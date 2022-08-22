SELECT public.dv_business_partner, 
Sum((dv_inventory.qty_available+dv_inventory.qty_allocated+dv_inventory.qty_shipped+dv_inventory.qty_hold+dv_inventory.qty_damaged+dv_inventory.qty_quarantine))
FROM public.dv_business_partner dv_business_partner, public.dv_inventory dv_inventory, public.dv_item dv_item, public.dv_storage dv_storage, public.dv_uom dv_uom
WHERE dv_business_partner.id = dv_item.vendor_id AND dv_item.id = dv_inventory.item_id AND
dv_item.id = dv_uom.item_id AND dv_inventory.storage_id = dv_storage.id AND 
((dv_business_partner.accountid=?) AND (dv_inventory.recv_ts<=?) AND (dv_inventory.ship_ts Is Null) AND
(((dv_inventory.qty_available+dv_inventory.qty_allocated+dv_inventory.qty_shipped+dv_inventory.qty_hold+dv_inventory.qty_damaged+dv_inventory.qty_quarantine))>0) OR 
(dv_business_partner.accountid=?) AND (dv_inventory.recv_ts<=?) AND (dv_inventory.ship_ts>?) AND
(((dv_inventory.qty_available+dv_inventory.qty_allocated+dv_inventory.qty_shipped+dv_inventory.qty_hold+dv_inventory.qty_damaged+dv_inventory.qty_quarantine))>0))
GROUP BY dv_item.id, dv_item.item_code, dv_item.description, dv_uom.default_ouom
HAVING (dv_uom.default_ouom<>1) OR (dv_uom.default_ouom<>1)