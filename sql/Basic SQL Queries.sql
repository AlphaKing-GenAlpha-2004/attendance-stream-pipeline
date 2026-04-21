USE attendance_tracking_system;
#View All Students
SELECT * FROM students;
#View all courses with faculty
SELECT c.course_name, f.faculty_name
FROM courses c
JOIN faculty f ON c.faculty_id = f.faculty_id;
#View Attendence Records
SELECT * FROM attendance;
#Total Students per Department
SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department;