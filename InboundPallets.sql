
'Ramp Inbound Pallets get all ramp customers total inbound pallets based on date'
SELECT CustomerName, month(DeliveryDate) AS month, SUM(PalletsReceived) As Inbound Pallets

FROM WarehouseReceipt

WHERE DeliveryDate BETWEEN '1/01/2021 00:00:01' AND '05/31/2022 23:59:59'

GROUP BY CustomerName, DeliveryDate

'Davinci inbound pallets get all inbound pallets based on date'

SELECT dv_business_partner.description,
EXTRACT(MONTH FROM dv_order.actual_trans_ts) as month,
EXTRACT(YEAR FROM dv_order.actual_trans_ts) as YEAR,
sum(dv_order_recv_item_entry.qty) as Units,
count(DISTINCT(dv_order.id)) AS Orders,
count(DISTINCT(dv_order_recv_item_entry.containerid)) AS Pallets
FROM dv_order INNER JOIN dv_business_partner
ON dv_order.vendor_id = dv_business_partner.id INNER JOIN dv_order_recv_item_entry ON dv_order.id = dv_order_recv_item_entry.order_id
WHERE dv_order.actual_trans_ts BETWEEN '2021-01-01 00:00:00' AND '2021-12-31 23:59:59' AND 
dv_business_partner.accountid = '261'
GROUP BY dv_business_partner.description , month, YEAR#(lf)ORDER BY dv_business_partner.description, month, YEAR

'Ramp Inbound Pallets get all ramp customers total inbound pallets based on date'
SELECT CustomerName, month(DeliveryDate) AS month,year(DeliveryDate) AS year, SUM(QtyReceived) As Units Count(DISTINCT(ReceiptNumber))
FROM WarehouseReceipt

WHERE DeliveryDate BETWEEN '1/01/2021 00:00:01' AND '05/31/2022 23:59:59'

GROUP BY CustomerName, month, year
ORDER BY CustomerName, month, year