CREATE DATABASE InterviewPracticeDB;
GO

USE InterviewPracticeDB;
GO

CREATE TABLE EMPLOYEE(
    Emp_ID INT IDENTITY(100,1) PRIMARY KEY,
    Emp_Email VARCHAR(100) UNIQUE,
    Country VARCHAR(50) DEFAULT 'Unknown',
    City VARCHAR(50) DEFAULT 'Unknown',
    Emp_Age INT CHECK (Emp_Age >= 18),
    Salary DECIMAL(10,2) DEFAULT 0 CHECK (Salary >= 0),
    Emp_Fname VARCHAR(50) NOT NULL,
    Emp_Lname VARCHAR(50) NOT NULL,
    Emp_DOB DATE,
    Emp_Join_Date DATE,
    Department VARCHAR(50) DEFAULT 'General',

    CONSTRAINT CHK_EmpID_Max CHECK (Emp_ID <= 999),
    CONSTRAINT CHK_Joining_After_Birth CHECK (Emp_Join_Date > Emp_DOB),
    CONSTRAINT CHK_Joining_Age CHECK (DATEDIFF(YEAR, Emp_DOB, Emp_Join_Date) >= 18)
);
