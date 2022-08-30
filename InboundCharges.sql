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

-- PLT PUTAWAY
SELECT Concat(WarehouseReceipt.ReceiptNumber,WarehouseReceipt.FacilityName) AS Thingy,CustomerTariff.TariffName,
Concat(Year(WarehouseReceipt.DeliveryDate),Month(WarehouseReceipt.DeliveryDate)) As Thingy2,
(WarehouseReceipt.PalletsReceived*CustomerTariff.Rate) As UnloadPallets
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerTariff.Rate,
(WarehouseReceipt.LadingQuantity*CustomerTariff.Rate) As CTN_CHarge
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
  WHERE  WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='ZTEST' AND CustomerTariff.TariffName='PLT PUTAWAY' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod = 'Palletized' 

-- UNLD UNIT
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerTariff.Rate,
(WarehouseReceipt.LadingQuantity*CustomerTariff.Rate) As CTN_CHarge
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
WHERE WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='Z_TEST' AND CustomerTariff.TariffName='UNLD UNIT' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod != 'Palletized'

-- SORT & CONFIRM
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerTariff.Rate,
(WarehouseReceipt.LadingQuantity*CustomerTariff.Rate) As CTN_CHarge
FROM WarehouseReceipt LEFT JOIN CustomerTariff ON WarehouseReceipt.CustomerName = CustomerTariff.CustomerName AND
WarehouseReceipt.FacilityName = CustomerTariff.FacilityName 
WHERE WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='ZTEST' AND CustomerTariff.TariffName='SORT & CONFIRM' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod != 'Palletized'
AND WarehouseReceipt.UniqueLotsReceived > 2

-- UNLD 20 FT FLR CNT
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerAccessorial.Rate,
(WarehouseReceipt.LadingQuantity*CustomerAccessorial.Rate) As UnloadFlat
FROM WarehouseReceipt LEFT JOIN CustomerAccessorial ON WarehouseReceipt.CustomerName = CustomerAccessorial.CustomerName AND
WarehouseReceipt.FacilityName = CustomerAccessorial.FacilityName 
WHERE WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='ZTEST' AND CustomerAccessorial.AccessorialName='UNLD 20 FT FLR CNT' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod = '20 FLR'

-- UNLD 40 FT FLR CNT
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerAccessorial.Rate,
(WarehouseReceipt.LadingQuantity*CustomerAccessorial.Rate) As UnloadFlat
FROM WarehouseReceipt LEFT JOIN CustomerAccessorial ON WarehouseReceipt.CustomerName = CustomerAccessorial.CustomerName AND
WarehouseReceipt.FacilityName = CustomerAccessorial.FacilityName 
WHERE WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='ZTEST' AND CustomerAccessorial.AccessorialName='UNLD 40 FT FLR CNT' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod = '40 FLR'

-- UNLD 45 FT FLR CNT
SELECT WarehouseReceipt.CustomerName,WarehouseReceipt.DeliveryDate,
WarehouseReceipt.ReceiptNumber,
WarehouseReceipt.TransportMethod,WarehouseReceipt.LadingQuantity,CustomerAccessorial.Rate,
(WarehouseReceipt.LadingQuantity*CustomerAccessorial.Rate) As UnloadFlat
FROM WarehouseReceipt LEFT JOIN CustomerAccessorial ON WarehouseReceipt.CustomerName = CustomerAccessorial.CustomerName AND
WarehouseReceipt.FacilityName = CustomerAccessorial.FacilityName 
WHERE WarehouseReceipt.CustomerName != 'PC' AND WarehouseReceipt.CustomerName !='Z_TEST' AND WarehouseReceipt.FacilityName !='ZTEST' AND CustomerAccessorial.AccessorialName='UNLD 45 FT FLR CNT' AND
WarehouseReceipt.DeliveryDate BETWEEN '1/1/2022 12:00:00 AM' AND '7/31/2022 11:59:59 PM' AND WarehouseReceipt.TransportMethod = '45 FLR'
