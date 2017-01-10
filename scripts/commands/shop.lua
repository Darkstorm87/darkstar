---------------------------------------------------------------------------------------------------
-- func: shop
-- desc: opens the Auction House menu anywhere in the world
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player,npc)
    stock = {
         0x1055,10000
    } 
    showShop(player, STATIC, stock);
end;