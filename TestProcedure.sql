DELIMITER $$
CREATE PROCEDURE Testify
  (TMethod varchar(64))  

BEGIN
'put thingy here'
IF TMethod = '0' THEN
SELECT 
CustomerName, ReceiptNumber, CustomerOrderNumber,DeliveryDate, 
TransportMethod, QtyReceived, LadingQuantity, PalletsReceived
FROM WarehouseReceipt
WHERE DeliveryDate BETWEEN '03/01/2022 00:00:01' AND '03/31/2022 23:59:59'
ELSE
SELECT 
CustomerName, ReceiptNumber, CustomerOrderNumber,DeliveryDate, 
TransportMethod, QtyReceived, LadingQuantity, PalletsReceived
FROM WarehouseReceipt
WHERE DeliveryDate BETWEEN '03/01/2022 00:00:01' AND '03/31/2022 23:59:59' AND
TransportMethod = TMethodVariable
END $$

DELIMITER



= Odbc.DataSource("dsn=RAMP1", [HierarchicalNavigation=true])

let Source = Odbc.DataSource("dsn=RAMP1", [HierarchicalNavigation=true]),
    Test = Value.NativeQuery(
        Source,
        "Select CustomerName, ReceiptNumber, CustomerOrderNumber,DeliveryDate, TransportMethod, QtyReceived, LadingQuantity, PalletsReceived
        FROM WarehouseReceipt
        WHERE TransportMethod=@TMethodVariable",
        [TMethodVariable="M"]
        )
    in 
    Test

    let Source = Odbc.DataSource("dsn=RAMP1", [HierarchicalNavigation=true]),
    Test = Value.NativeQuery(
        Source,
        "Select CustomerName, ReceiptNumber, CustomerOrderNumber,DeliveryDate, TransportMethod, QtyReceived, LadingQuantity, PalletsReceived
        FROM WarehouseReceipt
        WHERE TransportMethod=?",
        {"M"}
        )
    in 
    Test