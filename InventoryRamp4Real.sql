SELECT CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As ID,
Palletid, LotReferenceTwo ,Sum(QTY) OVER  (
PARTITION BY PalletId  ORDER BY PalletId
) AS [Running Total]
FROM InventoryTransaction
WHERE CustomerName = '430' AND FacilityName = 'Fullerton' AND TransactionType <4
GROUP BY CustomerName , Palletid, LotReferenceTwo


"use this one for real life purposes and junk"
SELECT CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As ID,
Palletid, WarehouseSku,ISNULL(TolocationName, 0) AS TolocationName,ISNULL(ToPalletId,0) AS ToPalletId, TransactionType, SUM(QTY)
FROM InventoryTransaction
WHERE  TransactionType = 4 AND TolocationName = 'Stage' OR TransactionType = 4 AND TolocationName = 'SHIPDOCK'
CustomerName = '430' AND FacilityName = 'Fullerton'  
GROUP BY CustomerName , Palletid, WarehouseSku,TransactionType, QTY,TolocationName,ToPalletId
ORDER BY PalletId, TransactionType, WarehouseSku



-- attempt
WHERE
    IF IsNumeric(@OrderNumber) = 1
        OrderNumber = @OrderNumber
    ELSE
        OrderNumber LIKE '%' + @OrderNumber + '%'

-- conversion
WHERE 
   (IsNumeric(@OrderNumber) AND (CAST OrderNumber AS VARCHAR) = (CAST @OrderNumber AS VARCHAR) OR
   (NOT IsNumeric(@OrderNumber) AND OrderNumber LIKE ('%' + @OrderNumber))

TolocationName = 'Stage' OR "SHIPDOCK"
