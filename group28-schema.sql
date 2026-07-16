-- ALU DATABASE SCHEMA - GROUP 28

DROP DATABASE IF EXISTS group28_db;
CREATE DATABASE group28_db;
USE group28_db;

-- MEMBER A(name): Students table

-- MEMBER B(Cynthia): Classroom table

-- Table Creation
CREATE TABLE Classroom ( classroom_id INT PRIMARY KEY AUTO_INCREMENT, room_number VARCHAR(10) NOT NULL, building VARCHAR(50) NOT NULL, capacity INT NOT NULL );

-- Adding Sample Rows
INSERT INTO Classroom (room_number, building, capacity) VALUES ('115', 'Entrepreneurship Room', 60), ('116', 'Intl. Business & Trade Room', 90), ('117', 'Political Studies Room', 50), ('118', 'Science Lab Room', 100), ('119', 'Theathre Studies Room', 150), ('120', 'FabLab Room', 30);

-- UPDATE Statement: Cynthia
UPDATE Classroom SET capacity = 80 WHERE room_number = '120';

-- DELETE Statement: Cynthia
DELETE FROM Classroom WHERE room_number = '118';

-- SELECT with WHERE: Cynthia
SELECT * FROM Classroom WHERE capacity > 60;


-- MEMBER C(Carrick): Faculty table

-- Table Creation
CREATE TABLE Faculty (
    faculty_id  INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(100) NOT NULL,
    department  VARCHAR(50)
);

-- Adding Sample Rows
INSERT INTO Faculty (name, email, department)
VALUES
    ('Chlomi Justifié',  'chlomi.justifié@alu.com',  'Computer Science'),
    ('Isimbi Nina', 'isimbi.nina@alu.com', 'Mathematics'),
    ('Chance Aubin',  'chance.aubin@alu.com', 'English'),
    ('David-Harold',  'david.harold@alu.com',  'Physics'),
    ('Cynthia Umwali', 'cynthia.umwali@alu.com', 'Computer Science');

-- UPDATE Statement
UPDATE Faculty SET department = 'Computer Science & AI' WHERE faculty_id = 1;

-- DELETE Statement
DELETE FROM Faculty WHERE email = 'cynthia.umwali@alu.com';

-- SELECT with WHERE
SELECT * FROM Faculty WHERE department = 'Computer Science';



-- MEMBER D(name): Courses table

-- MEMBER E(name): Extra_Curricular_Activities table + the two junction tables (Student_Courses, Student_Activities)


-- GROUP TASKS
