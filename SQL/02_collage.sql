CREATE TABLE students (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Ahmedabad'
);

INSERT INTO students (name, email, age)
VALUES
('Motu', 'motu@gmail.com', 20),
('Patlu', 'patlu@gmail.com', 21),
('Raju', 'raju@gmail.com', 22),
('Shyam', 'shyam@gmail.com', 19),
('Rohan', 'rohan@gmail.com', 23);

insert into student (name, email, ah)

SELECT * FROM students;


create table events (
	id serial primary key,
	event_name varchar(100),
	event_time timestamp
)

insert into events (event_name, event_time)
values
('Database Lecture', '2026-06-20 14:30:00'),
('Python Lecture', '2026-06-21 10:00:00'); 

select * from events;
select now();


CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    product VARCHAR(100),
    amount NUMERIC(10,2),
    order_date TIMESTAMP
);

INSERT INTO orders (customer_name, product, amount, order_date)
VALUES
('Motu', 'Laptop', 65000, '2026-06-15 10:30:00'),
('Patlu', 'Mouse', 1200, '2026-06-16 14:45:00'),
('Raju', 'Keyboard', 2500, '2026-06-18 09:15:00'),
('Shyam', 'Monitor', 15000, '2026-06-20 16:30:00'),
('Motu', 'Headphones', 3500, '2026-06-21 11:20:00'),
('Patlu', 'Webcam', 4500, '2026-06-22 18:10:00'),
('Raju', 'Laptop Stand', 2200, '2026-06-24 13:00:00'),
('Shyam', 'Printer', 12000, '2026-06-25 15:45:00'),
('Motu', 'USB Cable', 500, '2026-06-27 10:10:00'),
('Raju', 'Tablet', 28000, '2025-06-30 19:30:00');


SELECT * FROM orders;


select now();
select current_timestamp, now();
select extract(year from order_date) as "Year" from orders;
select extract(month from order_date) as "Month" from orders;
select extract(day from order_date) as "Day" from orders;
select extract(hour from order_date) as "Hour" from orders;
select customer_name, extract(month from order_date) as "Order Month" from orders;
select * from orders 
where order_date >= '2026-06-25';
select * from orders
where order_date <= '2026-06-25';
select * from orders
where order_date >= '2026-06-18' and order_date <= '2026-06-25';
select * from orders
where order_date = 
