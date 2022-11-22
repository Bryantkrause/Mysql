
-- davinci order by month for inbound
SELECT bp.accountid,
EXTRACT(YEAR FROM o.actual_trans_ts) as Createyear,
EXTRACT(Month FROM o.actual_trans_ts) as Createmonth,
count(o.doc_number) AS ORDERS
FROM dv_business_partner AS bp INNER JOIN dv_order as o ON bp.id = o.vendor_id 
WHERE o.actual_trans_ts BETWEEN '1/01/2021 00:00:01' AND '10/31/2022 23:59:59' AND .type = 1 and o.actual_trans_ts IS NOT NULL
GROUP BY bp.accountid, o.actual_trans_ts, Createyear, Createmonth

-- no customer detail
SELECT 
to_char(DATE_TRUNC('month', actual_trans_ts), 'YYYY, MM') as month,
count(doc_number) AS ORDERS
FROM  dv_order 
WHERE actual_trans_ts BETWEEN '1/01/2021 00:00:01' AND '10/31/2022 23:59:59' AND type = 1
GROUP BY  DATE_TRUNC('month', actual_trans_ts)
ORDER BY  DATE_TRUNC('month', actual_trans_ts)

-- ramp inbound orders by month

SELECT CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As name, FacilityName,
DATEPART(YEAR, DeliveryDate) As year,
DATEPART(Month, DeliveryDate) As month,
Count(DISTINCT(ReceiptNumber)) AS Orders
FROM WarehouseReceipt 
WHERE DeliveryDate BETWEEN '1/01/2021 00:00:01' AND '10/31/2022 23:59:59'
AND CustomerName != 'PC' AND CustomerName !='Z_TEST' AND FacilityName !='Z_TEST'
GROUP BY DATEPART(YEAR, DeliveryDate),DATEPART(Month, DeliveryDate), CustomerName, FacilityName
ORDER BY DATEPART(YEAR, DeliveryDate),DATEPART(Month, DeliveryDate)