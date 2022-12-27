SELECT so.OrderNumber, so.CustomerName,n.noteQualifier,n.Note

FROM ShipmentOrder as so INNER Join ShipmentOrderNote as n ON so.OrderNumber = n.OrderNumber AND
so.FacilityName = n.FacilityName AND so.CustomerName = n.CustomerName

WHERE so.CustomerName = '314' and so.ActualShipDate BETWEEN '10/01/2022 00:00:01' AND '10/31/2022 23:59:59'
