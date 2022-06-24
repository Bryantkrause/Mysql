DECLARE @SQL nvarchar(1000)

DECLARE @Pid varchar(50)
set @Pid = "&Customer&" 


SET @SQL = '
SELECT
CustomerName, FacilityName, AccessorialName, Rate, MinimumCharge
FROM CustomerAccessorial 
WHERE FacilityName=''Cerritos'' AND CustomerName=
'+ @Pid

EXEC (@SQL)