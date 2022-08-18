SELECT dv_business_partner.description,EXTRACT(MONTH FROM dv_order.actual_trans_ts) as month,
COUNT(DISTINCT(dv_order_recv_item_entry.containerid)) AS InboundPallets
FROM dv_order INNER JOIN dv_business_partner
ON dv_order.vendor_id = dv_business_partner.id
INNER JOIN dv_order_recv_item_entry ON dv_order.id = dv_order_recv_item_entry.order_id
WHERE "&Date&"
GROUP BY dv_business_partner.description, month
-- dv_order.actual_trans_ts BETWEEN '7/1/2022' AND '7/31/2022' 


-- SELECT * FROM(
-- SELECT dv_business_partner.description,EXTRACT(MONTH FROM dv_order.actual_trans_ts) as month,
-- dv_order_recv_item_entry.containerid
-- FROM dv_order INNER JOIN dv_business_partner
-- ON dv_order.vendor_id = dv_business_partner.id
-- INNER JOIN dv_order_recv_item_entry ON dv_order.id = dv_order_recv_item_entry.order_id
-- WHERE "&Date&"
-- GROUP BY dv_business_partner.description, month
-- ) Inbound
-- PIVOT (
-- COUNT(DISTINCT(dv_order_recv_item_entry.containerid))
-- FOR month IN ([1] , [2] , [3] , [4] , [5] , [6] , [7] , [8] ,[9] , [10] , [11] , [12])) AS thingy


-- dv_order.actual_trans_ts BETWEEN '7/1/2022' AND '7/31/2022' 
