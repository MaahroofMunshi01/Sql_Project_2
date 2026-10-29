create database pr_2;
use pr_2;

# Create table Customers 
create table tbl_customers(
cust_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
email_id varchar(100) unique not null,
reg_date date);

insert into tbl_customers (first_name,last_name,email_id,reg_date)
values('John','Doe','john.doe@email.com', '2022-03-15'),
('Jane','Smith','jane.smith@email.com','2021-11-02'),
('Michael','Brown','michael.brown@email.com','2023-01-10'),
('Emily','Davis','emily.davis@email.com','2023-05-22'),
('David','Wilson','david.wilson@email.com','2020-08-30'),
('Sarah','Connor','sarah.connor@email.com','2024-02-14');


# Create table Orders 
create table tbl_orders(
order_id int primary key auto_increment,
cust_id int,
order_date date,
total_amt int,
foreign key(cust_id)
references tbl_customers(cust_id));

insert into tbl_orders(cust_id,order_date,total_amt)
values
(1,'2023-07-01',150.50),
(2,'2023-07-03',200.75),
(1,'2023-08-15',1200.00),
(3,'2023-09-10',650.25),
(4,'2023-10-05',480.00),
(2,'2023-11-20',1500.00),
(1,'2024-01-12',300.00),
(5,'2024-02-18',950.75),
(3,'2024-03-25',2200.00),
(4,'2024-04-30',175.50),
(NULL,'2024-05-15',500.00);


# create table employees
create table tbl_employees(
emp_id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50),
department varchar(30),
hire_date date,
salary int);

insert into tbl_employees(first_name,last_name,department,hire_date,salary)
values('Mark','Johnson', 'Sales', '2020-01-15', 50000.00),
('Susan','Lee','HR','2021-03-20', 55000.00),
('Robert', 'Chen',    'IT',      '2019-06-01', 72000.00),
('Linda',  'Park',    'Finance', '2022-09-12', 48000.00),
('James',  'Miller',  'Sales',   '2023-02-28', 45000.00),
('Priya',  'Sharma',  'IT',      '2021-11-05', 68000.00);


# Q-1 INNER JOIN

select o.order_id,o.order_date,o.total_amt,c.cust_id,
c.first_name,c.last_name,c.email_id from tbl_orders o
inner join tbl_customers c on o.cust_id = c.cust_id
order by o.order_id;

# Q-2 LEFT JOIN

select c.first_name,c.last_name,c.email_id,c.reg_date,o.order_Date,o.total_amt
from tbl_customers c left join tbl_orders o on c.cust_id = o.cust_id;


# Q-3 Right Join
select c.first_name,c.last_name,c.email_id,c.reg_date,o.order_date,o.total_amt
from tbl_customers c right join tbl_orders o on c.cust_id = o.cust_id;


# Q-4  FULL Outer Join 

select c.first_name,c.last_name,c.email_id,c.reg_date,o.order_date,o.total_amt
from tbl_customers c 
left join tbl_orders o on c.cust_id=o.order_id

union

select c.first_name,c.last_name,c.email_id,c.reg_date,o.order_date,o.total_amt
from tbl_customers c
right join tbl_orders o on c.cust_id = o.cust_id;

# Q-5 subquery  to find customers who have order worth more than avg amount 

select c.first_name,c.last_name,c.email_id,c.reg_date from tbl_customers c 
inner join tbl_orders o on c.cust_id = o.cust_id 
where o.total_amt > (select avg(total_amt) from tbl_orders);

# Q-6 subquery to find employees salary more than avg salary

select first_name,last_name,department,hire_date,salary from tbl_employees 
where salary > (select avg(salary) from tbl_employees);

# Q-7 extract year & month from order date

select order_date ,
year(order_date) as order_year,
month(order_date) as order_month 
from tbl_orders;


# Q-8 :  Calculate difference between two dates (order date and curr date)

select order_date,datediff(curdate(),order_Date) as date_diff from tbl_orders;

# Q-9 : Format order to more readable format :

select order_date,date_format(order_date,"%d-%b-%y") as format_date from tbl_orders; # %b = short month name ex.jul/sep...

# Q-10 : Concate first name & last name to form a full name 
 
select concat(first_name," ",last_name) as full_name from tbl_customers;

# Q-11 : replace part of a string john with jonathon

select replace(first_name,"John","Jonathon") as replace_str from tbl_customers;

# Q-12: Convert first name to uppercase and last name to lower case

select upper(first_name),lower(last_name) from tbl_customers;

# Q-13 : Trim Extra Spaces from email

select trim(email_id) from tbl_customers;

# Q-14 : Caclulate running total of total amount for each order

select order_id,cust_id,order_date,total_amt,
sum(total_amt) over (order by order_date) as run_total
from tbl_orders;

# Q-15 :  Rank orders based on total amount using rank() function

select order_id,total_amt,rank() over (order by total_amt desc) as order_rank from tbl_orders;

# Q-16 : Assign a discount based on total amount in orders

select order_id,total_amt,
case
when total_amt >= 1000 	then total_amt * 0.10
when total_amt >= 500 then total_amt * 0.05
else 0
end as discount
from tbl_orders;

# Q-17 : Categorize employee salary as high med low
select emp_id,concat(first_name,"",last_name) as emp_name,salary,
case
when salary > 60000 then "High"
when salary >= 55000 then "Med"
else "low"
end as "Category"
from tbl_employees;