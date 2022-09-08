# Write your MySQL query statement below
with cte1 as
(
    select count(*) as "cntCancelled", t.request_at as "request_atCancelled"
    from Trips t
    join Users uCl
    on uCl.users_id = t.client_id
    join Users uDr
    on uDr.users_id = t.driver_id
    where (t.status = 'cancelled_by_driver'
    or t.status = 'cancelled_by_client')
    and uCl.banned = 'No'
    and uDr.banned = 'No'
    and t.request_at between '2013-10-01' and '2013-10-03'
    group by request_at
),
cte2 as 
(
    select count(*) as "cntAll", t.request_at as "request_atAll"
    from Trips t
    join Users uCl
    on uCl.users_id = t.client_id
    join Users uDr
    on uDr.users_id = t.driver_id
    and uCl.banned = 'No'
    and uDr.banned = 'No'
    and t.request_at between '2013-10-01' and '2013-10-03'
    group by request_at
)
select request_atAll as "Day", round(coalesce(cntCancelled/cntAll, 0), 2) as "Cancellation Rate"
from cte1
right join cte2
on cte1.request_atCancelled = cte2.request_atAll
