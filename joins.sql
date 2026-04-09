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





-- ** DAY 11**

-- PROBLEM: Department Highest Salary
-- DIFFICULTY: Medium

select d.name as "Department", e.name as "Employee", e.salary as "Salary"
from Employee e inner join Department d 
on e.departmentId=d.id
WHERE (e.departmentId, e.salary) IN (
    SELECT departmentId, MAX(salary)
    FROM Employee
    GROUP BY departmentId
);



-- PROBLEM: Exchange Seats
-- DIFFICULTY: Medium

select 
CASE
    WHEN id % 2 = 1 AND id != (SELECT MAX(id) FROM Seat) THEN id + 1
    WHEN id % 2 = 0 THEN id - 1
    ELSE id
END AS id, student
from Seat
order by id asc



-- PROBLEM: Product Sales Analysis I
-- DIFFICULTY: Easy

select p.product_name,s.year,s.price from product p inner join sales s on p.product_id=s.product_id





-- ** DAY 12**

-- PROBLEM: Second Highest Salary
-- DIFFICULTY: Medium

select max(salary) as "SecondHighestSalary"
from employee
where  salary<(select max(salary) from employee)

-- PROBLEM: Rank Score
-- DIFFICULTY: Medium

select score, dense_rank() over (order by score desc) as "rank" from Scores

-- PROBLEM: Consecutive Numbers
-- DIFFICULTY: Medium

select distinct l1.name as "ConsecutiveNums"
from Logs l1
join Logs l2 on l2.id=l1.id+1
join Logs l3 on l3.id=l1.id+2
where l1.nums=l2.nums and l1.nums=l3.nums





-- ** DAY 13**

-- PROBLEM: Tree Node
-- DIFFICULTY: Medium

select id,
CASE
    WHEN p_id is null THEN 'Root'
    WHEN id in (select p_id from Tree where p_id is not null) THEN 'Inner'
    ELSE 'Leaf'
END AS 'type'
from Tree   

-- PROBLEM: Biggest Single Number
-- DIFFICULTY: Easy

select max(num) as num from (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
)
as temp

-- PROBLEM: Actors and Directors Who Cooperated At Least Three Times
-- DIFFICULTY: Easy

select actor_id, director_id, from ActorDirector
group by actor_id,director_id 
having count(*)>=3


-- PROBLEM: Market Analysis I
-- DIFFICULTY: Medium 
-- Rule: In SQL, every column in SELECT must be inside an aggregation function or Group BY

select u.user_id as 'buyer_id', u.join_date, count(o.order_id) as 'orders_in_2019'
from Users u left join Orders o
on u.user_id=o.buyer_id
and year(o.order_date)=2019
group by u.user_id, u.join_date






