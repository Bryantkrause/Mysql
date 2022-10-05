SELECT
ShipmentOrderPick.FromPalletId, Count( Distinct(ShipmentOrderPick.FromPalletId))
FROM ShipmentOrder
INNER JOIN ShipmentOrderPick ON
ShipmentOrderPick.OrderNumber=ShipmentOrder.OrderNumber AND
ShipmentOrderPick.FacilityName=ShipmentOrder.FacilityName AND
ShipmentOrderPick.CustomerName=ShipmentOrder.CustomerName 
WHERE
ShipmentOrder.FacilityName='Cerritos'
AND ShipmentOrder.CustomerName='400'
AND ShipmentOrder.TransportMethod <>'U'
AND ShipmentOrder.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
GROUP BY ShipmentOrderPick.FromPalletId

"M"

SELECT
ShipmentOrderPick.FromPalletId, Count( Distinct(ShipmentOrderPick.FromPalletId))
FROM ShipmentOrder
INNER JOIN ShipmentOrderPick ON
ShipmentOrderPick.OrderNumber=ShipmentOrder.OrderNumber AND
ShipmentOrderPick.FacilityName=ShipmentOrder.FacilityName AND
ShipmentOrderPick.CustomerName=ShipmentOrder.CustomerName 
WHERE
ShipmentOrder.FacilityName='Cerritos'
AND ShipmentOrder.CustomerName='400'
AND ShipmentOrder.TransportMethod <>'U'
AND "&Date4&"
GROUP BY ShipmentOrderPick.FromPalletId