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



-- PROBLEM: Average Selling Price
-- DIFFICULTY: Easy









