
-- davinci order by month for inbound
SELECT 
to_char(DATE_TRUNC('month', actual_trans_ts), 'YYYY, MM') as month,
count(doc_number) AS ORDERS
FROM  dv_order 
WHERE actual_trans_ts BETWEEN '1/01/2021 00:00:01' AND '10/31/2022 23:59:59' AND type = 1
GROUP BY  DATE_TRUNC('month', actual_trans_ts)
ORDER BY  DATE_TRUNC('month', actual_trans_ts)

-- ramp inbound orders by month
SELECT
DATEPART(YEAR, DeliveryDate) As year,
DATEPART(Month, DeliveryDate) As month,
Count(DISTINCT(ReceiptNumber)) AS Orders
FROM WarehouseReceipt 
WHERE DeliveryDate BETWEEN '1/01/2021 00:00:01' AND '10/31/2022 23:59:59'
AND CustomerName != 'PC' AND CustomerName !='Z_TEST' AND FacilityName !='Z_TEST'
GROUP BY DATEPART(YEAR, DeliveryDate),DATEPART(Month, DeliveryDate)
ORDER BY DATEPART(YEAR, DeliveryDate),DATEPART(Month, DeliveryDate)