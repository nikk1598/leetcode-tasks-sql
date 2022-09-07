# Write your MySQL query statement below
with cte as 
(
    select id, salary, dense_rank() over(order by salary desc) as rating
    from Employee
)
select max(salary) as SecondHighestSalary
from cte
where rating = 2
limit 1
    

