// Copyright (c) 2010-2015 Darkstar Dev Teams

#ifndef	_SOCKET_H_
#define _SOCKET_H_

#ifndef _CBASETYPES_H_
	#include "../common/cbasetypes.h"
#endif


#ifdef WIN32
    #define FD_SETSIZE 1000
	#include <winsock2.h>
	typedef long in_addr_t;
#else
	#include <sys/types.h>
	#include <sys/socket.h>
    #include <arpa/inet.h>
	#include <netinet/in.h>
	#include <errno.h>
#endif

#include <time.h>
#include <memory>
#include <string>



/*
*
*				COMMON LEVEL
*
*/
/////////////////////////////////////////////////////////////////////
#if defined(WIN32)
/////////////////////////////////////////////////////////////////////
// windows portability layer 
typedef int socklen_t;

#define sErrno WSAGetLastError()
#define S_ENOTSOCK WSAENOTSOCK
#define S_EWOULDBLOCK WSAEWOULDBLOCK
#define S_EINTR WSAEINTR
#define S_ECONNABORTED WSAECONNABORTED


#define SHUT_RD   SD_RECEIVE
#define SHUT_WR   SD_SEND
#define SHUT_RDWR SD_BOTH

// global array of sockets (emulating linux)
// fd is the position in the array
extern SOCKET sock_arr[FD_SETSIZE];
extern int sock_arr_len;

/// Returns the socket associated with the target fd.
///
/// @param fd Target fd.
/// @return Socket
#define fd2sock(fd) sock_arr[fd]

/// Returns the first fd associated with the socket.
/// Returns -1 if the socket is not found.
///
/// @param s Socket
/// @return Fd or -1
int sock2fd(SOCKET s);


/// Inserts the socket into the global array of sockets.
/// Returns a new fd associated with the socket.
/// If there are too many sockets it closes the socket, sets an error and 
//  returns -1 instead.
/// Since fd 0 is reserved, it returns values in the range [1,FD_SETSIZE[.
///
/// @param s Socket
/// @return New fd or -1
int sock2newfd(SOCKET s);

int sAccept(int fd, struct sockaddr* addr, int* addrlen);

int sClose(int fd);
int sSocket(int af, int type, int protocol);

#define sBind(fd,name,namelen) bind(fd2sock(fd),name,namelen)
#define sListen(fd,backlog) listen(fd2sock(fd),backlog)
#define sIoctl(fd,cmd,argp) ioctlsocket(fd2sock(fd),cmd,argp)
#define sConnect(fd,name,namelen) connect(fd2sock(fd),name,namelen)
#define sRecv(fd,buf,len,flags) recv(fd2sock(fd),buf,len,flags)
#define sRecvfrom(fd,buf,len,flags,from,addrlen) recvfrom(fd2sock(fd),buf,len,flags,from,addrlen)
#define sSelect select
#define sSend(fd,buf,len,flags) send(fd2sock(fd),buf,len,flags)
#define sSendto(fd,buf,len,flags,to,addrlen) sendto(fd2sock(fd),buf,len,flags,to,addrlen)
#define sSetsockopt(fd,level,optname,optval,optlen) setsockopt(fd2sock(fd),level,optname,optval,optlen)
#define sShutdown(fd,how) shutdown(fd2sock(fd),how)
#define sFD_SET(fd,set) FD_SET(fd2sock(fd),set)
#define sFD_CLR(fd,set) FD_CLR(fd2sock(fd),set)
#define sFD_ISSET(fd,set) FD_ISSET(fd2sock(fd),set)
#define sFD_ZERO FD_ZERO
#else
// nix portability layer

#define SOCKET_ERROR (-1)

#define sErrno errno
#define S_ENOTSOCK EBADF
#define S_EWOULDBLOCK EAGAIN
#define S_EINTR EINTR
#define S_ECONNABORTED ECONNABORTED

#define sAccept accept
#define sClose close
#define sSocket socket

