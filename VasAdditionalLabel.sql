SELECT
ShipmentOrder.OrderNumber, ShipmentOrder.ActualShipDate, ShipmentOrderPick.User3, ShipmentOrderPick.User4, ShipmentOrder.Qty
FROM ShipmentOrder INNER JOIN ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
WHERE ShipmentOrder.CustomerName='400' AND 
ShipmentOrder.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59' 
AND(ShipmentOrderPick.User3="true" OR ShipmentOrderPick.User3="TRUE")
AND (ShipmentOrderPick.User4="true" OR ShipmentOrderPick.User4="TRUE")
AND ShipmentOrderPick.WarehouseSku IN(
PackDetail.COUNT  From Sku INNER JOIN PackDetail ON Sku.DefaultPAck=PackDetail.PackName 
Where Sku.CustomerName='400' AND PackDetail.UOM='IN')

SELECT
ShipmentOrder.OrderNumber, ShipmentOrder.ActualShipDate, ShipmentOrder.User3, ShipmentOrder.User4, ShipmentOrderPick.Qty, ShipmentOrderPick.PickQty, ShipmentOrderPick.WarehouseSku
FROM ShipmentOrder INNER JOIN ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
WHERE ShipmentOrder.CustomerName='400' AND ShipmentOrder.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
AND (ShipmentOrder.User3="true" OR ShipmentOrder.User3="TRUE")
AND (ShipmentOrder.User4="true" OR ShipmentOrder.User4="TRUE")

