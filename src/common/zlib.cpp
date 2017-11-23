#include "../common/zlib.h"
#include "../common/showmsg.h"
#include <vector>
#include <string>
#include <cstring>
#include <cassert>

#if (defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__) || \
    (defined(__BYTE_ORDER) && __BYTE_ORDER == __BIG_ENDIAN) || \
    defined(__BIG_ENDIAN__) || \
    defined(__ARMEB__) || \
    defined(__THUMBEB__) || \
    defined(__AARCH64EB__) || \
    defined(_MIBSEB) || defined(__MIBSEB) || defined(__MIBSEB__)
#   define DSP_BIG_ENDIAN 1
#else
#   define DSP_BIG_ENDIAN 0
#endif

#if DSP_BIG_ENDIAN
#   if defined(__clang__) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 3 && !defined(__MINGW32__) && !defined(__MINGW64__))
#       define bswap16 __builtin_bswap16
#       define bswap32 __builtin_bswap32
#       define bswap64 __builtin_bswap64
#   elif defined(__GLIBC__)
#       include <byteswap.h>
#       define bswap16 __bswap_16
#       define bswap32 __bswap_32
#       define bswap64 __bswap_64
#   elif defined(__NetBSD__)
#       include <sys/types.h>
#       include <machine/bswap.h> /* already named bswap16/32/64 */
#   elif defined(_MSC_VER)
#       define bswap16 _byteswap_ushort
#       define bswap32 _byteswap_ulong
#       define bswap64 _byteswap_uint64
#   else
#       error "No compiler builtins for byteswap available"
#   endif
#endif

// Resolve the next address in jump table (0 == no jump, 1 == next address)
#define JMPBIT(table, i) ((table[i / 8] >> (i & 7)) & 1)

struct zlib_jump
{
    const void *ptr;
};

struct zlib
{
    std::vector<std::uint32_t> enc;
    std::vector<struct zlib_jump> jump;
};

static struct zlib zlib;

static void swap32_if_be(std::uint32_t *v, const size_t memb)
{
#if DSP_BIG_ENDIAN
    for (size_t i = 0; i < memb; ++i)
        v[i] = bswap32(v[i]);
#else
    (void)v, (void)memb;
#endif
}

static bool read_to_vector(const std::string &file, std::vector<std::uint32_t> &vec)
{
    FILE *f;
    if (!(f = fopen(file.c_str(), "rb")))
    {
        ShowFatalError("zlib: can't open file <%s>\n", file.c_str());
        return false;
    }

    fseek(f, 0, SEEK_END);
    const size_t size = ftell(f);
    fseek(f, 0, SEEK_SET);

    vec.resize(size / sizeof(std::uint32_t));
    if (fread(vec.data(), sizeof(std::uint32_t), vec.size(), f) != vec.size())
    {
        ShowFatalError("zlib: can't read file <%s>: %s\n", file.c_str(), strerror(errno));
        return false;
    }
    fclose(f);

    swap32_if_be(vec.data(), vec.size());
    return true;
}

static void populate_jump_table(std::vector<struct zlib_jump> &jump, const std::vector<std::uint32_t> &dec)
{
    jump.resize(dec.size());

    // Base address of dec table, if we substract pointer in dec table, we should should be
    // able to normalize them to offsets starting from 0.
    const std::uint32_t base = dec[0] - sizeof(std::uint32_t);

    for (size_t i = 0; i < dec.size(); ++i)
    {
        if (dec[i] > 0xff)
        {
            // Everything over 0xff are pointers.
            // These pointers will be traversed until we hit data.
            jump[i].ptr = jump.data() + (dec[i] - base) / sizeof(base);
        }
        else
        {
            // Everything equal or less to 0xff is 8bit data.
            // The pointers at offsets -3 and -2 in table must be zero for each non-zero data entry
            // This approach assumes pointers are at least 8bit on the system.
            static_assert(sizeof(std::uintptr_t) >= sizeof(std::uint8_t), "Pointer can't hold a 8bit value");
            jump[i].ptr = reinterpret_cast<void*>(static_cast<std::uintptr_t>(dec[i]));
            assert(!jump[i].ptr || (!jump[i-2].ptr && !jump[i-3].ptr));
        }
    }
}

std::int32_t zlib_init()
{
    std::vector<std::uint32_t> dec;
    if (!read_to_vector("compress.dat", zlib.enc) || !read_to_vector("decompress.dat", dec))
        return -1;

    populate_jump_table(zlib.jump, dec);
    return 0;
}

