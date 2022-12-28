'
1	Receipt +
2	Shipment -
3	Adjustment -/+
4	Move +
5	?
6	Kit Order -/+
'
'M '
SELECT CustomerName, WarehouseSku, Description, PalletId, 
FROM InventoryTransaction
WHERE FacilityName!='ZTest'

'Using If'
SELECT CustomerName,
    WarehouseSku,
    PalletId,
    (
     CASE
        WHEN TransactionType=4 THEN (QTY*1)
        ELSE QTY   
    ) AS Quantity

FROM InventoryTransaction
WHERE FacilityName!='ZTest'  AND PalletId = '400-57147'
GROUP BY CustomerName, WarehouseSku, PalletId

'stolen from https://stackoverflow.com/questions/18213387/sum-columns-depending-on-another-column-value'
SELECT s.name
     , s.current_points
     , a.activity_type
     , a.points
     , IF(a.activity_type='used_points',a.points,NULL) AS used_points
     , IF(a.activity_type='added_points',a.points,NULL) AS added_points
     , SUM(a.points) AS total_points
  FROM subscriptions s
  JOIN activities a
    ON a.subscription_id = s.id
 GROUP BY s.name

'This is for Move since it does not have a -'
SELECT CustomerName, WarehouseSku,  PalletId, (SUM(Qty)*-1) AS Quantity
FROM InventoryTransaction
WHERE FacilityName!='ZTest' AND TransactionType = 4 AND PalletId = '400-57147'
GROUP BY CustomerName, WarehouseSku,  PalletId


'not for Move'
SELECT CustomerName, WarehouseSku,  PalletId, SUM(Qty) AS Quantity
FROM InventoryTransaction
WHERE FacilityName!='ZTest' AND TransactionType != 4 AND PalletId = '400-57147'
GROUP BY CustomerName, WarehouseSku,  PalletId


SELECT * 

FROM InventoryTransaction

WHERE FacilityName!='ZTest' and CustomerName = '120'