#define sBind bind
#define sConnect connect
#define sIoctl ioctl
#define sListen listen
#define sRecv recv
#define sRecvfrom recvfrom
#define sSelect select
#define sSend send
#define sSendto sendto
#define sSetsockopt setsockopt
#define sShutdown shutdown
#define sFD_SET FD_SET
#define sFD_CLR FD_CLR
#define sFD_ISSET FD_ISSET
#define sFD_ZERO FD_ZERO

#endif
// buffer I/O macros
#define RBUFP(p,pos) (((uint8*)(p)) + (pos))
#define RBUFB(p,pos) (*(uint8*)RBUFP((p),(pos)))
#define RBUFW(p,pos) (*(std::uint16_t*)RBUFP((p),(pos)))
#define RBUFL(p,pos) (*(std::uint32_t*)RBUFP((p),(pos)))
#define RBUFF(p,pos) (*(float*)RBUFP((p),(pos)))

#define WBUFP(p,pos) (((uint8*)(p)) + (pos))
#define WBUFB(p,pos) (*(uint8*)WBUFP((p),(pos)))
#define WBUFW(p,pos) (*(std::uint16_t*)WBUFP((p),(pos)))
#define WBUFL(p,pos) (*(std::uint32_t*)WBUFP((p),(pos)))
#define WBUFU(p,pos) (*(std::uint64_t*)WBUFP((p),(pos)))
#define WBUFF(p,pos) (*(float*)WBUFP((p),(pos)))

#define TOB(n) ((uint8)((n)&std::numeric_limits<std::uint8_t>::max()))
#define TOW(n) ((std::uint16_t)((n)&std::numeric_limits<std::uint16_t>::max()))
#define TOL(n) ((std::uint32_t)((n)&std::numeric_limits<std::uint32_t>::max()))

extern fd_set readfds;
extern int fd_max;
extern time_t last_tick;
extern time_t stall_time;

std::int32_t makeConnection(std::uint32_t ip, std::uint16_t port, std::int32_t type);

std::int32_t do_sockets(fd_set* rfd,duration next);

void do_close(std::int32_t fd);

bool socket_init(void);

bool socket_final(void);

// hostname/ip conversion functions
std::uint32_t host2ip(const char* hostname);


const char* ip2str(std::uint32_t ip, char ip_str[16]);

std::uint32_t str2ip(const char* ip_str);

#define CONVIP(ip) ((ip)>>24)&0xFF,((ip)>>16)&0xFF,((ip)>>8)&0xFF,((ip)>>0)&0xFF

std::uint16_t ntows(std::uint16_t netshort);

int socket_getips(std::uint32_t* ips, int max);

extern std::uint32_t g_addr_[16];   // ip addresses of local host (host byte order)

extern std::int32_t naddr_;   // # of ip addresses

