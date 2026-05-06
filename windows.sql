-----------------STRATASCRATCH---------------------

-- PROBLEM: Average Salaries
-- DIFFICULTY: Easy

select department, first_name, salary, avg(salary) over (partition by department)
from employee




-- PROBLEM: Workers with the highest salaries
-- DIFFICULTY: Easy

select t.worker_title as best_paid_title
from worker w join title t 
on w.worker_id=t.worker_ref_id
where w.salary= 
(
select MAX(a.salary)
from worker a join title b on a.worker_id=b.worker_ref_id
where b.worker_title IS NOT NULL
)
order by best_paid_title asc




-- PROBLEM: Finding Updated Records
-- DIFFICULTY: Easy

select  id, first_name, last_name, department_id, salary from 
(
select *, dense_rank() over (partition by id order by salary desc) as rnk from ms_employee_salary
) subquery
where rnk=1
order by id asc




-- PROBLEM: Ranking Most Active Guests
-- DIFFICULTY: Medium
-- COMPANY: Airbnb

select dense_rank() over(oreder by sum(n_messages) desc) as ranking, 
id_guest, sum(n_messages) as sum_n_messages
from airbnb_contacts
group by id_guest







