-- List the top 10 recommended products for the user_id=1 
-- based on the user’s purchase and 
-- search history(use any recommendation algorithm).


-- Recommending for user_id = 1
-- Based on user's purchase history
-- finding users who have bought the same product
-- find products brought by these products
create table friends as (
    select user_id from Purchase
    inner join (
        select product_id from Purchase
        where user_id = 1
    )as t
    where t.product_id = Purchase.product_id and user_id!=1
    group by user_id
);

select name from Products
inner join (
    select product_id from Purchase
    inner join friends
    where Purchase.id = friends.user_id 
)as t
where t.product_id = Products.id
;


-- Location based recommendation
-- create table friends as (
--     select id from Users
--     inner join (
--         select city from Users
--         where id = 1
--     ) as t
--     where Users.city = t.city and id!=1
-- );
-- select user_id from friends
-- inner join Purchase
-- where friends.id = Purchase.user_id
-- ;



drop table friends;