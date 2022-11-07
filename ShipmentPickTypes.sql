-- This query is looking for types and total number of picks a customer has given a specific time frame

SELECT p.PickUOM, SUM(p.PickQty) AS Total_Picks
FROM ShipmentOrder as so LEFT JOIN ShipmentOrderPick as p On so.OrderNumber = p.OrderNumber AND 
so.CustomerName = p.CustomerName AND so.FacilityName = p.FacilityName
WHERE so.ActualShipDate BETWEEN '10/01/2022 00:00:01' AND '10/31/2022 23:59:59' AND so.CustomerName = '10' AND
so.FacilityName = 'Fullerton'
GROUP BY p.PickUOM

-- this query is a follow up of the above query and seletcs more detail to review at the order level not just the pick level for a specific customer

SELECT so.OrderNumber, p.PickUOM, SUM(p.PickQty) AS Total_Picks
FROM ShipmentOrder as so LEFT JOIN ShipmentOrderPick as p On so.OrderNumber = p.OrderNumber AND 
so.CustomerName = p.CustomerName AND so.FacilityName = p.FacilityName
WHERE so.ActualShipDate BETWEEN '10/01/2022 00:00:01' AND '10/31/2022 23:59:59' AND so.CustomerName = '10' AND
so.FacilityName = 'Fullerton'
GROUP BY so.OrderNumber, p.PickUOM

-- all customer picks given type and time 

SELECT so.CustomerName, p.PickUOM, SUM(p.PickQty) AS Total_Picks
FROM ShipmentOrder as so LEFT JOIN ShipmentOrderPick as p On so.OrderNumber = p.OrderNumber AND 
so.CustomerName = p.CustomerName AND so.FacilityName = p.FacilityName
WHERE so.ActualShipDate BETWEEN '10/01/2022 00:00:01' AND '10/31/2022 23:59:59' 
GROUP BY so.CustomerName, p.PickUOM

-- customer picks given type and time buuuut with a pivot and combining Unicargo also no null values

with CTE as
(
SELECT * FROM(
    SELECT 
    CASE WHEN so.CustomerName >= 430 THEN 430 ELSE so.CustomerName END As ID,
    p.PickUOM,IsNull(p.PickQty,0) AS PickQty
    FROM ShipmentOrder as so LEFT JOIN ShipmentOrderPick as p On so.OrderNumber = p.OrderNumber AND 
    so.CustomerName = p.CustomerName AND so.FacilityName = p.FacilityName AND
    so.CustomerName != 'PC' AND so.CustomerName !='Z_TEST'
    WHERE so.ActualShipDate BETWEEN '10/01/2022 00:00:01' AND '10/31/2022 23:59:59') thingy
PIVOT (
    SUM(thingy.PickQty) FOR PickUOM IN ([PL], [CS], [EA], [IN])) AS turn
    )
SELECT ID, IsNull([PL], 0) AS PalletPick, IsNull([CS], 0) AS CasePick, IsNull([EA], 0) AS EachPick, IsNull([IN], 0) AS InnerPick
FROM CTE


