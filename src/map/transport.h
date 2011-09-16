/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#ifndef _CTRANSPORT_H
#define _CTRANSPORT_H

#include "../common/cbasetypes.h"

#include <vector>

#include "npcentity.h"

struct Elevator_t 
{
	uint8 id;
	uint8 zone;

	uint8 interval;
	uint8 movetime;

	CNpcEntity * Elevator;
	CNpcEntity * LowerDoor;
	CNpcEntity * UpperDoor;

	bool isMoving;
	bool isStarted;
	bool isPermanent;
};


class CTransportHandler
{
public:

	static	CTransportHandler * getInstance();

	void TransportTimer();

private:

	static CTransportHandler * _instance;

	CTransportHandler();

	void InitializeElevators();

	void startElevator(Elevator_t *);
	void arrivElevator(Elevator_t *);

	std::vector<Elevator_t> ElevatorList;
};

#endif