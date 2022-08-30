SELECT
WarehouseReceipt.CustomerName, WarehouseReceipt.ReceiptNumber, WarehouseReceipt.DeliveryDate, WarehouseReceipt.FacilityName
WarehouseReceipt.TransportMethod, WarehouseReceipt.QtyReceived, WarehouseReceipt.LadingQuantity, WarehouseReceipt.PalletsReceived

FROM WarehouseReceipt 
WHERE WarehouseReceipt.DeliveryDate BETWEEN '01/01/2022 00:00:01' AND '07/31/2022 23:59:59'
AND WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST'


'Specific List of Orders For lumper'

OR WarehouseReceipt.ReceiptNumber =

= Text.Combine(#"Removed Other Columns"[Custom])

SELECT  DocumentInvoice.ReceiptNumber, 
WarehouseReceipt.DeliveryDate, WarehouseReceipt.CustomerOrderNumber,WarehouseReceipt.CustomerPONumber,  WarehouseReceipt.CarrierName, WarehouseReceipt.TransportMethod, WarehouseReceipt.PalletsReceived, WarehouseReceipt.QtyReceived, WarehouseReceipt.LadingQuantity
"&InboundLinkList&" 
FROM DocumentInvoice LEFT JOIN  DocumentInvoiceDetail ON DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber 
LEFT JOIN WarehouseReceipt ON DocumentInvoice.ReceiptNumber = WarehouseReceipt.ReceiptNumber AND DocumentInvoice.FacilityName = WarehouseReceipt.FacilityName

WHERE WarehouseReceipt.FacilityName =  DocumentInvoice.FacilityName!='Ztest'  "&InboundReceiptNumber&"
GROUP BY DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoice.ReceiptNumber, DocumentInvoice.InvoiceDate,
WarehouseReceipt.DeliveryDate, WarehouseReceipt.CustomerOrderNumber,WarehouseReceipt.CustomerPONumber,  WarehouseReceipt.CarrierName, WarehouseReceipt.TransportMethod, WarehouseReceipt.QtyReceived, WarehouseReceipt.LadingQuantity, WarehouseReceipt.PalletsReceived

ORDER BY DocumentInvoice.ReceiptNumber 

SELECT CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As name,
Year = DATEPART(YEAR, DeliveryDate),
Month = DATEPART(Month, DeliveryDate),
SUM(QtyReceived) As Units, Count(DISTINCT(ReceiptNumber)) AS Orders
FROM WarehouseReceipt
WHERE DeliveryDate BETWEEN '4/01/2021 00:00:01' AND '07/31/2022 23:59:59'
AND CustomerName != 'PC' AND CustomerName !='Z_TEST' AND FacilityName !='Z_TEST'
GROUP BY CustomerName, DATEPART(YEAR, DeliveryDate),DATEPART(Month, DeliveryDate)
ORDER BY CustomerName, DATEPART(YEAR, DeliveryDate),DATEPART(Month, DeliveryDate)

SELECT Concat(WarehouseReceipt.CustomerName,WarehouseReceipt.FacilityName) AS THingy,CustomerTariff.TariffName,
(WarehouseReceipt.LadingQuantity*CustomerTariff.Rate) As UnloadPallets
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
WHERE WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST' AND CustomerTariff.TariffName='LZ 1001-2000' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '1/7/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod != 'Palletized'
AND WarehouseReceipt.LadingQuantity > 1000 AND WarehouseReceipt.LadingQuantity < 2001

