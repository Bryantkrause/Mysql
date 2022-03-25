SELECT
SO.OrderNumber, ShipmentOrderPick.WarehouseSku, SO.User3, SO.User4, PackDetail.UOM, SO.ActualShipDate, SO.CustomerName, PackDetail.Count, ShipmentOrderPick.Qty, ShipmentOrderPick.PickQty labels, 
FROM ShipmentOrder As SO INNER JOIN ShipmentOrderPick 
ON SO.OrderNumber=ShipmentOrderPick.OrderNumber
INNER JOIN Sku ON ShipmentOrderPick.WarehouseSku=Sku.WarehouseSku
INNER JOIN PackDetail ON Sku.DefaultPack=PackDetail.PackName
WHERE SO.CustomerName='400' AND SO.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
AND (SO.User3='true' OR SO.User3='TRUE')
AND (SO.User4='true' OR SO.User4='TRUE')
AND PackDetail.UOM='IN'

SELECT id, value, (value/2) AS calculated FROM mytable
