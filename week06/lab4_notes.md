At first i didn't come across any error. The department deleted succesfully, then i changed a few lines in the code.

SET SQL_SAFE_UPDATES = 0;
UPDATE Student 
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science')
WHERE matric_no = '20239999';
SET SQL_SAFE_UPDATES = 1;

After adding these lines, the error finally popped up.
MySQL threw Error 1451 (Cannot delete or update a parent row: a foreign key constraint fails) because referential integrity prevents deleting a department (Library and Information Science) while a record in the Student table (Transfer Student) still references its dept_id.

To fix it properly without losing the student record, I first updated the student's dept_id to reassign them to Software Engineering, which allowed the DELETE statement on Library and Information Science to succeed. Alternatively, this could have been resolved by deleting the dependent student record from the Student table first before deleting the department, setting the student's dept_id to NULL (if nullable), or defining the foreign key constraint with ON DELETE CASCADE or ON DELETE SET NULL.