-- List all electronics products in the price range of 10k-20k.

select * from Products 
where type = 'Electronics' and price between 10000 and 20000;
