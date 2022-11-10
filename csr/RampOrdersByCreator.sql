-- ramp out
SELECT ShipmentOrder.CreateWho,
CASE WHEN ShipmentOrder.CustomerName >= 430 THEN 430 ELSE ShipmentOrder.CustomerName END As ID, ShipmentOrder.FacilityName,
Year = DATEPART(YEAR, ShipmentOrder.CreateDate),
Month = DATEPART(Month, ShipmentOrder.CreateDate),
Day = DATEPART(Day, ShipmentOrder.CreateDate),
Count(DISTINCT(ShipmentOrder.OrderNumber)) As Orders, SUM(ShipmentOrder.QtyShipped) as Qty,
Count(DISTINCT(ShipmentOrderDetail.WarehouseSku)) As Sku,
ShipmentOrder.EDISent
FROM ShipmentOrder LEFT JOIN ShipmentOrderDetail ON ShipmentOrder.OrderNumber = ShipmentOrderDetail.OrderNumber
WHERE ShipmentOrder.CreateDate  BETWEEN '11/01/2022 00:00:01' AND '11/08/2022 23:59:59' AND
ShipmentOrder.CustomerName != 'PC' AND ShipmentOrder.CustomerName !='Z_TEST' AND ShipmentOrder.FacilityName !='ZTEST' AND
ShipmentOrder.Status != 98 
GROUP BY ShipmentOrder.CreateWho, ShipmentOrder.CustomerName,DATEPART(Day, ShipmentOrder.CreateDate), ShipmentOrder.EDISent,
DATEPART(YEAR, ShipmentOrder.CreateDate), DATEPART(Month, ShipmentOrder.CreateDate), ShipmentOrder.FacilityName

-- Ramp inbound
SELECT WR.CreateWho,
CASE WHEN WR.CustomerName >= 430 THEN 430 ELSE WR.CustomerName END As name, WR.FacilityName,
Year = DATEPART(YEAR, WR.CreateDate),
Month = DATEPART(Month, WR.CreateDate),
Day = DATEPART(Day, WR.CreateDate),
Count(DISTINCT(WR.ReceiptNumber)) AS Orders, SUM(WR.QtyReceived) As Qty,
Count(WarehouseReceiptDetail.WarehouseSku) As Sku,
WR.EDISent
FROM WarehouseReceipt AS WR LEFT JOin WarehouseReceiptDetail ON WR.ReceiptNumber = WarehouseReceiptDetail.ReceiptNumber
WHERE WR.CreateDate BETWEEN '1/01/2022 00:00:01' AND '10/15/2022 23:59:59'
AND WR.CustomerName != 'PC' AND WR.CustomerName !='Z_TEST' AND WR.FacilityName !='ZTEST'
GROUP BY WR.CustomerName, DATEPART(Day, WR.CreateDate), DATEPART(YEAR, WR.CreateDate),DATEPART(Month, WR.CreateDate), WR.FacilityName, WR.EDISent
ORDER BY WR.CustomerName, DATEPART(YEAR, WR.CreateDate),DATEPART(Month, WR.CreateDate)