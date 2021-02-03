-- Sort all laptops according to the price in increasing order


select name, price from Products
where type = 'Electronics' and subtype = 'Laptop'
order by price asc
;