CREATE DATABASE IF NOT EXISTS msisdb;
USE msisdb;


DROP TABLE IF EXISTS REF_DATA;
DROP TABLE IF EXISTS GAME;
DROP TABLE IF EXISTS USER;

create table REF_DATA (
	id INT PRIMARY KEY auto_increment NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	age INT NOT NULL,
	ref_grade VARCHAR(1) NOT NULL,
	ref_skill INT NOT NULL
);

insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (1, 'Jamil', 'Bourgeois', 63, 'B', 19);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (2, 'Goldarina', 'Corpe', 44, 'D', 34);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (3, 'Warde', 'Ruoff', 31, 'D', 74);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (4, 'Abelard', 'Over', 54, 'C', 9);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (5, 'Sloane', 'Plak', 60, 'D', 9);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (6, 'Jodi', 'Edson', 53, 'C', 56);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (7, 'Cecil', 'Rude', 40, 'C', 46);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (8, 'Hendrik', 'Nisen', 49, 'C', 38);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (9, 'Regine', 'McGahy', 31, 'D', 19);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (10, 'Roldan', 'Kloser', 60, 'A', 35);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (11, 'Ado', 'Tynnan', 27, 'A', 87);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (12, 'Nil', 'Lurriman', 23, 'D', 87);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (13, 'Verney', 'Malser', 21, 'D', 52);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (14, 'Randi', 'Woodage', 59, 'F', 19);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (15, 'Peirce', 'Underwood', 49, 'A', 14);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (16, 'Cy', 'Treacher', 25, 'A', 73);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (17, 'Burch', 'Steggles', 29, 'C', 82);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (18, 'Deerdre', 'Trevallion', 22, 'C', 19);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (19, 'Garvey', 'Mulrean', 38, 'A', 95);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (20, 'Zonnya', 'Cawdery', 22, 'A', 31);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (21, 'Ricca', 'Iddins', 28, 'C', 99);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (22, 'Dyan', 'Tapscott', 41, 'C', 70);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (23, 'Wit', 'Bontein', 29, 'D', 50);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (24, 'Hendrick', 'Overbury', 56, 'F', 49);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (25, 'Frederique', 'Kernock', 42, 'B', 39);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (26, 'Teena', 'Grimsdell', 53, 'F', 58);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (27, 'Arlyn', 'Dalla', 30, 'A', 14);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (28, 'Joy', 'Langlais', 45, 'F', 31);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (29, 'Olwen', 'Ianno', 48, 'F', 83);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (30, 'Fionna', 'Bailles', 40, 'A', 30);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (31, 'Ricki', 'Geertz', 46, 'C', 68);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (32, 'Agace', 'Pitone', 32, 'F', 32);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (33, 'Roarke', 'Dumphy', 65, 'B', 49);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (34, 'Lon', 'McAreavey', 20, 'C', 79);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (35, 'Porty', 'McCoid', 25, 'F', 83);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (36, 'Freida', 'Boake', 65, 'D', 7);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (37, 'Annabel', 'Romanelli', 32, 'B', 77);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (38, 'Thedric', 'Fobidge', 21, 'F', 88);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (39, 'Francene', 'Amphlett', 60, 'D', 2);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (40, 'Galina', 'Youde', 54, 'A', 48);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (41, 'Brandie', 'Lantoph', 31, 'A', 6);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (42, 'Teri', 'Figin', 40, 'C', 64);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (43, 'Polly', 'Farahar', 49, 'F', 37);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (44, 'Arlena', 'Archbald', 32, 'B', 10);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (45, 'Monah', 'McQuilty', 58, 'F', 20);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (46, 'Norene', 'Dominelli', 54, 'A', 9);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (47, 'Allene', 'Lecount', 60, 'B', 5);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (48, 'Ardyth', 'Harlowe', 21, 'A', 66);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (49, 'Heddi', 'Billingham', 33, 'D', 4);
insert into REF_DATA (id, first_name, last_name, age, ref_grade, ref_skill) values (50, 'Katerina', 'Darlasson', 20, 'C', 11);


CREATE TABLE GAME(
    game_id INT NOT NULL PRIMARY KEY auto_increment, 
    field TEXT, 
    game_date INT,
    
    );


CREATE TABLE USER (
    user_ID INT NOT NULL PRIMARY KEY auto_increment,
    user_status varchar(10) NOT NULL
    
    );

/* 
CREATE TABLE ASSIGNMENT (
    game_id int NOT NULL,
    id int NOT NULL

);