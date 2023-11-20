with prev_next_id as
 (
  select *, lag(id) over(order by id) as prev_id,
            lead(id) over(order by id) as next_id
  from Seat
 )
select * from (

    select prev_id as id, student
    from prev_next_id
    where id % 2 = 0

union all

    select next_id as id, student
    from prev_next_id
    where id % 2 != 0
    and next_id is not null

union all

    select id as id, student
    from prev_next_id
    where next_id is null and id % 2 != 0

order by id
)