with cte as (
 select e2.id, e2.name, count(*) as cnt
 from Employee e1
 join Employee e2
 on e1.managerId = e2.id
 group by e2.id, e2.name)
 
select name
from cte
where cnt >= 5

