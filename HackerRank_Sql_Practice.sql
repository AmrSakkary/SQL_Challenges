-- Revising the Select Query I
SELECT * FROM CITY WHERE population > 100000 AND CountryCode = 'USA';

-- Revising the Select Query II
SELECT NAME FROM city WHERE population > 120000 AND countrycode = 'USA'
-- Select All
select * from city
--Select By ID
select * from city where id = 1661
-- Japanese Cities' Attributes
select * from city where countrycode = 'JPN'
-- Japanese Cities' Names
select name from city where countrycode = 'JPN'

-- Weather Observation Station 1

select city, state from station

-- Weather Observation Station 3

select distinct city
from station
where id % 2 = 0

-- Weather Observation Station 4

SELECT (count(city)- count(distinct city))
FROM station

-- Weather Observation Station 5

select city , len
from (select city, length(city) as len
from station
) a
order by len, city 
limit 1; 

select city , len
from (select city, length(city) as len
from station
) a
order by len desc
limit 1; 

-- Weather Observation Station 6

select distinct city
from station
where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' 
or city like 'u%';

-- Weather Observation Station 7

select distinct city
from station
where city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u';

-- Weather Observation Station 8

select distinct city
from station
where (city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u') and  (city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%'
or city like 'u%');

-- Weather Observation Station 9

select distinct city
from station
where city not like 'a%' and city not like 'e%' and city not like 'i%' and city not like 'o%' and city not like 'u%';

-- Weather Observation Station 10

select distinct city
from station
where city not like '%a' and city not like '%e' and city not like '%i' and city not like '%o' and city not like '%u';

-- Weather Observation Station 11

SELECT DISTINCT CITY 
FROM station
where left(CITY,1) NOT IN ('a', 'e', 'i', 'o', 'u')
or right(CITY,1) NOT IN ('a', 'e', 'i', 'o', 'u');

-- Weather Observation Station 12

SELECT DISTINCT CITY 
FROM station
where left(CITY,1) NOT IN ('a', 'e', 'i', 'o', 'u')
and right(CITY,1) NOT IN ('a', 'e', 'i', 'o', 'u');

-- Higher Than 75 Marks

select name
from students
where marks > 75
order by RIGHT(name, 3), id

-- Employee Names

select name from employee
order by name

-- Employee Salaries

with cte as  (select *
from employee
where months < 10 )

select name
from cte
where salary > 2000
order by employee_id;

-- Type of Triangle

select 
    case
        when a+b > c and a+c > b and c+b > a then 
            case 
                when a = b and b = c and a = c   then 'Equilateral'
                when a = b or  b=c or a=c then 'Isosceles'
                when a != b and b != c and a != c then 'Scalene'
            end
        else 'Not A Triangle'
    end
from TRIANGLES;

-- The PADS

select 
    concat(name,'(',left(occupation,1),')')
from OCCUPATIONS
order by name;

select 
    concat('There are a total of ',occ_count, ' ',lower(occupation), 's.')
from (select occupation,count(*) as occ_count
                    from OCCUPATIONS
                    group by occupation) as t1
order by occ_count

-- Binary Tree Nodes

select 
    case 
        when p is null then cast(n as varchar) + ' Root'
        when n in (select distinct p from BST) then cast(n as varchar) + ' Inner'
        else cast(n as varchar) + ' Leaf'
    end
from BST
order by n

-- Revising Aggregations - The Count Function

select count(id)
from city
where population > 100000

-- Revising Aggregations - The Sum Function

SELECT SUM(population)
FROM city
WHERE district = 'California'

-- Revising Aggregations - Averages

select avg(population)
from city 
where district = 'California'

-- Average Population

select round(avg(population), 0 ) 
from city 

-- Japan Population

select sum(population)
from city
where countrycode = 'JPN'

-- Population Density Difference

select max(population) - min(population)
from city 

-- The Blunder

select ceiling(avg(cast(salary as numeric)) - avg(cast(replace(salary, '0', '') as numeric)))
from employees;

-- Top Earners

with total_earnings as 
        (select *, (salary * months) as earnings
        from employee),
        max_earning as 
        (select  max(total_earnings.earnings) max_e
        from total_earnings)
