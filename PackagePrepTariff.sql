SELECT ShipmentOrder.OrderNumber,COUNT(ShipmentOrder.CartonQuantity)
    From ShipmentOrder
    INNER JOIN ShipmentOrderPick ON ShipmentOrderPick.OrderNumber=ShipmentOrder.OrderNumber
    LEFT JOIN LEFT JOIN CustomerTariff ON ShipmentOrder.CustomerName=CustomerTariff.CustomerName 
    WHERE ShipmentOrder.FacilityName='Cerritos' AND ShipmentOrder.CustomerName='400' AND ShipmentOrder.TransportMethod='U'
    AND ShipmentOrder.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
    AND ShipmentOrderPick.WarehouseSku IN(
    SELECT Sku.WarehouseSku  From Sku INNER JOIN PackDetail ON Sku.DefaultPAck=PackDetail.PackName 
    Where Sku.CustomerName='400' AND PackDetail.UOM='IN' AND Sku.User12='PACKAGE PREP CASE')
    GROUP BY ShipmentOrder.OrderNumber

'update with M'
SELECT ShipmentOrder.OrderNumber, COUNT(ShipmentOrder.CartonQuantity) AS QTY, (COUNT(ShipmentOrder.CartonQuantity) * CustomerTariff.Rate) AS Charge
From ShipmentOrder
INNER JOIN ShipmentOrderPick ON ShipmentOrderPick.OrderNumber=ShipmentOrder.OrderNumber
LEFT JOIN CustomerTariff ON ShipmentOrder.CustomerName=CustomerTariff.CustomerName 
WHERE ShipmentOrder.FacilityName='Cerritos'
AND ShipmentOrder.CustomerName='400'
AND ShipmentOrder.TransportMethod='U'
"&Date&" 
AND CustomerTariff.TariffName = 'PACKAGE PREP CS'
AND ShipmentOrderPick.WarehouseSku
IN(
SELECT Sku.WarehouseSku  
From Sku 
INNER JOIN PackDetail ON Sku.DefaultPAck=PackDetail.PackName 
Where Sku.CustomerName='400' AND PackDetail.UOM='IN' AND Sku.User12='PACKAGE PREP CASE')
GROUP BY ShipmentOrder.OrderNumber, ShipmentOrder.CartonQuantity, CustomerTariff.Rate