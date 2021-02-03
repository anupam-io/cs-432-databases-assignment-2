-- User id to delete = 2

delete from Cart where user_id = 2;
delete from Addresses where user_id = 2;
delete from Searches where user_id = 2;
delete from Users where id = 2;

select * from Reviews;
-- No deletion in Purchase
-- No deletion in Reviews