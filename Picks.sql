
    SELECT 
    ShipmentOrderPick.OrderNumber, ShipmentOrderPick.WarehouseSku, ShipmentOrderPick.PickUOM, ShipmentOrderPick.PickQty, ShipmentOrderPick.Qty, ShipmentOrderPick.PickQty
    FROM ShipmentOrder INNER JOIN  ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
    WHERE ShipmentOrderPick.FacilityName='Cerritos' AND CustomerName='400' AND PickUOM!='PL' AND ShipmentOrder.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'

   