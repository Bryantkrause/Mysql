Select * from (
     Select Case when (podocstatus = 'CL') then 'Closed PO'
         when (podocstatus = 'OP') then 'Open PO'
         when (podocstatus = 'SC') then 'Short Closed PO'   
    end as POStatus, 
    YEAR(podate) as [Year], YEAR(podate) as [poyear] , LEFT (datename(Month,podate),3) as [pomonth]
    From PO_order_hdr
    Where podocstatus IN ('SC','CL','OP')
    ) as POnumber
PIVOT
(
    Count(poyear)
    FOR [pomonth]  IN (Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec)

)as PVT

SET NOCOUNT ON;
USE tempdb;

IF OBJECT_ID(N'Orders', N'U') IS NOT NULL DROP TABLE Orders;

IF OBJECT_ID(N'Customers', N'U') IS NOT NULL DROP TABLE Customers;

CREATE TABLE Customers
(
custid CHAR(5) NOT NULL,
city VARCHAR(10) NOT NULL,
CONSTRAINT PK_Customers PRIMARY KEY(custid)
);

CREATE TABLE Orders
(
orderid INT NOT NULL,
custid CHAR(5) NULL,
CONSTRAINT PK_Orders PRIMARY KEY(orderid),
CONSTRAINT FK_Customers PRIMARY KEY(custid)
    REFERENCES Customers(custid)
);
GO

INSERT INTO Customers(custid, city) VALUES
('FISSA','Madrid'),
('FRNDO','Madrid'),
('KRLOS','Madrid'),
('MRPHS','Zion');

INSERT INTO Orders(orderid, custid) VALUES
(1, 'FRNDO'),
(2, 'FRNDO'),
(3, 'KRLOS'),
(4, 'KRLOS'),
(5, 'KRLOS'),
(6, 'MRPHS'),
(7, NULL);

SELECT * FROM Customers;
SELECT * FROM Orders
