
    SELECT 
    ShipmentOrderPick.OrderNumber, ShipmentOrderPick.WarehouseSku, ShipmentOrderPick.PickUOM, ShipmentOrderPick.PickQty, ShipmentOrderPick.Qty
    FROM ShipmentOrder INNER JOIN  ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
    WHERE ShipmentOrderPick.FacilityName='Cerritos' AND CustomerName='400' AND PickUOM!='PL' AND ShipmentOrder.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
    GROUP BY ShipmentOrder.OrderNumber, ShipmentOrderPick.PickUOM
   

   'M'
   'CS'
   SELECT 
    ShipmentOrderPick.OrderNumber, ShipmentOrderPick.PickUOM, SUM(ShipmentOrderPick.PickQty), (SUM(ShipmentOrderPick.PickQty) * CustomerTariff.Rate)
    FROM ShipmentOrder INNER JOIN  ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
    LEFT JOIN CustomerTariff ON ShipmentOrder.CustomerName=CustomerTariff.CustomerName 
    WHERE ShipmentOrder.FacilityName='Cerritos' AND ShipmentOrder.CustomerName='400' AND ShipmentOrderPick.PickUOM!='PL'"&Date&" AND
    ShipmentOrderPick.PickUOM = 'CS' AND CustomerTariff.TariffName = 'HNDL OUT CS/UOM'
    GROUP BY ShipmentOrderPick.OrderNumber, ShipmentOrderPick.PickUOM, ShipmentOrderPick.PickQty, CustomerTariff.Rate ORDER BY OrderNumber

    'M'
   'IN'
   'something is broken with this order 0000158311 is duplicating charges not combining'
   SELECT 
    ShipmentOrderPick.OrderNumber, ShipmentOrderPick.PickUOM, SUM(ShipmentOrderPick.PickQty), (SUM(ShipmentOrderPick.PickQty) * CustomerTariff.Rate)
    FROM ShipmentOrder INNER JOIN  ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
    LEFT JOIN CustomerTariff ON ShipmentOrder.CustomerName=CustomerTariff.CustomerName 
    WHERE ShipmentOrder.FacilityName='Cerritos' AND ShipmentOrder.CustomerName='400' AND ShipmentOrderPick.PickUOM!='PL'"&Date&" AND
    ShipmentOrderPick.PickUOM = 'IN' AND CustomerTariff.TariffName = 'HNDL OUT IN/UOM'
    GROUP BY ShipmentOrderPick.OrderNumber, ShipmentOrderPick.PickUOM, ShipmentOrderPick.PickQty, CustomerTariff.Rate ORDER BY OrderNumber
    'M'
   'EA'
   SELECT 
    ShipmentOrderPick.OrderNumber, ShipmentOrderPick.PickUOM, SUM(ShipmentOrderPick.PickQty), (SUM(ShipmentOrderPick.PickQty) * CustomerTariff.Rate)
    FROM ShipmentOrder INNER JOIN  ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
    LEFT JOIN CustomerTariff ON ShipmentOrder.CustomerName=CustomerTariff.CustomerName 
    WHERE ShipmentOrder.FacilityName='Cerritos' AND ShipmentOrder.CustomerName='400' AND ShipmentOrderPick.PickUOM!='PL'"&Date&" AND
    ShipmentOrderPick.PickUOM = 'EA' AND CustomerTariff.TariffName = 'HNDL OUT EA/UOM'
    GROUP BY ShipmentOrderPick.OrderNumber, ShipmentOrderPick.PickUOM, ShipmentOrderPick.PickQty, CustomerTariff.Rate ORDER BY OrderNumber