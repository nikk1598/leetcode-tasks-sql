with sum_weight as (
  select *, sum(weight) over(order by turn) as sum_weight
  from Queue)
select person_name
from sum_weight
where sum_weight <= 1000
order by sum_weight desc
limit 1