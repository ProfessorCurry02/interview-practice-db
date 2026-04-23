# Interview Practice SQL Database

## Overview

This project simulates real-world SQL interview scenarios using a structured relational database.
It demonstrates core SQL concepts such as database design, data validation, stored procedures, and analytical querying.

The goal of this project is to showcase practical SQL skills relevant to data analyst and software engineering roles.

This particular database was created in the way that it was because my other one just isn't professional enough and doesn't translate well to the corporate space.

---

## Tools Used

* SQL Server (SSMS)
* T-SQL

---

## Database Structure

### Tables:

* **EMPLOYEE** – Stores employee details with constraints and validation rules
* **EMPLOYEE_LOGINS** – Tracks employee login activity for retention analysis

### Key Features:

* Primary and foreign key relationships
* Default values and constraints
* Data integrity enforcement using CHECK constraints

---

## Stored Procedures

* **sp_emp_id_info**
  Validates employee ID input and retrieves employee data with error handling

* **sp_employee_table**
  Filters employees dynamically by country

* **sp_employee_true_age**
  Calculates accurate employee age using date logic

* **sp_check_triangle**
  Determines triangle type using conditional logic (interview-style problem)

---

## SQL Concepts Demonstrated

* Window Functions (Running totals)
* Subqueries (Above-average salary analysis)
* Aggregations (Department-level metrics)
* Joins & Self-Joins (User retention analysis)
* Date Functions (Accurate age calculation)
* Input Validation & Control Flow (Stored procedures)

---

## Key Queries

* Running total of employee ages
* Employees earning above-average salary
* Employee count by department
* Day-over-day user retention rate
* True age calculation using date logic

---

## How to Run

1. Run `schema.sql` to create database and tables
2. Run `data.sql` to insert sample data
3. Run `queries.sql` to explore analytical queries
4. Run `procedures.sql` to test stored procedures

---

## Notes

Sample data is included to demonstrate functionality and query behavior.
The dataset is intentionally small for readability and ease of testing.

---

## Purpose

This project was built as part of SQL interview preparation and to demonstrate practical database and analytical skills.

---

## Author

**Bharath Shanmugasundaram**  
Bachelor of Information Technology  
Aspiring Data Analyst / Software Engineer  

-  Email: bharath.shanmugasundaram@gmail.com  
-  LinkedIn: www.linkedin.com/in/bharath-shanmugasundaram-47a590224
-  GitHub: 
