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

#ifndef _ITEMUTILS_H
#define _ITEMUTILS_H

#include <vector>

#include "../items/item.h"
#include "../items/item_armor.h"
#include "../items/item_currency.h"
#include "../items/item_fish.h"
#include "../items/item_furnishing.h"
#include "../items/item_general.h"
#include "../items/item_linkshell.h"
#include "../items/item_puppet.h"
#include "../items/item_usable.h"
#include "../items/item_weapon.h"

#define MAX_ITEMID  32768
#define MAX_DROPID  5000
#define MAX_LOOTID  1300

enum DROP_TYPE
{
    DROP_NORMAL  = 0x00,
    DROP_GROUPED = 0x01,
    DROP_STEAL   = 0x02,
    DROP_DESPOIL = 0x04
};

struct DropItem_t
{
    std::uint16_t ItemID;
    std::uint8_t  DropType;
    std::uint16_t DropRate;
    std::uint8_t  GroupId;
    std::uint16_t GroupRate;
};

struct LootItem_t
{
    std::uint16_t ItemID;
    std::uint16_t Rolls;
    std::uint8_t  LootGroupId;
};


typedef std::vector<DropItem_t> DropList_t;
typedef std::vector<LootItem_t> LootList_t;

/************************************************************************
*                                                                       *
*  Пространстов имен дла работы с глобальными списками предметов        *
*                                                                       *
************************************************************************/

namespace itemutils
{
    void    Initialize();
    void    FreeItemList();

    CItem*  GetItem(CItem* PItem);
    CItem*  GetItem(std::uint16_t ItemID);
    CItem*  GetItemPointer(std::uint16_t ItemID);

    CItemWeapon* GetUnarmedItem();
    CItemWeapon* GetUnarmedH2HItem();

    DropList_t* GetDropList(std::uint16_t DropID);
    LootList_t* GetLootList(std::uint16_t LootDropID);

};

#endif