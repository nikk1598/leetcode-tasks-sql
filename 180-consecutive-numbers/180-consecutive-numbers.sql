/* Write your PL/SQL query statement below */
with cte as(
   select num, 
          lag(num) over(order by id) as prev1,
          lag(num, 2) over(order by id) as prev2
    from Logs
)
select distinct num as ConsecutiveNums
from cte
where prev1 = num
and prev2 = num
and prev1 = prev2
