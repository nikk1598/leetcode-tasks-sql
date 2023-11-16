-- Write your PostgreSQL query statement below
with cte as (
    select event_date, lead(event_date) over(partition by player_id order by event_date) as next_event_date,
            row_number() over(partition by player_id order by event_date) as row_number
    from Activity
)
select round(count(*)::numeric / (select count(distinct player_id)::numeric from Activity), 2) as fraction
from cte
where row_number = 1
and next_event_date-event_date = 1