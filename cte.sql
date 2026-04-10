-- Common table Expression is a temporary result set you define using WITH and then use like a table in your query

-- BASIC SYNTAX
with cte_name as (
SELECT ... 
)
select * from cte_name



-- EXAMPLE
-- Get employees with salary>average salary

--Without CTE:
select * from employees
where salary>(select avg(salary) from employees)

--With CTE:
with avg_salary as(
select avg(salary) as avg_sal from employees
)
select * from employees where salary>(select avg_sal from avg_salary)




-- EXAMPLE
-- Find 2nd Highest Salary
with secondhighest as (
    select salary, dense_rank() over (order by salary desc) as rnk
    from Employee
)
select MAX(salary) as "SecondHighestSalary" from secondhighest where rnk=2