SELECT
ShipmentOrder.OrderNumber, ShipmentOrderPick.FromPalletId, Count( Distinct(ShipmentOrderPick.FromPalletId))
FROM ShipmentOrder
INNER JOIN ShipmentOrderPick ON
ShipmentOrderPick.OrderNumber=ShipmentOrder.OrderNumber
LEFT JOIN CustomerAccessorial ON
 ShipmentOrder.CustomerName=CustomerAccessorial.CustomerName 
WHERE
ShipmentOrder.FacilityName='Cerritos'
AND ShipmentOrder.CustomerName='400'
AND ShipmentOrder.TransportMethod ='M'
AND ShipmentOrder.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
GROUP BY ShipmentOrderPick.FromPalletId, ShipmentOrder.OrderNumber

"M"

SELECT
ShipmentOrder.OrderNumber, ShipmentOrderPick.FromPalletId, Count( Distinct(ShipmentOrderPick.FromPalletId)) As PalletNum, 
(Count( Distinct(ShipmentOrderPick.FromPalletId)) * 14.50) As MaterialCharge, (Count( Distinct(ShipmentOrderPick.FromPalletId)) * 3.85) As WrapCharge
FROM ShipmentOrder
INNER JOIN ShipmentOrderPick ON
ShipmentOrderPick.OrderNumber=ShipmentOrder.OrderNumber
LEFT JOIN CustomerAccessorial ON
 ShipmentOrder.CustomerName=CustomerAccessorial.CustomerName 
WHERE
ShipmentOrder.FacilityName='Cerritos'
AND ShipmentOrder.CustomerName='400'
AND ShipmentOrder.TransportMethod ='M'
"&Date&" 
GROUP BY ShipmentOrderPick.FromPalletId, ShipmentOrder.OrderNumber