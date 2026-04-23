-- ============================================
-- Procedure 1: Employee ID Validation & Lookup
-- Demonstrates input validation and control flow
-- ============================================

CREATE OR ALTER PROCEDURE sp_emp_id_info
    @Emp_ID INT = NULL
AS
BEGIN
    DECLARE @EmpCount INT = 0;

    IF @Emp_ID IS NULL
    BEGIN
        PRINT 'Please enter a valid Employee ID';
        RETURN;
    END;

    IF @Emp_ID < 100
    BEGIN
        PRINT 'Employee ID must be >= 100';
        RETURN;
    END;

    IF @Emp_ID > 999
    BEGIN
        PRINT 'Employee ID must be <= 999';
        RETURN;
    END;

    SELECT @EmpCount = COUNT(*)
    FROM EMPLOYEE
    WHERE Emp_ID = @Emp_ID;

    IF @EmpCount = 0
    BEGIN
        PRINT 'No employee found with the provided ID';
    END
    ELSE
    BEGIN
        EXEC sp_emp_id_info_version_02 @Emp_ID;
    END;
END;
GO



-- ============================================
-- Procedure 2: Filter Employees by Country
-- Demonstrates parameterized queries
-- ============================================

CREATE OR ALTER PROCEDURE sp_employee_table
    @Country VARCHAR(50) = '%'
AS
BEGIN
    SELECT *
    FROM EMPLOYEE
    WHERE Country LIKE @Country;
END;
GO



-- ============================================
-- Procedure 3: Employee Age Calculation
-- Demonstrates date-based logic
-- ============================================

CREATE OR ALTER PROCEDURE sp_employee_true_age
AS
BEGIN
    SELECT 
        Emp_ID,
        Emp_Fname,
        FORMAT(GETDATE(), 'yyyy-MM-dd') AS Current_Date,
        Emp_DOB,
        Emp_Age,
        DATEDIFF(YEAR, Emp_DOB, GETDATE()) 
        - CASE 
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, Emp_DOB, GETDATE()), Emp_DOB) > GETDATE()
            THEN 1
            ELSE 0
          END AS True_Age
    FROM EMPLOYEE;
END;
GO



-- ============================================
-- Procedure 4: Triangle Type Checker
-- Demonstrates conditional logic without tables
-- ============================================

CREATE OR ALTER PROCEDURE sp_check_triangle
    @a INT = NULL,
    @b INT = NULL,
    @c INT = NULL
AS
BEGIN
    IF @a IS NULL OR @b IS NULL OR @c IS NULL
    BEGIN
        PRINT 'Please enter all three side values';
        RETURN;
    END;

    SELECT 
        CASE
            WHEN @a + @b <= @c OR @b + @c <= @a OR @a + @c <= @b 
                THEN 'Not a Triangle'
            WHEN @a = @b AND @b = @c 
                THEN 'Equilateral'
            WHEN @a = @b OR @b = @c OR @a = @c 
                THEN 'Isosceles'
            ELSE 'Scalene'
        END AS Triangle_Type;
END;
GO
