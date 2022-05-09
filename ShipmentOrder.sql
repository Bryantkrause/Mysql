SELECT CustomerName, OrderNumber, ActualShipDate, TransportMethod, PalletsShipped, CartonQuantity, QtyShipped

FROM ShipmentOrder

WHERE CustomerName = "&Customer&" AND "&Date&" AND FacilityName!='Ztest'