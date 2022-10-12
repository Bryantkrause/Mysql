SELECT CASE WHEN I.CustomerName >= 430 THEN 430 ELSE I.CustomerName END As ID, D.GLCode, SUM(D.Amount) As AMT , I.InvoiceNumber
FROM Invoice AS I LEFT JOIN InvoiceDetail AS D ON I.CustomerName = D.CustomerName AND
I.FacilityName = D.FacilityName AND I.InvoiceNumber = D.InvoiceNumber
WHERE I.InvoiceDate = '9/30/2022' AND I.CustomerName != 'PC' AND I.CustomerName !='Z_TEST'
GROUP BY I.CustomerName, D.GLCode
