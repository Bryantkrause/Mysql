WITH report AS (
WITH CTE AS (
SELECT id as di, recordDate, TO_DAYS(recordDate) AS DAY, temperature,
 LAG(temperature, 1) OVER ( ORDER BY recordDate) AS PreviousDayTemp,
 LAG(TO_DAYS(recordDate), 1) OVER ( ORDER BY recordDate) AS PreviousDay
From Weather
ORDER BY recordDate
)
SELECT CASE WHEN SUM(DAY-PreviousDay) = 1 AND  SUM(temperature - PreviousDayTemp) > 0 THEN di ELSE 0 END As id
FROM CTE
GROUP BY di
)
SELECT id
FROM report
WHERE id != 0