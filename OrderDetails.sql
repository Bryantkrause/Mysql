SELECT
ShipmentOrder.CustomerName, ShipmentOrder.OrderNumber, COUNT(DISTINCT(ShipmentOrderPick.WarehouseSku)) 
FROM ShipmentOrder
INNER JOIN ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
WHERE 
ShipmentOrder.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
GROUP BY ShipmentOrder.CustomerName, ShipmentOrder.OrderNumber

'm'

SELECT
ShipmentOrder.CustomerName, ShipmentOrder.OrderNumber, COUNT(DISTINCT(ShipmentOrderPick.WarehouseSku)) As SkuCount, ShipmentOrderPick.PickUOM
FROM ShipmentOrder
INNER JOIN ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
WHERE 
"&Date&" AND
ShipmentOrder.CustomerName = "&Customer&"
GROUP BY ShipmentOrder.CustomerName, ShipmentOrder.OrderNumber, ShipmentOrderPick.PickUOM

SELECT 
ShipmentOrderPick.OrderNumber, ShipmentOrderPick.PickUOM, ShipmentOrderPick.PickQty, PackDetail.Count
FROM ShipmentOrder INNER JOIN  ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber 
INNER JOIN Sku ON ShipmentOrderPick.WarehouseSku=Sku.WarehouseSku
INNER JOIN PackDetail ON Sku.DefaultPack=PackDetail.PackName
WHERE ShipmentOrder.CustomerName = "&Customer&"  AND "&Date&" 
GROUP BY ShipmentOrderPick.OrderNumber, ShipmentOrderPick.PickUOM, ShipmentOrderPick.PickQty, PackDetail.Count ORDER BY OrderNumber
