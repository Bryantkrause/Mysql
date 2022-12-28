SELECT so.facilityName, so.facilityName, so.customerName, so.OrderNumber, sd.warehouseSku, sd.PackName, sd.UOM, sd.Qty, det.chargeAlias, det.ChargeDescription

FROM ShipmentOrder as so LEFT JOIN  ShipmentOrderPick as sd on so.orderNumber = sd.ordernumber and 
so.FacilityName = sd.FacilityName and so.CustomerName = sd.CustomerName
LEFT JOIN DocumentInvoice as di on so.orderNumber = di.ordernumber and 
so.FacilityName = di.FacilityName and so.CustomerName = di.CustomerName
LEFT JOIN DocumentInvoiceDetail as det on di.DocumentInvoiceNumber = det.DocumentInvoiceNumber

WHERE so.ActualShipDate BETWEEN '11/01/2022 00:00:01' AND '11/30/2022 23:59:59' AND so.CustomerName = '417'