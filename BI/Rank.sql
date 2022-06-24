
'rank customer revenue'
SELECT DocumentInvoice.CustomerName, DocumentInvoiceDetail.ChargeAlias, SUM(DocumentInvoiceDetail.Amount) AS TotalAMT,
    RANK() OVER (ORDER BY SUM(DocumentInvoiceDetail.Amount) )AS RANK 

FROM DocumentInvoice INNER JOIN DocumentInvoiceDetail ON DocumentInvoice.CustomerName = DocumentInvoiceDetail.CustomerName

WHERE DocumentInvoice.CustomerName = '400'
GROUP BY DocumentInvoice.CustomerName, DocumentInvoiceDetail.ChargeAlias


'rank customer revenue'
SELECT CustomerName, ChargeAlias, SUM(Amount) AS TotalAMT,
    RANK() OVER (ORDER BY SUM(Amount) DESC )AS RANK 

FROM InvoiceDetail 
WHERE RANK <= 10

GROUP BY CustomerName, ChargeAlias

'top ten revenue'
SELECT * FROM
(SELECT CustomerName, ChargeAlias, SUM(Amount) AS TotalAMT,
    RANK() OVER (ORDER BY SUM(Amount) DESC )AS RANK 

FROM InvoiceDetail

WHERE EditDate BETWEEN '01/01/2022 00:00:01' AND '05/31/2022 23:59:59' 

GROUP BY CustomerName, ChargeAlias ) AS Z
WHERE Z.RANK <= 10 

