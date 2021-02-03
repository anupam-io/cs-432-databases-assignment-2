create table Users(
    id int(10) unsigned auto_increment primary key
);

create table Reviews(
    id int(10) unsigned auto_increment primary key,
    user_id int(10) unsigned,

    foreign key (user_id) references Users(id) on delete set null
);


drop table Reviews;
drop table Users;