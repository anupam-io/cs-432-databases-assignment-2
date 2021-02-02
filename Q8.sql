select * from Purchase
inner join (
    select id from Users
    order by signup_time desc limit 1
)as t
where Purchase.user_id = t.id;