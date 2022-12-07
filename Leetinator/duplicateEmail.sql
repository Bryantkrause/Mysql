WITH CTE AS
(
SELECT email, count(email) as number
FROM person
GROUP BY email
)
SELECT email
FROM CTE
WHERE number > 1

