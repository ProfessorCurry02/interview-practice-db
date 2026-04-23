-- ============================================
-- Running Total of Employee Ages
-- Demonstrates use of window functions (SUM OVER)
-- ============================================

select 
    Emp_ID
    , Emp_Fname
    , Emp_Age
    , sum(Emp_Age) over (
                    order by Emp_Age rows unbounded preceding
                    ) as running_total_age
from EMPLOYEE;



-- ============================================
-- Employees with Above-Average Salary
-- Demonstrates subqueries and filtering
-- ============================================

select 
    concat(Emp_Fname, ' ', Emp_Lname) as Emp_Name
from EMPLOYEE
where Salary > (
    select AVG(Salary) from EMPLOYEE
                )
order by Salary desc;



-- ============================================
-- Employee Count by Department
-- Demonstrates GROUP BY aggregation
-- ============================================

select 
    Department
    , COUNT(*) as Total_Employees
from EMPLOYEE
group by Department;



-- ============================================
-- User Retention Rate (Day-over-Day)
-- Demonstrates self joins and date-based analysis
-- ============================================

select 
    t.temp_login_date
    , isnull(returning_users * 1.0 / total_users, 0) as RetentionRate
from(
    select
        temp_login_date
        , count(distinct Emp_ID) as total_users
    from EMPLOYEE_LOGINS
    group by temp_login_date
    ) t
left join
    (select 
        l1.temp_login_date
        , COUNT(distinct l1.Emp_ID) as returning_users
    from EMPLOYEE_LOGINS l1
join EMPLOYEE_LOGINS l2 on l1.Emp_ID=l2.Emp_ID
and l2.temp_login_date = DATEADD(DAY, 1, l1.temp_login_date)
group by l1.temp_login_date) r
on t.temp_login_date = r.temp_login_date;



-- ============================================
-- True Age Calculation
-- Demonstrates accurate age calculation using date logic
-- ============================================

select Emp_ID
, Emp_Fname
, format(GETDATE(), 'yyyy-MM-dd') as currentdate
, Emp_DOB
, Emp_Age
, DATEDIFF(YEAR, Emp_DOB, GETDATE()) 
- case 
	when DATEADD(year, DATEDIFF(year, Emp_DOB, getdate()), Emp_DOB) > GETDATE()
	then 1
	else 0
	end as true_age
from EMPLOYEE;
