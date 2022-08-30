create sequence seq_board;

create table tbl_board (
bno number(10,0),
title varchar2(200) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate);

insert into tbl_board (bno, title, content, writer)
values(seq_board.nextval, 'test', 'test', 'user')

select * from tbl_board

insert into member values(mem_seq.nextval, 'test', 'test')

create sequence mem_seq;

select * from member

select userid from member where userid='dd' and userpw='dd'

select userid from (select * from member where userid='test' and userpw='tst' order by rownum desc) where rownum=1


--회원테이블 예시
create table member (
userid varchar2(100) not null,
username varchar2(100) not null,
userpw varchar2(100) not null,
mainProcess varchar2(100) not null,
userRight varchar2(100) not null,
department varchar2(100),
contact varchar2(100),
email varchar2(100),
memo varchar2(100),
attachedFile varchar2(100),
referenceImage varchar2(100)
);


--출고 관리 (ㅇ)
create table ct_goods_out_bound (
outbound_no varchar2(50) not null,
outbound_plan_no varchar2(50),
order_no varchar2(50),
plan_date varchar2(50),
outbound_expect_date varchar2(50),
customer_id varchar2(50),
man_in_charge varchar2(50),
customer_delivery varchar2(50),
contact_tel varchar2(50),
tenancy_id varchar2(15) not null,
reg_id varchar2(16),
reg_datetime char(14),
cor_id char(16),
correct_datetime char(14)
);


--입고 관리(ㅇ)
create table ct_goods_receive_issue (
goods_receive_issue_id varchar2(50) not null,
date_time varchar2(50) not null,
product_id varchar2(50) not null,
inventory_movement_type varchar2(50) not null,
qty varchar2(50),
location varchar2(50),
tenancy_id varchar2(15) not null,
reg_id varchar2(16),
reg_datetime char(14),
cor_id char(16) not null,
correct_datetime char(14),
purchase_id varchar2(15),
coil_no varchar2(50),
skuqty number,
remark varchar2(100)
);


--재고 관리(ㅇ)
create table ct_inven (
inven_id varchar2(50) not null,
product_id varchar2(50) not null,
inven_type varchar2(50) not null,
location_id varchar2(12),
inven_qty number,
remark varchar2(500),
tenancy_id varchar2(50) not null,
reg_id varchar2(50) not null,
reg_datetime varchar2(50) not null,
cor_id varchar2(50) not null,
correct_datetime varchar2(50) not null,
transaction_no varchar2(50)
);


--발주 관리(ㅇ)
create table ct_mat_purchase (
purchase_id varchar2(100) not null,
purchase_date varchar2(100),
delivery_date varchar2(100),
total_amount varchar2(100),
delivery_place varchar2(100),
expire_date varchar2(100),
payment_condition varchar2(100),
purchase_customer varchar2(100),
salesman varchar2(100),
salesman_tel varchar2(100),
salesman_mobile varchar2(100),
addr varchar2(100),
remark varchar2(500),
request varchar2(500),
tenancy_id varchar2(100) not null,
reg_id varchar2(100),
reg_datetime char(14),
cor_id varchar2(100),
correct_datetime varchar2(100)
);


--생산 관리(d)
create table ct_production_labor (
production_labor_id varchar2(100) not null,
production_performance_id varchar2(100) not null,
seq varchar2(100),
labor_classification varchar2(100),
labor_code varchar2(100),
worker_id varchar2(100),
remarks varchar2(500),
tenancy_id varchar2(100) not null,
reg_id varchar2(100),
reg_datetime char(14),
cor_id char(16),
correct_datetime char(14),
workorder_id varchar2(100),
start_time varchar2(100),
end_time varchar2(100)
);


--작업지시(d)
create table ct_workorder (
workorder_id varchar2(100) not null,
prd_schedule_year varchar2(100),
prd_schedule_month varchar2(100),
prd_schedule_day varchar2(100),
prd_schedule_detail_seq varchar2(100),
product_id varchar2(100) not null,
order_no varchar2(100),
order_detail_seq varchar2(100),
from_schedule_yn varchar2(100),
from_order_yn varchar2(100),
from_result_yn varchar2(100),
tenancy_id varchar2(100) not null,
reg_id varchar2(100),
reg_datetime char(14),
cor_id varchar2(100),
correct_datetime varchar2(100),
attach_file blob,
attachfile_name varchar2(100)
);


--공정관리(d)
create table st_process (
process_id varchar2(100) not null,
process_name varchar2(100) not null,
main_equipment_id varchar2(100),
reviewer_id varchar2(100),
grantor_id varchar2(100),
remark varchar2(4000),
tenancy_id varchar2(100) not null,
reg_id varchar2(100),
reg_datetime char(14),
cor_id char(16),
correct_datetime char(14),
process_classification_code varchar2(100) not null,
image blob
);


--품목관리(d)
create table st_product (
product_id varchar2(100) not null,
product_name varchar2(100),
class_code_a varchar2(100),
class_code_b varchar2(100),
class_code_c varchar2(100),
vehicle_type varchar2(100),
main_process_id varchar2(100),
remark varchar2(4000),
tenancy_id varchar2(100) not null,
reg_id varchar2(100),
reg_datetime char(14),
cor_id char(16),
correct_datetime char(14),
vehicle_report_type varchar2(100),
product_class_code varchar2(100),
unit varchar2(100),
spec varchar2(100),
price varchar2(100),
sku varchar2(100),
process_routing_id varchar2(100),
image blob,
skuqty varchar2(100),
attach_file blob,
attachfile_name varchar2(100)
);


--생산 관리(d)
create table st_user (
user_id varchar2(100) not null,
user_name varchar2(100),
dept_code char(8),
title_code char(2),
tel varchar2(100),
office_tel varchar2(100),
email varchar2(100),
status_code char(2),
pwd varchar2(100),
joindate char(8),
resigndate char(8),
autogragh_pic blob,
tenancy_id varchar2(100) not null,
reg_id varchar2(100),
reg_datetime char(14),
cor_id char(16),
correct_datetime char(14),
admin_user_yn char(10),
processid varchar2(100),
remark varchar2(200),
profile_pic blob
);




















