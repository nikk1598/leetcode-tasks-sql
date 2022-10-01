with cte as (
    select d.name as department,
           e.name as employee,
           e.salary,
           dense_rank() over(partition by d.id order by e.salary desc) as rank
    from Employee e
    join Department d
    on d.id = e.departmentId
)
select department, employee, salary
from cte
where rank=1