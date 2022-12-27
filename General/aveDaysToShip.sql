SELECT 
FacilityName, ID, year,
[1] = isnull([1], 0),
[2] = isnull([2], 0),
[3] = isnull([3], 0),
[4] = isnull([4], 0),
[5] = isnull([5], 0),
[6] = isnull([6], 0),
[7] = isnull([7], 0),
[8] = isnull([8], 0),
[9] = isnull([9], 0),
[10] = isnull([10], 0),
[11] = isnull([11], 0),
[12] = isnull([12], 0)
FROM (
SELECT so.FacilityName, CASE WHEN so.CustomerName >= 430 THEN 430 ELSE so.CustomerName END As ID,
DATEDIFF(dd,so.CreateDate,so.ActualShipDate) As DaysToShip,
IsNull(month(so.ActualShipDate), 0) as month,
IsNull(year(so.ActualShipDate), 0) as year
FROM ShipmentOrder AS so LEFT JOIN Customer AS C ON so.CustomerName = c.CustomerName
WHERE so.ActualShipDate  BETWEEN '1/01/2021 00:00:01' AND '11/30/2022 23:59:59' AND
so.CustomerName != 'PC' AND so.CustomerName !='Z_TEST' AND so.FacilityName !='ZTEST' AND
c.status = 0
) Ship
PIVOT (
    AVG(DaysToShip)
FOR month IN ([1] , [2] , [3] , [4] , [5] , [6] , [7] , [8] ,[9] , [10] , [11] , [12])) AS thingy
ORDER BY  ID, year asc