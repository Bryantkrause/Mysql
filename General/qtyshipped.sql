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
CASE WHEN so.CartonQuantity < so.QtyShipped THEN so.CartonQuantity ELSE so.QtyShipped END AS UnitShipped,
IsNull(month(so.ActualShipDate), 0) as month,
IsNull(year(so.ActualShipDate), 0) as year
FROM ShipmentOrder AS so LEFT JOIN Customer AS C ON so.CustomerName = c.CustomerName
WHERE so.ActualShipDate  BETWEEN '1/01/2021 00:00:01' AND '11/30/2022 23:59:59' AND
so.CustomerName != 'PC' AND so.CustomerName !='Z_TEST' AND so.FacilityName !='ZTEST' AND
c.status = 0
) Ship
PIVOT (
    SUM(UnitShipped)
FOR month IN ([1] , [2] , [3] , [4] , [5] , [6] , [7] , [8] ,[9] , [10] , [11] , [12])) AS thingy
ORDER BY  ID, year asc

-- with total
WITH OrderNumber (UnitShipped,[year], [Orderyear], [month]) AS
(
SELECT CASE WHEN so.CustomerName >= 430 THEN 430 ELSE so.CustomerName END As ID,
CASE WHEN so.CartonQuantity < so.QtyShipped THEN so.CartonQuantity ELSE so.QtyShipped END AS UnitShipped,
LEFT (datename(Month,so.ActualShipDate), 3) as [month],
Year(so.ActualShipDate) as [year],
Year(so.ActualShipDate) as [Orderyear]
FROM ShipmentOrder AS so LEFT JOIN Customer AS C ON so.CustomerName = c.CustomerName
WHERE so.ActualShipDate  BETWEEN '1/01/2021 00:00:01' AND '11/30/2022 23:59:59' AND
so.CustomerName != 'PC' AND so.CustomerName !='Z_TEST' AND so.FacilityName !='ZTEST' AND
c.status = 0
)
select *,
    (select count([Year] from OrderNumber X
    where X.Orderyear = PVT.Orderyear) as [Total]
from OrderNumber
PIVOT (
    Count(Orderyear)
FOR month IN (Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec)) AS thingy
ORDER BY  ID, year asc



WITH POnumber (POStatus, [Year], [poyear], [pomonth]) AS
(
    Select case when (podocstatus = 'CL') then 'Closed PO'
         when (podocstatus = 'OP') then 'Open PO'
         when (podocstatus = 'SC') then 'Short Closed PO'   
    end as POStatus, 
    YEAR(podate) as [Year], YEAR(podate) as [poyear] , LEFT (datename(Month,podate),3) as [pomonth]
    From PO_order_hdr
    Where podocstatus IN ('SC','CL','OP')
)
select *,
    -- Subselect that counts the total for the given status and year:
    (select count([Year]) from POnumber T 
     where T.POStatus = PVT.POStatus and T.poyear = PVT.poyear) as [Total]
from POnumber
PIVOT
(
    Count(poyear)
    FOR [pomonth]  IN (Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec)
)as PVT