-- ramp out
SELECT
CASE WHEN ShipmentOrder.CustomerName >= 430 THEN 430 ELSE ShipmentOrder.CustomerName END As ID, 
Year = DATEPART(YEAR, ShipmentOrder.CreateDate),
Month = DATEPART(Month, ShipmentOrder.CreateDate),
Day = DATEPART(Day, ShipmentOrder.CreateDate),
Count(DISTINCT(ShipmentOrder.OrderNumber)) As Orders, SUM(ShipmentOrder.QtyShipped) as Qty,
Count(DISTINCT(ShipmentOrderDetail.WarehouseSku)) As Sku
FROM ShipmentOrder LEFT JOIN ShipmentOrderDetail ON ShipmentOrder.OrderNumber = ShipmentOrderDetail.OrderNumber
WHERE ShipmentOrder.CreateDate  BETWEEN '1/01/2022 00:00:01' AND '10/15/2022 23:59:59' AND
ShipmentOrder.CustomerName != 'PC' AND ShipmentOrder.CustomerName !='Z_TEST' AND ShipmentOrder.FacilityName !='Z_TEST'
GROUP BY ShipmentOrder.CustomerName,DATEPART(Day, ShipmentOrder.CreateDate), DATEPART(YEAR, ShipmentOrder.CreateDate), DATEPART(Month, ShipmentOrder.CreateDate)

-- Ramp inbound
SELECT CASE WHEN WarehouseReceipt.CustomerName >= 430 THEN 430 ELSE WarehouseReceipt.CustomerName END As name,
Year = DATEPART(YEAR, WarehouseReceipt.CreateDate),
Month = DATEPART(Month, WarehouseReceipt.CreateDate),
Day = DATEPART(Day, WarehouseReceipt.CreateDate),
SUM(WarehouseReceipt.QtyReceived) As Units, Count(DISTINCT(WarehouseReceipt.ReceiptNumber)) AS Orders,
Count(WarehouseReceiptDetail.WarehouseSku) As Sku
FROM WarehouseReceipt LEFT JOin WarehouseReceiptDetail ON WarehouseReceipt.ReceiptNumber = WarehouseReceiptDetail.ReceiptNumber
WHERE WarehouseReceipt.CreateDate BETWEEN '1/01/2022 00:00:01' AND '10/15/2022 23:59:59'
AND WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST'
GROUP BY WarehouseReceipt.CustomerName, DATEPART(Day, WarehouseReceipt.CreateDate), DATEPART(YEAR, WarehouseReceipt.CreateDate),DATEPART(Month, WarehouseReceipt.CreateDate)
ORDER BY WarehouseReceipt.CustomerName, DATEPART(YEAR, WarehouseReceipt.CreateDate),DATEPART(Month, WarehouseReceipt.CreateDate)