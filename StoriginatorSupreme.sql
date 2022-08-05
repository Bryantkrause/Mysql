SELECT Invoice.CustomerName, Invoice.FacilityName, Invoice.InvoiceDate, InvoiceDetail.TariffName, Tariff.TariffType, SUM(InvoiceDetail.InvoicedQty) As Quantity
FROM Invoice LEFT JOIN InvoiceDetail ON  Invoice.InvoiceNumber = InvoiceDetail.InvoiceNumber
LEFT JOIN Tariff ON InvoiceDetail.TariffName = Tariff.TariffName
WHERE InvoiceDetail.GLCode = 'Storage' AND Invoice.InvoiceDate BETWEEN '02/01/2022 00:00:01' AND '02/28/2022 23:59:59'

GROUP BY Invoice.CustomerName, Invoice.FacilityName, Invoice.InvoiceDate, InvoiceDetail.TariffName, Tariff.TariffType