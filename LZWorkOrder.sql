SELECT DocumentInvoice.WarehouseName, DocumentInvoice.FacilityName, DocumentInvoice.CustomerName,
 DocumentInvoice.WorkOrderNumber, DocumentInvoiceDetail.TariffName, 
 DocumentInvoiceDetail.AccessorialName, DocumentInvoiceDetail.ChargeAlias, DocumentInvoiceDetail.ChargeDescription, DocumentInvoiceDetail.InvoicedQty, 
 DocumentInvoiceDetail.Rate, DocumentInvoiceDetail.Amount, WorkOrder.CustomerOrderNumber, WorkOrder.CompletedDate
FROM (DocumentInvoice INNER JOIN DocumentInvoiceDetail ON (DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber) 
AND (DocumentInvoice.CustomerName = DocumentInvoiceDetail.CustomerName) AND (DocumentInvoice.FacilityName = DocumentInvoiceDetail.FacilityName) 
AND (DocumentInvoice.WarehouseName = DocumentInvoiceDetail.WarehouseName)) 
INNER JOIN WorkOrder ON (DocumentInvoiceDetail.CustomerName = WorkOrder.CustomerName) AND (DocumentInvoiceDetail.FacilityName = WorkOrder.FacilityName) 
AND (DocumentInvoiceDetail.WarehouseName = WorkOrder.WarehouseName) AND (DocumentInvoice.WorkOrderNumber = WorkOrder.WorkOrderNumber) AND
 (DocumentInvoice.CustomerName = WorkOrder.CustomerName) AND (DocumentInvoice.FacilityName = WorkOrder.FacilityName) AND
 (DocumentInvoice.WarehouseName = WorkOrder.WarehouseName)
WHERE (DocumentInvoice.InvoiceDate BETWEEN '11/01/2021 00:00:01' AND '03/31/2022 23:59:59' AND DocumentInvoice.CustomerName = '425') 