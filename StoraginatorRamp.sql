
    SELECT
    INV.LocationName, CUS.CustomerName+'-'+CUS.CustomerAlias CustomerName, Count(distinct(INV.PalletId)) PalletCount
    FROM
    Inventory INV INNER JOIN Customer CUS ON INV.CustomerName=CUS.CustomerName
    WHERE
    INV.FacilityName='Fullerton' and CUS.Status=0 
    GROUP BY CUS.CustomerName, CUS.CustomerAlias, INV.LocationName
