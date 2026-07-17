-- ALU DATABASE SCHEMA - GROUP 28


-- ========== 1. CREATE DATABASE ==========
DROP DATABASE IF EXISTS group28_db;
CREATE DATABASE group28_db;
USE group28_db;


-- ========== 2. CREATE TABLES ==========

-- ---------- MEMBER A (Nina): Students ----------
CREATE TABLE Students (
    student_id      INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    email           VARCHAR(100) UNIQUE NOT NULL,
    classroom_id    INT          NOT NULL,
    enrollment_date DATE         NOT NULL,
    CONSTRAINT fk_students_classroom
        FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- ---------- MEMBER B (Cynthia): Classroom ----------
CREATE TABLE Classroom (
    classroom_id  INT PRIMARY KEY AUTO_INCREMENT,
    room_number   VARCHAR(10) NOT NULL,
    building      VARCHAR(50) NOT NULL,
    capacity      INT NOT NULL
);

-- ---------- MEMBER C (Carrick): Faculty ----------
CREATE TABLE Faculty (
    faculty_id  INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(100) NOT NULL,
    department  VARCHAR(50)
);

-- ---------- MEMBER D (Aubin): Courses ----------
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

-- ---------- MEMBER E (Chlomi): Extra_Curricular_Activities ----------
CREATE TABLE Extra_Curricular_Activities (
    activity_id         INT PRIMARY KEY AUTO_INCREMENT,
    activity_name       VARCHAR(100),
    category            VARCHAR(50),
    faculty_advisor_id  INT,
    FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);

-- ---------- MEMBER E (David-Harold): Junction tables - Student_Courses + Student_Activities ----------
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


-- ========== 3. INSERT STATEMENTS ==========

-- ---------- MEMBER B (Cynthia): Classroom ----------
INSERT INTO Classroom (room_number, building, capacity) VALUES
    ('115', 'Entrepreneurship Room', 60),
    ('116', 'Intl. Business & Trade Room', 90),
    ('117', 'Political Studies Room', 50),
    ('118', 'Science Lab Room', 100),
    ('119', 'Theathre Studies Room', 150),
    ('120', 'FabLab Room', 30);

-- ---------- MEMBER C (Carrick): Faculty ----------
INSERT INTO Faculty (name, email, department)
VALUES
    ('Chlomi Justifié',  'chlomi.justifié@alu.com',  'Computer Science'),
    ('Isimbi Nina', 'isimbi.nina@alu.com', 'Mathematics'),
    ('Chance Aubin',  'chance.aubin@alu.com', 'English'),
    ('David-Harold',  'david.harold@alu.com',  'Physics'),
    ('Cynthia Umwali', 'cynthia.umwali@alu.com', 'Computer Science');

-- ---------- MEMBER A (Nina): Students ----------
INSERT INTO Students (name, email, classroom_id, enrollment_date) VALUES
('Shyaka Carrick',   'shyaka.carrick@alustudent.com',   1, '2024-09-01'),
('Isimbi Henriette', 'isimbi.henriette@alustudent.com', 5, '2024-09-01'),
('Ishimwe David',    'i.david@alustudent.com',          1, '2024-09-01'),
('Umwali Sarah',     'umwali.sarah@alustudent.com',     3, '2024-09-01'),
('Uwase Aline',      'uwase.aline@alustudent.com',      2, '2024-09-01');

-- ---------- MEMBER D (Aubin): Courses ----------
INSERT INTO Courses (course_name, credits, faculty_id, classroom_id) VALUES
    ('Intro to Programming', 4, 1, 2),
    ('Self Leadership', 3, 2, 5),
    ('Intro to Linux', 3, 3, 2),
    ('Learning Process', 4, 4, 6),
    ('Data Structures', 4, 4, 6);

-- ---------- MEMBER E (Chlomi): Extra_Curricular_Activities ----------
INSERT INTO Extra_Curricular_Activities (activity_name, category, faculty_advisor_id) VALUES
    ('Coding', 'Tech', 1),
    ('Singing', 'Music', 2),
    ('Robotics', 'Tech', 1),
    ('Debate', 'Language', 3),
    ('Spelling', 'Language', 3);

-- ---------- MEMBER E (David-Harold): Junction tables ----------
INSERT INTO Student_Courses (student_id, course_id, enrollment_date) VALUES
    (1, 1, '2024-09-02'),
    (1, 3, '2024-09-02'),
    (2, 2, '2024-09-03'),
    (3, 1, '2024-09-02'),
    (3, 5, '2024-09-04'),
    (4, 2, '2024-09-03');

INSERT INTO Student_Activities (student_id, activity_id, join_date) VALUES
    (1, 1, '2024-09-10'),
    (1, 4, '2024-09-11'),
    (2, 3, '2024-09-10'),
    (3, 1, '2024-09-12'),
    (4, 5, '2024-09-12');


-- ========== 4. INDIVIDUAL UPDATE / DELETE / SELECT ==========

-- ---------- MEMBER A (Nina): Students ----------
UPDATE Students SET classroom_id = 6 WHERE student_id = 3;
DELETE FROM Students WHERE student_id = 5;
SELECT * FROM Students WHERE enrollment_date = '2024-09-01';

-- ---------- MEMBER B (Cynthia): Classroom ----------
UPDATE Classroom SET capacity = 80 WHERE room_number = '120';
DELETE FROM Classroom WHERE room_number = '118';
SELECT * FROM Classroom WHERE capacity > 60;

-- ---------- MEMBER C (Carrick): Faculty ----------
UPDATE Faculty SET department = 'Computer Science & AI' WHERE faculty_id = 1;
DELETE FROM Faculty WHERE email = 'cynthia.umwali@alu.com';
SELECT * FROM Faculty WHERE department = 'Computer Science';

-- ---------- MEMBER D (Aubin): Courses ----------
UPDATE Courses SET credits = 5 WHERE course_name = 'Data Structures';
DELETE FROM Courses WHERE course_name = 'Learning Process';
SELECT * FROM Courses WHERE credits >= 4;

-- ---------- MEMBER E (Chlomi): Extra_Curricular_Activities ----------
UPDATE Extra_Curricular_Activities SET activity_name = 'Programming' WHERE activity_name='Coding';
DELETE FROM Extra_Curricular_Activities WHERE activity_name = 'Singing';
SELECT * FROM Extra_Curricular_Activities WHERE category = 'Language';

-- ---------- MEMBER E (David-Harold): Junction tables ----------
-- Move student 2 from Robotics (3) to Debate (4)
UPDATE Student_Activities SET activity_id = 4 WHERE student_id = 2 AND activity_id = 3;

-- Student 3 drops Data Structures
DELETE FROM Student_Courses WHERE student_id = 3 AND course_id = 5;

SELECT * FROM Student_Courses WHERE student_id = 1;


-- ========== 5. GROUP TASKS: JOIN QUERIES + AGGREGATE ==========

-- JOIN 1: "Student X is enrolled in Course Y, taught by Faculty Z, in Classroom W."
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

-- JOIN 3 : "Faculty X teaches Course Y worth Z credits in Building W."
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


-- ---------- NORMALIZATION CHECK (group answer) ----------
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
