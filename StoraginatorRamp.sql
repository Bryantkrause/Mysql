SELECT CASE WHEN Invoice.CustomerName >= 430 THEN 430 ELSE Invoice.CustomerName END As ID,
month(Invoice.InvoiceDate) AS month,year(Invoice.InvoiceDate) AS Year,
SUM(InvoiceDetail.InvoicedQty) QTY
FROM Invoice INNER JOIN InvoiceDetail ON (Invoice.WarehouseName = InvoiceDetail.WarehouseName)
AND (Invoice.FacilityName = InvoiceDetail.FacilityName) AND
(Invoice.InvoiceNumber = InvoiceDetail.InvoiceNumber)
WHERE Invoice.InvoiceDate Between '01/01/2021 00:00:01' AND '04/30/2022 23:59:59' 
AND InvoiceDetail.TariffName='REC STOR MONTHLY PL'
GROUP BY  Invoice.CustomerName,Invoice.InvoiceDate

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

'SELECT
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
HAVING SUM(InventoryAllView.QTYAVAILABLE+InventoryAllView.QTYALLOCATED+InventoryAllView.QTYEXPECTED+InventoryAllView.QTYONHOLD+InventoryAllView.QTYDAMAGED) > 0'

'SELECT
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
InventoryAllView.QTYAVAILABLE, InventoryAllView.QTYALLOCATED, InventoryAllView.QTYEXPECTED, InventoryAllView.QTYONHOLD, InventoryAllView.QTYDAMAGED'

'dont need having'
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

'before adding that adjustment table'
= Odbc.Query("dsn=RAMP1", "SELECT
InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.Description, InventoryAllView.PalletId, InventoryAllView.LOTREFERENCEONE,  WarehouseReceipt.DeliveryDate, 
InventoryAllView.QTYONHAND 
FROM InventoryAllView LEFT JOIN WarehouseReceiptDetailEntry ON InventoryAllView.PalletId = WarehouseReceiptDetailEntry.PalletId LEFT JOIN
WarehouseReceipt ON WarehouseReceiptDetailEntry.ReceiptNumber = WarehouseReceipt.ReceiptNumber AND
WarehouseReceiptDetailEntry.CustomerName = WarehouseReceipt.CustomerName AND
WarehouseReceiptDetailEntry.FacilityName = WarehouseReceipt.FacilityName AND
WarehouseReceiptDetailEntry.WarehouseName = WarehouseReceipt.WarehouseName 
WHERE InventoryAllView.FACILITYNAME !='ZTEST' "&Account&"
GROUP BY InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.Description, InventoryAllView.PalletId,InventoryAllView.LOTREFERENCEONE,   WarehouseReceipt.DeliveryDate, 
InventoryAllView.QTYONHAND ORDER BY WarehouseReceipt.DeliveryDate")

'adding adjustment table'
= Odbc.Query("dsn=RAMP1", "SELECT
InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.Description, InventoryAllView.PalletId, InventoryAllView.LOTREFERENCEONE, WarehouseAdjustmentDetail.CreateDate, WarehouseReceipt.DeliveryDate, 
InventoryAllView.QTYONHAND 
FROM 
InventoryAllView LEFT JOIN WarehouseReceiptDetailEntry ON InventoryAllView.PalletId = WarehouseReceiptDetailEntry.PalletId LEFT JOIN
WarehouseReceipt ON WarehouseReceiptDetailEntry.ReceiptNumber = WarehouseReceipt.ReceiptNumber AND
WarehouseReceiptDetailEntry.CustomerName = WarehouseReceipt.CustomerName AND
WarehouseReceiptDetailEntry.FacilityName = WarehouseReceipt.FacilityName AND
WarehouseReceiptDetailEntry.WarehouseName = WarehouseReceipt.WarehouseName LEFT JOIN
WarehouseAdjustmentDetail ON InventoryAllView.PalletId = WarehouseAdjustmentDetail.PalletId
WHERE InventoryAllView.FACILITYNAME !='ZTEST' "&Account&"
GROUP BY InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.Description, InventoryAllView.PalletId,InventoryAllView.LOTREFERENCEONE, WarehouseAdjustmentDetail.CreateDate,   WarehouseReceipt.DeliveryDate, 
InventoryAllView.QTYONHAND ORDER BY WarehouseReceipt.DeliveryDate")

= Table.AddColumn(#"Changed Type", "Custom", each if [CreateDate] = null then [LOTREFERENCEONE] else if [LOTREFERENCEONE] = null then [DeliveryDate] else if [DeliveryDate]
 = null then [CreateDate] else [CreateDate])

 'just for unicargo'
= Odbc.Query("dsn=RAMP1", "SELECT
InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.Description, InventoryAllView.PalletId, InventoryAllView.LOTREFERENCEONE, WarehouseAdjustmentDetail.CreateDate, WarehouseReceipt.DeliveryDate, 
InventoryAllView.QTYONHAND 
FROM 
InventoryAllView LEFT JOIN WarehouseReceiptDetailEntry ON InventoryAllView.PalletId = WarehouseReceiptDetailEntry.PalletId LEFT JOIN
WarehouseReceipt ON WarehouseReceiptDetailEntry.ReceiptNumber = WarehouseReceipt.ReceiptNumber
LEFT JOIN Customer ON InventoryAllView.CustomerName = Customer.CustomerName AND
WarehouseReceiptDetailEntry.CustomerName = WarehouseReceipt.CustomerName AND
WarehouseReceiptDetailEntry.FacilityName = WarehouseReceipt.FacilityName AND
WarehouseReceiptDetailEntry.WarehouseName = WarehouseReceipt.WarehouseName LEFT JOIN
WarehouseAdjustmentDetail ON InventoryAllView.PalletId = WarehouseAdjustmentDetail.PalletId
WHERE InventoryAllView.FACILITYNAME !='ZTEST' AND
Customer.BillingGroup = 'UNC'
GROUP BY InventoryAllView.CustomerName, InventoryAllView.WarehouseSku, InventoryAllView.Description, InventoryAllView.PalletId,InventoryAllView.LOTREFERENCEONE, WarehouseAdjustmentDetail.CreateDate,   WarehouseReceipt.DeliveryDate, 
InventoryAllView.QTYONHAND ORDER BY WarehouseReceipt.DeliveryDate")