SELECT
WarehouseReceipt.CustomerName, WarehouseReceipt.ReceiptNumber, WarehouseReceipt.DeliveryDate, WarehouseReceipt.CarrierName,
WarehouseReceipt.TransportMethod, WarehouseReceipt.QtyReceived, WarehouseReceipt.PalletsReceived

FROM WarehouseReceipt 
WHERE WarehouseReceipt.CustomerName ='314 ' AND
WarehouseReceipt.DeliveryDate BETWEEN '03/01/2022 00:00:01' AND '03/31/2022 23:59:59'
AND WarehouseReceipt.FacilityName!='Ztest' 


'Specific List of Orders For lumper'

OR WarehouseReceipt.ReceiptNumber =

= Text.Combine(#"Removed Other Columns"[Custom])

SELECT  DocumentInvoice.ReceiptNumber, 
WarehouseReceipt.DeliveryDate, WarehouseReceipt.CustomerOrderNumber,WarehouseReceipt.CustomerPONumber,  WarehouseReceipt.CarrierName, WarehouseReceipt.TransportMethod, WarehouseReceipt.PalletsReceived, WarehouseReceipt.QtyReceived, WarehouseReceipt.LadingQuantity
"&InboundLinkList&" 
FROM DocumentInvoice LEFT JOIN  DocumentInvoiceDetail ON DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber 
LEFT JOIN WarehouseReceipt ON DocumentInvoice.ReceiptNumber = WarehouseReceipt.ReceiptNumber AND DocumentInvoice.FacilityName = WarehouseReceipt.FacilityName

WHERE WarehouseReceipt.FacilityName =  DocumentInvoice.FacilityName!='Ztest'  "&InboundReceiptNumber&"
GROUP BY DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoice.ReceiptNumber, DocumentInvoice.InvoiceDate,
WarehouseReceipt.DeliveryDate, WarehouseReceipt.CustomerOrderNumber,WarehouseReceipt.CustomerPONumber,  WarehouseReceipt.CarrierName, WarehouseReceipt.TransportMethod, WarehouseReceipt.QtyReceived, WarehouseReceipt.LadingQuantity, WarehouseReceipt.PalletsReceived

ORDER BY DocumentInvoice.ReceiptNumber 
