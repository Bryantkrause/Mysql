'original'
SELECT dv_order.actual_trans_ts, dv_business_partner.description, dv_business_partner.accountid,
dv_order.doc_number, dv_order.id, dv_item.item_code, dv_order_ship_item_entry.qty
FROM   ((public.dv_order dv_order INNER JOIN public.dv_business_partner dv_business_partner ON dv_order.vendor_id=dv_business_partner.id) 
INNER JOIN public.dv_order_ship_item_entry dv_order_ship_item_entry ON dv_order.id=dv_order_ship_item_entry.order_id) 
INNER JOIN public.dv_item dv_item ON dv_order_ship_item_entry.item_id=dv_item.id
WHERE  (dv_order.actual_trans_ts>={ts '2021-05-01 00:00:00'} AND dv_order.actual_trans_ts<{ts '2022-08-01 00:00:00'}) AND
dv_order.doc_number NOT  LIKE 'ADJ%' AND dv_business_partner.accountid='261'
-- sub report
 SELECT dv_item.item_code, dv_inventory.mfg_lotcode, dv_inventory.mfg_sublotcode,
 dv_inventory.qty_available, dv_inventory.qty_allocated, dv_inventory.qty_hold,
 dv_inventory.qty_quarantine, dv_inventory.qty_damaged, dv_inventory.qty_shipped,
 dv_business_partner.accountid, dv_inventory.recv_ts, dv_inventory.ship_ts, dv_item.description
 FROM   (public.dv_item dv_item INNER JOIN public.dv_business_partner dv_business_partner ON dv_item.vendor_id=dv_business_partner.id)
 INNER JOIN public.dv_inventory dv_inventory ON dv_item.id=dv_inventory.item_id
 WHERE  (dv_business_partner.accountid='261' AND dv_inventory.recv_ts<{ts '2022-08-01 00:00:01'} AND
 dv_inventory.ship_ts IS  NULL  OR dv_business_partner.accountid='261'AND
 dv_inventory.recv_ts<{ts '2022-08-01 00:00:01'} AND dv_inventory.ship_ts>={ts '2022-08-01 00:00:00'})
 ORDER BY dv_item.item_code, dv_inventory.mfg_lotcode, dv_inventory.mfg_sublotcode
-- sub report 2
 SELECT dv_order.actual_trans_ts, dv_order.doc_number, dv_order_recv_item_entry.qty, dv_order_recv_item_entry.type, dv_business_partner.accountid
 FROM   (public.dv_order_recv_item_entry dv_order_recv_item_entry INNER JOIN public.dv_order dv_order ON dv_order_recv_item_entry.order_id=dv_order.id)
 INNER JOIN public.dv_business_partner dv_business_partner ON dv_order.vendor_id=dv_business_partner.id
 WHERE  dv_order.doc_number NOT  LIKE 'ADJ%' AND (dv_order.actual_trans_ts>={ts '2021-05-01 00:00:00'} AND 
 dv_order.actual_trans_ts<{ts '2022-08-01 00:00:00'}) AND dv_order_recv_item_entry.type=1 AND dv_business_partner.accountid='261'

-- 
SELECT dv_order.actual_trans_ts, dv_business_partner.description, dv_business_partner.accountid,
dv_order.doc_number, dv_order.id, dv_item.item_code, dv_order_ship_item_entry.qty
FROM   ((public.dv_order dv_order INNER JOIN public.dv_business_partner dv_business_partner ON dv_order.vendor_id=dv_business_partner.id) 
INNER JOIN public.dv_order_ship_item_entry dv_order_ship_item_entry ON dv_order.id=dv_order_ship_item_entry.order_id) 
INNER JOIN public.dv_item dv_item ON dv_order_ship_item_entry.item_id=dv_item.id
WHERE  (dv_order.actual_trans_ts>={ts '2021-05-01 00:00:00'} AND dv_order.actual_trans_ts<{ts '2022-08-01 00:00:00'}) AND
dv_order.doc_number NOT  LIKE 'ADJ%' AND dv_business_partner.accountid='261'