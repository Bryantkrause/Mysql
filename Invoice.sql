SELECT Invoice.WarehouseName, Invoice.FacilityName, Invoice.CustomerName, Customer.CustomerAlias, Invoice.InvoiceDate, InvoiceDetail.ChargeAlias, SUM(InvoiceDetail.InvoicedQty) Pallets

FROM Invoice INNER JOIN InvoiceDetail ON Invoice.InvoiceNumber = InvoiceDetail.InvoiceNumber AND 
Invoice.FacilityName = InvoiceDetail.FacilityName AND
Invoice.WarehouseName = InvoiceDetail.WarehouseName LEFT JOIN
Customer ON Invoice.CustomerName = Customer.CustomerName

WHERE  Invoice.InvoiceDate BETWEEN '01/01/2021 00:00:01' AND '04/30/2022 23:59:59' 
AND( InvoiceDetail.ChargeAlias = 'Recurring Storage' OR InvoiceDetail.ChargeAlias = 'Weekly Storage')
GROUP BY Invoice.WarehouseName, Invoice.FacilityName, Invoice.CustomerName, Invoice.InvoiceDate, Customer.CustomerAlias, InvoiceDetail.ChargeAlias
ORDER BY Invoice.CustomerName
