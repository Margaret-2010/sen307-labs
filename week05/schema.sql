USE sen307_vug_sen_24_12766;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Lecturer (
    lectureR_id  INT PRIMARY KEY AUTO_INCREMENT,
    staff_no VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    matric_no VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('M','F'),
    date_of_birth DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    course_title VARCHAR(150) NOT NULL,
    credit_units TINYINT NOT NULL DEFAULT 3,
    description TEXT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Enrolment (
    enrolment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    academic_session VARCHAR(9) NOT NULL DEFAULT '2026/2027',
    semester ENUM('First','Second') NOT NULL DEFAULT 'First',
    enrolled_on DATE DEFAULT (CURRENT_DATE),
    UNIQUE (student_id, course_id, academic_session),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE CourseAllocation (
    allocation_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    lecturer_id INT NOT NULL,
    academic_session VARCHAR(9) NOT NULL DEFAULT '2026/2027',
    UNIQUE (course_id, lecturer_id, academic_session),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (lecturer_id) REFERENCES Lecturer(lecturer_id)
);

ALTER TABLE Student ADD COLUMN phone VARCHAR(15) AFTER full_name;
ALTER TABLE Course ADD CONSTRAINT chk_credit_units CHECK (credit_units BETWEEN 1 AND 6);

-- Test 1: NOT NULL (should fail: dept_name is required)
INSERT INTO Department (dept_name) VALUES (NULL);

-- Test 2: CHECK (should fail: credit_units must be 1 to 6)
INSERT INTO Course (course_code, course_title, credit_units) VALUES ('TST101', 'Test', 9);

-- Test 3: FOREIGN KEY (should fail: department 999 does not exist)
INSERT INTO Student (matric_no, full_name, dept_id) VALUES ('TEST001', 'Test', 999);

-- Test 4: ENUM (should fail: gender must be 'M' or 'F')
INSERT INTO Student (matric_no, full_name, gender) VALUES ('TEST002', 'Test', 'X');

-- Confirm every table is still empty
SELECT COUNT(*) FROM Department;
SELECT COUNT(*) FROM Course;
SELECT COUNT(*) FROM Student;

-- Test 5: UNIQUE (should fail: dept_name must be unique)
INSERT INTO Department (dept_name) VALUES ('Software Engineering');
INSERT INTO Department (dept_name) VALUES ('Software Engineering');

SHOW TABLES;
DESCRIBE Department;
DESCRIBE lecturer;
DESCRIBE Student;
DESCRIBE Course;
DESCRIBE Enrolment;
DESCRIBE CourseAllocation;
SHOW CREATE TABLE Enrolment;