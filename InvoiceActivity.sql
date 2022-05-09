SELECT DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoiceDetail.TariffName, DocumentInvoiceDetail.AccessorialName, DocumentInvoiceDetail.ChargeAlias,
DocumentInvoiceDetail.ChargeDescription, DocumentInvoiceDetail.Amount, DocumentInvoiceDetail.InvoicedQty, DocumentInvoice.ReceiptNumber, DocumentInvoice.OrderNumber, DocumentInvoice.WorkOrderNumber, DocumentInvoice.InvoiceDate, DocumentInvoiceDetail.GLCode 

FROM DocumentInvoice LEFT JOIN  DocumentInvoiceDetail ON DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber

WHERE DocumentInvoice.CustomerName = '314' AND DocumentInvoice.InvoiceDate BETWEEN '03/01/2022 00:00:01' AND '03/31/2022 23:59:59'

'M'
SELECT DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoiceDetail.TariffName, DocumentInvoiceDetail.AccessorialName, DocumentInvoiceDetail.ChargeAlias,
DocumentInvoiceDetail.ChargeDescription, DocumentInvoiceDetail.Amount, DocumentInvoiceDetail.InvoicedQty, DocumentInvoice.ReceiptNumber, DocumentInvoice.OrderNumber, DocumentInvoice.WorkOrderNumber, DocumentInvoice.InvoiceDate

FROM DocumentInvoice LEFT JOIN  DocumentInvoiceDetail ON DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber

WHERE DocumentInvoice.CustomerName = "&Customer&" AND "&Date2&" AND DocumentInvoice.FacilityName!='Ztest' 