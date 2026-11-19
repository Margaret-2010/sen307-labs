-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: Inioluwa MAargaret Salako Matric: VUG/SEN/24/12766
-- ============================================
USE sen307_vug_sen_24_12766;
-- Task 1: Students in one department, sorted A-Z
-- Explanation: Retreieves all students in Software Engineering and sorts them alphabetically by their full names.
SELECT s.*
FROM Student s
INNER JOIN Department d
ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;


-- Task 2: Courses with their lecturers (INNER JOIN)
-- Explanation: Displays each course alongside the lecturer teaching it by joining three tables.
SELECT C.course_title, l.full_name
FROM Course c
INNER JOIN CourseAllocation ca
ON c.course_id = ca.course_id
INNER JOIN Lecturer l
ON ca.lecturer_id = l.lecturer_id;


-- Task 3: Students and their courses (LEFT JOIN)
-- Explanation: Displays every student and their enrolled courses, including students without enrolments.
SELECT s.full_name, c.course_title 
FROM Student s
LEFT JOIN Enrolment e 
ON s.student_id = e.student_id
LEFT JOIN Course c
ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;


-- Task 4: Filtering with AND / OR / IN / BETWEEN
-- Explanation: Retrieves female students in either Software Engineering or Artificial Intelligence who were born between 2004 and 2005.
SELECT * 
FROM Student 
WHERE gender = 'F'
AND dept_id IN (1,3)
AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31';

-- Task 5: Paginating enrolments with LIMIT and OFFSET
-- Explanation: Displays the first 10 and next 10 elements
SELECT * FROM Enrolment ORDER BY enrolment_id ASC LIMIT 10 OFFSET 0;
SELECT * FROM Enrolment ORDER BY enrolment_id ASC LIMIT 10 OFFSET 10;


-- Optional Challenge: RIGHT JOIN
-- Explanation: Displays every student and their courses, including students without enrolments.

SELECT s.full_name, c.course_title
FROM Enrolment e
RIGHT JOIN Student s
ON e.student_id = s.student_id
LEFT JOIN Course c
ON e.course_id = c.course_id
ORDER BY s.full_name;

-- The LEFT JOIN version is easier to read because Student is the main table whose complete records we want to preserve.