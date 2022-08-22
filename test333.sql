SELECT CustomerName,ActualShipDate, SUM(QtyShipped) AS ShippedQty

FROM ShipmentOrder

WHERE CustomerName = '314'  AND FacilityName!='Ztest'

if customer name = 314 AND FacilityName does not equal'Ztest'
    then display data
GROUP BY CustomerName, ActualShipDate



SELECT ShipmentOrder.CustomerName, ShipmentOrder.ActualShipDate, SUM(ShipmentOrder.QtyShipped) AS ShippedQty, Sum(ShipmentOrderDetail.QtyOrdered) As QTYOrdered

FROM ShipmentOrder LEFT JOIN ShipmentOrderDetail ON ShipmentOrder.OrderNumber = ShipmentOrderDetail.OrderNumber

WHERE ShipmentOrder.CustomerName = '314'  AND ShipmentOrder.FacilityName!='Ztest' AND ShipmentOrderDetail.WarehouseSku = '860006554347' AND
ShipmentOrder.CustomerName != 'PC' AND ShipmentOrder.CustomerName !='Z_TEST' AND ShipmentOrder.FacilityName !='Z_TEST'

GROUP BY ShipmentOrder.CustomerName, ShipmentOrder.ActualShipDate

