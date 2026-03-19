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

