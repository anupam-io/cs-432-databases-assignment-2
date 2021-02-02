select * from Cart 
inner join (
    select id from Users
    order by signup_time asc limit 2
)as t
where t.id = Cart.user_id;