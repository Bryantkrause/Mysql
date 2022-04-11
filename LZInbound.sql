SELECT DocumentInvoice.WarehouseName, DocumentInvoice.FacilityName, DocumentInvoice.CustomerName,
 DocumentInvoice.ReceiptNumber, DocumentInvoiceDetail.TariffName, 
 DocumentInvoiceDetail.AccessorialName, DocumentInvoiceDetail.ChargeAlias, DocumentInvoiceDetail.ChargeDescription, DocumentInvoiceDetail.InvoicedQty, 
 DocumentInvoiceDetail.Rate, DocumentInvoiceDetail.Amount, WarehouseReceiptView.CustomerOrderNumber, WarehouseReceiptView.DeliveryDate
FROM (DocumentInvoice INNER JOIN DocumentInvoiceDetail ON (DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber) 
AND (DocumentInvoice.CustomerName = DocumentInvoiceDetail.CustomerName) AND (DocumentInvoice.FacilityName = DocumentInvoiceDetail.FacilityName) 
AND (DocumentInvoice.WarehouseName = DocumentInvoiceDetail.WarehouseName)) 
INNER JOIN WarehouseReceiptView ON (DocumentInvoiceDetail.CustomerName = WarehouseReceiptView.CustomerName) AND (DocumentInvoiceDetail.FacilityName = WarehouseReceiptView.FacilityName) 
AND (DocumentInvoiceDetail.WarehouseName = WarehouseReceiptView.WarehouseName) AND (DocumentInvoice.ReceiptNumber = WarehouseReceiptView.ReceiptNumber) AND
 (DocumentInvoice.CustomerName = WarehouseReceiptView.CustomerName) AND (DocumentInvoice.FacilityName = WarehouseReceiptView.FacilityName) AND
 (DocumentInvoice.WarehouseName = WarehouseReceiptView.WarehouseName)
WHERE (DocumentInvoice.InvoiceDate BETWEEN '11/01/2021 00:00:01' AND '03/15/2022 23:59:59' AND DocumentInvoice.CustomerName = '425') 