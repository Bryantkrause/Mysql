SELECT Invoice.CustomerName, Invoice.FacilityName, Invoice.InvoiceDate, InvoiceDetail.TariffName,  SUM(InvoiceDetail.InvoicedQty) As Quantity
FROM Invoice LEFT JOIN InvoiceDetail ON  Invoice.InvoiceNumber = InvoiceDetail.InvoiceNumber
LEFT JOIN Tariff ON InvoiceDetail.TariffName = Tariff.TariffName
WHERE InvoiceDetail.GLCode = 'Storage' AND Invoice.InvoiceDate BETWEEN '07/01/2022 00:00:01' AND '07/31/2022 23:59:59' AND Tariff.TariffType = 2

GROUP BY Invoice.CustomerName, Invoice.FacilityName, Invoice.InvoiceDate, InvoiceDetail.TariffName