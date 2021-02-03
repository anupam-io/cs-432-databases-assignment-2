select user_id, product_id, Purchase.id as purchase_id from Purchase
inner join (
    select id from Users
    order by signup_time desc limit 1
)as t
where Purchase.user_id = t.id
order by Purchase.date_of_purchase desc limit 3
;