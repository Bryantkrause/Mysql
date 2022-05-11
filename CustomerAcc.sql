SELECT
CustomerName, FacilityName, AccessorialName, Rate, MinimumCharge
FROM CustomerAccessorial 
WHERE CustomerName='400'

'M'
SELECT 
    CustomerAccessorial.CustomerName,
    CustomerAccessorial.FacilityName,
    Accessorial.AccessorialAlias AS Charge,
    CustomerAccessorial.Rate
FROM CustomerAccessorial LEFT JOIN Accessorial ON CustomerAccessorial.AccessorialName=Accessorial.AccessorialName