/*
===========================================================================

  Copyright (c) 2010-2016 Darkstar Dev Teams

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

#ifndef _LOGIN_H
#define _LOGIN_H

#include "../common/cbasetypes.h"

#include <list>

#include "../common/kernel.h"
#include "../common/socket.h"
#include "../common/sql.h"
#include "../common/mmo.h"

#include "login_session.h"

extern lan_config_t lan_config;

struct login_config_t
{
    std::uint16_t login_auth_port;         // authentication port of login server ->  54231
    std::string login_auth_ip;           // authentication ip of login server   -> INADDR_ANY

    std::uint16_t login_data_port;
    std::string login_data_ip;

    std::uint16_t login_view_port;
    std::string login_view_ip;

    std::string servername;

    std::string mysql_host;         // mysql addr     -> localhost:3306
    std::uint16_t      mysql_port;         // mysql port     -> 3306
    std::string mysql_login;        // mysql login    -> default ***REMOVED***
    std::string mysql_password;     // mysql pass     -> default NULL
    std::string mysql_database;     // mysql database -> default dspdb

    std::uint32_t search_server_port;      // search_server_port -> 54002

    std::uint16_t msg_server_port;         // chat server port
    std::string msg_server_ip;      // chat server IP
    bool  log_user_ip;              // log user ip -> default false
};

struct version_info_t
{
    std::string client_ver;         // Expected Client version
    bool enable_ver_lock;
};

extern login_config_t login_config;
extern version_info_t version_info;

extern Sql_t *SqlHandle;
//////////////////////////////////////////////////////////

/*======================================================
 * Login-Server Version Screen [venom]
 *------------------------------------------------------*/
void login_helpscreen(std::int32_t flag);
/*======================================================
 * Login-Server Version Screen [venom]
 *------------------------------------------------------*/
void login_versionscreen(std::int32_t flag);
/*==========================================
 * Login-Server Config [venom]
 *------------------------------------------*/

std::int32_t login_config_read(const char *cfgName);
std::int32_t login_config_default();

std::int32_t version_info_read(const char *cfgName);
std::int32_t version_info_default();

#endif