select max(earnings), count(*)
from total_earnings
where earnings = (select * from max_earning)

-- Weather Observation Station 2

with round_lat_lon as 
            (select 
                round(sum(lat_n), 2) lat,
                round(sum(long_w), 2) lan
             from station)

select cast(lat as numeric(20,2)) , cast(lan as numeric(20,2)) 
from round_lat_lon

-- Weather Observation Station 13

select cast(round(sum(lat_n),4) as numeric(20,4))
from station
where lat_n > 38.7880 and lat_n < 137.2345

-- Weather Observation Station 14

select cast(max(lat_n)as numeric(20,4))
from station
where lat_n < 137.2345

-- Weather Observation Station 15

with max_lat_n as (select max(lat_n) max_lat
from station
where lat_n < 137.2345)

select cast(long_w as numeric(32,4))
from station 
where LAT_N = (select * from max_lat_n)

-- Weather Observation Station 16

select cast(round(min(lat_n), 4) as numeric(32,4))
from station
where lat_n > 38.7780

-- Weather Observation Station 17

with cte as (select min(lat_n) max_lat
                from station
                where lat_n > 38.7780
            )
            
select cast(long_w as numeric(32,4))
from station
where lat_n = (select * from cte)

-- Population Census

select sum(city.population)
from city 
join country
    on CITY.CountryCode = COUNTRY.Code
where continent = 'Asia'

-- African Cities

select c.name
from city c
join country co
    on  c.CountryCode = co.Code
where co.CONTINENT = 'Africa'

-- Average Population of Each Continent


select co.continent, cast(round(avg(c.population),0) as numeric(20,0))
from city c
join country co
    on c.CountryCode = co.Code
group by co.continent

-- The Report

select distinct
    case 
        when g.grade < 8  then 'NULL'
        when  g.grade >= 8 then s.name
    end as name,
    g.grade,
    s.marks
from grades g
JOIN students s
on s.marks between g.min_mark and g.max_mark
order by 2 desc, 1 asc

-- Draw The Triangle 1

DECLARE @var int               
SELECT @var = 20 
while @var != 0
begin
print REPLICATE('* ', @var)
set @var -= 1
end

-- Draw The Triangle 2

declare @star int
select @star = 1
    while @star != 21
        begin
            print replicate('* ', @star)
            set @star += 1
        end


-- Weather Observation Station 18

select cast(Manhattan_Distance as numeric(32,4))

from (select round(abs(min(lat_n)- max(lat_n)) + abs(min(long_w)- max(long_w)), 4) "Manhattan_Distance"
from station) t1


-- Weather Observation Station 19

select 
    cast(round(Euclidean_distance, 4) as numeric(32, 4)) 
from
    (select 
        sqrt(power((max(lat_n)- min(lat_n)),2) + power((max(long_w)- min(long_w)), 2)) "Euclidean_distance"
    from station
    ) t1



-- Weather Observation Station 20
-- 1- Calculating the Median in MySQL.

with temptab as (select id, lat_n, row_number() over(order by lat_n) te
              from station) 

select 
case
    when count(*)%2 = 0 then round(
                                    (select avg(lat_n) 
                                         from temptab
                                              where te = (select count(*)/2 from temptab) 
                                                  or te = (select count(*)/2+1 from temptab)
                                    ),4)
                                
    else (select round(lat_n, 4)
          from temptab
          where te = (select floor(count(*)/2)+1 from temptab)
         )
         
end
from temptab


-- 2- Calculating the Median in MS SQL Server.

with temptab as (select id, lat_n, row_number() over(order by lat_n) te
              from station) 

select 
case
    when count(*)%2 = 0 then cast(
                                    (select avg(lat_n) 
                                         from temptab
                                              where te = (select floor(count(*)/2) from temptab) 
                                                  or te = (select floor( count(*)/2) +1 from temptab)
                                    )as numeric(10,4))
                                
    else (select cast (lat_n as numeric(10,4))
          from temptab
          where te = (select floor(count(*)/2)+1 from temptab)
         )
         
end
from temptab


















































