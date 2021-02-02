-- Retailers
create table Retailers(
    id int(10) unsigned auto_increment primary key,
    email varchar(50) not null unique,
    name varchar(50) not null,
    city_name varchar(50) not null
);

-- Products
create table Products(
    id int(10) unsigned auto_increment primary key,
    name varchar(50) not null,
    type varchar(50) not null,
    retailer_id int(10) unsigned not null,
    
    description varchar(500) default null,
    manufacture_date date default null,
    added_time datetime not null,

    price int(10) default null,
    author varchar(200) default null,
    
    foreign key (retailer_id) references Retailers(id),
    check (type in ('Novels', 'Electronics', 'Clothes'))
);

-- Users
create table Users(
    id int(10) unsigned auto_increment primary key,
    email varchar(50) not null unique,
    password varchar(50) default null,
    phone varchar(10) default null,
    signup_time datetime default null,
    
    name varchar(50) default null,
    city varchar(50) default null
);

-- Addresses
create table Addresses(
    id int(10) unsigned auto_increment primary key,
    user_id int(10) unsigned not null,
    description varchar(500) not null,

    foreign key (user_id) references Users(id)
);

-- Reviews
create table Reviews(
    id int(10) unsigned auto_increment primary key,
    user_id int(10) unsigned not null,
    description varchar(500) not null,
    product_id int(10) unsigned not null,

    foreign key (user_id) references Users(id),
    foreign key (product_id) references Products(id)
);

-- Views
create table Views(
    id int(10) unsigned auto_increment primary key,
    product_id int(10) unsigned not null,
    view_date date not null,

    foreign key (product_id) references Products(id)
);

-- Cart
create table Cart(
    id int(10) unsigned auto_increment primary key,
    user_id int(10) unsigned not null,
    product_id int(10) unsigned not null,
    quantity int(10) unsigned not null,

    foreign key (user_id) references Users(id),
    foreign key (product_id) references Products(id)
); 

-- Purchase
create table Purchase(
    id int(10) unsigned auto_increment primary key,
    user_id int(10) unsigned not null,
    product_id int(10) unsigned not null,
    quantity int(10) unsigned not null,
    total_price int(10) unsigned not null,
    date_of_purchase date not null,

    foreign key (user_id) references Users(id),
    foreign key (product_id) references Products(id)
);