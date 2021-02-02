-- Part 1
select * from Products
where name like '%mi%';

-- Part 2
create table special_products as (
    select id from Products
    where name like '%mi%'
);

select user_id from Purchase
inner join special_products
where special_products.id = Purchase.product_id
group by user_id;

drop table special_products;