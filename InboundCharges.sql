SELECT WarehouseReceipt.CustomerName,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,
WarehouseReceipt.PalletsReceived,
(WarehouseReceipt.PalletsReceived*CustomerTariff.Rate) As UnloadPallets
 
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName 
AND CustomerTariff ON WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 

WHERE  WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST' AND CustomerTariff.TariffName='UNLD PLTZD' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod = 'Palletized'

-- LZ<1000
SELECT WarehouseReceipt.CustomerName,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,
(WarehouseReceipt.PalletsReceived*CustomerTariff.Rate) As UnloadPallets
 FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
  WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
    WHERE  WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST' AND CustomerTariff.TariffName='LZ<1000' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod != 'Palletized' AND WarehouseReceipt.LadingQuantity < 1000
