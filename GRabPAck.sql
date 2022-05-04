SELECT Sku.CustomerName, Sku.WarehouseSku, PackDetail.UOM, PackDetail.Description, PackDetail.Count

FROM Sku LEFT JOIN PackDetail On Sku.DefaultPack=PackDetail.PackName

WHERE Sku.CustomerName = "&Customer&"
