SELECT
SO.OrderNumber, ShipmentOrderPick.WarehouseSku, SO.User2, PackDetail.UOM, SO.ActualShipDate, SO.CustomerName, PackDetail.Count, ShipmentOrderPick.Qty
FROM ShipmentOrder As SO INNER JOIN ShipmentOrderPick 
ON SO.OrderNumber=ShipmentOrderPick.OrderNumber
INNER JOIN Sku ON ShipmentOrderPick.WarehouseSku=Sku.WarehouseSku
INNER JOIN PackDetail ON Sku.DefaultPack=PackDetail.PackName
WHERE SO.CustomerName='400' AND SO.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
AND (SO.User2='true' OR SO.User2='TRUE')
AND PackDetail.UOM='IN'