select id , student from (
select id-1 as id, student from seat where id % 2 = 0
union
select id+1 as id , student from seat where id % 2 = 1 and id != (select count(id) from seat)
union
select id , student from seat where id % 2 = 1 and id = (select count(id) from seat)
) as alias order by id