create table orders (
    o_id int primary key,
    o_name varchar(100),
    o_date date
);

create table customers (
    c_id int primary key,
    c_name varchar(100),
    o_id int,
    foreign key (o_id) references orders(o_id)
);


insert into orders (o_id, o_name, o_date) values
(501, 'laptop pro', '2026-10-01'),
(502, 'wireless mouse', '2026-10-02'),
(503, '4k monitor', '2026-10-02'),
(504, 'mechanical keyboard', '2026-10-03'),
(505, 'noise-canceling headphones', '2026-10-03'),
(506, 'usb-c hub', '2026-10-04'),
(507, 'ergonomic chair', '2026-10-04'),
(508, 'desk mat', '2026-10-05'),
(509, 'external ssd', '2026-10-05'),
(510, 'hdmi cable', '2026-10-05');


insert into customers (c_id, c_name, o_id) values
(1, 'aarav sharma', 501),
(2, 'diya patel', 502),
(3, 'vihaan verma', 503),
(5, 'kabir singh', 505),
(4, 'ananya reddy', 504),
(6, 'ishaan joshi', 506),
(7, 'meera nair', 507),
(8, 'arjun gupta', 508),
(9, 'sai kiran', 509),
(10, 'riya das', 510);


select * from orders;
select * from customers;


select * from orders
where extract(year from o_date) >= '2024';
