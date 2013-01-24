/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#ifndef _CMESSAGEBASICPACKET_H
#define _CMESSAGEBASICPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

/*
 * This contains a list of message IDs for this type of packet. They should be used
 * in the messageID parameter. 
 */
enum MSGBASIC_ID : uint16 
{
	MSGBASIC_ALREADY_CLAIMED		= 12, /* Cannot attack. Your target is already claimed. */
	MSGBASIC_TOO_FAR_AWAY			= 78, /* <target> is too far away. */
	MSGBASIC_WAIT_LONGER			= 94, /* You must wait longer to perform that action. */
	MSGBASIC_CANNOT_ATTACK_TARGET	= 446 /* You cannot attack that target */
};

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CBaseEntity;

class CMessageBasicPacket : public CBasicPacket
{
public:

	CMessageBasicPacket(CBaseEntity* PSender, CBaseEntity* PTarget, int32 param, int32 value, uint16 messageID);
};

#endif