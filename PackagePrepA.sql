SELECT 
    ShipmentOrderPackage.OrderNumber, COUNT(ShipmentOrderPackage.CreatedByAllocation)
    FROM ShipmentOrderPackage INNER JOIN  ShipmentOrder
    ON ShipmentOrderPackage.OrderNumber=ShipmentOrder.OrderNumber
    WHERE ShipmentOrder.CustomerName='400' AND ShipmentOrder.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
    AND ShipmentOrderPackage.CreatedByAllocation=0
    GROUP BY ShipmentOrderPackage.OrderNumber
