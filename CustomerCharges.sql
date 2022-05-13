
'CustomerCharges is a variable based on customer charges that sums each one in a separate column'
'M'
SELECT DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoice.ReceiptNumber, DocumentInvoice.OrderNumber, DocumentInvoice.WorkOrderNumber, DocumentInvoice.InvoiceDate,
WarehouseReceipt.DeliveryDate, WarehouseReceipt.CustomerOrderNumber,WarehouseReceipt.CustomerPONumber,  WarehouseReceipt.CarrierName, WarehouseReceipt.TransportMethod, WarehouseReceipt.QtyReceived, WarehouseReceipt.LadingQuantity, WarehouseReceipt.PalletsReceived,
ShipmentOrder.CustomerOrderNumber,ShipmentOrder.CustomerPONumber, ShipmentOrder.CarrierName, ShipmentOrder.TransportMethod, ShipmentOrder.ActualShipDate, ShipmentOrder.PalletsShipped, ShipmentOrder.CartonQuantity, ShipmentOrder.QtyShipped,
WorkOrder.CustomerOrderNumber, WorkOrder.CustomerPONumber
"&CustomerCharges&"
FROM DocumentInvoice LEFT JOIN  DocumentInvoiceDetail ON DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber AND
LEFT JOIN WarehouseReceipt ON DocumentInvoice.ReceiptNumber = WarehouseReceipt.ReceiptNumber AND
LEFT JOIN ShipmentOrder ON DocumentInvoice.OrderNumber = ShipmentOrder.OrderNumber AND
LEFT JOIN WorkOrder ON DocumentInvoice.WorkOrderNumber = WorkOrder.WorkOrderNumber

WHERE DocumentInvoice.CustomerName = "&Customer&" AND "&Date2&" AND DocumentInvoice.FacilityName!='Ztest' 
GROUP BY DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoice.ReceiptNumber, DocumentInvoice.OrderNumber, DocumentInvoice.WorkOrderNumber, DocumentInvoice.InvoiceDate,
WarehouseReceipt.DeliveryDate, WarehouseReceipt.CustomerOrderNumber,WarehouseReceipt.CustomerPONumber,  WarehouseReceipt.CarrierName, WarehouseReceipt.TransportMethod, WarehouseReceipt.QtyReceived, WarehouseReceipt.LadingQuantity, WarehouseReceipt.PalletsReceived,
ShipmentOrder.CustomerOrderNumber,ShipmentOrder.CustomerPONumber, ShipmentOrder.CarrierName, ShipmentOrder.TransportMethod, ShipmentOrder.ActualShipDate, ShipmentOrder.PalletsShipped, ShipmentOrder.CartonQuantity, ShipmentOrder.QtyShipped,
WorkOrder.CustomerOrderNumber, WorkOrder.CustomerPONumber