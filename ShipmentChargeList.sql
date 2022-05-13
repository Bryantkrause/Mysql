'M Shipping'
SELECT DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoice.OrderNumber, 
ShipmentOrder.ActualShipDate, ShipmentOrder.CustomerOrderNumber,ShipmentOrder.CustomerPONumber,  ShipmentOrder.CarrierName, ShipmentOrder.TransportMethod,
ShipmentOrder.QtyShipped, ShipmentOrder.CartonQuantity, ShipmentOrder.PalletsShipped
"&OutboundLinkList&"
FROM DocumentInvoice LEFT JOIN  DocumentInvoiceDetail ON DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber 
LEFT JOIN ShipmentOrder ON DocumentInvoice.OrderNumber = ShipmentOrder.OrderNumber AND DocumentInvoice.FacilityName = ShipmentOrder.FacilityName

WHERE DocumentInvoice.CustomerName = "&Customer&" AND "&Date2&" AND DocumentInvoice.FacilityName!='Ztest' AND DocumentInvoice.OrderNumber != 0
GROUP BY DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoice.OrderNumber, DocumentInvoice.InvoiceDate,
ShipmentOrder.ActualShipDate, ShipmentOrder.CustomerOrderNumber,ShipmentOrder.CustomerPONumber,  ShipmentOrder.CarrierName, ShipmentOrder.TransportMethod,
ShipmentOrder.QtyShipped, ShipmentOrder.CartonQuantity, ShipmentOrder.PalletsShipped
ORDER BY DocumentInvoice.OrderNumber

'M Shipping Charge List'
SELECT DocumentInvoiceDetail.ChargeAlias
FROM DocumentInvoiceDetail LEFT JOIN  DocumentInvoice ON DocumentInvoiceDetail.DocumentInvoiceNumber = DocumentInvoice.DocumentInvoiceNumber 
WHERE DocumentInvoiceDetail.CustomerName = "&Customer&" AND "&Date2&" AND DocumentInvoiceDetail.FacilityName!='Ztest' AND DocumentInvoice.OrderNumber != 0 
GROUP BY DocumentInvoiceDetail.ChargeAlias

'M OutboundLinkList'
let
    Source = Excel.CurrentWorkbook(){[Name="OutboundChargeList"]}[Content],
    #"Added Custom" = Table.AddColumn(Source, "Custom", each ",SUM( CASE WHEN DocumentInvoiceDetail.ChargeAlias = '"&[ChargeAlias]&"' THEN DocumentInvoiceDetail.Amount ELSE 0 END) AS '"&[ChargeAlias]&"')"),
    #"Removed Other Columns" = Table.SelectColumns(#"Added Custom",{"Custom"}),
    Custom1 = Text.Combine(#"Removed Other Columns"[Custom])
in
    Custom1