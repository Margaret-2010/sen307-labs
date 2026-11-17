USE sen307_vug_sen_24_12766;

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3, 'Relational database design, SQL queries, normalization, transactions and indexing using
MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3, 'Architectural styles, design patterns, microservices and how to structure large software
systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3, 'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,'Supervised and unsupervised learning, neural networks, deep learning and model
evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));
SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

select dept_id, dept_name FROM department;
select course_id, course_code from course;

INSERT INTO lecturer(staff_no, full_name, email, dept_id) values
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Dr Usoh Ikouwem', 'u.ikouwem@vua.edu.ng', 10),
('VUA/ST/104', 'Dr Victoria Ike', 'v.ike@vua.edu.ng', 10),
('VUA/ST/105', 'Dr Sonia Ahmad', 's.ahmad@vua.edu.ng', 9),
('VUA/ST/106', 'Dr Jerry Emmanuel', 'j.emmanuel@vua.edu.ng', 9),
('VUA/ST/107', 'Dr Sylvia Benedict', 's.benedict@vua.edu.ng', 12),
('VUA/ST/108', 'Dr Jeff Hart', 'j.hart@vua.edu.ng', 12),
('VUA/ST/109', 'Dr Lamuel Linus', 'l.linus@vua.edu.ng', 11),
('VUA/ST/110', 'Dr Gideon okere', 'g.okere@vua.edu.ng', 11);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('VUG/SEN/24/12766', 'Inioluwa Margaret Salako', 'F', '2009-06-23', 1),
('20231234', 'Ada Obi', 'F', '2005-03-14', 1),
('20231235', 'John Musa', 'M', '2004-11-02', 1),
('20231236', 'Favour Munachi', 'F', '2003-11-02', 1),
('20231237', 'Paula Livinus', 'F', '2002-11-02', 1),
('20231238', 'Fiona Stanley', 'F', '2001-11-02', 12),
('20231239', 'Kevin Chukwuma', 'M', '2000-11-02', 12),
('20231240', 'Jeffrey Osita', 'M', '2006-11-02', 12),
('20231241', 'Henry Hart', 'M', '2007-11-02', 12),
('20231242', 'Charlotte Flair', 'F', '2008-11-02', 9),
('20231243', 'Kelvin Owens', 'M', '2009-11-02', 9),
('20231244', 'Sunday Benjamin', 'M', '2005-08-14', 9),
('20231245', 'Oliver Jackson', 'M', '2002-5-02', 9),
('20231246', 'Sylvie Emmanuel', 'F', '2004-8-02', 11),
('20231247', 'Muhammed Ajar', 'M', '2005-9-02', 11),
('20231248', 'Benson Boone', 'M', '2001-12-12', 11),
('20231249', 'Percy Jackson', 'M', '2004-10-02', 11),
('20231250', 'Jasper Dunlop', 'M', '2006-1-02', 10),
('20231251', 'Ndazibari Joshua', 'F', '2007-3-02', 10),
('20231252', 'Ray Manchester', 'M', '2008-5-02', 10),
('20231253', 'Prisca Njoku', 'F', '2009-4-02', 10);


SELECT student_id, matric_no, full_name FROM Student;
SELECT lecturer_id, full_name FROM Lecturer;

INSERT INTO Enrolment (student_id, course_id) VALUES
-- Software Engineering (dept_id = 1 | Courses: 1 = SEN307, 2 = SEN301)[cite: 1, 2]
(3, 1), (3, 2),
(4, 1), (4, 2),
(5, 1), (5, 2),
(6, 1), (6, 2),
-- (7, 1), (7, 2),

-- Cybersecurity (dept_id = 12 | Course: 10 = CYB301)[cite: 1, 2]
(8, 10),
(9, 10),
(10, 10),
-- (11, 10),

-- Computer Science (dept_id = 9 | Courses: 3 = COS301, 4 = COS305)[cite: 1, 2]
(12, 3), (12, 4),
(13, 3), (13, 4),
(14, 3), (14, 4),
(15, 3), (15, 4),

-- Data Science (dept_id = 11 | Courses: 8 = DTS301, 9 = DTS305)[cite: 1, 2]
(16, 8), (16, 9),
(17, 8), (17, 9),
(18, 8), (18, 9),
(19, 8), (19, 9),

-- Artificial Intelligence (dept_id = 10 | Courses: 5 = AIN301, 6 = AIN305, 7 = AIN307)[cite: 1, 2]
(20, 5), (20, 6), (20, 7),
(21, 5), (21, 6), (21, 7),
(22, 5), (22, 6),(23, 5),
(23, 7), (12, 1), (16, 1);


INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
-- Software Engineering (dept_id = 1 | Lecturers: 1, 2 | Courses: 1, 2)
(1, 1),
(1, 2),
(2, 2),

-- Computer Science (dept_id = 9 | Lecturers: 5, 6 | Courses: 3, 4)[cite: 1, 2, 4]
(3, 5),
(4, 6),

-- Artificial Intelligence (dept_id = 10 | Lecturers: 3, 4 | Courses: 5, 6, 7)[cite: 1, 2, 4]
(5, 3),
(6, 4),
(7, 3),

-- Data Science (dept_id = 11 | Lecturers: 9, 10 | Courses: 8, 9)[cite: 1, 2, 4]
(8, 9),
(9, 10),

-- Cybersecurity (dept_id = 12 | Lecturers: 7, 8 | Course: 10)[cite: 1, 2, 4]
(10, 7);
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';
SET SQL_SAFE_UPDATES = 0;
UPDATE Student SET dept_id = 9 WHERE matric_no = '20231234';
SET SQL_SAFE_UPDATES = 1;
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';

INSERT INTO Department(dept_name) VALUES ('Library and Information Science');

-- INSERT INTO Student(matric_no, full_name, dept_id) VALUES
-- ('20239999', 'Transfer Student',
-- (SELECT dept_id FROM Department WHERE dept_name = 'Library and Information
-- Science'));

SET SQL_SAFE_UPDATES = 0;
UPDATE Student 
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science')
WHERE matric_no = '20239999';
SET SQL_SAFE_UPDATES = 1;

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20239999';

DELETE FROM Department WHERE dept_name = 'Library and Information Science';

UPDATE Student
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';

DELETE FROM Department WHERE dept_name = 'Library and Information Science';
SELECT * FROM Department;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;