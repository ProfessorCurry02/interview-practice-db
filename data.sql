USE [InterviewPracticeDB]
GO

INSERT INTO EMPLOYEE (Emp_Email, Country, City, Emp_Age, Salary, Emp_Fname, Emp_Lname, Emp_DOB, Emp_Join_Date, Department)
VALUES
('john.doe@email.com', 'USA', 'Dallas', 30, 60000, 'John', 'Doe', '1994-05-10', '2022-06-01', 'IT'),
('jane.smith@email.com', 'USA', 'Plano', 28, 55000, 'Jane', 'Smith', '1996-08-15', '2021-07-15', 'HR'),
('mike.brown@email.com', 'USA', 'Austin', 35, 70000, 'Mike', 'Brown', '1989-03-22', '2020-01-10', 'Finance');
GO

--User Retention Query Data
INSERT INTO EMPLOYEE_LOGINS (Emp_ID, temp_login_date)
VALUES
    -- Employee 1 (3 consecutive days)
    (101,'2026-03-01'),
    (101,'2026-03-02'),
    (101,'2026-03-03'),

    -- Employee 2 (3 consecutive days)
    (102,'2026-03-05'),
    (102,'2026-03-06'),
    (102,'2026-03-07'),

    -- Employee 3 (4 consecutive days)
    (103,'2026-03-10'),
    (103,'2026-03-11'),
    (103,'2026-03-12'),
    (103,'2026-03-13'),

    -- Employee 4 (broken streak – should NOT appear in solution)
    (104,'2026-03-01'),
    (104,'2026-03-03'),
    (104,'2026-03-04'),

    -- Employee 5 (3 consecutive days)
    (105,'2026-03-15'),
    (105,'2026-03-16'),
    (105,'2026-03-17'),

    -- Employee 6 (another valid streak)
    (106,'2026-03-20'),
    (106,'2026-03-20'),
    (106,'2026-03-20'),
    (106,'2026-03-21'),
    (106,'2026-03-22');
