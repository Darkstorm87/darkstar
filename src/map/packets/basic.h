﻿/*
===========================================================================

Copyright © 2010-2015 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

This file is part of DarkStar-server source code.

===========================================================================
*/

#ifndef _BASICPACKET_H
#define _BASICPACKET_H

#include "../../common/cbasetypes.h"

#include <stdio.h>
#include <string.h>

#define PACKET_SIZE 0x104

enum ENTITYUPDATE
{
    ENTITY_SPAWN,
    ENTITY_SHOW,
    ENTITY_UPDATE,
    ENTITY_HIDE,
    ENTITY_DESPAWN,
};

/** Base class for all packets
*
* Contains a 0x104 byte sized buffer
* Access the raw data with ref<T>(index)
*
*/
class CBasicPacket
{
protected:

    std::uint8_t* data;
    std::uint8_t& type;
    std::uint8_t& size;
    std::uint16_t& code;
    bool owner;

public:

    CBasicPacket()
        : data(new std::uint8_t[PACKET_SIZE]), type(ref<std::uint8_t>(0)), size(ref<std::uint8_t>(1)), code(ref<std::uint16_t>(2)), owner(true)
    {
        std::fill(data, data + PACKET_SIZE, 0);
    }

    CBasicPacket(std::uint8_t* _data)
        : data(_data), type(ref<std::uint8_t>(0)), size(ref<std::uint8_t>(1)), code(ref<std::uint16_t>(2)), owner(false)
    {}

    CBasicPacket(const CBasicPacket& other)
        : data(new std::uint8_t[PACKET_SIZE]), type(ref<std::uint8_t>(0)), size(ref<std::uint8_t>(1)), code(ref<std::uint16_t>(2)), owner(true)
    {
        memcpy(data, other.data, PACKET_SIZE);
    }

    CBasicPacket(CBasicPacket&& other)
        : data(other.data), type(ref<std::uint8_t>(0)), size(ref<std::uint8_t>(1)), code(ref<std::uint16_t>(2)), owner(other.owner)
    {
        other.data = nullptr;
    }

    virtual ~CBasicPacket()
    {
        if (owner && data)
        {
            delete[] data;
        }
    }

    CBasicPacket& operator= (const CBasicPacket& other) = delete;
    CBasicPacket& operator= (CBasicPacket&& other) = delete;

    /* Getters for the header */

    std::uint16_t id()
    {
        return ref<std::uint16_t>(0) & 0x1FF;
    }
    std::size_t length()
    {
        return 2 * (ref<std::uint8_t>(1) & ~1);
    }
    unsigned short sequence()
    {
        return ref<std::uint16_t>(2);
    }

    /* Setters for the header */

    // Set the first 9 bits to the ID. The highest bit overflows into the second byte.
    void id(unsigned int new_id)
    {
        ref<std::uint16_t>(0) &= ~0x1FF;
        ref<std::uint16_t>(0) |= new_id & 0x1FF;
    }

    // The length "byte" is actually just the highest 7 bits.
    // Need to preserve the lowest bit for the ID.
    void length(std::size_t new_size)
    {
        ref<std::uint8_t>(1) &= 1;
        ref<std::uint8_t>(1) |= ((new_size + 3) & ~3) / 2;
    }

    void sequence(unsigned short new_sequence)
    {
        ref<std::uint16_t>(2) = new_sequence;
    }

    /* Indexer for the data buffer */

    template<typename T>
    T& ref(std::size_t index)
    {
        return *reinterpret_cast<T*>(data + index);
    }

    operator std::uint8_t*()
    {
        return data;
    }

    int8* operator[] (const int index)
    {
        return reinterpret_cast<int8*>(data)+index;
    }
};

#endif
