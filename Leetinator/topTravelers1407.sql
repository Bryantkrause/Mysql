SELECT u.name, COALESCE(sum(r.distance),0) AS travelled_distance
FROM Users AS u LEFT JOIN Rides AS r ON u.id = r.user_id
GROUP BY r.user_id
ORDER BY travelled_distance DESC, u.name ASC 