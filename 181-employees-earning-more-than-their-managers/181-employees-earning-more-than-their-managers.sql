# Write your MySQL query statement below
with cte as
(
    select emp.name, emp.salary as eSal, man.salary as mSal
    from Employee emp
    join Employee man
    on emp.managerId = man.id
)
select name as Employee
from cte
where eSal > mSal
