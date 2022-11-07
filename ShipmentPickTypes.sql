-- This query is looking for types and total number of picks a customer has given a specific time frame

SELECT p.PickUOM, SUM(p.PickQty) AS Total_Picks

FROM ShipmentOrder as so LEFT JOIN ShipmentOrderPick as p On so.OrderNumber = p.OrderNumber AND 
so.CustomerName = p.CustomerName AND so.FacilityName = p.FacilityName

WHERE so.ActualShipDate BETWEEN '10/01/2022 00:00:01' AND '10/31/2022 23:59:59' AND so.CustomerName = '10' AND
so.FacilityName = 'Fullerton'

GROUP BY p.PickUOM

-- this query is a follow up of the above query and seletcs more detail to review at the order level not just the pick level

SELECT so.OrderNumber, p.PickUOM, SUM(p.PickQty) AS Total_Picks

FROM ShipmentOrder as so LEFT JOIN ShipmentOrderPick as p On so.OrderNumber = p.OrderNumber AND 
so.CustomerName = p.CustomerName AND so.FacilityName = p.FacilityName

WHERE so.ActualShipDate BETWEEN '10/01/2022 00:00:01' AND '10/31/2022 23:59:59' AND so.CustomerName = '10' AND
so.FacilityName = 'Fullerton'

GROUP BY so.OrderNumber, p.PickUOM