'this version has duplicates not sure why'
SELECT 
    Inventory.CustomerName,
    WarehouseReceipt.DeliveryDate,
    Inventory.PalletID,
    Inventory.WarehouseSku,
    Inventory.Qty
FROM Inventory
    INNER JOIN WarehouseReceiptDetailEntry ON Inventory.LotReferenceOne = WarehouseReceiptDetailEntry.LotReferenceOne
    INNER JOIN WarehouseReceipt ON WarehouseReceipt.ReceiptNumber = WarehouseReceiptDetailEntry.ReceiptNumber
WHERE Inventory.CustomerName = '402'
    AND WarehouseReceipt.CustomerName = '402'
GROUP BY Inventory.CustomerName,
    WarehouseReceipt.DeliveryDate,
    Inventory.PalletID,
    Inventory.WarehouseSku,
    Inventory.Qty
ORDER BY WarehouseReceipt.DeliveryDate

'take 2'
SELECT 
    Inventory.CustomerName,
    Inventory.LotReferenceOne,
    Inventory.PalletID,
    Inventory.WarehouseSku,
    Inventory.Qty
FROM Inventory
    INNER JOIN WarehouseReceiptDetailEntry ON Inventory.LotReferenceOne = WarehouseReceiptDetailEntry.LotReferenceOne
    INNER JOIN WarehouseReceipt ON WarehouseReceipt.ReceiptNumber = WarehouseReceiptDetailEntry.ReceiptNumber
WHERE Inventory.CustomerName = '402'
    AND WarehouseReceipt.CustomerName = '402'
GROUP BY Inventory.CustomerName,
    WarehouseReceipt.DeliveryDate,
    Inventory.PalletID,
    Inventory.WarehouseSku,
    Inventory.Qty
ORDER BY WarehouseReceipt.DeliveryDate

    SELECT     
    Inventory.CustomerName,
    Inventory.LotReferenceOne,
    Inventory.PalletID,
    Inventory.WarehouseSku,
    Inventory.Qty WHERE "&Account&" 
    GROUP BY Inventory.CustomerName, Inventory.LotReferenceOne, Inventory.PalletID, Inventory.WarehouseSku, Inventory.Qty
    ORDER BY Inventory.LotReferenceOne

SELECT
InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.PalletId, WarehouseReceipt.DeliveryDate, 
SUM(InventoryAllView.QTYAVAILABLE+InventoryAllView.QTYALLOCATED+InventoryAllView.QTYEXPECTED+InventoryAllView.QTYONHOLD+InventoryAllView.QTYDAMAGED) Quantity
FROM
InventoryAllView LEFT JOIN WarehouseReceiptDetailEntry ON InventoryAllView.PalletId = WarehouseReceiptDetailEntry.PalletId LEFT JOIN
WarehouseReceipt ON WarehouseReceiptDetailEntry.ReceiptNumber = WarehouseReceipt.ReceiptNumber AND
WarehouseReceiptDetailEntry.CustomerName = WarehouseReceipt.CustomerName AND
WarehouseReceiptDetailEntry.FacilityName = WarehouseReceipt.FacilityName AND
WarehouseReceiptDetailEntry.WarehouseName = WarehouseReceipt.WarehouseName
WHERE InventoryAllView.CustomerName='403' AND InventoryAllView.FACILITYNAME !='ZTEST'
GROUP BY InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.PalletId, WarehouseReceipt.DeliveryDate
HAVING SUM(InventoryAllView.QTYAVAILABLE+InventoryAllView.QTYALLOCATED+InventoryAllView.QTYEXPECTED+InventoryAllView.QTYONHOLD+InventoryAllView.QTYDAMAGED) > 0

SELECT
InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.PalletId, WarehouseReceipt.DeliveryDate, 
InventoryAllView.QTYAVAILABLE, InventoryAllView.QTYALLOCATED, InventoryAllView.QTYEXPECTED, InventoryAllView.QTYONHOLD, InventoryAllView.QTYDAMAGED
FROM
InventoryAllView LEFT JOIN WarehouseReceiptDetailEntry ON InventoryAllView.PalletId = WarehouseReceiptDetailEntry.PalletId LEFT JOIN
WarehouseReceipt ON WarehouseReceiptDetailEntry.ReceiptNumber = WarehouseReceipt.ReceiptNumber AND
WarehouseReceiptDetailEntry.CustomerName = WarehouseReceipt.CustomerName AND
WarehouseReceiptDetailEntry.FacilityName = WarehouseReceipt.FacilityName AND
WarehouseReceiptDetailEntry.WarehouseName = WarehouseReceipt.WarehouseName
WHERE InventoryAllView.CustomerName='403' AND InventoryAllView.FACILITYNAME !='ZTEST'
GROUP BY InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.PalletId, WarehouseReceipt.DeliveryDate, 
InventoryAllView.QTYAVAILABLE, InventoryAllView.QTYALLOCATED, InventoryAllView.QTYEXPECTED, InventoryAllView.QTYONHOLD, InventoryAllView.QTYDAMAGED

SELECT
InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.PalletId, WarehouseReceipt.DeliveryDate, 
SUM(InventoryAllView.QTYAVAILABLE+InventoryAllView.QTYALLOCATED+InventoryAllView.QTYEXPECTED+InventoryAllView.QTYONHOLD+InventoryAllView.QTYDAMAGED) Quantity
FROM
InventoryAllView LEFT JOIN WarehouseReceiptDetailEntry ON InventoryAllView.PalletId = WarehouseReceiptDetailEntry.PalletId LEFT JOIN
WarehouseReceipt ON WarehouseReceiptDetailEntry.ReceiptNumber = WarehouseReceipt.ReceiptNumber AND
WarehouseReceiptDetailEntry.CustomerName = WarehouseReceipt.CustomerName AND
WarehouseReceiptDetailEntry.FacilityName = WarehouseReceipt.FacilityName AND
WarehouseReceiptDetailEntry.WarehouseName = WarehouseReceipt.WarehouseName
WHERE InventoryAllView.CustomerName='403' AND InventoryAllView.FACILITYNAME !='ZTEST'
GROUP BY InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.PalletId, WarehouseReceipt.DeliveryDate


