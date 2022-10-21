SELECT user_id, CONCAT(UPPER(LEFT(name,1)),LOWER(SUBSTRING(name,2,LENGTH(name)))) AS name
FROM Users
ORDER BY user_id

-- better version

-- # Write your MySQL query statement below
select user_id,concat(upper(left(name,1)),lower(substring(name,2))) as name
from Users
order by user_id;

-- better due to improved use of substring without needing to specify the end of length
