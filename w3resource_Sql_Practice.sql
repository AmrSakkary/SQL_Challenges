-----------------------
-- Sql Daily Practice |
-----------------------------------------------------------------------------------
-- Retrieve data from tables                                                      
-- source: https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php   
-----------------------------------------------------------------------------------

-- 1. Write a SQL statement that displays all the information about all salespeople.
SELECT *
From salesman;

-- 2. Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution".
Select "This is SQL Exercise, Practice and Solution";


-- 3. Write a SQL query to display three numbers in three columns. 
Select 1,2,3

-- 4. Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server. 
select sum(15+10)

-- 5. Write an SQL query to display the result of an arithmetic expression.

select 1*5+2/2

-- 6. Write a SQL statement to display specific columns such as names and commissions for all salespeople. 
select 
    name,
    commission
from salesmen;

-- 7. Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.

select 
    ord_date, 
    salesman_id,
    ord_no,
    purch_amt
from orders


-- 8. From the following table, write a SQL query to identify the unique salespeople ID. Return salesman_id.
select distinct salesman_id
from orders

-- 9. From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city.
select 
    name,
    city
from salesman
where city = 'Paris'


-- 10. From the following table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id.
select 
    customer_id,
    cust_name,
    city,
    grade,
    salesman_id
from customer
where grade = 200

-- 11. From the following table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt. 
select 
    ord_no,
    ord_date,
    purch_amt
from orders
where salesman_id = 5001



-- 12. From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner.

select 
    subject,
    winner
from nobel_win
where year = 1970

-- 13. From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1970. Return winner.
select *
from nobel_win
where SUBJECT  = 'Literature' and year = 1970;

-- 14. From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject.

select *
from nobel_win
where winner = 'Dennis Gabor'


-- 15. From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner.
select 
    year,
    winner
from nobel_win
where SUBJECT = 'Physice' and year >= 1950


-- 16. From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. Begin and end values are included. Return year, subject, winner, and country.
SELECT 
    year,
    subject, 
    winner,
    country
FROM nobel_win
WHERE SUBJECT = 'Chemistry' AND year >= 1965 AND year <=1975;

-- 17. Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.
select * 
from nobel_win
where CATEGORY = 'Prime Ministerial' and year > 1972 
and winner = 'Menachem Begin' or winner ='Yitzhak Rabin'

select * 
from nobel_win
where CATEGORY = 'Prime Minister' and year > 1972 
and winner in ('Menachem Begin' ,'Yitzhak Rabin')

-- 18. From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category.

select *
from nobel_win
where winner like 'Louis%'


-- 19. From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category.
select *
from nobel_win
where SUBJECT = 'Physics' and year = 1970
union -- something new here 
    (select *
        from nobel_win
        where SUBJECT = 'Economics' and year = 1971)

-- 20. From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category.  
select *
from nobel_win
where year = 1970 and subject not in ('Physiology', 'Economics')

-- 21. From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category.
SELECT *
FROM nobel_win
WHERE subject = 'Physiology' and year < 1971
UNION
SELECT *
FROM nobel_win
WHERE subject = 'Peace' AND year >= 1974 

-- 22. From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.
SELECT * 
FROM nobel_win
WHERE winner = 'Johannes Georg Bednorz'

-- 23. From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending.
SELECT * 
FROM nobel_win
WHERE subject not like 'P%'
ORDER by year DESC , winner 

-- 24. From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category.
SELECT year, subject, winner, country, category, 1 as priority
FROM nobel_win
WHERE subject NOT IN('Economics', 'Chemistry') and year = 1970
UNION
SELECT year, subject, winner, country, category, 2 as priority
FROM nobel_win
WHERE subject IN('Economics', 'Chemistry') and year = 1970
ORDER BY priority, subject


-- it was a nice idea to add a column to sort by it 

-- also good to know this info 
--for those who are using union: order by can only be applied only once (i.e. after the last query)


-- 25. From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com. 

select *
from item_mast
where pro_price >= 200 and pro_price <= 600

-- 26. From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg.

select round(avg(pro_price), 2) as Average_Price
from item_mast
where pro_com = 16
-- 27. From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.'

select pro_name as "Item Name", pro_price as "Price in Rs"
from item_mast

-- 28. From the following table, write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price.
select pro_name, pro_price
from item_mast
where PRO_PRICE >= 250
order by PRO_PRICE desc, pro_name

-- 29. From the following table, write a SQL query to calculate average price of the items for each company. Return average price and company code.
select pro_com, avg(pro_price) as Average_Price
from item_mast
group by pro_com
order by Average_Price desc

