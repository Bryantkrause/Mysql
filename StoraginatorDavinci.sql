SELECT
dv_business_partner.accountid, dv_inventory.recv_ts , dv_inventory.containerid,
dv_item.item_code, dv_item.description, SUM(dv_inventory.qty_available+ dv_inventory.qty_damaged+ dv_inventory.qty_hold+dv_inventory.qty_allocated ) Quantity
FROM 
dv_inventory INNER JOIN dv_item ON dv_inventory.item_id=dv_item.id INNER JOIN dv_business_partner ON dv_item.vendor_id=dv_business_partner.id
INNER JOIN dv_storage ON dv_inventory.storage_id=dv_storage.id
WHERE
dv_business_partner.enabled=1 AND
dv_business_partner.accountid='10' AND dv_inventory.qty_shipped='0'
GROUP BY dv_business_partner.accountid, dv_inventory.recv_ts , dv_inventory.containerid,dv_item.item_code, dv_item.description
ORDER BY dv_inventory.recv_ts
HAVING SUM(dv_inventory.qty_available+ dv_inventory.qty_damaged+ dv_inventory.qty_hold+dv_inventory.qty_allocated ) > 0

'for mayborn'

SELECT
dv_business_partner.accountid, dv_inventory.containerid, dv_uom.default_ouom, 
dv_item.item_code, dv_item.description, dv_inventory.recv_ts, SUM(dv_inventory.qty_available+ dv_inventory.qty_damaged+ dv_inventory.qty_hold+dv_inventory.qty_allocated ) Quantity
FROM 
dv_inventory INNER JOIN dv_item ON dv_inventory.item_id=dv_item.id INNER JOIN dv_business_partner ON dv_item.vendor_id=dv_business_partner.id
INNER JOIN dv_storage ON dv_inventory.storage_id=dv_storage.id INNER JOIN dv_uom ON dv_item.id = dv_uom.item_id
WHERE
dv_business_partner.enabled=1 "&ACCOUNT&" AND dv_inventory.qty_shipped='0' GROUP BY dv_business_partner.accountid, dv_inventory.recv_ts , dv_inventory.containerid,
dv_item.item_code, dv_item.description, dv_uom.default_ouom
HAVING SUM(dv_inventory.qty_available+ dv_inventory.qty_damaged+ dv_inventory.qty_hold+dv_inventory.qty_allocated ) > 0 ORDER BY dv_inventory.recv_ts

'billing code'
SELECT dv_item.id, dv_item.item_code, dv_item.description, 
Sum((dv_inventory.qty_available+dv_inventory.qty_allocated+dv_inventory.qty_shipped+dv_inventory.qty_hold+dv_inventory.qty_damaged+dv_inventory.qty_quarantine))
FROM public.dv_business_partner dv_business_partner, public.dv_inventory dv_inventory, public.dv_item dv_item, public.dv_storage dv_storage, public.dv_uom dv_uom
WHERE dv_business_partner.id = dv_item.vendor_id AND dv_item.id = dv_inventory.item_id AND dv_item.id = dv_uom.item_id
 AND dv_inventory.storage_id = dv_storage.id AND ((dv_business_partner.accountid=?) AND (dv_inventory.recv_ts<=?)
  AND (dv_inventory.ship_ts Is Null) AND 
  (((dv_inventory.qty_available+dv_inventory.qty_allocated+dv_inventory.qty_shipped+dv_inventory.qty_hold+dv_inventory.qty_damaged+dv_inventory.qty_quarantine))>0) OR 
  (dv_business_partner.accountid=?) AND (dv_inventory.recv_ts<=?) AND (dv_inventory.ship_ts>?) AND 
  (((dv_inventory.qty_available+dv_inventory.qty_allocated+dv_inventory.qty_shipped+dv_inventory.qty_hold+dv_inventory.qty_damaged+dv_inventory.qty_quarantine))>0))
GROUP BY dv_item.id, dv_item.item_code, dv_item.description, dv_uom.default_ouom
HAVING (dv_uom.default_ouom<>1) OR (dv_uom.default_ouom<>1)
