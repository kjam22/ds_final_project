CREATE DATABASE IF NOT EXISTS finaldb;
USE finaldb;

DROP TABLE IF EXISTS referee;

DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS sportuser;

CREATE TABLE referee(id INT NOT NULL PRIMARY KEY auto_increment, 

                    firstname VARCHAR(25) NOT NULL, lastname VARCHAR(25) NOT NULL, grade VARCHAR(25) NOT NULL,

                     age INT, skill INT, rstatus VARCHAR(25));


CREATE TABLE game(id INT NOT NULL PRIMARY KEY auto_increment, 
field varchar(100), 
gdatetime datetime DEFAULT current_timestamp);


-- A report can be generated with joins
-- CREATE TABLE report(id INT NOT NULL PRIMARY KEY auto_increment, 
-- Game_ID INT, Game_Date DATE, Assigned_Referee TEXT);

CREATE TABLE sportuser (id INT NOT NULL PRIMARY KEY auto_increment, assignor BOOLEAN);
-- if user is assignor then show skill and status else name,age, grade


INSERT INTO  referee (firstname, lastname,grade,age,skill,rstatus) VALUES

     ('Kevin','Kim', 'National', 32,70,'Unassigned'),

     ('Herbert', 'Miles','Local', 40,80, 'Unassigned'),

     ('Morris', 'Reed', 'International', 35,40, 'Unassigned'),

     ('Paula', 'Edwards', 'National',45, 70, 'Unassigned'),

     ('Tom', 'Gregory', 'Local', 50, 100, 'Unassigned');



INSERT INTO game (field)VALUES

    ('field1'),

    ('field2'),

    ('field3'),

    ('field4');



-- INSERT INTO Report VALUES

--      (1, 101, '2021-11-01', 'Kevin Kim'),

--      (2, 102, '2021-11-10', 'Herbert Miles'),

--      (3, 103, '2021-11-13', 'Morris Read'),

--      (4, 104, '2021-12-11', 'Tom Gregory');     

select * from referee;