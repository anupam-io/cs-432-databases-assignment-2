-- User id to delete = 2

delete from Cart where user_id = 2;
delete from Addresses where user_id = 2;
delete from Users where id = 2;
-- No deletion in Purchase
-- No deletion in Reviews