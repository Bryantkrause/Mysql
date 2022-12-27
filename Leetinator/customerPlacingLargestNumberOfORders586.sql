SELECT customer_number 
FROM orders
WHERE customer_number = ( SELECT MAX(COUNT(s.order_number)) FROM Orders AS s)