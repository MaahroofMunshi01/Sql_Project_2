# SQL Project 2: Data Digger 🔍

## 📌 Project Overview
Data Digger is a SQL-based project developed using MySQL to practice and demonstrate SQL queries on customer, order, and employee databases.

This project covers various SQL concepts, including joins, subqueries, date functions, string functions, window functions, ranking, running totals, discount calculations, and salary categorization.

## 🎯 Project Objectives
- Retrieve and analyze customer and order information.
- Combine data from multiple tables using SQL joins.
- Use subqueries to retrieve records based on average values.
- Perform date calculations and formatting.
- Manipulate strings using built-in SQL functions.
- Calculate running totals and rank orders.
- Apply discounts based on order amounts.
- Categorize employee salaries using conditional statements.

## 🗄️ Database Structure

**Database Name:** `pr_2`

The project contains three tables:

### 1. Customers — `tbl_customers`
Stores customer information.

| Column | Description |
|---|---|
| `cust_id` | Customer ID (Primary Key) |
| `first_name` | Customer's first name |
| `last_name` | Customer's last name |
| `email_id` | Customer's email address |
| `reg_date` | Customer registration date |

### 2. Orders — `tbl_orders`
Stores order information.

| Column | Description |
|---|---|
| `order_id` | Order ID (Primary Key) |
| `cust_id` | Customer ID (Foreign Key) |
| `order_date` | Order date |
| `total_amt` | Total order amount |

### 3. Employees — `tbl_employees`
Stores employee information.

| Column | Description |
|---|---|
| `emp_id` | Employee ID (Primary Key) |
| `first_name` | Employee's first name |
| `last_name` | Employee's last name |
| `department` | Employee's department |
| `hire_date` | Employee's hiring date |
| `salary` | Employee's salary |

## 🛠️ SQL Concepts Covered

### 1. SQL Joins
- **INNER JOIN:** Retrieves matching customer and order records.
- **LEFT JOIN:** Retrieves all customers and their matching orders.
- **RIGHT JOIN:** Retrieves all orders and their matching customer records.
- **FULL OUTER JOIN Simulation:** Combines left and right join results using `UNION`.

### 2. Subqueries
- Finds customers whose order amounts are greater than the average order amount.
- Finds employees whose salaries are greater than the average salary.

### 3. Date Functions
- `YEAR()` — Extracts the year from a date.
- `MONTH()` — Extracts the month from a date.
- `DATEDIFF()` — Calculates the difference between two dates.
- `DATE_FORMAT()` — Formats dates into a readable format.

### 4. String Functions
- `CONCAT()` — Combines first and last names.
- `REPLACE()` — Replaces part of a string.
- `UPPER()` — Converts text to uppercase.
- `LOWER()` — Converts text to lowercase.
- `TRIM()` — Removes leading and trailing spaces.

### 5. Window Functions
- `SUM() OVER()` — Calculates a running total of order amounts.
- `RANK() OVER()` — Ranks orders based on their total amounts, with the highest amount receiving rank 1.

### 6. Conditional Logic Using CASE

**Discount Calculation:**

| Order Amount | Discount |
|---|---:|
| ₹1,000 or more | 10% |
| ₹500 to below ₹1,000 | 5% |
| Below ₹500 | 0% |

**Employee Salary Categorization:**

| Salary | Category |
|---|---|
| Above ₹60,000 | High |
| ₹55,000 to ₹60,000 | Medium |
| Below ₹55,000 | Low |

## 💡 Sample SQL Queries

### Rank Orders by Total Amount

```sql
SELECT
    order_id,
    total_amt,
    RANK() OVER (ORDER BY total_amt DESC) AS order_rank
FROM tbl_orders;
```

### Calculate Discounts Based on Order Amount

```sql
SELECT
    order_id,
    total_amt,
    CASE
        WHEN total_amt >= 1000 THEN total_amt * 0.10
        WHEN total_amt >= 500 THEN total_amt * 0.05
        ELSE 0
    END AS discount
FROM tbl_orders;
```

### Calculate Running Total

```sql
SELECT
    order_id,
    cust_id,
    order_date,
    total_amt,
    SUM(total_amt) OVER (ORDER BY order_date) AS run_total
FROM tbl_orders;
```

### Categorize Employee Salaries

```sql
SELECT
    emp_id,
    CONCAT(first_name, ' ', last_name) AS emp_name,
    salary,
    CASE
        WHEN salary > 60000 THEN 'High'
        WHEN salary >= 55000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM tbl_employees;
```

## 💻 Technologies Used
- **Database:** MySQL
- **Tool:** MySQL Workbench
- **Language:** SQL

## 📚 Key Learnings
- Understanding primary keys and foreign keys.
- Retrieving related data using different types of joins.
- Writing subqueries for data analysis.
- Working with date and string functions.
- Using window functions for ranking and cumulative calculations.
- Applying business rules using `CASE` statements.
- Calculating discounts based on order values.

## 🚀 How to Run the Project
1. Install MySQL Server and MySQL Workbench.
2. Clone or download this repository.
3. Open `Project_2.sql` in MySQL Workbench.
4. Execute the SQL script to create the database, tables, and sample records.
5. Run the queries individually to explore the results.

## 👨‍💻 Author
**Maahroof Munshi**

Aspiring Data Analyst | MCA Student
