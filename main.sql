drop database db_X;
create database db_X;
use db_X;

-- Retailers schema
create table Retailers(
    id int(10) unsigned auto_increment primary key,
    pname varchar(50) not null,
    plocation varchar(50) not null
);

insert into Retailers (pname, plocation) values 
("Suraj stores", "Palaj"),
("Palak stores", "Kolkata"),
("Rakesh stores", "Jaipur");

-- Products schema
create table Products(
    id int(10) unsigned auto_increment primary key,
    name varchar(50) not null,
    type varchar(50) not null,
    retailer_id int(10) unsigned not null,
    description varchar(500) not null,
    manufacture_date date not null,
    price int(10) NOT NULL,
    -- reviews ...


    constraint chk_ret foreign key (retailer_id) references Retailers(id),
    constraint chk_type check (type in ('Novels', 'Electronics', 'Clothes'))
);

insert into Products (name, retailer_id, type, description, manufacture_date, price) values 
("High in the sky", 1, 'Novels', 'a beautiful book', '2020-01-01', 200),
("Blue Jeans", 2, 'Clothes', 'jeans made for men', '2020-02-09', 700);
update Products set price = 1000 where id = 1;

select * from Retailers;
select * from Products;




create table Users(
    id int(10) unsigned auto_increment primary key,
    name varchar(50) not null
);
insert into Users (name) values 
('Anonymous'),
('Sam'),
('Pat');

create table Reviews(
    user_id int(10) unsigned not null,
    description varchar(500) not null,
    product_id int(10) unsigned not null,
    constraint chk_usr foreign key (user_id) references Users(id),
    constraint chk_pdt foreign key (product_id) references Products(id)
);

select * from Users;
insert into Reviews (user_id, product_id, description) values
(1, 1, "readable book"),
(1, 2, "very tight"),
(2, 1, "nice words used"),
(2, 2, "beautiful piece of cloth");




select * from Reviews
where product_id = 2;

