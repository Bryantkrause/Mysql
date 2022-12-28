SELECT WarehouseSku, Type, Description, DefaultPack, AllocationName, isActive, SkuGroup
FROM Sku LEFT JOIN ShipmentOrder as so ON 
WHERE CustomerName = '417'