SELECT
CustomerName, ReceiptNumber, CustomerOrderNumber,DeliveryDate, CreateDate,
EstimatedDeliveryDate, TransportMethod, QtyReceived, LadingQuantity, PalletsReceived, DAY(DeliveryDate)
FROM WarehouseReceipt
WHERE WarehouseReceipt.CustomerName='400'
"&InboundDate&"

SELECT
CustomerName, ReceiptNumber, CustomerOrderNumber,DeliveryDate, CreateDate,
EstimatedDeliveryDate, TransportMethod, QtyReceived, LadingQuantity, PalletsReceived, DeliveryDate
FROM WarehouseReceipt 
WHERE FacilityName!='Ztest' "&InboundDate&"

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

SELECT CustomerName, DeliveryDate, SUM(PalletsReceived)
FROM WarehouseReceipt
WHERE DeliveryDate  BETWEEN '01/01/2021 00:00:01' AND '02/28/2022 23:59:59'
GROUP BY CustomerName, DeliveryDate

SELECT 
CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As ID,
TransportMethod, count(TransportMethod) As Number, Sum(PalletsReceived) As PAllets
FROM WarehouseReceipt
WHERE DeliveryDate BETWEEN '1/01/2021 00:00:01' AND '10/31/2022 23:59:59'
AND CustomerName != 'PC' AND CustomerName !='Z_TEST'
GROUP BY CustomerName, TransportMethod
ORDER BY CustomerName , TransportMethod
