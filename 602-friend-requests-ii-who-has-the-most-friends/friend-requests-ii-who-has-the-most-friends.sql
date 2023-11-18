with r_id as (
 select requester_id, count(*) as cnt_r_id
 from RequestAccepted
 group by requester_id),

a_id as (
 select accepter_id, count(*) as cnt_a_id
 from RequestAccepted
 group by accepter_id)

 select COALESCE(requester_id, accepter_id) as id, COALESCE(cnt_r_id, 0) + COALESCE(cnt_a_id, 0) as num
 from r_id
 full join a_id
 on r_id.requester_id = a_id.accepter_id
 order by num desc
 limit 1