SELECT Receipt.FacilityName, Receipt.CustomerName, Receipt.receiptNumber, Receipt.TransportMethod, Receipt.DeliveryDate,
Entry.warehouseSKu, Entry.PackName, Entry.UOM, Entry.QtyReceived, Entry.PalletID
From warehouseReceipt AS Receipt LEFT JOIN warehouseReceiptDetailEntry AS Entry ON Receipt.receiptNumber = Entry.receiptNumber AND
Receipt.FacilityName = Entry.FacilityName AND Receipt.CustomerName = Entry.CustomerName 
WHERE Receipt.CustomerName = '424' AND Receipt.DeliveryDate BETWEEN '01/01/2022 00:00:01' AND '09/30/2022 23:59:59'