-- 30. From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.

select pro_name, PRO_PRICE
from item_mast
where PRO_PRICE = (select min(PRO_PRICE) from item_mast)

-- notice here that he asked for the cheapest items not any item with a price order 
-- you check what is the min price 
-- then get all items within this price 

-- 31. From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname.
select distinct emp_lname
from emp_details

-- 32. From the following table, write a SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept.
select *
from emp_details
where emp_lname = 'Snares'

-- 33. From the following table, write a SQL query to retrieve the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept..
select *
from emp_details
where emp_dept = 57

-------------------------------------------------------
-- Boolean and Relational operators
-- source: https://www.w3resource.com/sql-exercises/sql-boolean-operators.php
-------------------------------------------------------

-- 1. From the following table, write a SQL query to locate the details of customers with grade values above 100. Return customer_id, cust_name, city, grade, and salesman_id.
select *
from customer
where grade > 100

-- 2. From the following table, write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id. 
select *
from customer
where city = 'New York' and grade > 100


-- 3. From the following table, write a SQL query to find customers who are from the city of New York or have a grade of over 100. Return customer_id, cust_name, city, grade, and salesman_id.
select * 
from customer
where city = 'New York' or grade > 100

-- 4. From the following table, write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id. 
select *
from customer
where city = 'New York' or grade <= 100

-- 5. From the following table, write a SQL query to identify customers who do not belong to the city of 'New York' or have a grade value that exceeds 100. Return customer_id, cust_name, city, grade, and salesman_id.
select *
from customer
where city != 'New York' and grade <= 100
-- other solution
SELECT * FROM customer WHERE NOT (city = 'New York' OR grade>100);

-- 6. From the following table, write a SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
-- here you get the data first then exclude it from the query to get the rest of the data 
-- wrong answer
select *
from orders
where ord_date != '2012-09-10' and (salesman_id > 5005 or purch_amt > 1000)

-- right answer 
SELECT * FROM  orders WHERE NOT ((ord_date ='2012-09-10'AND salesman_id > 5005) OR purch_amt > 1000.00);


-- 7. From the following table, write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission. 
select *
from salesman
where commission between 0.10 and  0.12

SELECT salesman_id,name,city,commission 
FROM salesman 
WHERE (commission > 0.10 
AND commission< 0.12);

-- 8. From the following table, write a SQL query to find details of all orders with a purchase amount less than 200 or exclude orders with an order date greater than or equal to '2012-02-10' and a customer ID less than 3009. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
select * 
from orders
where purch_amt < 200 or not (ord_date >= '2012-02-10' and customer_id < 3009)



-- 9. From the following table, write a SQL query to find all orders that meet the following conditions. Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000.
select *
from orders
where not ((ord_date = '2012-08-17' or customer_id > 3005)  and purch_amt < 1000)


-- 10. Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.
select ord_no, purch_amt, 
        case 
            when (purch_amt / 6000)*100 > 50 then 'achieved'
            else 'unachieved' 
        end as target
from orders
where (purch_amt / 6000)*100 > 50

-- this is fine but he want to see how much did you achieve or didn't from the target
select ord_no, purch_amt, round((purch_amt / 6000)*100, 3) as achieved,
100 -round((purch_amt / 6000)*100, 3) as unachieved
        
from orders
where (purch_amt / 6000)*100 > 50


-- 11. From the following table, write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept.
select *
from emp_details
where EMP_LNAME in ('Dosni' , 'Mardy')
-- 12. From the following table, write a SQL query to find the employees who work at depart 47 or 63. Return emp_idno, emp_fname, emp_lname, and emp_dept.

select *
from emp_details
where emp_dept in (47 , 63)

-------------------------------------
-- Wildcard and Special operators
-- source: https://www.w3resource.com/sql-exercises/sql-wildcard-special-operators.php
-------------------------------------


-- 1. From the following table, write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission.
select *
from salesman
where city in ('Paris', 'Rome')
-- 2. From the following table, write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'. Return salesman_id, name, city, commission.

select *
from salesman
where city in ('Paris', 'Rome')

-- 3. From the following table, write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. Return salesman_id, name, city, commission.
select *
from salesman
where city not in ('Paris', 'Rome')


-- 4. From the following table, write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id.
select *
from customer
where customer_id in ( 3007, 3008 , 3009)

-- 5. From the following table, write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included). Return salesman_id, name, city, and commission.
select *
from salesman
where commission between 0.12 and 0.14

-- 6. From the following table, write a SQL query to select orders between 500 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.

