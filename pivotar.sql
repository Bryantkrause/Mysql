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
    CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As ID,
year(DeliveryDate) as year, IsNull(month(DeliveryDate), 0) as month ,
PalletsReceived 
FROM WarehouseReceipt
WHERE DeliveryDate BETWEEN '1/01/2021 00:00:01' AND '07/31/2022 23:59:59' AND
 CustomerName != 'PC' AND CustomerName !='Z_TEST')  test
 PIVOT (
    SUM(PalletsReceived) FOR month IN ([1] , [2] , [3] , [4] , [5] , [6] , [7] , [8] ,[9] , [10] , [11] , [12])) AS thingy
ORDER BY ID, year desc

-- total
SELECT CustomerName,
CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As ID,
    SUM(case when month(DeliveryDate) = 1 then PalletsReceived else 0 end) Jan,
    SUM(case when month(DeliveryDate) = 2 then PalletsReceived else 0 end) Feb,
    SUM(case when month(DeliveryDate) = 3 then PalletsReceived else 0 end) Mar,
    SUM(case when month(DeliveryDate) = 4 then PalletsReceived else 0 end) Apr,
    SUM(case when month(DeliveryDate) = 5 then PalletsReceived else 0 end) May,
    SUM(case when month(DeliveryDate) = 6 then PalletsReceived else 0 end) Jun,
    SUM(case when month(DeliveryDate) = 7 then PalletsReceived else 0 end) Jul,
    SUM(case when month(DeliveryDate) = 8 then PalletsReceived else 0 end) Aug,
    SUM(case when month(DeliveryDate) = 9 then PalletsReceived else 0 end) Sep,
    SUM(case when month(DeliveryDate) = 10 then PalletsReceived else 0 end) Oct,
    SUM(case when month(DeliveryDate) = 11 then PalletsReceived else 0 end) Nov,
    SUM(case when month(DeliveryDate) = 12 then PalletsReceived else 0 end) Dec,
    SUM(PalletsReceived) Total
FROM WarehouseReceipt
WHERE DeliveryDate BETWEEN '1/01/2021 00:00:01' AND '07/31/2022 23:59:59' AND
CustomerName != 'PC' AND CustomerName !='Z_TEST'
GROUP BY CustomerName