-- ALU DATABASE SCHEMA - GROUP 28

DROP DATABASE IF EXISTS group28_db;
CREATE DATABASE group28_db;
USE group28_db;



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

-- MEMBER A(Nina): Students table
-- Table Creation
CREATE TABLE Students (
    student_id      INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    email           VARCHAR(100) UNIQUE NOT NULL,
    classroom_id    INT          NOT NULL,
    enrollment_date DATE         NOT NULL,
    CONSTRAINT fk_students_classroom
        FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- Adding Sample Rows
INSERT INTO Students (name, email, classroom_id, enrollment_date) VALUES
('Shyaka Carrick',   'shyaka.carrick@alustudent.com',   1, '2024-09-01'),
('Isimbi Henriette', 'isimbi.henriette@alustudent.com', 5, '2024-09-01'),
('Ishimwe David',    'i.david@alustudent.com',          1, '2024-09-01'),
('Umwali Sarah',     'umwali.sarah@alustudent.com',     3, '2024-09-01'),
('Uwase Aline',      'uwase.aline@alustudent.com',      2, '2024-09-01');

-- UPDATE Statement
UPDATE Students SET classroom_id = 6 WHERE student_id = 3;

-- DELETE Statement
DELETE FROM Students WHERE student_id = 5;

-- SELECT with WHERE
SELECT * FROM Students WHERE enrollment_date = '2024-09-01';



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

-- Table Creation:

CREATE TABLE Courses (
	course_id     INT PRIMARY KEY AUTO_INCREMENT,
    	course_name   VARCHAR(100) NOT NULL,
    	credits       INT NOT NULL,
    	faculty_id    INT NOT NULL,
    	classroom_id  INT NOT NULL,
	CONSTRAINT fk_courses_faculty
	    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
	CONSTRAINT fk_courses_classroom
	    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- Inserting Values

INSERT INTO Courses (course_name, credits, faculty_id, classroom_id) VALUES
   ('Intro to Programming', 4, 1, 2),
   ('Self Leadership', 3, 2, 5),
   ('Intro to Linux', 3, 3, 2),
   ('Learning Process', 4, 4, 6),
   ('Data Structures', 4, 4, 6);

-- UPDATE Statement: Aubin
UPDATE Courses SET credits = 5 WHERE course_name = 'Data Structures';

-- DELETE Statement: Aubin
DELETE FROM Courses WHERE course_name = 'Learning Process';

-- SELECT with WHERE: Aubin
SELECT * FROM Courses WHERE credits >= 4;
		
-- MEMBER E(name): Extra_Curricular_Activities table + the two junction tables (Student_Courses, Student_Activities)

-- TABLE CREATION
CREATE TABLE Extra_Curricular_Activities(
	activity_id INT PRIMARY KEY,
	activity_name VARCHAR(100),
	category VARCHAR(50),
	faculty_advisor_id INT,
	FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);

-- INSERTING VALUES
INSERT INTO Extra_Curricular_Activities (activity_name, category, faculty_advisor_id) VALUES
	('Coding', 'Tech', 1),
	('Singing', 'Music', 2),
	('Robotics' 'Tech', 1),
	('Debate', 'Language', 3),
	('Spelling', 'Language', 3),
);

-- UPDATE STATEMENT:
UPDATE Extra_Curricular_Activities SET(activity_name="Programming") WHERE activity_name="Coding";

-- DELETE STATEMENT:
DELETE Extra_Curricular_Activities WHERE activity_name="Singing";

-- SELECT STATEMENT:
SELECT * FROM Extra_Curricular_Activities WHERE category="Language";

-- GROUP TASKS
