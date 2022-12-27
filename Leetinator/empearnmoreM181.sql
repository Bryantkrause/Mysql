WITH CTE AS (
SELECT l.id, r.name, l.salary, r.managerID, case WHEN l.id = r.managerID THEN r.salary ELSE 0 END AS MSalary
FROM employee as L INNER JOIN employee as R ON l.id = r.managerID
WHERE r.salary > l.salary
)
SELECT name AS Employee
FROM CTE