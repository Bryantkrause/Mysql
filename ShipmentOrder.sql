SELECT
CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As ID, 
Year = DATEPART(YEAR, ActualShipDate),
Month = DATEPART(Month, ActualShipDate),
Count(DISTINCT(OrderNumber)) As Orders, SUM(QtyShipped) as Qty

FROM ShipmentOrder

WHERE ActualShipDate  BETWEEN '4/01/2021 00:00:01' AND '07/31/2022 23:59:59' AND
CustomerName != 'PC' AND CustomerName !='Z_TEST' AND FacilityName !='Z_TEST'
GROUP BY CustomerName, DATEPART(YEAR, ActualShipDate), DATEPART(Month, ActualShipDate)


-- getting shipment data 
SELECT 
FacilityName, ID, year,
[1] = isnull([1], 0),
[2] = isnull([2], 0),
[3] = isnull([3], 0),
[4] = isnull([4], 0),
[5] = isnull([5], 0),
[6] = isnull([6], 0),
[7] = isnull([7], 0),
[8] = isnull([8], 0),
[9] = isnull([9], 0),
[10] = isnull([10], 0),
[11] = isnull([11], 0),
[12] = isnull([12], 0)
FROM (
SELECT so.FacilityName, CASE WHEN so.CustomerName >= 430 THEN 430 ELSE so.CustomerName END As ID,
DATEDIFF(dd,so.CreateDate,so.ActualShipDate) As DaysToShip,
IsNull(month(so.ActualShipDate), 0) as month,
IsNull(year(so.ActualShipDate), 0) as year
FROM ShipmentOrder AS so LEFT JOIN Customer AS C ON so.CustomerName = c.CustomerName
WHERE so.ActualShipDate  BETWEEN '1/01/2021 00:00:01' AND '11/30/2022 23:59:59' AND
so.CustomerName != 'PC' AND so.CustomerName !='Z_TEST' AND so.FacilityName !='ZTEST' AND
c.status = 0
) Ship
PIVOT (
    AVG(DaysToShip)
FOR month IN ([1] , [2] , [3] , [4] , [5] , [6] , [7] , [8] ,[9] , [10] , [11] , [12])) AS thingy
ORDER BY  ID, year asc
-- Grab a note

SELECT SO.OrderNumber, SO.ActualShipDate, Note.Note
FROM ShipmentOrder AS SO INNER JOIN ShipmentOrderNote AS Note On SO.OrderNumber = Note.OrderNumber
WHERE SO.CustomerName = '314' AND SO.ActualShipDate BETWEEN '9/01/2022 00:00:01' AND '09/30/2022 23:59:59' AND
Note.Note LIKE '%110 CASES PER PALLET%'

SELECT name
FROM Customer
WHERE referee_id != 2; or referee_id  IS NULL

'to find a sous'

SELECT CustomerName, ActualShipDate, OrderNumber, CustomerOrderNumber, CustomerPoNumber, CarrierProNumber,
WarehouseBolNumber, RoutingReferenceNumber

FROM ShipmentOrder

WHERE CustomerName = '400'  AND FacilityName!='Ztest' AND CarrierName = 'PRIORITY1'


-- Davinci
SELECT dv_business_partner.description,EXTRACT(MONTH FROM dv_order.actual_trans_ts) as month, EXTRACT(YEAR FROM dv_order.actual_trans_ts) as YEAR,
 sum(dv_order_ship_item_entry.qty) as Units, count(DISTINCT(dv_order.id)), count(dv_order_ship_item_entry.ordinal) as SKu
FROM dv_order INNER JOIN dv_business_partner
ON dv_order.vendor_id = dv_business_partner.id
INNER JOIN dv_order_ship_item_entry ON dv_order.id = dv_order_ship_item_entry.order_id

WHERE dv_order.actual_trans_ts BETWEEN '2021-05-01 00:00:00' AND '2022-07-31 23:59:59'

GROUP BY dv_business_partner.description , month, YEAR
ORDER BY dv_business_partner.description, month, YEAR