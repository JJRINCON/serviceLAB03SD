CREATE DATABASE university;

CREATE TABLE students(id int unique, 
                      name VARCHAR(40) not null,
                      career VARCHAR(50) not null, 
                      PRIMARY KEY (id));

INSERT INTO students VALUES (1, "Jhon", "Ingenieria de sistemas");
INSERT INTO students VALUES (2, "Gabriella", "Ingenieria de sistemas");
INSERT INTO students VALUES (3, "Fabian", "Ingenieria de sistemas");
INSERT INTO students VALUES (4, "Duvan", "Psicologia");
INSERT INTO students VALUES (5, "Estefania", "Ingenieria ambiental");
INSERT INTO students VALUES (6, "Raul", "Economia");

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

flush privileges;