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
	activity_id INT PRIMARY KEY AUTO_INCREMENT,
	activity_name VARCHAR(100),
	category VARCHAR(50),
	faculty_advisor_id INT,
	FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);

-- INSERTING VALUES
INSERT INTO Extra_Curricular_Activities (activity_name, category, faculty_advisor_id) VALUES
	('Coding', 'Tech', 1),
	('Singing', 'Music', 2),
	('Robotics', 'Tech', 1),
	('Debate', 'Language', 3),
	('Spelling', 'Language', 3);

-- UPDATE STATEMENT:
UPDATE Extra_Curricular_Activities SET activity_name = 'Programming' WHERE activity_name='Coding';

-- DELETE STATEMENT:
DELETE FROM Extra_Curricular_Activities WHERE activity_name = 'Singing';

-- SELECT STATEMENT:
SELECT * FROM Extra_Curricular_Activities WHERE category = 'Language';
-- ============================================================
-- MEMBER E (David-Harold): Junction tables
-- Student_Courses + Student_Activities (many-to-many links)
-- ============================================================

-- TABLE CREATION: Student_Courses (links Students <-> Courses)
CREATE TABLE Student_Courses (
    student_id INT NOT NULL,
    course_id  INT NOT NULL,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    CONSTRAINT fk_sc_student
        FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT fk_sc_course
        FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- TABLE CREATION: Student_Activities (links Students <-> Extra_Curricular_Activities)
CREATE TABLE Student_Activities (
    student_id  INT NOT NULL,
    activity_id INT NOT NULL,
    join_date DATE,
    PRIMARY KEY (student_id, activity_id),
    CONSTRAINT fk_sa_student
        FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT fk_sa_activity
        FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);

-- INSERTING VALUES: Student_Courses
-- (students 1-4 and courses 1,2,3,5 still exist after earlier DELETEs)
INSERT INTO Student_Courses (student_id, course_id, enrollment_date) VALUES
    (1, 1, '2024-09-02'),
    (1, 3, '2024-09-02'),
    (2, 2, '2024-09-03'),
    (3, 1, '2024-09-02'),
    (3, 5, '2024-09-04'),
    (4, 2, '2024-09-03');

-- INSERTING VALUES: Student_Activities
-- (activities 1,3,4,5 still exist after Singing is deleted)
INSERT INTO Student_Activities (student_id, activity_id, join_date) VALUES
    (1, 1, '2024-09-10'),
    (1, 4, '2024-09-11'),
    (2, 3, '2024-09-10'),
    (3, 1, '2024-09-12'),
    (4, 5, '2024-09-12');

-- UPDATE Statement: David-Harold
-- Move student 2 from Robotics (3) to Debate (4)
UPDATE Student_Activities SET activity_id = 4 WHERE student_id = 2 AND activity_id = 3;

-- DELETE Statement: David-Harold
-- Student 3 drops Data Structures
DELETE FROM Student_Courses WHERE student_id = 3 AND course_id = 5;

-- SELECT with WHERE: David-Harold
SELECT * FROM Student_Courses WHERE student_id = 1;


-- ============================================================
-- GROUP TASKS: Join queries + aggregate
-- ============================================================

-- JOIN 1 (David-Harold): "Student X is enrolled in Course Y, taught by Faculty Z, in Classroom W."
SELECT CONCAT(
    s.name, ' is enrolled in ', c.course_name,
    ', taught by ', f.name,
    ', in classroom ', cl.room_number, ' (', cl.building, ').'
) AS sentence
FROM Student_Courses sc
JOIN Students  s  ON sc.student_id  = s.student_id
JOIN Courses   c  ON sc.course_id   = c.course_id
JOIN Faculty   f  ON c.faculty_id   = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;

-- JOIN 2: "Student X participates in Activity Y, advised by Faculty Z."
SELECT CONCAT(
    s.name, ' participates in ', a.activity_name,
    ', advised by ', f.name, '.'
) AS sentence
FROM Student_Activities sa
JOIN Students s ON sa.student_id = s.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
JOIN Faculty  f ON a.faculty_advisor_id = f.faculty_id;

-- JOIN 3 (our choice): "Faculty X teaches Course Y worth Z credits in Building W."
SELECT CONCAT(
    f.name, ' teaches ', c.course_name,
    ' (', c.credits, ' credits) in the ', cl.building, '.'
) AS sentence
FROM Courses c
JOIN Faculty   f  ON c.faculty_id   = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;

-- AGGREGATE: number of students enrolled in each course
SELECT c.course_name, COUNT(sc.student_id) AS enrolled_students
FROM Courses c
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY c.course_name;

-- ============================================================
-- NORMALIZATION CHECK (group answer)
-- Our schema avoids repeated data: each fact lives in exactly one
-- table. Student, faculty, and classroom details are stored once and
-- referenced elsewhere by foreign key instead of being copied (e.g.
-- Courses stores faculty_id, not the teacher's name). The two junction
-- tables, Student_Courses and Student_Activities, correctly resolve
-- the many-to-many relationships: without them we would have to
-- repeat a student's row for every course or activity they take,
-- duplicating their name and email. With composite primary keys
-- (student_id + course_id / activity_id), each enrollment is recorded
-- exactly once, so the schema satisfies third normal form.
-- ============================================================
