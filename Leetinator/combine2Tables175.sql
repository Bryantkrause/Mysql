SELECT p.firstName, p.lastName, IFNULL(a.city,Null) as city, IFNULL(a.state,Null) as state
FROM Person as p Left Join Address as a ON p.personId = a.personId
