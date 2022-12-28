SELECT count(receiptNumber) AS orders

FROM warehouseReceipts

WHERE CustomerName = '417' AND DeliveryDate BETWEEN '11/01/2022 00:00:01' AND '11/30/2022 23:59:59'
AND receiptType = 'Order Return'