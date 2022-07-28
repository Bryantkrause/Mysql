    SELECT 
    ShipmentOrderPick.OrderNumber, ShipmentOrderPick.WarehouseSku, ShipmentOrderPick.PickUOM, ShipmentOrderPick.PickQty, ShipmentOrderPick.Qty, Sku.Description, Sku.DefaultPack, Sku.SkuCategory
    FROM ShipmentOrder INNER JOIN  ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
    INNER JOIN Sku ON ShipmentOrderPick.WarehouseSku = Sku.WarehouseSku
    WHERE ShipmentOrderPick.FacilityName='Cerritos' AND
    ShipmentOrder.CustomerName='417' AND
    ShipmentOrderPick.PickUOM!='PL' AND
    ShipmentOrder.ActualShipDate BETWEEN '06/01/2022 00:00:01' AND '06/30/2022 23:59:59' 
    
    SELECT
    FacilityName, CustomerName, OrderNumber, PackageLineNumber, Qty
    From ShipmentOrderPackage
    WHERE CustomerName = '417'
