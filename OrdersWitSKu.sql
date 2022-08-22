
-- ramp out
SELECT
CASE WHEN ShipmentOrder.CustomerName >= 430 THEN 430 ELSE ShipmentOrder.CustomerName END As ID, 
Year = DATEPART(YEAR, ShipmentOrder.ActualShipDate),
Month = DATEPART(Month, ShipmentOrder.ActualShipDate),
Count(DISTINCT(ShipmentOrder.OrderNumber)) As Orders, SUM(ShipmentOrder.QtyShipped) as Qty,
Count(DISTINCT(ShipmentOrderDetail.WarehouseSku)) As Sku

FROM ShipmentOrder LEFT JOIN ShipmentOrderDetail ON ShipmentOrder.OrderNumber = ShipmentOrderDetail.OrderNumber

WHERE ShipmentOrder.ActualShipDate  BETWEEN '4/01/2021 00:00:01' AND '07/31/2022 23:59:59' AND
ShipmentOrder.CustomerName != 'PC' AND ShipmentOrder.CustomerName !='Z_TEST' AND ShipmentOrder.FacilityName !='Z_TEST'
GROUP BY ShipmentOrder.CustomerName, DATEPART(YEAR, ShipmentOrder.ActualShipDate), DATEPART(Month, ShipmentOrder.ActualShipDate)

-- Ramp inbound
SELECT CASE WHEN WarehouseReceipt.CustomerName >= 430 THEN 430 ELSE WarehouseReceipt.CustomerName END As name,
Year = DATEPART(YEAR, WarehouseReceipt.DeliveryDate),
Month = DATEPART(Month, WarehouseReceipt.DeliveryDate),
SUM(WarehouseReceipt.QtyReceived) As Units, Count(DISTINCT(WarehouseReceipt.ReceiptNumber)) AS Orders,
Count(WarehouseReceiptDetail.WarehouseSku) As Sku
FROM WarehouseReceipt LEFT JOin WarehouseReceiptDetail ON WarehouseReceipt.ReceiptNumber = WarehouseReceiptDetail.ReceiptNumber
WHERE WarehouseReceipt.DeliveryDate BETWEEN '4/01/2021 00:00:01' AND '07/31/2022 23:59:59'
AND WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST'
GROUP BY WarehouseReceipt.CustomerName, DATEPART(YEAR, WarehouseReceipt.DeliveryDate),DATEPART(Month, WarehouseReceipt.DeliveryDate)
ORDER BY WarehouseReceipt.CustomerName, DATEPART(YEAR, WarehouseReceipt.DeliveryDate),DATEPART(Month, WarehouseReceipt.DeliveryDate)