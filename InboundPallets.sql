
'Ramp Inbound Pallets get all ramp customers total inbound pallets based on date'
SELECT CustomerName, SUM(PalletsReceived) As Inbound Pallets

FROM WarehouseReceipt

WHERE DeliveryDate BETWEEN '1/01/2021 00:00:01' AND '05/31/2022 23:59:59'

GROUP BY CustomerName

'Davinci inbound pallets get all inbound pallets based on date'

SELECT dv_business_partner.description, COUNT(DISTINCT(dv_order_recv_item_entry.containerid)) AS InboundPallets

FROM dv_order INNER JOIN dv_business_partner
ON dv_order.vendor_id = dv_business_partner.id
INNER JOIN dv_order_recv_item_entry ON dv_order.id = dv_order_recv_item_entry.order_id

WHERE dv_order.actual_trans_ts BETWEEN '2021-07-01 00:00:00' AND '2022-06-30 23:59:59'

GROUP BY dv_business_partner.description
