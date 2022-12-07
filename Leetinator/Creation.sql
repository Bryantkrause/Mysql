CREATE TABLE Employee(
    id Int Primary Key,
    name varchar(255),
    salary int,
    managerID int
)

INSERT INTO Employee
VALUES (
    1, "Joe", 70000, 3
),
(
    2, "Henry", 80000, 4
),
(
    3, "Sam", 60000 
),
(
    4, "Max", 90000 
)

CREATE TABLE Weather(
    id Int Primary Key,
    recordDate date,
    temperature int
)

INSERT INTO Weather
VALUES (
    1, 2015-01-01, 10
),
(
    2, 2015-01-02, 25
),
(
    3, 2015-01-03, 20 
),
(
    4, 2015-01-04, 30 
)