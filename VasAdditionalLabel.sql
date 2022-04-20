SELECT
SO.OrderNumber, ShipmentOrderPick.WarehouseSku, SO.User3, SO.User4, PackDetail.UOM, 
SO.ActualShipDate, SO.CustomerName, PackDetail.Count, ShipmentOrderPick.Qty, ShipmentOrderPick.PickQty labels, 
FROM ShipmentOrder As SO INNER JOIN ShipmentOrderPick 
ON SO.OrderNumber=ShipmentOrderPick.OrderNumber
INNER JOIN Sku ON ShipmentOrderPick.WarehouseSku=Sku.WarehouseSku
INNER JOIN PackDetail ON Sku.DefaultPack=PackDetail.PackName
WHERE SO.CustomerName='400' AND SO.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
AND (SO.User3='true' OR SO.User3='TRUE')
AND (SO.User4='true' OR SO.User4='TRUE')
AND PackDetail.UOM='IN'

'M'

SELECT
ShipmentOrder.OrderNumber, (Sum(PackDetail.Count/ShipmentOrderPick.Qty)) AS LabelMe
FROM ShipmentOrder As ShipmentOrder INNER JOIN ShipmentOrderPick 
ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
LEFT JOIN CustomerTariff ON ShipmentOrder.CustomerName=CustomerTariff.CustomerName 
INNER JOIN Sku ON ShipmentOrderPick.WarehouseSku=Sku.WarehouseSku
INNER JOIN PackDetail ON Sku.DefaultPack=PackDetail.PackName
WHERE ShipmentOrder.CustomerName='400' 
"&Date&" 
AND CustomerTariff.TariffName = 'VAS INNER'
AND (ShipmentOrder.User3='true' OR ShipmentOrder.User3='TRUE')
AND (ShipmentOrder.User4='true' OR ShipmentOrder.User4='TRUE')
AND PackDetail.UOM='IN'
GROUP BY ShipmentOrder.OrderNumber, PackDetail.Count, ShipmentOrderPick.Qty

132067