SELECT
ShipShipmentOrder.OrderNumber, ShipmentOrderPick.WarehouseSku,ShipmentOrder.User2, PackDetail.UOM,
ShipShipmentOrder.ActualShipDate,ShipmentOrder.CustomerName, PackDetail.Count, ShipmentOrderPick.Qty
FROM ShipmentOrder AsShipmentOrder INNER JOIN ShipmentOrderPick 
ONShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
INNER JOIN Sku ON ShipmentOrderPick.WarehouseSku=Sku.WarehouseSku
INNER JOIN PackDetail ON Sku.DefaultPack=PackDetail.PackName
WHERE ShipmentOrder.CustomerName='400' ANDShipmentOrder.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
AND (ShipShipmentOrder.User2='true' ORShipmentOrder.User2='TRUE')
AND PackDetail.UOM='IN'

'M'
SELECT
ShipmentOrder.OrderNumber, SUM(ShipmentOrderPick.Qty), (SUM(ShipmentOrderPick.Qty) * CustomerTariff.Rate)
FROM ShipmentOrder  INNER JOIN ShipmentOrderPick 
ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
INNER JOIN Sku ON ShipmentOrderPick.WarehouseSku=Sku.WarehouseSku
INNER JOIN PackDetail ON Sku.DefaultPack=PackDetail.PackName
LEFT JOIN CustomerTariff ON ShipmentOrder.CustomerName=CustomerTariff.CustomerName 
WHERE ShipmentOrder.CustomerName='400'
"&Date&" 
AND (ShipmentOrder.User2='true' OR ShipmentOrder.User2='TRUE')
AND PackDetail.UOM='IN'
AND CustomerTariff.TariffName = 'VAS PCS'
GROUP BY ShipmentOrder.OrderNumber, CustomerTariff.Rate