select *
from orders
where (purch_amt between 500 and 4000) and purch_amt not in (948.50 , 1983.43)


-- 7. From the following table, write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.
select *
from salesman
where left(name, 1) in ('B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K')

select *
from salesman
where left(name, 1) between 'A' and 'K'

-- 8. From the following table, write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.
select *
from salesman
where left(name, 1) not in ('B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K')

select *
from salesman
where left(name, 1) not between 'A' and 'K'


select *
from salesman
where name not between 'A' and 'L'
-- 9. From the following table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.
select *
from customer
where left(cust_name, 1) = 'B'

SELECT * FROM customer WHERE cust_name LIKE 'B%';


-- 10. From the following table, write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
select *
from customer
where right(cust_name,1)  = 'n'
-- 11. From the following table, write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission. 
select *
from salesman
where left(name, 1) = 'N' and left(right(name, -3), 1) = 'l'

-- 12. From the following table, write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.
select *
from testtable
where col1 like '%\\_%'

-- 13. From the following table, write a SQL query to identify those rows where col1 does not contain the escape character underscore ( _ ). Return col1.

select *
from testtable
where col1 not like '%\\_%'

-- can also use 
select * from testtable where col1 not like '%/_%' escape '/'

-- 14. From the following table, write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1.
select *
from testtable
where col1 like '%/%'


-- 15. From the following table, write a SQL query to identify those rows where col1 does not contain the forward slash character ( / ). Return col1.
select *
from testtable
where col1 not like '%/%'

-- can also use 
SELECT * FROM testtable WHERE col1 NOT LIKE '%//%' ESCAPE '/';

-- 16. From the following table, write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1.
select *
from testtable
where col1 like '%\\_/%'

SELECT * FROM testtable WHERE col1 LIKE '%/_//%' ESCAPE '/';
-- 17. From the following table, write a SQL query to find those rows where col1 does not contain the string ( _/ ). Return col1.
select *
from testtable
where col1 not like '%\\_/%'

-- 18. From the following table, write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1.
select * 
from testtable
where col1 like '%\\%%'
-- 19. From the following table, write a SQL query to find those rows where col1 does not contain the character percent ( % ). Return col1.
select * 
from testtable
where col1 not like '%\\%%'

-- 20. From the following table, write a SQL query to find all those customers who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id. 
select *
from customer
where grade is null

-- 21. From the following table, write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,city, grade, salesman_id. 
select *
from customer
where is not null

-- 22. From the following table, write a SQL query to locate the employees whose last name begins with the letter 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept.

select *
from emp_details
where emp_lname like 'D%'

------------------------------------
-- Aggregate functions and Group by
-- source: https://www.w3resource.com/sql-exercises/sql-aggregate-functions.php
------------------------------------

-- 1. From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.
select sum(purch_amt)
from orders

-- 2. From the following table, write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount.
select avg(purch_amt)
from orders

-- 3. From the following table, write a SQL query that counts the number of unique salespeople. Return number of salespeople. 
select distinct count(salesman_id)
from orders

select count(*) from (select salesman_id, count(salesman_id)
from orders
group by 1) as t1

select count(*) from (select distinct salesman_id from orders) as t1

SELECT COUNT (DISTINCT salesman_id) FROM orders

-- 4. From the following table, write a SQL query to count the number of customers. Return number of customers.
select distinct count(customer_id)
from customer

select count(*) from (select distinct (customer_id)
from customer) as t1

SELECT COUNT (DISTINCT customer_id) FROM customer

-- 5. From the following table, write a SQL query to determine the number of customers who received at least one grade for their activity.
select count(*) from(select customer_id, count(grade)
from customer
group by customer_id
having count(grade) >0) as t1


select count(all grade)
from customer
-- 6. From the following table, write a SQL query to find the maximum purchase amount.
select max(purch_amt) as max
from orders

-- 7. From the following table, write a SQL query to find the minimum purchase amount.
select min(purch_amt) as max
from orders

-- 8. From the following table, write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade.
select city, max(grade) as "maximum grade"
from customer
group by city

-- 9. From the following table, write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount.
select customer_id, max(purch_amt) as "maximum purchase amount"
from orders
group by 1
order by 1
-- 10. From the following table, write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount.
select customer_id, ord_date, max(purch_amt) as "maximum purchase amount"
from orders
group by 1,2
order by 1

-- 11. From the following table, write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. Return salesperson ID, purchase amount
select salesman_id , max(purch_amt)
from orders
where ord_date = '2012-08-17'
group by salesman_id

