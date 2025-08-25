show databases;
create database store;
drop database store;
create database bike_store;
show databases;
use bike_store;
create table customers(customer_id int primary key not null,first_name varchar(50),last_name varchar(50),
phone varchar(50),email varchar(50),street varchar(50),city varchar(50),state varchar(50),zip_code int);
desc customers;
drop table if exists staffs;

create table staffs(staff_id int primary key,first_name varchar(50),last_name varchar(50),email varchar(50),phone varchar(44),active int,store_id int,manager_id int,
foreign key(store_id) references stores(store_id)
);
DROP TABLE IF EXISTS orders;

create table orders(order_id INT  PRIMARY KEY,
	customer_id INT,
	order_status tinyint NOT NULL,
	-- Order status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed
	order_date DATE NOT NULL,
	required_date DATE NOT NULL,
	shipped_date DATE,
	store_id INT NOT NULL,
	staff_id INT NOT NULL,
foreign  key(customer_id) references customers(customer_id),foreign key(staff_id) references staffs (staff_id),
foreign key(store_id) references stores(store_id));


drop table if exists stores;
create table stores(store_id int primary key,store_name varchar(45),phone varchar(55),email varchar(56),street varchar(56),city varchar(67),state varchar(56),zip_code varchar(45));

drop table if exists order_items;
create table order_items(order_id int ,item_id int,product_id int,quantity int,list_price int,discount int,foreign key(product_id)references products(product_id),
foreign key (order_id)references orders(order_id));

drop table if exists products;
create table products(product_id int primary key,product_name varchar(55),brand_id int,category_id int,model_year year,list_price float,foreign key(category_id)references categories(category_id),
foreign key(brand_id)references brands(brand_id));

drop table if exists categories;
create table categories(category_id int primary key,category_name varchar(55));
drop table if exists stocks;
create table stocks(store_id int,product_id int,quantity int,foreign key(store_id) references stores(store_id));

create table brands(brand_id int primary key,brand_name varchar(56));

show tables;
select * from stores;
select * from stocks;
select * from staffs;
select * from products;
select * from orders;
select * from order_items;
select * from customers;
select * from categories;
select * from brands;




