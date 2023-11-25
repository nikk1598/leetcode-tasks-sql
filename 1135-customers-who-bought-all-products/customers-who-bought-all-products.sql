with distinct_customer as (
 select distinct *
 from Customer
 )
select customer_id
from distinct_customer
group by customer_id
having count(*) = (select count(*) from product)