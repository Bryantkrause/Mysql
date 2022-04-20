SELECT
OrderNumber, CartonQuantity
FROM ShipmentOrder
WHERE CustomerName='400' AND
ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59' AND
(ConsigneeName='Amazon' OR ConsigneeName='AMAZON')

'M'
SELECT
ShipmentOrder.OrderNumber,ShipmentOrder.CartonQuantity, (ShipmentOrder.CartonQuantity * CustomerAccessorial.Rate)
FROM ShipmentOrder 
LEFT JOIN CustomerAccessorial ON ShipmentOrder.CustomerName=CustomerAccessorial.CustomerName 
WHERE ShipmentOrder.CustomerName='400'
AND CustomerAccessorial.AccessorialName = 'ADDITIONAL LABEL'
 "&Date&" 
 AND (ShipmentOrder.ConsigneeName='Amazon' OR ShipmentOrder.ConsigneeName='AMAZON')
