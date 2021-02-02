-- List all retailer ids 
-- whose products, user_id = 1 have purchased.

select retailer_id from Products
inner join (
    select product_id from Purchase
    where user_id = 1
    group by product_id
) as t
on Products.id = product_id
group by retailer_id
;