-- 12. From the following table, write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount.
select customer_id, ord_date, max(purch_amt)
from orders
group by 1,2
having max(purch_amt) > 2000

-- 13. From the following table, write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are included.) by combination of each customer and order date. Return customer id, order date and maximum purchase amount. 
select 
    customer_id,
    ord_date,
    max(purch_amt)
from orders
group by 1,2
having max(purch_amt) between 2000 and 6000

-- 14. From the following table, write a SQL query to find the maximum order (purchase) amount based on the combination of each customer and order date. Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase amount.
select 
    customer_id,
    ord_date,
    max(purch_amt)
from orders
group by 1,2
having max(purch_amt) in (2000, 3000, 5760, 6000)


-- 15. From the following table, write a SQL query to determine the maximum order amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount.
select 
    customer_id, 
    max(purch_amt)
from orders
where customer_id between 3002 and 3007
group by 1

-- 16. From the following table, write a SQL query to find the maximum order (purchase) amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Filter the rows for maximum order (purchase) amount is higher than 1000. Return customer id and maximum purchase amount.
select 
    customer_id, 
    max(purch_amt)
from orders
where customer_id between 3002 and 3007
group by 1
having max(purch_amt) > 1000


-- 17. From the following table, write a SQL query to determine the maximum order (purchase) amount generated by each salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). Return salesperson id and maximum purchase amount.
select 
    salesman_id,
    max(purch_amt)
from orders
where salesman_id between 5003 and 5008
group by 1

-- 18. From the following table, write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.
select count(*)
from orders
where ord_date = '2012-08-17'

-- 19. From the following table, write a SQL query to count the number of salespeople in a city. Return number of salespeople.
select count(*)
from salesman
where city is not null

-- 20. From the following table, write a SQL query to count the number of orders based on the combination of each order date and salesperson. Return order date, salesperson id.
select 
    salesman_id,
    ord_date,
    count(ord_no)
from orders
group by 1,2

-- 21. From the following table, write a SQL query to calculate the average product price. Return average product price.
select round(avg(PRO_PRICE),2) as "Average Price"
from item_mast
-- 22. From the following table, write a SQL query to count the number of products whose price are higher than or equal to 350. Return number of products.
select count(*) as "Number of Products"
from item_mast
where pro_price >= 350

-- 23. From the following table, write a SQL query to compute the average price for unique companies. Return average price and company id.
select PRO_COM as "Company ID", avg(pro_price) as "Average Price"
from item_mast
group by 1


-- 24. From the following table, write a SQL query to compute the sum of the allotment amount of all departments. Return sum of the allotment amount.
select sum(DPT_ALLOTMENT)
from emp_department

-- 25. From the following table, write a SQL query to count the number of employees in each department. Return department code and number of employees.
select EMP_DEPT, count(*)
from emp_details
group by 1

----------------------------------------------------------------------------------------
-- Formatting Query Output
-- source: https://www.w3resource.com/sql-exercises/sql-fromatting-output-exercises.php
----------------------------------------------------------------------------------------

-- 1. From the following table, write a SQL query to select all the salespeople. Return salesman_id, name, city, commission with the percent sign (%).

SELECT salesman_id,name,city,concat(commission*100 ,'%')commission_percent
FROM salesman;

-- 2. From the following table, write a SQL query to find the number of orders booked for each day. Return the result in a format like "For 2001-10-10 there are 15 orders".".
select concat('For ', ord_date, ', there are ', count(ord_no), ' orders.')
from orders
group by ord_date

-- 3. From the following table, write a SQL query to find all the orders. Sort the result-set in ascending order by ord_no. Return all fields.
select *
from orders
order by ord_no 
-- 4. From the following table, write a SQL query to find all the orders. Sort the result-set in descending order by ord_date. Return all fields.
select * 
from orders
order by ord_date desc

-- 5. From the following table, write a SQL query to find all the orders. Sort the result-set in descending order by ord_date and purch_amt. Return all fields.
select *
from orders
order by ord_date, purch_amt desc
-- 6. From the following table, write a SQL query to find all the customers. Sort the result-set by customer_id. Return cust_name, city, grade.
select cust_name, city, grade
from customer
order by customer_id

-- 7. From the following table, write a SQL query that calculates the maximum purchase amount generated by each salesperson for each order date. Sort the result-set by salesperson id and order date in ascending order. Return salesperson id, order date and maximum purchase amount.
select 
    salesman_id,
    ord_date,
    max(purch_amt) "maximum purchase amount"
