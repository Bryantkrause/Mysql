SELECT
CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As ID, 
Year = DATEPART(YEAR, ActualShipDate),
Month = DATEPART(Month, ActualShipDate),
Count(DISTINCT(OrderNumber)) As Orders, SUM(QtyShipped) as Qty

FROM ShipmentOrder

WHERE ActualShipDate  BETWEEN '4/01/2021 00:00:01' AND '07/31/2022 23:59:59' AND
CustomerName != 'PC' AND CustomerName !='Z_TEST' AND FacilityName !='Z_TEST'
GROUP BY CustomerName, DATEPART(YEAR, ActualShipDate), DATEPART(Month, ActualShipDate)


'to find a sous'

SELECT CustomerName, ActualShipDate, OrderNumber, CustomerOrderNumber, CustomerPoNumber, CarrierProNumber,
WarehouseBolNumber, RoutingReferenceNumber

FROM ShipmentOrder

WHERE CustomerName = '400'  AND FacilityName!='Ztest' AND CarrierName = 'PRIORITY1'