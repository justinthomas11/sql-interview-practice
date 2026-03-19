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





