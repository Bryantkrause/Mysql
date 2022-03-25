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


