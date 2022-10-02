 CREATE TABLE Customers (
 	customer_num number,
	sortation VARCHAR2(100),
	id VARCHAR2(100),
	pw VARCHAR2(100),
	name VARCHAR2(100),
	address VARCHAR2(100),
	tel VARCHAR2(100),
	cell VARCHAR2(100),
	email VARCHAR2(100),
	emailAgree VARCHAR2(100),
	birth VARCHAR2(100)
);
select * from Customers;
DELETE FROM customers WHERE sortation='admin'

insert into customers(sortation, id, pw, name) values('admin', 'admin', 'admin', '비비엔다');
insert into customers(sortation, id, pw, name) values('user', 'user', 'user', '김민지');
insert into customers(sortation, id, pw, name) values('user', 'dd', 'dd', '김민지');
drop table customers
 CREATE TABLE orders (
 	order_num number,
 	order_date date,
	fabric VARCHAR2(100),
	filling VARCHAR2(100),
	pattern VARCHAR2(100),
	finishing VARCHAR2(100),
	color VARCHAR2(100),
	manufacturer VARCHAR2(100)
);

 CREATE TABLE manufacturers (
 	manu_num number,
	name VARCHAR2(100),
	rank number,
	order_rank number,
	review_rank number,
	fivestars_rank number,
	matching number,
	success_rate number,
	satisfaction_rate number,
	inventory_rate number
)
 CREATE TABLE production (
 	pro_num number,
 	order_date date,
	progress VARCHAR2(100),
	achievement VARCHAR2(100),
	shipment VARCHAR2(100)
)

select * from trend_analysis;

select * from trend_analysis where product_type='type02' and pattern='P03'
select * from trend_analysis where product_type='type02'

DELETE FROM trend_analysis WHERE product_name is null
