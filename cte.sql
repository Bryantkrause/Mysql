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