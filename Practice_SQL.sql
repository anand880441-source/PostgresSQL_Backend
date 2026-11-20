CREATE TABLE Students(
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    admission_year INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students (student_id, name, department, city, admission_year) VALUES
(1, 'Aarav Sharma', 'Computer Science', 'Ahmedabad', 2023),
(2, 'Diya Patel', 'Information Technology', 'Surat', 2023),
(3, 'Rohan Verma', 'Electronics', 'Vadodara', 2022),
(4, 'Priya Mehta', 'Mechanical', 'Rajkot', 2024),
(5, 'Kabir Shah', 'Computer Science', 'Ahmedabad', 2022),
(6, 'Ananya Joshi', 'Civil', 'Gandhinagar', 2023),
(7, 'Vikram Singh', 'Information Technology', 'Bhavnagar', 2024),
(8, 'Neha Gupta', 'Electronics', 'Jamnagar', 2022),
(9, 'Rahul Nair', 'Mechanical', 'Anand', 2024),
(10, 'Pooja Desai', 'Computer Science', 'Surat', 2023);

INSERT INTO Courses (course_id, course_name, credits) VALUES
(101, 'Data Structures and Algorithms', 4),
(102, 'Database Management Systems', 3),
(103, 'Operating Systems', 4),
(104, 'Computer Networks', 3),
(105, 'Digital Electronics', 3),
(106, 'Engineering Mechanics', 4),
(107, 'Fluid Mechanics', 3),
(108, 'Software Engineering', 3),
(109, 'Web Development', 2),
(110, 'Artificial Intelligence', 4);


INSERT INTO Enrollments (enrollment_id, student_id, course_id, marks, enrollment_date) VALUES
(1001, 1, 101, 88, '2023-08-10'),
(1002, 1, 102, 92, '2023-08-12'),
(1003, 2, 101, 75, '2023-08-10'),
(1004, 3, 105, 81, '2022-08-15'),
(1005, 4, 106, 68, '2024-08-05'),
(1006, 5, 103, 95, '2022-08-16'),
(1007, 6, 107, 79, '2023-08-11'),
(1008, 7, 102, 85, '2024-08-06'),
(1009, 8, 105, 90, '2022-08-15'),
(1010, 9, 108, 77, '2024-08-07');


select * from Students;
select * from courses;
select * from enrollments;

-- 1  
select name from students;
-- 2
select name, department from students 
where department = 'Computer Science';
-- 3
select name, city from students
where city = 'Ahmedabad';
-- 4
select * from courses
where credits > 3;
-- 5
select * from students
where admission_year = '2024';
-- 6
select * from enrollments
where marks > 70;
-- 7
select max(marks) as Maximum_Marks from enrollments;
-- 8
select min(marks) as Minimum_Marks from enrollments;
-- 9
select avg(marks) as Avg_Marks from enrollments;
-- 10
select count(*) as Total_Students from students;
-- 11
select count(*) as Total_Courses from courses;
-- 12
select department, count(*) as Total_Students from students
group by department;
-- 13
select c.course_name, avg(e.marks) from courses c left join enrollments e on c.course_id = e.course_id
group by c.course_name;
-- 14
select c.course_name, count(e.student_id) as Total_Students from enrollments e right join courses c on e.course_id = c.course_id
group by c.course_name;
-- 15 
select s.name, e.marks from students s left join enrollments e on s.student_id = e.student_id
where e.marks >= 60 and e.marks <= 80; 
-- 16 
select s.name, c.course_name, e.marks from students s join enrollments e on s.student_id = e.student_id join courses c on c.course_id = e.course_id;
-- 17
select s.name, e.marks from students s left join enrollments e on s.student_id = e.student_id 
where e.marks > 80;
-- 18
select s.name, e.marks, c.course_name from students s join enrollments e on s.student_id = e.student_id join courses c on c.course_id = e.course_id 
where e.marks < 40;
-- 19
select s.student_id, s.name from enrollments e join students s on e.student_id = s.student_id
group by s.student_id, s.name
having count(e.course_id) > 2;
-- 20
select c.course_name, count(e.student_id) as total_enrolled from enrollments e join courses c on c.course_id = e.course_id 
group by c.course_id, c.course_name 
having count(e.student_id) > 3;
-- 21 
select max(e.marks), c.course_name from enrollments e join courses c on c.course_id = e.course_id 
group by c.course_name;
-- 22
select min(e.marks), c.course_name from enrollments e join courses c on c.course_id = e.course_id 
group by c.course_name;
-- 23
select avg(e.marks), s.name from enrollments e join students s on s.student_id = e.student_id 
group by s.name;
-- 24
select avg(e.marks), s.name from enrollments e join students s on s.student_id = e.student_id 
group by s.name
having avg(e.marks) > 70;
-- 25
select s.name, c.course_name as course, e.marks from enrollments e 
join students s on s.student_id = e.student_id 
join courses c on c.course_id = e.course_id 
where e.marks > 80 ;
-- 26
select s.name, sum(e.marks) as total_marks from enrollments e join students s on s.student_id = e.student_id 
group by s.name;
-- 27
select department, count(student_id) as NumberOfStudents from students
group by department
order by NumberOfStudents desc
limit 1;
-- 28
select c.course_name, count(e.enrollment_id) as NumberOfEnroll from courses c join enrollments e on c.course_id = e.course_id
group by c.course_name
order by NumberOfEnroll desc
limit 1;
-- 29
select s.name, count(e.enrollment_id) as NumberOfEnroll from students s left join enrollments e on s.student_id = e.student_id
group by s.name
having NumberOfEnroll = 0;
-- 30
select s.name as "Student Name", c.course_name as "Course Name", e.marks as "Marks",
case 
	when e.marks >= 40 then 'Pass'
	else 'Fail'
end as "Result" from enrollments e
join Students s on e.student_id = s.student_id
join Courses c on e.course_id = c.course_id;
-- 31
select