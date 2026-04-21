#Total Classes Attended by Student
SELECT student_id, COUNT(*) AS total_classes
FROM attendance
GROUP BY student_id;
#Present and Absent Count per Student
SELECT 
    student_id,
    SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) AS present_count,
    SUM(CASE WHEN status = 'Absent' THEN 1 ELSE 0 END) AS absent_count
FROM attendance
GROUP BY student_id;
#Attendance% per Student
SELECT 
    student_id,
    ROUND(
        SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attendance_percentage
FROM attendance
GROUP BY student_id;
#Student+Course+Attendance
SELECT 
    s.full_name,
    c.course_name,
    a.attendance_date,
    a.status
FROM attendance a
JOIN students s ON a.student_id = s.student_id
JOIN courses c ON a.course_id = c.course_id;
#Students enrolled in each course
SELECT 
    c.course_name,
    COUNT(scm.student_id) AS total_students
FROM student_course_map scm
JOIN courses c ON scm.course_id = c.course_id
GROUP BY c.course_name;

