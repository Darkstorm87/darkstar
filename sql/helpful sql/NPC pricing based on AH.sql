UPDATE item_basic ib
INNER JOIN (
		select a.id
				, nq.itemid, nq.name as nqName, nq.BaseSell * a.ResultQty as nqNPC
				, hq.itemid as hqitemid, hq.name as hqName, hq.BaseSell * a.ResultHQ1Qty as hqNPC
				, hq.itemid as hq2itemid, hq2.name as hq2Name, hq2.BaseSell * a.ResultHQ2Qty as hq2NPC
				, hq.itemid as hq3itemid, hq3.name as hq3Name, hq3.BaseSell * a.ResultHQ3Qty as hq3NPC
				, coalesce(stack1.AHPrice,single1.AHPrice,0)
					+ coalesce(stack2.AHPrice,single2.AHPrice,0)
					+ coalesce(stack3.AHPrice,single3.AHPrice,0)
					+ coalesce(stack4.AHPrice,single4.AHPrice,0)
					+ coalesce(stack5.AHPrice,single5.AHPrice,0)
					+ coalesce(stack6.AHPrice,single6.AHPrice,0)
					+ coalesce(stack7.AHPrice,single7.AHPrice,0)
					+ coalesce(stack8.AHPrice,single8.AHPrice,0) AS AHTotalPrice
		from synth_recipes a
		INNER JOIN item_basic nq
			ON a.Result = nq.itemid
		INNER JOIN item_armor ia
			ON nq.itemid = ia.itemId
		LEFT OUTER JOIN item_basic hq
			ON a.ResultHQ1 = hq.itemid
		LEFT OUTER JOIN item_basic hq2
			ON a.ResultHQ2 = hq2.itemid
		LEFT OUTER JOIN item_basic hq3
			ON a.ResultHQ3 = hq3.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack1
			ON a.Ingredient1 = stack1.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single1
			ON a.Ingredient1 = single1.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack2
			ON a.Ingredient2 = stack2.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single2
			ON a.Ingredient2 = single2.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack3
			ON a.Ingredient3 = stack3.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single3
			ON a.Ingredient3 = single3.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack4
			ON a.Ingredient4 = stack4.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single4
			ON a.Ingredient4 = single4.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack5
			ON a.Ingredient5 = stack5.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single5
			ON a.Ingredient5 = single5.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack6
			ON a.Ingredient6 = stack6.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single6
			ON a.Ingredient6 = single6.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack7
			ON a.Ingredient7 = stack7.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single7
			ON a.Ingredient7 = single7.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack8
			ON a.Ingredient8 = stack8.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single8
			ON a.Ingredient8 = single8.itemid

		WHERE nq.BaseSell > 0 AND nq.NoSale = 0
		AND (hq.itemid IS NULL OR hq.BaseSell > 0 AND hq.NoSale = 0)
		AND (hq2.itemid IS NULL OR hq2.BaseSell > 0 AND hq2.NoSale = 0)
		AND (hq3.itemid IS NULL OR hq3.BaseSell > 0 AND hq3.NoSale = 0)
	) stuff
    ON ib.itemid = stuff.hq3itemid
    AND hq2itemid != hq3itemid
SET ib.BaseSell = AHTotalPrice * 1.4
WHERE AHTotalPrice > 0
AND AHTotalPrice * 1.4 < hqNPC;

