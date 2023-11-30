with first_orders_cte as (
    select *, row_number() over(partition by customer_id order by order_date) row_num
    from Delivery
),
date_diffs_cte as (
    select customer_pref_delivery_date-order_date date_diff
    from first_orders_cte
    where row_num = 1
)
select round((select count(*) from date_diffs_cte where date_diff = 0)::numeric /
             (select count(*) from date_diffs_cte)::numeric, 4)
             *100 as immediate_percentage
from date_diffs_cte
limit 1


