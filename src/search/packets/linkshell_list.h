/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

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

#ifndef _CLINKSHELLLISTPACKET_H_
#define _CLINKSHELLLISTPACKET_H_

#include "../../common/cbasetypes.h"
#include "search_list.h"

class CLinkshellListPacket
{
public:

    CLinkshellListPacket(std::uint32_t linkshellid, std::uint32_t Total);
    ~CLinkshellListPacket();

    void AddPlayer(SearchEntity* PPlayer);

    std::uint8_t* GetData();
    std::uint16_t GetSize();

private:
    std::uint32_t m_linkshellid;
    std::uint32_t m_offset;
    std::uint8_t m_data[1024];
};

#endif