SELECT itemid, name, 1 AS sell01, 0 AS buy01, IF(bd.Price<vp.price,bd.Price,vp.price) as price01, 40 AS stock01, if(stackSize > 1, 1, 0) as sell12, 0 AS buy12, FLOOR(IF(bd.Price<vp.price,bd.Price,vp.price) * stackSize * 0.9) as price12, 40 as stock12, vp.price
FROM (
	SELECT *, 1000 DIV stackSize AS Price
	FROM item_basic ib
	WHERE aH IN (15, 36, 49)
	AND NoSale = 0
	AND NOT flags & (0x4000 | 0x8000)
	UNION
	SELECT *, if(BaseSell = 0, 1000 DIV stackSize, BaseSell) * 9 AS Price
	FROM item_basic a
	WHERE itemid NOT BETWEEN 0x0200 AND 0x0206
	AND (itemid BETWEEN 0x01D8 AND 0x0DFF
	OR itemid BETWEEN 0x7000 AND 0x7FFF)
	AND NoSale = 0
	AND aH NOT IN (0, 36, 49, 61)
	AND itemid NOT IN (836, 860, 865, 867, 874, 899, 901, 908, 909, 1110, 1272, 1273, 1274, 1275, 1276, 1277, 1279, 1280, 1281, 1282, 1283, 1293, 1295, 1296, 1311, 1312, 1313, 2168, 2169, 2172, 2371, 2372, 2373)
	AND itemid NOT BETWEEN 3444 AND 3492
	AND NOT flags & (0x4000 | 0x8000)
	AND NOT EXISTS(SELECT 1 FROM synth_recipes WHERE a.itemid IN (Result, ResultHQ1, ResultHQ2, ResultHQ3))
) bd
INNER JOIN vendor_prices vp
	ON bd.itemid = vp.item_id
WHERE bd.price > vp.price