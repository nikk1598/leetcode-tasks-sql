with orders_count_in_2019 as (
 select buyer_id, count(order_id) as orders_in_2019 
 from Orders 
 where EXTRACT(year from order_date) = '2019'
 group by buyer_id)

select u.user_id as buyer_id, u.join_date, coalesce(o.orders_in_2019, 0) as orders_in_2019
from Users u
left join orders_count_in_2019 o
on u.user_id = o.buyer_id

