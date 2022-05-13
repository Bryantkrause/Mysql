
'CustomerCharges is a variable based on customer charges that sums each one in a separate column'
'M Whole REport'
SELECT DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoice.ReceiptNumber, DocumentInvoice.OrderNumber, DocumentInvoice.WorkOrderNumber, DocumentInvoice.InvoiceDate,
WarehouseReceipt.DeliveryDate, WarehouseReceipt.CustomerOrderNumber,WarehouseReceipt.CustomerPONumber,  WarehouseReceipt.CarrierName, WarehouseReceipt.TransportMethod, WarehouseReceipt.QtyReceived, WarehouseReceipt.LadingQuantity, WarehouseReceipt.PalletsReceived,
ShipmentOrder.CustomerOrderNumber,ShipmentOrder.CustomerPONumber, ShipmentOrder.CarrierName, ShipmentOrder.TransportMethod, ShipmentOrder.ActualShipDate, ShipmentOrder.PalletsShipped, ShipmentOrder.CartonQuantity, ShipmentOrder.QtyShipped,
WorkOrder.CustomerOrderNumber, WorkOrder.CustomerPONumber
"&CustomerCharges&"
FROM DocumentInvoice LEFT JOIN  DocumentInvoiceDetail ON DocumentInvoice.DocumentInvoiceNumber = DocumentInvoiceDetail.DocumentInvoiceNumber 
LEFT JOIN WarehouseReceipt ON DocumentInvoice.ReceiptNumber = WarehouseReceipt.ReceiptNumber AND DocumentInvoice.FacilityName = WarehouseReceipt.FacilityName
LEFT JOIN ShipmentOrder ON DocumentInvoice.OrderNumber = ShipmentOrder.OrderNumber AND DocumentInvoice.FacilityName = ShipmentOrder.FacilityName
LEFT JOIN WorkOrder ON DocumentInvoice.WorkOrderNumber = WorkOrder.WorkOrderNumber AND DocumentInvoice.FacilityName = WorkOrder.FacilityName

WHERE DocumentInvoice.CustomerName = "&Customer&" AND "&Date2&" AND DocumentInvoice.FacilityName!='Ztest' 
GROUP BY DocumentInvoice.CustomerName, DocumentInvoice.FacilityName, DocumentInvoice.ReceiptNumber, DocumentInvoice.OrderNumber, DocumentInvoice.WorkOrderNumber, DocumentInvoice.InvoiceDate,
WarehouseReceipt.DeliveryDate, WarehouseReceipt.CustomerOrderNumber,WarehouseReceipt.CustomerPONumber,  WarehouseReceipt.CarrierName, WarehouseReceipt.TransportMethod, WarehouseReceipt.QtyReceived, WarehouseReceipt.LadingQuantity, WarehouseReceipt.PalletsReceived,
ShipmentOrder.CustomerOrderNumber,ShipmentOrder.CustomerPONumber, ShipmentOrder.CarrierName, ShipmentOrder.TransportMethod, ShipmentOrder.ActualShipDate, ShipmentOrder.PalletsShipped, ShipmentOrder.CartonQuantity, ShipmentOrder.QtyShipped,
WorkOrder.CustomerOrderNumber, WorkOrder.CustomerPONumber
ORDER BY DocumentInvoice.ReceiptNumber DESC, DocumentInvoice.OrderNumber DESC, DocumentInvoice.WorkOrderNumber DESC

