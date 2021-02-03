-- Write a query to update the discount on 
-- all new products by 15% and 
-- store it as a new table holi_Deals

drop table if exists holi_Deals;

create table holi_Deals as (
    select * from Products
    where date(added_time) 
    between date_sub(curdate(), interval 100 day) and curdate()
);

update holi_Deals
set discount = 15
;

select name, price, discount from holi_Deals;