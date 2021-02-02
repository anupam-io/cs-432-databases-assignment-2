-- List all users who bought 
-- more than 3 electronic items and more than 3 novels.

create table e as (
    select user_id, sum(quantity) from Purchase
    inner join Products
    where Purchase.product_id = Products.id and Products.type = 'Electronics'
    group by user_id
);


create table n as (
    select user_id, sum(quantity) from Purchase
    inner join Products
    where Purchase.product_id = Products.id and Products.type = 'Novels'
    group by user_id
);
-- select * from e;
-- select * from n;

select e.user_id from e
inner join n
where e.user_id = n.user_id;


drop table e;
drop table n;

-- Not combining for better readability