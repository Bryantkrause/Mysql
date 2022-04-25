SELECT
CustomerName, ReceiptNumber, CustomerOrderNumber,DeliveryDate, CreateDate,
EstimatedDeliveryDate, TransportMethod, QtyReceived, LadingQuantity, PalletsReceived, DAY(DeliveryDate)
FROM WarehouseReceipt
WHERE WarehouseReceipt.CustomerName='400'
"&InboundDate&"


"M"
SELECT
WarehouseReceipt.ReceiptNumber, WarehouseReceipt.DeliveryDate, WarehouseReceipt.TransportMethod, WarehouseReceipt.PalletsReceived, WarehouseReceipt.LadingQuantity, WarehouseReceipt.CustomerOrderNumber, CustomerAccessorial.Rate
FROM WarehouseReceipt
LEFT JOIN CustomerAccessorial ON WarehouseReceipt.CustomerName=CustomerAccessorial.CustomerName
WHERE WarehouseReceipt.CustomerName='400'
"&InboundDate&"
AND WarehouseReceipt.TransportMethod!= 'U'
AND (WarehouseReceipt.TransportMethod = '40 FLR' OR WarehouseReceipt.TransportMethod = '45 FLR')
AND CustomerAccessorial.AccessorialName = 'UNLD 40 FT FLR CNT'