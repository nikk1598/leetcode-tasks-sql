with row_num_cte_desc as (
  select product_id, new_price, row_number() over(partition by product_id order by change_date desc) as row_num_desc
  from Products
  where change_date <= '2019-08-16'
),

row_num_cte_acs as (
  select product_id, new_price, change_date, row_number() over(partition by product_id order by change_date) as row_num_acs
  from Products
)

select * from (
  select product_id, 10 as price
  from row_num_cte_acs
  where row_num_acs = 1
  and change_date > '2019-08-16'
) as not_changed_prices

union

select * from (
  select product_id, new_price as price
  from row_num_cte_desc
  where row_num_desc = 1
) as changed_prices




