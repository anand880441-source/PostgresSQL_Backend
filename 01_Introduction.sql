select current_database();

create table students (
	id int primary key,
	name varchar(100),
	age int,
	city varchar(100)
)

insert into students (id, name, age, city) values 
(1, 'Liam Smith', 20, 'New York'),
(2, 'Olivia Johnson', 22, 'Los Angeles'),
(3, 'Noah Williams', 19, 'Chicago'),
(4, 'Emma Brown', 21, 'Houston'),
(5, 'Oliver Jones', 23, 'Phoenix'),
(6, 'Ava Garcia', 20, 'Philadelphia'),
(7, 'Elijah Miller', 22, 'San Antonio'),
(8, 'Charlotte Davis', 19, 'San Diego'),
(9, 'William Rodriguez', 21, 'Dallas'),
(10, 'Sophia Martinez', 20, 'San Jose');

drop table students;
truncate table students;

update students set name = 'Anand'
where id = 1;

delete from students
where id = 10;

select * from students;



CREATE TABLE users (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

INSERT INTO users (name, email)
VALUES ('Motu', 'motu@gmail.com');

SELECT * FROM users;


create database college;
