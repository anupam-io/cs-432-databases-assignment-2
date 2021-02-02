update Products 
set price = price + 10*price/100
where exists(
    select * from (
        select product_id from Views
        where date(view_date) between date_sub(curdate(), interval 3 month) and curdate()
        group by product_id
        having count(product_id) >= 10
    ) as t
    where product_id = id
);

select * from Products;