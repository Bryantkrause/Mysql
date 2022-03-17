CREATE PROCEDURE GetShipments
@CustomerName

AS
BEGIN
SET NOCOUNT ON

SELECT 
CustomerName, OrderNumber, ActualShipDate
FROM ShipmentOrder
WHERE CustomerName = @CustomerName AND ActualShipDate BETWEEN '11/01/2021 00:00:01' AND '11/30/2021 23:59:59'
END

let
    Source = Excel.CurrentWorkbook(){[Name="Customer_Name"]}[Content],
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"CustomerName", Int64.Type}}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Changed Type",{{"CustomerName", type text}}),
    #"Added Custom" = Table.AddColumn(#"Changed Type1", "Custom", each "(CustomerName = '"&[CustomerName]&"')"),
    Custom1 = " WHERE "&Text.Combine( #"Added Custom"[Custom])
in
    Custom1

    
let
    StartDate=DateBegin,
    EndDate=DateEnd,
    Source = Sql.Database("dsn=RAMP1", "ShipmentOrder", 
    [Query=
    "SELECT * FROM [ShipmentOrder].[dbo].[Logs] WHERE ActualShipDate>='" &StartDate& "' AND CreatedTime <='" &EndDate& "' ", 
    HierarchicalNavigation=true)
in
    Source

let
 CusName=Name,
 Source=Odbc.DataSource("dsn=RAMP1", "ShipmentOrder",
 [Query="SELECT * FROM [ShipmentOrder] WHERE CustomerName ='" &CusName&"' "])
in
 Source
let
 CusName=Name,
 Source=Odbc.DataSource("dsn=RAMP1", "ShipmentOrder",
 [Query= "SELECT * FROM [ShipmentOrder] 
 WHERE CustomerName ='" &CusName&"' ",
 HierarchicalNavigation=true])
in
 Source







example 1
let
    Source = Sql.Database("localhost", "Adventure Works DW"),
    Test = Value.NativeQuery(
            Source,
            "SELECT * FROM DimDate
            WHERE EnglishMonthName=@MonthName
            AND
            EnglishDayNameOfWeek=@DayName",
            [MonthName="March", DayName="Tuesday"])"
in
    Test



thingy 3

let
    StartDate=DateBegin,
    EndDate=DateEnd,
    Source = Sql.Database("this-is-the-database-url.com", "TableNameHere", 
    [Query="SELECT * FROM [TableNameHere].[dbo].[Logs] WHERE CreatedTime >='" &StartDate& "' AND CreatedTime <='" &EndDate& "' ", 
    CommandTimeout=#duration(0, 0, 10, 0), HierarchicalNavigation=true, MultiSubnetFailover=true])
in
    Source
