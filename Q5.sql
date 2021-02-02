-- Find phone numbers and emailIDs of all users who 
-- reside in the city ‘Madrid’ and have made a total 
-- purchase greater than or equal to Rs. 10000 in the past.


create table temp1 as (
    select user_id, total_price from Purchase
    where exists(
        select * from (
            select id from Users
            where city = 'Madrid'
        ) as t
        where id = user_id
    )
);

-- select * from aaa;

create table temp2 as (
    select user_id from temp1
    group by user_id
    having sum(total_price) >= 10000
);

select phone, email from Users
inner join temp2
on Users.id = temp2.user_id;

drop table temp1, temp2;


-- I have not merged the syntax for better readability