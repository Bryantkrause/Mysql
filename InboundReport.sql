SELECT
WarehouseReceipt.CustomerName, WarehouseReceipt.ReceiptNumber, WarehouseReceipt.DeliveryDate, WarehouseReceipt.CarrierName,
WarehouseReceipt.TransportMethod, WarehouseReceipt.QtyReceived, WarehouseReceipt.PalletsReceived

FROM WarehouseReceipt 
WHERE WarehouseReceipt.CustomerName ='314 ' AND
WarehouseReceipt.DeliveryDate BETWEEN '03/01/2022 00:00:01' AND '03/31/2022 23:59:59'
AND WarehouseReceipt.FacilityName!='Ztest' 