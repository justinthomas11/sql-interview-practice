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




-- PROBLEM: Second Highest Salary
-- DIFFICULTY: Medium
-- COMPANIES: Amazon, Dropbox 

with cte as
(select salary, dense_rank() over (order by salary desc) as "salary_rank" from employee)

select salary from cte where salary_rank=2




-- PROBLEM: Customers With Large Orders
-- DIFFICULTY: Medium
-- COMPANIES: Uber, Netflix, DoorDash

with cte as (
select c.customer_id, c.customer_name, o.amount, o.order_id, o.status
from online_store_customers c inner join online_store_orders o
on c.customer_id=o.customer_id
where amount>100)
select distinct customer_id, customer_name from cte order by customer_id




-- PROBLEM: Processed Ticket Rate By Type
-- DIFFICULTY: Medium
-- COMPANIES: Meta

with cte as(
    select type,
            CASE
                WHEN processed='TRUE' THEN 1
                ELSE 0
            END AS processed_num
    from facebook_complaints
    )
select type, round(avg(processed_num),2) as processed_rate
from cte
group by type




-- PROBLEM: Income by title and gender
-- DIFFICULTY: Medium
-- COMPANIES: City of San Francisco

select * from sf_employee;

with bonus_totals as(
select worker_ref_id, sum(bonus) as total_bonus
from sf_bonus
group by worker_ref_id)
,
compensation as(
select e.employee_title, e.sex, e.salary + b.total_bonus as total_comp
from sf_employee e inner join bonus_totals b
on e.id=b.worker_ref_id)

select employee_title, sex, avg(total_comp) as avg_compensation from compensation
group by employee_title, sex;








