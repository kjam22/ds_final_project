CREATE DATABASE IF NOT EXISTS finaldb;
USE finaldb;

DROP TABLE IF EXISTS referee;

DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS game;

CREATE TABLE referee(id INT NOT NULL PRIMARY KEY auto_increment, 

                    firstname VARCHAR(25) NOT NULL, lastname VARCHAR(25) NOT NULL, grade VARCHAR(25) NOT NULL,

                     Age INT, Referee_Skill INT, Referee_Status VARCHAR(25));


CREATE TABLE game(id INT NOT NULL PRIMARY KEY auto_increment, 
field varchar(100), 
gDate DATE
gtime TIME DEFAULT CURRENT_TIMESTAMP);


-- A report can be generated with joins
-- CREATE TABLE report(id INT NOT NULL PRIMARY KEY auto_increment, 
-- Game_ID INT, Game_Date DATE, Assigned_Referee TEXT);

CREATE TABLE user (id INT NOT NULL PRIMARY KEY auto_increment, assignor BOOLEAN);
-- if user is assignor then show skill and status else name,age, grade


INSERT INTO referee VALUES

     ('Kevin','Kim', 'National', 32,70,'Unassigned'),

     ('Herbert', 'Miles','Local', 40,80, 'Unassigned'),

     ('Morris', 'Reed', 'International', 35,40, 'Unassigned'),

     ('Paula', 'Edwards', 'National',45, 70, 'Unassigned'),

     ('Tom', 'Gregory', 'Local', 50, 100, 'Unassigned');



INSERT INTO game VALUES

    ('field1','2021-11-01'),

    ('field2', '2021-11-02'),

    ('field3', '2021-11-04'),

    ('field4', '2021-11-06');



-- INSERT INTO Report VALUES

--      (1, 101, '2021-11-01', 'Kevin Kim'),

--      (2, 102, '2021-11-10', 'Herbert Miles'),

--      (3, 103, '2021-11-13', 'Morris Read'),

--      (4, 104, '2021-12-11', 'Tom Gregory');     

