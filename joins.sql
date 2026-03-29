-- *DAY 8* --

-- PROBLEM: Combine Two Tables
-- DIFFICULTY: Easy

select p.firstName, p.lastName, a.city, a.state from
Person p LEFT JOIN Address a on p.personID=a.personID



-- PROBLEM: Employees Earning More Than Their Managers
-- DIFFICULTY: Easy

select e.name as "Employee" from Employee e 
join Employee m
on e.managerId=m.id 
where e.salary>m.salary



-- PROBLEM: Duplicate Emails
-- DIFFICULTY: Easy

select email from Person
group by email
having count(email)>1






-- ** DAY 9**

-- PROBLEM: Rising Temperature
-- DIFFICULTY: Easy

select a.id from Weather a JOIN Weather b 
ON a.recordDate=DATE_ADD(b.recordDate, INTERVAL 1 DAY)
where a.temperature>b.temperature



-- PROBLEM: Game Play Analysis I
-- DIFFICULTY: Easy

select player_id, MIN(event_date) as "first_login" from Activity
group by player_id





-- ** DAY 10**

-- PROBLEM: Managers with at least 5 direct reports
-- DIFFICULTY: Medium

select a.name from Employee a join Employee b
on a.id=b.managerId
GROUP BY a.id, a.name
having count(b.managerId)>=5



-- PROBLEM: Customer Who Visited But Did Not Make Any Transactions
-- DIFFICULTY: Easy

select v.customer_id, count(*) as "count_no_trans" 
from Visits v left join Transactions t 
on v.visit_id=t.visit_id
where t.visit_id is null
group by v.customer_id



-- PROBLEM: Sales Person
-- DIFFICULTY: Easy

select name from SalesPerson where sales_id not in 
(select o.sales_id from Orders o LEFT JOIN Company c on o.com_id=c.com_id WHERE c.name='RED')

