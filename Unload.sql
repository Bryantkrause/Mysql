SELECT
ReceiptNumber, DeliveryDate, TransportMethod, PalletsReceived, LadingQuantity
FROM WarehouseReceipt
WHERE CustomerName='400' AND DeliveryDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
AND TransportMethod!='U'
