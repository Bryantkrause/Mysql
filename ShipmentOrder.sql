SELECT
CASE WHEN CustomerName >= 430 THEN 430 ELSE CustomerName END As ID, 
Year = DATEPART(YEAR, ActualShipDate),
Month = DATEPART(Month, ActualShipDate),
Count(DISTINCT(OrderNumber)) As Orders, SUM(QtyShipped) as Qty

FROM ShipmentOrder

WHERE ActualShipDate  BETWEEN '4/01/2021 00:00:01' AND '07/31/2022 23:59:59' AND
CustomerName != 'PC' AND CustomerName !='Z_TEST' AND FacilityName !='Z_TEST'
GROUP BY CustomerName, DATEPART(YEAR, ActualShipDate), DATEPART(Month, ActualShipDate)


-- Grab a note

SELECT SO.OrderNumber, SO.ActualShipDate, Note.Note
FROM ShipmentOrder AS SO INNER JOIN ShipmentOrderNote AS Note On SO.OrderNumber = Note.OrderNumber
WHERE SO.CustomerName = '314' AND SO.ActualShipDate BETWEEN '9/01/2022 00:00:01' AND '09/30/2022 23:59:59' AND
Note.Note LIKE '%110 CASES PER PALLET%'







'to find a sous'

SELECT CustomerName, ActualShipDate, OrderNumber, CustomerOrderNumber, CustomerPoNumber, CarrierProNumber,
WarehouseBolNumber, RoutingReferenceNumber

FROM ShipmentOrder

WHERE CustomerName = '400'  AND FacilityName!='Ztest' AND CarrierName = 'PRIORITY1'


-- Davinci
SELECT dv_business_partner.description,EXTRACT(MONTH FROM dv_order.actual_trans_ts) as month, EXTRACT(YEAR FROM dv_order.actual_trans_ts) as YEAR,
 sum(dv_order_ship_item_entry.qty) as Units, count(DISTINCT(dv_order.id)), count(dv_order_ship_item_entry.ordinal) as SKu
FROM dv_order INNER JOIN dv_business_partner
ON dv_order.vendor_id = dv_business_partner.id
INNER JOIN dv_order_ship_item_entry ON dv_order.id = dv_order_ship_item_entry.order_id

WHERE dv_order.actual_trans_ts BETWEEN '2021-05-01 00:00:00' AND '2022-07-31 23:59:59'

GROUP BY dv_business_partner.description , month, YEAR
ORDER BY dv_business_partner.description, month, YEAR