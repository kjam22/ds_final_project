CREATE DATABASE IF NOT EXISTS finaldb;
USE finaldb;

DROP TABLE IF EXISTS sportuser;
DROP TABLE IF EXISTS assign;
DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS referee;


CREATE TABLE referee(id INT NOT NULL PRIMARY KEY auto_increment, 

                    firstname VARCHAR(25) NOT NULL, lastname VARCHAR(25) NOT NULL, grade VARCHAR(25) NOT NULL, position VARCHAR(25),

                     age INT, skill INT);


CREATE TABLE game(id INT NOT NULL PRIMARY KEY auto_increment, 
field varchar(100), 
gdate date,
gtime time,
gtype varchar(25));


CREATE TABLE assign
(id INT NOT NULL PRIMARY KEY auto_increment, 
refereeid INT,
gameid INT,
foreign key (refereeid) references referee(id),
foreign key (gameid) references game(id),
assign_status varchar(25));



-- A report can be generated with joins
-- CREATE TABLE report(id INT NOT NULL PRIMARY KEY auto_increment, 
-- Game_ID INT, Game_Date DATE, Assigned_Referee TEXT);

CREATE TABLE sportuser (id INT NOT NULL PRIMARY KEY auto_increment, assignor BOOLEAN);
-- if user is assignor then show skill and status else name,age, grade


INSERT INTO  referee (firstname, lastname, grade,age, skill) VALUES

     ('Kevin','Kim', 'National', 32,70),

     ('Herbert', 'Miles','Local', 40,80),

     ('Morris', 'Reed', 'International', 35,40),

     ('Paula', 'Edwards', 'National',45, 70),

     ('Tom', 'Gregory', 'Local', 50, 100);



INSERT INTO game (field, gdate, gtime, gtype)VALUES

    ('IU Stadium', '2021/01/02', '13:30:00', 'low-recreation'),

    ('Bloomington Stadium', '2021/01/05', '16:30:00', 'high-recreation'),

    ('Indy Stadium', '2021/01/04', '15:30:00', 'low-recreation'),

    ('Purdue Stadium' ,'2021/01/03', '14:00:00', 'high-recreation');
   

select * from assign;