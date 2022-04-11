Select

DI.CustomerName, DI.InvoiceNumber, 





FROM DocumentInvoice AS DI

WHERE





SELECT DocumentInvoice.WarehouseName, DocumentInvoice.FacilityName, DocumentInvoice.InvoiceDate, DocumentInvoice.CustomerName, DocumentInvoice.DocumentInvoiceNumber,
 DocumentInvoice.ReceiptNumber, DocumentInvoice.OrderNumber, DocumentInvoice.KitOrderNumber, DocumentInvoice.WorkOrderNumber, DocumentInvoiceDetail.TariffName, 
 DocumentInvoiceDetail.AccessorialName, DocumentInvoiceDetail.ChargeAlias, DocumentInvoiceDetail.ChargeDescription, DocumentInvoiceDetail.InvoicedQty, 
 DocumentInvoiceDetail.Rate, DocumentInvoiceDetail.Amount, ShipmentOrderView.OrderNumber, ShipmentOrderView.OTHERREFERENCETWO
FROM (DocumentInvoice INNER JOIN DocumentInvoiceDetail ON (DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber) 
AND (DocumentInvoice.CustomerName = DocumentInvoiceDetail.CustomerName) AND (DocumentInvoice.FacilityName = DocumentInvoiceDetail.FacilityName) 
AND (DocumentInvoice.WarehouseName = DocumentInvoiceDetail.WarehouseName)) 
INNER JOIN ShipmentOrderView ON (DocumentInvoiceDetail.CustomerName = ShipmentOrderView.CustomerName) AND (DocumentInvoiceDetail.FacilityName = ShipmentOrderView.FacilityName) 
AND (DocumentInvoiceDetail.WarehouseName = ShipmentOrderView.WarehouseName) AND (DocumentInvoice.OrderNumber = ShipmentOrderView.OrderNumber) AND
 (DocumentInvoice.CustomerName = ShipmentOrderView.CustomerName) AND (DocumentInvoice.FacilityName = ShipmentOrderView.FacilityName) AND
 (DocumentInvoice.WarehouseName = ShipmentOrderView.WarehouseName)
WHERE (((DocumentInvoice.InvoiceDate) Between [Forms]![StartEndDate]![BeginOrderDate] And [Forms]![StartEndDate]![EndOrderDate]));