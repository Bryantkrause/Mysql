CREATE PROCEDURE [Testify]
    @Starting
    @Ending
AS
BEGIN

SELECT 
OrderNumber, CartonQuantity
FROM ShipmentOrder
WHERE CustomerName='400' AND
ActualShipDate BETWEEN @Starting AND @Ending

END