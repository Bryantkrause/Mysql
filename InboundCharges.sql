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
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerTariff.Rate,
(WarehouseReceipt.LadingQuantity*CustomerTariff.Rate) As CTN_CHarge
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
  WHERE  WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST' AND CustomerTariff.TariffName='LZ<1000' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod != 'Palletized' AND WarehouseReceipt.LadingQuantity < 1000

-- LZ 1001-2000
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerTariff.Rate,
(WarehouseReceipt.LadingQuantity*CustomerTariff.Rate) As CTN_CHarge
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
  WHERE  WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST' AND CustomerTariff.TariffName='LZ 1001-2000' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod != 'Palletized'
AND WarehouseReceipt.LadingQuantity > 1000 AND WarehouseReceipt.LadingQuantity < 2001

-- LZ 2001-3000
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerTariff.Rate,
(WarehouseReceipt.LadingQuantity*CustomerTariff.Rate) As CTN_CHarge
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
WHERE WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST' AND CustomerTariff.TariffName='LZ 2001-3000' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod != 'Palletized'
AND WarehouseReceipt.LadingQuantity > 2000 AND WarehouseReceipt.LadingQuantity < 3001

-- LZ> 3000
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerTariff.Rate,
(WarehouseReceipt.LadingQuantity*CustomerTariff.Rate) As CTN_CHarge
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
WHERE WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST' AND CustomerTariff.TariffName='LZ> 3000' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod != 'Palletized'
AND WarehouseReceipt.LadingQuantity > 3000

-- LZ > 1000
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerTariff.Rate,
(WarehouseReceipt.LadingQuantity*CustomerTariff.Rate) As CTN_CHarge
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
WHERE WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST' AND CustomerTariff.TariffName='LZ > 1000' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod != 'Palletized'
AND WarehouseReceipt.LadingQuantity > 1000

-- FloorLoad Up to: 1000
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerTariff.Rate,
(WarehouseReceipt.LadingQuantity*CustomerTariff.Rate) As CTN_CHarge
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
WHERE WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST' AND CustomerTariff.TariffName='FloorLoad Up to: 1000' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod != 'Palletized'
AND WarehouseReceipt.LadingQuantity <= 1000

-- FloorLoad Pieces:>2000
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerTariff.Rate,
(WarehouseReceipt.LadingQuantity*CustomerTariff.Rate) As CTN_CHarge
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
WHERE WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST' AND CustomerTariff.TariffName='FloorLoad Pieces:>2000' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod != 'Palletized'
AND WarehouseReceipt.LadingQuantity > 1999

