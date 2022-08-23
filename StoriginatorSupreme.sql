SELECT Invoice.CustomerName, Invoice.FacilityName, Invoice.InvoiceDate, InvoiceDetail.TariffName,  SUM(InvoiceDetail.InvoicedQty) As Quantity
FROM Invoice LEFT JOIN InvoiceDetail ON  Invoice.InvoiceNumber = InvoiceDetail.InvoiceNumber
LEFT JOIN Tariff ON InvoiceDetail.TariffName = Tariff.TariffName
WHERE InvoiceDetail.GLCode = 'Storage' AND Invoice.InvoiceDate BETWEEN '07/01/2022 00:00:01' AND '07/31/2022 23:59:59' AND Tariff.TariffType = 2

GROUP BY Invoice.CustomerName, Invoice.FacilityName, Invoice.InvoiceDate, InvoiceDetail.TariffName

-- attempted by inventory transaction
-- 1 = REC 2 = SHIP 3 = ADJ
SELECT
CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As ID,
FORMAT(EffectiveDate, 'yyyyMM') AS YM,
CASE WHEN TransactionType = 1 THEN Sum(Qty) ELSE 0 END As QtyRec,
CASE WHEN TransactionType = 2 THEN Sum(Qty) ELSE 0 END As QtyShip,
CASE WHEN TransactionType = 3 THEN Sum(Qty) ELSE 0 END As QtyADJ
FROM InventoryTransaction
WHERE CustomerName = '425' AND FacilityName = 'Fullerton' 
GROUP BY CustomerName ,  TransactionType, FORMAT(EffectiveDate, 'yyyyMM')
ORDER BY FORMAT(EffectiveDate, 'yyyyMM')

SELECT 
CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As ID,
FORMAT(EffectiveDate, 'yyyyMM') AS YM,
TransactionType, Sum(QTY) As QTY
FROM InventoryTransaction
WHERE CustomerName = '425' AND FacilityName = 'Fullerton' 
GROUP BY CustomerName ,  TransactionType, FORMAT(EffectiveDate, 'yyyyMM')
ORDER BY FORMAT(EffectiveDate, 'yyyyMM')