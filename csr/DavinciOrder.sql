-- Inbound
SELECT bp.accountid, 
EXTRACT(YEAR FROM o.created_on_dt) as year,
EXTRACT(Month FROM o.created_on_dt) as month,
EXTRACT(Day FROM  o.created_on_dt) as day,
count(o.doc_number) AS ORDERS,
SUM(r.qty) AS QTY,
COUNT(r.item_id) AS Sku
FROM dv_business_partner AS bp INNER JOIN dv_order as o ON bp.id = o.vendor_id 
INNER JOIN dv_order_recv_item_entry as r ON o.id = r.id
WHERE o.created_on_dt BETWEEN '1/01/2021 00:00:01' AND '10/31/2022 23:59:59' AND o.type = 1
GROUP BY bp.accountid, o.created_on_dt, year, month, day

-- Outbound
SELECT bp.accountid,
EXTRACT(YEAR FROM o.created_on_dt) as Createyear,
EXTRACT(Month FROM o.created_on_dt) as Createmonth,
EXTRACT(Day FROM  o.created_on_dt) as Createday,
count(o.doc_number) AS ORDERS,
SUM(r.qty) AS QTY,
COUNT(r.item_id) AS Sku
FROM dv_business_partner AS bp INNER JOIN dv_order as o ON bp.id = o.vendor_id 
INNER JOIN dv_order_ship_item_entry as r ON o.id = r.id
WHERE o.created_on_dt BETWEEN '1/01/2021 00:00:01' AND '10/31/2022 23:59:59' AND o.type = 2 and o.actual_trans_ts IS NOT NULL
GROUP BY bp.accountid, o.created_on_dt, Createyear, Createmonth, Createday

