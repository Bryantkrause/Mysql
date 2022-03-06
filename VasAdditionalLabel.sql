SELECT
SO.OrderNumber, 

FROM SO AS ShipmentOrder INNER JOIN PICK AS ShipmentOrderPick

WHERE SO.CustomerName='400' AND 
SO.ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59' 
AND (PICK.User2="true" OR PICK.User2="TRUE")
AND PICK.WarehouseSku IN(
PackDetail.COUNT  From Sku INNER JOIN PackDetail ON Sku.DefaultPAck=PackDetail.PackName 
Where Sku.CustomerName='400' AND PackDetail.UOM='IN'

