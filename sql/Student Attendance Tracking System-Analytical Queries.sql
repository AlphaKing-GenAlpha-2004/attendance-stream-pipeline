USE attendance_tracking_system;
#Total Record Check of Students
SELECT COUNT(*) AS total_students FROM students;
#Total Record Check of Faculties
SELECT COUNT(*) AS total_faculties FROM faculty;
#Total Record Check of Student-Course Mappings
SELECT COUNT(*) AS total_mappings FROM student_course_map;
#Total Record Check of Attendance
SELECT COUNT(*) AS total_attendance FROM attendance;
#Attendance Percentage per Student
SELECT 
    s.student_id,
    s.full_name,
    ROUND(
        COUNT(CASE WHEN a.status = 'Present' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS attendance_percentage
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
GROUP BY s.student_id, s.full_name
ORDER BY attendance_percentage DESC;
#Students with Low Attendance(<75%) along with their Courses
SELECT *
FROM (
    SELECT 
        s.student_id,
        s.full_name,
        c.course_name,
        ROUND(
            COUNT(CASE WHEN a.status = 'Present' THEN 1 END) * 100.0 / COUNT(*),
            2
        ) AS attendance_percentage
    FROM Attendance a
    JOIN Students s ON a.student_id = s.student_id
    JOIN Courses c ON a.course_id = c.course_id
    GROUP BY s.student_id, s.full_name, c.course_name
) t
WHERE attendance_percentage < 75
ORDER BY attendance_percentage ASC;
#Top 10 Student with Attendance
SELECT 
    s.student_id,
    s.full_name,
    ROUND(
        COUNT(CASE WHEN a.status = 'Present' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS attendance_percentage
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
GROUP BY s.student_id, s.full_name
ORDER BY attendance_percentage DESC
LIMIT 10;
#Course-Wise Attendance Percentage
SELECT 
    c.course_name,
    ROUND(
        COUNT(CASE WHEN a.status = 'Present' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS attendance_percentage
FROM Attendance a
JOIN Courses c ON a.course_id = c.course_id
GROUP BY c.course_name
ORDER BY attendance_percentage DESC;
#Daily Attendance Trend
SELECT 
    attendance_date,
    COUNT(*) AS total_records,
    COUNT(CASE WHEN status = 'Present' THEN 1 END) AS present_count,
    COUNT(CASE WHEN status = 'Absent' THEN 1 END) AS absent_count
FROM Attendance
GROUP BY attendance_date
ORDER BY attendance_date;
#Student-Wise Course Count
SELECT 
    student_id,
    COUNT(course_id) AS total_courses
FROM Student_Course_Map
GROUP BY student_id
ORDER BY total_courses DESC;
#Attendance Per Course Per Student
SELECT 
    s.full_name,
    c.course_name,
    COUNT(CASE WHEN a.status = 'Present' THEN 1 END) AS present_days,
    COUNT(*) AS total_days
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
JOIN Courses c ON a.course_id = c.course_id
GROUP BY s.full_name, c.course_name;
#Average Attendance Across System
SELECT 
    ROUND(
        COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS overall_attendance_percentage
FROM Attendance;
#Students with Perfect Attendence (=100%)
SELECT 
    s.student_id,
    s.full_name
FROM Attendance a
JOIN Students s ON a.student_id = s.student_id
GROUP BY s.student_id, s.full_name
HAVING COUNT(CASE WHEN a.status = 'Absent' THEN 1 END) = 0;