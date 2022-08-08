SELECT * FROM
(
SELECT CustomerName, year(DeliveryDate) as year, IsNull(month(DeliveryDate), 0) as month ,PalletsReceived
FROM WarehouseReceipt
WHERE DeliveryDate BETWEEN '1/01/2021 00:00:01' AND '05/31/2022 23:59:59'
)  test
PIVOT (
    SUM (PalletsReceived)
FOR month IN ([1] , [2] , [3] , [4] , [5] , [6] , [7] , [8] ,[9] , [10] , [11] , [12])) AS thingy

ORDER BY year desc
-- above this is working model

-- combine accounts with multiple accounts
SELECT * FROM(
    SELECT  
    CASE WHEN CustomerName >= 430 THEN 500 ELSE CustomerName END As ID,
year(DeliveryDate) as year, IsNull(month(DeliveryDate), 0) as month ,
PalletsReceived 
FROM WarehouseReceipt
WHERE DeliveryDate BETWEEN '1/01/2021 00:00:01' AND '07/31/2022 23:59:59' AND
 CustomerName != 'PC' AND CustomerName !='Z_TEST')  test
 PIVOT (
    SUM(PalletsReceived) FOR month IN ([1] , [2] , [3] , [4] , [5] , [6] , [7] , [8] ,[9] , [10] , [11] , [12])) AS thingy
ORDER BY year desc

