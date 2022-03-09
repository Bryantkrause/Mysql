SELECT
OrderNumber, CartonQuantity
FROM ShipmentOrder
WHERE CustomerName='400' AND
ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59' AND
(ConsigneeName='Amazon' OR ConsigneeName='AMAZON')