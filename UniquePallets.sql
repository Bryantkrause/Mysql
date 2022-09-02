-- Cerritos

SELECT
ShipmentOrder.OrderNumber, ShipmentOrderPick.FromPalletId, Count( Distinct(ShipmentOrderPick.FromPalletId)) As PalletNum, 
(Count( Distinct(ShipmentOrderPick.FromPalletId)) * 14.50) As MaterialCharge, (Count( Distinct(ShipmentOrderPick.FromPalletId)) * 4.2) As WrapCharge
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

-- Fullerton
SELECT
ShipmentOrder.OrderNumber, ShipmentOrderPick.FromPalletId, Count( Distinct(ShipmentOrderPick.FromPalletId)) As PalletNum, 
(Count( Distinct(ShipmentOrderPick.FromPalletId)) * 14.50) As MaterialCharge, (Count( Distinct(ShipmentOrderPick.FromPalletId)) * 4.2) As WrapCharge
FROM ShipmentOrder
INNER JOIN ShipmentOrderPick ON
ShipmentOrderPick.OrderNumber=ShipmentOrder.OrderNumber
LEFT JOIN CustomerAccessorial ON
ShipmentOrder.CustomerName=CustomerAccessorial.CustomerName 
WHERE
ShipmentOrder.FacilityName='Fullerton'
AND ShipmentOrder.CustomerName='400'
AND ShipmentOrder.TransportMethod ='M'
AND ShipmentOrder.ActualShipDate BETWEEN '8/1/2022' AND '8/31/2022'
GROUP BY ShipmentOrderPick.FromPalletId, ShipmentOrder.OrderNumber