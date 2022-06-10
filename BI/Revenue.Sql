SELECT Invoice.WarehouseName, Invoice.FacilityName AS Location, Invoice.CustomerName, Invoice.InvoiceDate, InvoiceDetail.ChargeAlias, 
InvoiceDetail.Amount, InvoiceDetail.InvoicedQty, Invoice.TariffName, Invoice.AccessorialName
FROM Invoice INNER JOIN InvoiceDetail ON Invoice.InvoiceNumber = InvoiceDetail.InvoiceNumber AND
Invoice.FacilityName = InvoiceDetail.FacilityName AND
Invoice.WarehouseName = InvoiceDetail.WarehouseName 

WHERE Invoice.FacilityName!='Z_test' AND
Invoice.InvoiceDate > '01/01/2021 00:00:01'