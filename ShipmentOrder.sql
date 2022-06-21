SELECT CustomerName, OrderNumber, ActualShipDate, TransportMethod, PalletsShipped, CartonQuantity, QtyShipped

FROM ShipmentOrder

WHERE CustomerName = "&Customer&" AND "&Date&" AND FacilityName!='Ztest'

'to find a sous'

SELECT CustomerName, ActualShipDate, OrderNumber, CustomerOrderNumber, CustomerPoNumber, CarrierProNumber,
WarehouseBolNumber, RoutingReferenceNumber

FROM ShipmentOrder

WHERE CustomerName = '400'  AND FacilityName!='Ztest' AND CarrierName = 'PRIORITY1'