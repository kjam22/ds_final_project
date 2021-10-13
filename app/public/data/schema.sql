CREATE DATABASE IF NOT EXISTS msisdb;
USE msisdb;

DROP TABLE IF EXISTS Referee;

DROP TABLE IF EXISTS Report;


CREATE TABLE Referee(Member_ID INT NOT NULL PRIMARY KEY auto_increment, 

                    First_Name VARCHAR(25) NOT NULL, Last_Name VARCHAR(25) NOT NULL,

                     Age INT, Referee_ Skill INT, Referee_Status TEXT);



CREATE TABLE Game(Game_ID INT NOT NULL PRIMARY KEY auto_increment, Game_Level INT, field TEXT, game_Date INT);



CREATE TABLE Report(Report_ID INT NOT NULL PRIMARY KEY auto_increment, Game_ID INT, Game_Date DATE, Assigned_Referee TEXT);

CREATE TABLE User (user_ID INT NOT NULL PRIMARY KEY auto_increment);


INSERT INTO Referee VALUES

     (1001,'Kevin','Kim', 23, 70,'Unassigned'),

     (1002,'Herbert', 'Miles', 33, 80, 'Unassigned'),

     (1003,'Morris', 'Reed', 37, 100, 'Unassigned'),

     (1004, 'Paula', 'Edwards', 28, 70, 'Unassigned'),

     (1005, 'Tom', 'Gregory', 40, 80, 'Unassigned');



INSERT INTO Game VALUES

    (101, 1, 'field1','2021-11-01'),

    (102, 2, 'field2', '2021-11-02'),

    (103, 3, 'field3', '2021-11-04'),

    (104, 4, 'field4', '2021-11-06');



INSERT INTO Report VALUES

     (1, 101, '2021-11-01', 'Kevin Kim'),

     (2, 102, '2021-11-10', 'Herbert Miles'),

     (3, 103, '2021-11-13', 'Morris Read'),

     (4, 104, '2021-12-11', 'Tom Gregory');     