from orders
group by 1, 2
order by 1, 2 

-- 8. From the following table, write a SQL query to find all the customers. Sort the result-set in descending order on 3rd field. Return customer name, city and grade.
select 
    cust_name,
    city,
    grade 
from customer
order by 3 desc

-- 9. From the following table, write a SQL query that counts the unique orders and the highest purchase amount for each customer. Sort the result-set in descending order on 2nd field. Return customer ID, number of distinct orders and highest purchase amount by each customer.
select distinct 
    customer_id,
    count(ord_no),
    max(purch_amt)
from orders
group by 1
order by 2 desc

-- 10. From the following table, write a SQL query to calculate the summation of purchase amount, total commission (15% for all salespeople) by each order date. Sort the result-set on order date. Return order date, summation of purchase amount and commission.  

select ord_date,
    sum(purch_amt),
    sum(purch_amt) * 0.15
from orders
group by 1
order by 1

------------------------------------------------------------------------------------------------
-- Query on Multiple Tables
-- source: https://www.w3resource.com/sql-exercises/sql-exercises-quering-on-multiple-table.php
------------------------------------------------------------------------------------------------
-- 1. From the following tables, write a SQL query to find the salespeople and customers who live in the same city. Return customer name, salesperson name and salesperson city.
select 
    c.cust_name,
    s.name,
    s.city
from salesman s
join customer c
    on s.city = c.city

-- 2. From the following tables, write a SQL query to locate all the customers and the salesperson who works for them. Return customer name, and salesperson name.
select 
    c.cust_name "Customer Name",
    s.name "salesman name"
from salesman s
join customer c
    on s.salesman_id = c.salesman_id

-- 3. From the following tables, write a SQL query to find those salespeople who generated orders for their customers but are not located in the same city. Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table).
select o.ord_no,c.cust_name,o.customer_id, o.salesman_id
from salesman s
join customer c
    on s.salesman_id = c.salesman_id
join orders o
    on c.customer_id = o.customer_id
where c.city != s.city

-- 4. From the following tables, write a SQL query to locate the orders made by customers. Return order number, customer name.
select
    o.ord_no,
    c.cust_name
from orders o
join customer c
    on o.customer_id = c.customer_id

-- 5. From the following tables, write a SQL query to find those customers where each customer has a grade and is served by a salesperson who belongs to a city. Return cust_name as "Customer", grade as "Grade". 
select 
    c.cust_name "Customer",
    grade "Grade",
    count(ord_no) "Orders Count"
from salesman s
join orders o
    on o.salesman_id = s.salesman_id
join customer c
    on o.customer_id = c.customer_id
where grade is not null
group by 1,2

-- 6. From the following table, write a SQL query to find those customers who are served by a salesperson and the salesperson earns commission in the range of 12% to 14% (Begin and end values are included.). Return cust_name AS "Customer", city AS "City".
select 
    c.cust_name "Customer",
    c.city "City"
from customer c
join salesman s
    on s.salesman_id = c.salesman_id
where commission between 0.12 and 0.14
-------------------------------------------------------
select 
    c.cust_name "Customer",
    c.city "City",
    count(ord_no) "Orders Count"
from customer c
join salesman s
    on s.salesman_id = c.salesman_id
join orders o
    on o.customer_id = c.customer_id
where commission between 0.12 and 0.14
group by 1,2


-- 7. From the following tables, write a SQL query to find all orders executed by the salesperson and ordered by the customer whose grade is greater than or equal to 200. Compute purch_amt*commission as “Commission”. Return customer name, commission as “Commission%” and Commission.
select 
    ord_no,
    cust_name,
    commission as "Commmission%",
    purch_amt * commission as "Commission"
from orders o
join salesman s
    on s.salesman_id = o.salesman_id
join customer c
    on o.customer_id = c.customer_id
where grade >= 200
-- 8. From the following table, write a SQL query to find those customers who placed orders on October 5, 2012. Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id.
select *
from customer c
join orders o
    on o.customer_id = c.customer_id
where ord_date = '2012-10-05'

---------------------------------------------------------------------------
-- SQL Joins
-- Source: https://www.w3resource.com/sql-exercises/sql-joins-exercises.php
---------------------------------------------------------------------------

-- 1. From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
select 
    s.name "Salesman Name", 
    cust_name, 
    s.city
from salesman s
join customer c
    on s.city = c.city

-- 2. From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
select 
    ord_no,
    purch_amt,
    cust_name,
    city
from orders o
join customer c
    on o.customer_id = c.customer_id
where purch_amt between 500 and 2000





























































