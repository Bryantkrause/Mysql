SELECT Out.FacilityName, Out.CustomerName, Out.OrderNumber, Out.ActualShipDate,
Pick.warehouseSKu,Pick.FromPalletID, Pick.PackName, Pick.UOM, Pick.QTY, Pick.PickQty, Pick.PickUOM
FROM ShipmentOrder AS Out LEFT JOIN ShipmentOrderPick AS Pick ON Out.FacilityName = Pick.FacilityName AND
Out.OrderNumber = Pick.OrderNumber AND Out.CustomerName = Pick.CustomerName
WHERE Out.CustomerName = '424' AND Out.ActualShipDate BETWEEN '01/01/2022 00:00:01' AND '09/30/2022 23:59:59'