/************************************************/
#ifdef dsTCPSERV 
	/*
	*
	*		TCP LEVEL
	*
	*/

	// initial recv buffer size (this will also be the max. size)
	// biggest known packet: S 0153 <len>.w <emblem data>.?B -> 24x24 256 color .bmp (0153 + len.w + 1618/1654/1756 bytes)
	#define RFIFO_SIZE (2*1024)
	// initial send buffer size (will be resized as needed)
	#define WFIFO_SIZE (16*1024)

	// Maximum size of pending data in the write fifo. (for non-server connections)
	// The connection is closed if it goes over the limit.
	#define WFIFO_MAX (1*1024*1024)

	// Struct declaration
	typedef int (*RecvFunc)(int fd);
	typedef int (*SendFunc)(int fd);
	typedef int (*ParseFunc)(int fd);

	// socket I/O macros
	#define RFIFOHEAD(fd)
	#define WFIFOHEAD(fd, size) do{ if((fd) && session[fd]->wdata_size + (size) > session[fd]->max_wdata ) realloc_writefifo(fd, size); }while(0)
	//-------------------
	#define RFIFOP(fd,pos) (session[fd]->rdata + session[fd]->rdata_pos + (pos))
	#define WFIFOP(fd,pos) (session[fd]->wdata + session[fd]->wdata_size + (pos))


	#define RFIFOB(fd,pos) (*(uint8*)RFIFOP(fd,pos))
	#define WFIFOB(fd,pos) (*(uint8*)WFIFOP(fd,pos))
	#define RFIFOW(fd,pos) (*(std::uint16_t*)RFIFOP(fd,pos))
	#define WFIFOW(fd,pos) (*(std::uint16_t*)WFIFOP(fd,pos))
	#define RFIFOL(fd,pos) (*(std::uint32_t*)RFIFOP(fd,pos))
	#define WFIFOL(fd,pos) (*(std::uint32_t*)WFIFOP(fd,pos))

	#define RFIFOREST(fd)  (session[fd]->flag.eof ? 0 : session[fd]->rdata.size() - session[fd]->rdata_pos)
	#define RFIFOFLUSH(fd) \
		do { \
			if(session[fd]->rdata.size() == session[fd]->rdata_pos){ \
				session[fd]->rdata_pos = 0; \
                session[fd]->rdata.clear(); \
			} else { \
                session[fd]->rdata.erase(0, session[fd]->rdata_pos); \
				session[fd]->rdata_pos = 0; \
			} \
		} while(0)
	struct socket_data
	{
		struct {
			unsigned char eof : 1;
			unsigned char server : 1;
		} flag;

		std::uint32_t client_addr; // remote client address

		std::string rdata, wdata;
		size_t rdata_pos;
		time_t rdata_tick; // time of last recv (for detecting timeouts); zero when timeout is disabled

		RecvFunc func_recv;
		SendFunc func_send;
		ParseFunc func_parse;

        bool ver_mismatch;
		void* session_data; // stores application-specific data related to the session
	};

	// Data prototype declaration
    extern std::array<std::unique_ptr<socket_data>, FD_SETSIZE> session;
	//////////////////////////////////
	// some checking on sockets
	bool session_isValid(int fd);
	bool session_isActive(int fd);

	int create_session(int fd, RecvFunc func_recv, SendFunc func_send, ParseFunc func_parse);
	int delete_session(int fd);
	//////////////////////////////////
	std::int32_t recv_to_fifo(std::int32_t fd);

	std::int32_t send_from_fifo(std::int32_t fd);

	std::int32_t connect_client(std::int32_t listen_fd, sockaddr_in& client_address);

	std::int32_t makeConnection_tcp(std::uint32_t ip, std::uint16_t port);

	std::int32_t makeListenBind_tcp(const char* ip, std::uint16_t port,RecvFunc connect_client);

	std::int32_t RFIFOSKIP(std::int32_t fd, size_t len);

	void socket_init_tcp(void);
	void socket_final_tcp(void);

	void do_close_tcp(std::int32_t fd);

	void flush_fifo(std::int32_t fd);
	void flush_fifos(void);
	//void set_nonblocking(std::int32_t fd, ulong yes);

	void set_defaultparse(ParseFunc defaultparse);

	void set_eof(std::int32_t fd);

	void set_nonblocking(int fd, unsigned long yes);
#elif defined(dsUDPSERV)
	/*
	*
	*		UDP LEVEL
	*
	*/
	extern std::int32_t listen_fd;
	std::int32_t makeBind_udp(std::uint32_t ip, std::uint16_t port);

	void socket_init_udp(void);
	void do_close_udp(std::int32_t fd);
	void socket_final_udp(void);

	std::int32_t recvudp(std::int32_t fd,void *buff,size_t nbytes,std::int32_t flags,struct sockaddr *from, socklen_t *addrlen);
	std::int32_t sendudp(std::int32_t fd,void *buff,size_t nbytes,std::int32_t flags,const struct sockaddr *from,socklen_t addrlen);
#endif 


#endif // _SOCKET_H //
