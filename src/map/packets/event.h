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

#ifndef _CEVENTPACKET_H
#define _CEVENTPACKET_H

#include "../../common/cbasetypes.h"

#include <string>

#include "basic.h"

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CCharEntity;

class CEventPacket : public CBasicPacket
{
public:

	CEventPacket(
		CCharEntity* PChar,
		std::uint16_t EventID, 
		std::uint8_t  numOfParams = 0, 
		std::uint32_t param0 = 0,
		std::uint32_t param1 = 0,
		std::uint32_t param2 = 0,
		std::uint32_t param3 = 0,
		std::uint32_t param4 = 0,
		std::uint32_t param5 = 0,
		std::uint32_t param6 = 0,
		std::uint32_t param7 = 0,
        std::int16_t textTable = -1);
};

#endif