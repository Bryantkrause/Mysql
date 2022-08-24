Select * from (
     Select Case when (podocstatus = 'CL') then 'Closed PO'
         when (podocstatus = 'OP') then 'Open PO'
         when (podocstatus = 'SC') then 'Short Closed PO'   
    end as POStatus, 
    YEAR(podate) as [Year], YEAR(podate) as [poyear] , LEFT (datename(Month,podate),3) as [pomonth]
    From PO_order_hdr
    Where podocstatus IN ('SC','CL','OP')
    ) as POnumber
PIVOT
(
    Count(poyear)
    FOR [pomonth]  IN (Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec)

)as PVT