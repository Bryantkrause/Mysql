'inbound open orders'
SELECT
FacilityName, ReceiptNumber, DeliveryDate, TransportMethod, CustomerName
FROM WarehouseReceipt
WHERE DeliveryDate BETWEEN '03/01/2022 00:00:01' AND '03/31/2022 23:59:59'
AND (Status = 0 OR Status = 50 OR Status = 60)

'outbound open orders'
SELECT 
FacilityName, OrderNumber, RequestedShipDate, CustomerName, Status
FROM
ShipmentOrder
WHERE
FacilityName!='ZTEST' AND (Status = 0 OR Status = 40 OR Status = 50 OR Status = 51 OR Status = 52) AND
RequestedShipDate BETWEEN '03/01/2022 00:00:00' AND '03/31/2022 23:59:59'