#Top 10 Students by Attendance %
SELECT 
    s.full_name,
    ROUND(
        SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attendance_percentage
FROM attendance a
JOIN students s ON a.student_id = s.student_id
GROUP BY s.full_name
ORDER BY attendance_percentage DESC
LIMIT 10;
#Students with Attendance <75%
SELECT *
FROM (
    SELECT 
        s.full_name,
        ROUND(
            SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS attendance_percentage
    FROM attendance a
    JOIN students s ON a.student_id = s.student_id
    GROUP BY s.full_name
) AS sub
WHERE attendance_percentage < 75;
#Course-Wise Attendance%
SELECT 
    c.course_name,
    ROUND(
        SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attendance_percentage
FROM attendance a
JOIN courses c ON a.course_id = c.course_id
GROUP BY c.course_name;
#Daily Attendance Trend
SELECT 
    attendance_date,
    COUNT(*) AS total_classes,
    SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) AS present,
    SUM(CASE WHEN status = 'Absent' THEN 1 ELSE 0 END) AS absent
FROM attendance
GROUP BY attendance_date
ORDER BY attendance_date;
#Rank Students with Window Function
SELECT
    s.full_name,
    ROUND(
        SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attendance_percentage,
    
    RANK() OVER (
        ORDER BY 
        SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) DESC
    ) AS student_rank
FROM attendance a
JOIN students s ON a.student_id = s.student_id
GROUP BY s.full_name;
#Students with perfect attendance
SELECT s.full_name
FROM attendance a
JOIN students s ON a.student_id = s.student_id
GROUP BY s.full_name
HAVING COUNT(*) = SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END);
#Most absent students
SELECT 
    s.full_name,
    COUNT(*) AS absent_days
FROM attendance a
JOIN students s ON a.student_id = s.student_id
WHERE status = 'Absent'
GROUP BY s.full_name
ORDER BY absent_days DESC
LIMIT 10;
#Faculty-wise attendance percentage
SELECT 
    f.faculty_name,
    ROUND(
        SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attendance_percentage
FROM attendance a
JOIN courses c ON a.course_id = c.course_id
JOIN faculty f ON c.faculty_id = f.faculty_id
GROUP BY f.faculty_name;