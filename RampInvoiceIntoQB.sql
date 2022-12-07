SELECT CASE WHEN I.CustomerName >= 430 THEN 430 ELSE I.CustomerName END As ID, D.GLCode, SUM(D.Amount) As AMT , I.InvoiceNumber
FROM Invoice AS I LEFT JOIN InvoiceDetail AS D ON I.CustomerName = D.CustomerName AND
I.FacilityName = D.FacilityName AND I.InvoiceNumber = D.InvoiceNumber
WHERE I.InvoiceDate = '9/30/2022' AND I.CustomerName != 'PC' AND I.CustomerName !='Z_TEST'
GROUP BY I.CustomerName, D.GLCode


SELECT dbo_Invoice.WarehouseName, dbo_Invoice.FacilityName, dbo_Invoice.CustomerName, dbo_Invoice.InvoiceNumber, dbo_Invoice.InvoiceDate, 
dbo_Invoice.InvoiceAmount, dbo_InvoiceDetail.TariffName, dbo_InvoiceDetail.AccessorialName, dbo_InvoiceDetail.ChargeAlias, dbo_InvoiceDetail.Description, 
dbo_InvoiceDetail.Amount, dbo_InvoiceDetail.InvoicedQty, dbo_InvoiceDetail.Rate, dbo_InvoiceDetail.GLCode, dbo_InvoiceDetail.PalletId
FROM dbo_Invoice INNER JOIN dbo_InvoiceDetail ON (dbo_Invoice.InvoiceNumber = dbo_InvoiceDetail.InvoiceNumber) AND
(dbo_Invoice.FacilityName = dbo_InvoiceDetail.FacilityName) AND (dbo_Invoice.WarehouseName = dbo_InvoiceDetail.WarehouseName)
WHERE (((dbo_Invoice.InvoiceDate) Between [Forms]![StartEndDate]![BeginOrderDate] And [Forms]![StartEndDate]![EndOrderDate]));

SELECT
CASE WHEN I.CustomerName >= 430 THEN 430 ELSE I.CustomerName END As ID, d.ChargeAlias,
SUM(d.Amount) as Amount, Sum(d.InvoicedQty) As Qty

FROM Invoice as I INNER JOIN InvoiceDetail as d ON i.InvoiceNumber = d.InvoiceNumber AND
i.FacilityName = d.FacilityName and i.WarehouseName = d.WarehouseName

WHERE i.InvoiceDate BETWEEN '1/01/2021 00:00:01' AND '10/31/2022 23:59:59'

Group By I.CustomerName, d.ChargeAlias