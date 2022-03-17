SELECT
CustomerName, ReceiptNumber, CustomerOrderNumber,DeliveryDate, CreateDate, EstimatedDeliveryDate, TransportMethod, QtyReceived, LadingQuantity, PalletsReceived
FROM WarehouseReceipt
WHERE DeliveryDate BETWEEN '11/01/2021 00:00:01' AND '03/15/2022 23:59:59'