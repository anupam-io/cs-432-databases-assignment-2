-- User id to delete = 2
update Users 
set name = 'Anonymous', password = null, city = null
where id = 3; 