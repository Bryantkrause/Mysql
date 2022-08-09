SELECT WorkORder.CustomerName, WorkORder.CustomerOrderNumber, WorkORderNote.Note, DocumentInvoiceDetail.ChargeAlias, Sum(DocumentInvoiceDetail.InvoicedQty) As Qty, Sum(DocumentInvoiceDetail.Amount) AS Amount

FROM WorkORder LEFT JOIN WorkORderDetail ON WorkORder.WorkOrderNumber=WorkORderDetail.WorkOrderNumber
LEFT JOIN WorkOrderNote ON WorkORder.WorkOrderNumber = WorkOrderNote.WorkOrderNumber
LEFT JOIN DocumentInvoice ON WorkORder.WorkOrderNumber = DocumentInvoice.WorkOrderNumber
LEFT JOIN DocumentInvoiceDetail ON DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber
WHERE WorkORder.CustomerName = '425' and WorkORder.CompletedDate BETWEEN '06/01/2022 00:00:01' AND '06/30/2022 23:59:59'

GROUP BY WorkORder.CustomerName, WorkORder.CustomerOrderNumber, WorkORderNote.Note, DocumentInvoiceDetail.ChargeAlias