-- ===========================
-- FOUNDATIONS.SQL
-- ===========================


-- ** DAY 1**

-- PROBLEM: Recyclable and low fat products
-- DIFFICULTY: Easy

select product_id from Products where low_fats='Y' and recyclable='Y'



--- PROBLEM: Big Countries
--- DIFFICULTY: Easy

select name, population, area from World where area>=300000 or population>=2500000



---PROBLEM: Find Customer Referee
--- DIFFICULTY: Easy

select name from Customer where referee_id!=2 or referee_id is null





-- ** DAY 2**

-- PROBLEM: Customers Who Never Order
-- DIFFICULTY: Easy

select c.name as "Customers" FROM Customers c 
LEFT JOIN Orders o
on c.id=o.customerId
where o.customerId is null




-- PROBLEM: Invalid Tweets
-- DIFFICULTY: Easy

select tweet_id from Tweets where LENGTH(content)>15



-- PROBLEM: Article Views I

select distinct author_id as "id" from Views WHERE
author_id=viewer_id order by author_id ASC





-- ** DAY 3**

-- PROBLEM: Calculate Special Bonus
-- DIFFICULTY: Easy

select employee_id, IF(employee_id%2!=0 and name not like 'M%', salary, 0) as bonus
from Employees order by employee_id ASC



-- PROBLEM: Fix Names In A Table
-- DIFFICULTY: Easy

select user_id, 
CONCAT(
        UPPER(LEFT(name, 1)),
        LOWER(SUBSTRING(name, 2))
      ) as name
from Users order by user_id ASC



-- PROBLEM: Replace Employee ID with Unique Identifier
-- DIFFICULTY: Easy

select eu.unique_id,e.name from Employees e
LEFT JOIN EmployeeUNI eu on e.id=eu.id





-- ** DAY 4**

-- PROBLEM: Not boring movies
-- DIFFICULTY: Easy

select id, movie, description, rating from Cinema where id%2=1 and description not like "boring" 
order by rating DESC



-- PROBLEM: Product Sales Analysis I
-- DIFFICULTY: Easy

select s.sale_id, p.produce_name, s.year, s.price from product p inner join sales 
on p.product_id=s.product_id 



-- PROBLEM: Rearrange Products Table
-- DIFFICULTY: EASY

SELECT product_id, 'store1' AS store, store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION

SELECT product_id, 'store2' AS store, store2 AS price
FROM Products
WHERE store2 IS NOT NULL

UNION

SELECT product_id, 'store3' AS store, store3 AS price
FROM Products
WHERE store3 IS NOT NULL;





-- ** DAY 5**


-- PROBLEM: Average Selling Price
-- DIFFICULTY: Easy

select p.product_id, IFNULL(ROUND(SUM(p.price*u.units)/SUM(u.units),2),0) as "average_price"
from Prices p left join UnitsSold u 
on p.product_id=u.product_id 
AND u.purchase_date BETWEEN p.start_date and p.end_date
group by product_id


-- PROBLEM: Project Employees I
--- DIFFICULTY: Easy

select p.project_id, ROUND(AVG(experience_years),2) as "average_years" 
from project p left join employee e on p.employee_id=e.employee_id 
group by p.project_id


--- PROBLEM: User Activity For The Past 30 days I
--- DIFFICULTY: Easy

select activity_date as "day" , COUNT(DISTINCT(user_id)) as "active_users"
from Activity
where activity_date> DATE_SUB('2019-07-27', INTERVAL 30 DAY) 
AND activity_date<='2019-07-27'
GROUP BY activity_date





-- ** DAY 6**

-- PROBLEM: Queries Quality and Percentage
-- DIFFICULTY: Easy

select query_name, ROUND(AVG(rating/position),2) as "quality"
ROUND(SUM(IF(rating<3,1,0))/COUNT(*) * 100, 2) as "poor_query_percentage"
FROM Queries
GROUP BY query_name



-- PROBLEM: Bank Account Summary II
-- DIFFICULTY: Easy

select u.name, SUM(t.amount) as "balance"
from Users u INNER JOIN Transactions t
on u.account=t.account
GROUP BY u.account
having balance>10000



-- PROBLEM: Customer Placing The Largest Number Of Orders
-- DIFFICULTY: Easy

select customer_number from Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1






-----------------STRATASCRATCH---------------------


-- PROBLEM: Calculate Samantha's and Lisa's Total Sales Revenue
-- DIFFICULTY: Easy
-- COMPANIES: Amazon, SalesForce, Groupon

select sum(sales_revenue) as total_revenue
from sales_performance
where salesperson='Samantha' or salesperson='Lisa'




-- PROBLEM: Wine varieties tasted by "Roger Voss"
-- DIFFICULTY: Easy
-- COMPANIES: Wine Magazine

select distinct variety from winemag_p2 where taster_name='Roger Voss' and region_1 is not null



-- PROBLEM: Hour of highest gas expense
-- DIFFICULTY: Easy
-- COMPANIES: Lyft

select hour from lyft_rides where gasoline_cost in (select max(gasoline_cost) from lyft_rides)




-- PROBLEM: Unique Users Per Client Per Month
-- DIFFICULTY: Easy
-- COMPANIES: Microsoft, Apple, Dell

select client_id, extract(month from time_id) as "month", count(distinct user_id) as "users_num"
from fact_events group by client_id, month;




-- PROBLEM: High Earners in Support Departments
-- DIFFICULTY: Easy
-- COMPANIES: Uber, Spotify, Amazon

select first_name, last_name, department, salary from techcorp_workforce where salary>80000 
and department in ('HR', 'Admin')




-- PROBLEM: Top Ranked Songs
-- DIFFICULTY: Easy
-- COMPANIES: Spotify

select trackname, count(*) as "times_top1"
from spotify_worldwide_daily_song_ranking
where position=1
group by trackname
order by times_top1 desc























