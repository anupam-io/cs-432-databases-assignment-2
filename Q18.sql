-- List all products added to the database in the past 10 days

select name from Products
where date(added_time) between date_sub(curdate(), interval 10 day) and curdate()
;