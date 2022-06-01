"Ramp"

SELECT
InventoryAllView.CustomerName, Customer.CustomerAlias,  COUNT(DISTINCT(InventoryAllView.PalletId)) AS Pallets
FROM 
InventoryAllView LEFT JOIN WarehouseReceiptDetailEntry ON InventoryAllView.PalletId = WarehouseReceiptDetailEntry.PalletId LEFT JOIN
WarehouseReceipt ON WarehouseReceiptDetailEntry.ReceiptNumber = WarehouseReceipt.ReceiptNumber AND
WarehouseReceiptDetailEntry.CustomerName = WarehouseReceipt.CustomerName AND
WarehouseReceiptDetailEntry.FacilityName = WarehouseReceipt.FacilityName AND
WarehouseReceiptDetailEntry.WarehouseName = WarehouseReceipt.WarehouseName LEFT JOIN
WarehouseAdjustmentDetail ON InventoryAllView.PalletId = WarehouseAdjustmentDetail.PalletId LEFT JOIN
Customer ON InventoryAllView.CustomerName = Customer.CustomerName
WHERE InventoryAllView.FACILITYNAME !='ZTEST' AND InventoryAllView.CustomerName !='Z_TEST'
GROUP BY InventoryAllView.CustomerName, Customer.CustomerAlias ORDER BY InventoryAllView.CustomerName

"Davinci"

SELECT
dv_business_partner.accountid, dv_business_partner.description, COUNT(DISTINCT(dv_inventory.containerid)) As Pallets
FROM 
dv_inventory INNER JOIN dv_item ON dv_inventory.item_id=dv_item.id INNER JOIN dv_business_partner ON dv_item.vendor_id=dv_business_partner.id
INNER JOIN dv_storage ON dv_inventory.storage_id=dv_storage.id INNER JOIN dv_uom ON dv_item.id = dv_uom.item_id
WHERE
dv_business_partner.enabled=1 AND dv_inventory.qty_shipped='0' 
OR dv_business_partner.accountid!= 000 
OR dv_business_partner.accountid!= "BT"
OR dv_business_partner.accountid!= "Test"
OR dv_business_partner.accountid!= 36 
GROUP BY dv_business_partner.accountid, dv_business_partner.description
ORDER BY dv_business_partner.accountid