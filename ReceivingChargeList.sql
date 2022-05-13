'M Recieving'
SELECT DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoice.ReceiptNumber, DocumentInvoice.InvoiceDate,
WarehouseReceipt.DeliveryDate, WarehouseReceipt.CustomerOrderNumber,WarehouseReceipt.CustomerPONumber,  WarehouseReceipt.CarrierName, WarehouseReceipt.TransportMethod, WarehouseReceipt.QtyReceived, WarehouseReceipt.LadingQuantity, WarehouseReceipt.PalletsReceived
"&InboundLinkList&"
FROM DocumentInvoice LEFT JOIN  DocumentInvoiceDetail ON DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber 
LEFT JOIN WarehouseReceipt ON DocumentInvoice.ReceiptNumber = WarehouseReceipt.ReceiptNumber AND DocumentInvoice.FacilityName = WarehouseReceipt.FacilityName

WHERE DocumentInvoice.CustomerName = "&Customer&" AND "&Date2&" AND DocumentInvoice.FacilityName!='Ztest' AND DocumentInvoice.ReceiptNumber != 0
GROUP BY DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoice.ReceiptNumber, DocumentInvoice.InvoiceDate,
WarehouseReceipt.DeliveryDate, WarehouseReceipt.CustomerOrderNumber,WarehouseReceipt.CustomerPONumber,  WarehouseReceipt.CarrierName, WarehouseReceipt.TransportMethod, WarehouseReceipt.QtyReceived, WarehouseReceipt.LadingQuantity, WarehouseReceipt.PalletsReceived

ORDER BY DocumentInvoice.ReceiptNumber

'M Receiving Charge List'
SELECT DocumentInvoiceDetail.ChargeAlias
FROM DocumentInvoiceDetail LEFT JOIN  DocumentInvoice ON DocumentInvoiceDetail.DocumentInvoiceNumber = DocumentInvoice.DocumentInvoiceNumber 
WHERE DocumentInvoiceDetail.CustomerName = "&Customer&" AND "&Date2&" AND DocumentInvoiceDetail.FacilityName!='Ztest' AND DocumentInvoice.ReceiptNumber != 0 
GROUP BY DocumentInvoiceDetail.ChargeAlias

'M InboundLinkList'
let
    Source = Excel.CurrentWorkbook(){[Name="InboundChargeList"]}[Content],
    #"Added Custom" = Table.AddColumn(Source, "Custom", each ",SUM( CASE WHEN DocumentInvoiceDetail.ChargeAlias = '"&[ChargeAlias]&"' THEN DocumentInvoiceDetail.Amount ELSE 0 END) AS '"&[ChargeAlias]&"')"),
    #"Removed Other Columns" = Table.SelectColumns(#"Added Custom",{"Custom"}),
    Custom1 = Text.Combine(#"Removed Other Columns"[Custom])
in
    Custom1