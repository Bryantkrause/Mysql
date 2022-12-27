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

CREATE TABLE Activity(
    player_id  Int,
    device_id  int,
    event_date  date,
    games_played int
)

INSERT INTO Activity

(1,2,2016-03-01,5)
(1,2,2016-05-02,6)
(2,3,2017-06-25,1)
(3,1,2016-03-02,0)
(3,4,2018-07-03,5)