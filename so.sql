'M'

SELECT
ShipmentOrder.OrderNumber, (PackDetail.Count/ShipmentOrderPick.Qty) AS LabelMe
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
GROUP BY ShipmentOrder.OrderNumber