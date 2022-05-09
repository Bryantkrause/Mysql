SELECT Invoice.WarehouseName, Invoice.FacilityName, Invoice.CustomerName, Invoice.InvoiceDate, Invoice.InvoiceAmount, InvoiceDetail.TariffName, InvoiceDetail.AccessorialName,
InvoiceDetail.ChargeAlias, InvoiceDetail.Description, InvoiceDetail.Amount, InvoiceDetail.InvoicedQty, InvoiceDetail.GLCode, InvoiceDetail.ReceiptNumber, InvoiceDetail.OrderNumber,
InvoiceDetail.WorkOrderNumber

FROM Invoice INNER JOIN InvoiceDetail ON Invoice.InvoiceNumber = InvoiceDetail.InvoiceNumber AND Invoice.FacilityName = InvoiceDetail.FacilityName AND
Invoice.WarehouseName = InvoiceDetail.WarehouseName

WHERE Invoice.CustomerName = '410' AND BETWEEN '03/01/2022 00:00:01' AND '03/31/2022 23:59:59'
