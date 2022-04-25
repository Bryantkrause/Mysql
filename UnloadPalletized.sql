SELECT
WarehouseReceipt.ReceiptNumber, WarehouseReceipt.DeliveryDate, WarehouseReceipt.TransportMethod,
WarehouseReceipt.PalletsReceived, WarehouseReceipt.LadingQuantity, WarehouseReceipt.CustomerOrderNumber, (CustomerTariff.Rate * WarehouseReceipt.PalletsReceived)
FROM WarehouseReceipt
LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName=CustomerTariff.CustomerName
WHERE WarehouseReceipt.CustomerName='400'
"&InboundDate&"
AND WarehouseReceipt.TransportMethod!= 'U'
AND WarehouseReceipt.TransportMethod = 'PALLETIZED'
AND CustomerTariff.TariffName = 'UNLD PLTZD'