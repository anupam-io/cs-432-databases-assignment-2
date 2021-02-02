-- Print the UserId, mobile number, and Email Id 
-- of all users who have saved a product in the cart,
-- whose quantity is less than 5.



select id, phone, email from Users
inner join (
    select user_id from Cart
    group by user_id
    having min(quantity) < 5
) as t
where t.user_id = Users.id
;