SELECT *, cast(AHTotalPrice * 1.4 as SIGNED), cast(NewBreakEvenPrice * 1.4 AS SIGNED), nqNPC - AHTotalPrice, hqNPC - AHTotalPrice, hq3NPC - AHTotalPrice
FROM (
		select a.id
				, nq.itemid, nq.name as nqName, nq.BaseSell * a.ResultQty as nqNPC
				, hq.itemid as hqitemid, hq.name as hqName, hq.BaseSell * a.ResultHQ1Qty as hqNPC
				, hq.itemid as hq2itemid, hq2.name as hq2Name, hq2.BaseSell * a.ResultHQ2Qty as hq2NPC
				, hq.itemid as hq3itemid, hq3.name as hq3Name, hq3.BaseSell * a.ResultHQ3Qty as hq3NPC
				, coalesce(stack1.AHPrice,single1.AHPrice,0)
					+ coalesce(stack2.AHPrice,single2.AHPrice,0)
					+ coalesce(stack3.AHPrice,single3.AHPrice,0)
					+ coalesce(stack4.AHPrice,single4.AHPrice,0)
					+ coalesce(stack5.AHPrice,single5.AHPrice,0)
					+ coalesce(stack6.AHPrice,single6.AHPrice,0)
					+ coalesce(stack7.AHPrice,single7.AHPrice,0)
					+ coalesce(stack8.AHPrice,single8.AHPrice,0) AS AHTotalPrice
				, (coalesce(stack1.AHPrice,single1.AHPrice,0)
					+ coalesce(stack2.AHPrice,single2.AHPrice,0)
					+ coalesce(stack3.AHPrice,single3.AHPrice,0)
					+ coalesce(stack4.AHPrice,single4.AHPrice,0)
					+ coalesce(stack5.AHPrice,single5.AHPrice,0)
					+ coalesce(stack6.AHPrice,single6.AHPrice,0)
					+ coalesce(stack7.AHPrice,single7.AHPrice,0)
					+ coalesce(stack8.AHPrice,single8.AHPrice,0)) / coalesce(a.ResultHQ3Qty, a.ResultHQ2Qty, a.ResultHQ1Qty, a.ResultQty) AS NewBreakEvenPrice
		from synth_recipes a
		INNER JOIN item_basic nq
			ON a.Result = nq.itemid
		INNER JOIN item_armor ia
			ON nq.itemid = ia.itemId
		LEFT OUTER JOIN item_basic hq
			ON a.ResultHQ1 = hq.itemid
		LEFT OUTER JOIN item_basic hq2
			ON a.ResultHQ2 = hq2.itemid
		LEFT OUTER JOIN item_basic hq3
			ON a.ResultHQ3 = hq3.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack1
			ON a.Ingredient1 = stack1.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single1
			ON a.Ingredient1 = single1.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack2
			ON a.Ingredient2 = stack2.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single2
			ON a.Ingredient2 = single2.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack3
			ON a.Ingredient3 = stack3.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single3
			ON a.Ingredient3 = single3.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack4
			ON a.Ingredient4 = stack4.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single4
			ON a.Ingredient4 = single4.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack5
			ON a.Ingredient5 = stack5.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single5
			ON a.Ingredient5 = single5.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack6
			ON a.Ingredient6 = stack6.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single6
			ON a.Ingredient6 = single6.itemid

		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack7
			ON a.Ingredient7 = stack7.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single7
			ON a.Ingredient7 = single7.itemid
			
		LEFT OUTER JOIN (
			SELECT ib.itemid, MIN(price/stackSize) as AHPrice 
			FROM auction_house ah
			INNER JOIN item_basic ib
				ON ah.itemid = ib.itemid
			WHERE seller_name = 'IVALICE' AND stack = 1
			GROUP BY ib.itemid) stack8
			ON a.Ingredient8 = stack8.itemid
		LEFT OUTER JOIN (SELECT itemid, MIN(price) as AHPrice FROM auction_house WHERE seller_name = 'IVALICE' AND stack = 0 GROUP BY itemid) single8
			ON a.Ingredient8 = single8.itemid

		WHERE nq.BaseSell > 0 AND nq.NoSale = 0
		AND (hq.itemid IS NULL OR hq.BaseSell > 0 AND hq.NoSale = 0)
		AND (hq2.itemid IS NULL OR hq2.BaseSell > 0 AND hq2.NoSale = 0)
		AND (hq3.itemid IS NULL OR hq3.BaseSell > 0 AND hq3.NoSale = 0)
	) stuff
WHERE AHTotalPrice > 0
-- AND cast(AHTotalPrice * 1.4 as SIGNED) < hq3NPC
ORDER BY hqNPC - AHTotalPrice DESC;