static std::int32_t zlib_compress_sub(const std::uint8_t *b32, const std::uint32_t read, const std::uint32_t elem, int8 *out, const std::uint32_t out_sz)
{
    assert(b32 && out);

    if (zlib_compressed_size(elem) > sizeof(std::uint32_t))
    {
        ShowWarning("zlib_compress_sub: element exceeds 4 bytes (%u)\n", elem);
        return -1;
    }

    if (zlib_compressed_size(read + elem) > out_sz)
    {
        ShowWarning("zlib_compress_sub: ran out of space (%u : %u : %u)\n", read, elem, out_sz);
        return -1;
    }

    for (std::uint32_t i = 0; i < elem; ++i)
    {
        const std::uint8_t shift = (read + i) & 7;
        const std::uint32_t v = (read + i) / 8;
        const std::uint32_t inv_mask = ~(1 << shift);
        assert(shift < 8);
        out[v] = (inv_mask & out[v]) + (JMPBIT(b32, i) << shift);
    }

    return 0;
}

std::int32_t zlib_compress(const int8 *in, const std::uint32_t in_sz, int8 *out, const std::uint32_t out_sz)
{
    assert(in && out);
    assert(zlib.enc.size());

    std::uint32_t read = 0;
    const std::uint32_t max_sz = (out_sz - 1) * 8; // Output buffer may be at least 8 times big than original
    for (std::uint32_t i = 0; i < in_sz; ++i)
    {
        const std::uint32_t elem = zlib.enc[static_cast<int8>(in[i]) + 0x180];
        if (elem + read < max_sz)
        {
            const std::uint32_t index = static_cast<int8>(in[i]) + 0x80;
            assert(index < zlib.enc.size());
            std::uint32_t v = zlib.enc[index];
            swap32_if_be(&v, 1);
            std::uint8_t b32[sizeof(v)];
            memcpy(b32, &v, sizeof(b32));
            zlib_compress_sub(b32, read, elem, out + 1, out_sz - 1);
            read += elem;
        }
        else if (in_sz + 1 >= out_sz)
        {
            // Ran if input doesn't fit output, outputs garbage(?)
            ShowWarning("zlib_compress: ran out of space, outputting garbage(?) (%u : %u : %u : %u)\n", read, elem, max_sz, in[i]);
            memset(out, 0, (out_sz / 4) + (in_sz & 3));
            memset(out + 1, in_sz, in_sz / 4);
            memset(out + 1 + in_sz / 4, (in_sz + 1) * 8, in_sz & 3);
            return in_sz;
        }
        else
        {
            ShowWarning("zlib_compress: ran out of space (%u : %u : %u : %u)\n", read, elem, max_sz, in[i]);
            return -1;
        }
    }

    out[0] = 1;
    return read + 8;
}

std::uint32_t zlib_decompress(const int8 *in, const std::uint32_t in_sz, int8 *out, const std::uint32_t out_sz)
{
    assert(in && out);
    assert(zlib.jump.size());

    const struct zlib_jump *jmp = static_cast<const struct zlib_jump*>(zlib.jump[0].ptr);
    assert(jmp >= zlib.jump.data() && jmp <= zlib.jump.data() + zlib.jump.size());

    if (in[0] != 1)
    {
        ShowWarning("zlib_decompress: invalid compressed data\n");
        return -1;
    }

    std::uint32_t w = 0;
    const int8 *data = in + 1;
    for (std::uint32_t i = 0; i < in_sz && w < out_sz; ++i)
    {
        jmp = static_cast<const struct zlib_jump*>(jmp[JMPBIT(data, i)].ptr);
        assert(jmp >= zlib.jump.data() && jmp <= zlib.jump.data() + zlib.jump.size());

        // Repeat until there is nowhere to jump to
        if (jmp[0].ptr != 0 || jmp[1].ptr != 0)
            continue;

        // The remaining address should be data
        assert(jmp[3].ptr <= reinterpret_cast<void*>(0xff));
        out[w++] = static_cast<std::uint8_t>(reinterpret_cast<std::uintptr_t>(jmp[3].ptr));
        jmp = static_cast<const struct zlib_jump*>(zlib.jump[0].ptr);

        if (w >= out_sz)
        {
            ShowWarning("zlib_decompress: ran out of space (%u : %u)\n", in_sz, out_sz);
            return -1;
        }
    }

    return w;
}
