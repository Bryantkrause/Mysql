SELECT
ShipmentOrder.OrderNumber, ShipmentOrderPick.PickUOM, ShipmentOrderPick.PickQty,
ShipmentOrder.FacilityName, ShipmentOrder.CustomerName, Sku.DefaultPack
FROM ShipmentOrder
LEFT JOIN  ShipmentOrderPick ON ShipmentOrder.OrderNumber=ShipmentOrderPick.OrderNumber
LEFT JOIN SKU ON ShipmentOrderPick.WarehouseSku=Sku.WarehouseSku
WHERE ShipmentOrder.CustomerName = "&Customer&" AND ShipmentOrder.OrderNumber ='0000013800'
AND "&Date&" AND ShipmentOrder.FacilityName='Fullerton' AND SKU.CustomerName = "&Customer&"