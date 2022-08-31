--사용자
create table member_mes(
num number not null,
company varchar2(100) not null,
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

DELETE FROM member_mes WHERE userid='dd'


create sequence mes_seq;

drop sequence mes_seq;

select * from member_mes

-- 포에버
insert into member_mes values(
mes_seq.nextval, 'fourever', 'fourever01', 'fourever01', 'fourever01',
'포장', 'manager', '포장', 'test', 'test', 'test', null, 'test')
 
 -- 대창앵글몰
 insert into member_mes values(
mes_seq.nextval, 'daechang', 'daechang01', 'daechang01', 'daechang01',
'포장', 'manager', '포장', 'test', 'test', 'test', null, 'test')
 
 --에스비유엠
 insert into member_mes values(
mes_seq.nextval, 'sbum', 'sbum01', 'sbum01', 'sbum01',
'포장', 'manager', '포장', 'test', 'test', 'test', null, 'test')
 
 --에스비유코리아
 insert into member_mes values(
mes_seq.nextval, 'sbu', 'sbu01', 'sbu01', 'sbu01', 
'포장', 'manager', '포장', 'test', 'test', 'test', null, 'test')

 --이지
  insert into member_mes values(
mes_seq.nextval, 'easy', 'easy01', 'easy01', 'easy01', 
'포장', 'manager', '포장', 'test', 'test', 'test', null, 'test')

--이커버스
  insert into member_mes values(
mes_seq.nextval, 'ecovers', 'ecovers01', 'ecovers01', 'ecovers01', 
'포장', 'manager', '포장', 'test', 'test', 'test', null, 'test')

--수영산업
  insert into member_mes values(
mes_seq.nextval, 'sy', 'sy01', 'sy01', 'sy01', 
'포장', 'manager', '포장', 'test', 'test', 'test', null, 'test')

select * from member_mes

DELETE FROM member_mes WHERE userRight='slc1'

drop table member_mes;


--제품
create table client_production (
pro_num number, --제품번호
pro_name varchar2(100), --제품명
pro_code_a varchar2(100), --품목대분류
pro_code_b varchar2(100), --품목소분류
pro_family varchar2(100), --제품군
pro_unit varchar2(100), --입력단위
pro_standard varchar2(100), --기준
pro_how varchar2(100), --방법
pro_work varchar2(100), --작업구분
company varchar2(100)
);

create sequence pro_seq;

select * from client_production where company='fourever' order by pro_name

DELETE FROM client_production WHERE pro_family='액체형제조';

select * from client_production

  insert into client_production values('플레버(식품첨가물) 4L', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버(식품첨가물) 18L', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버(기구등 살균소독제) 300mL', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버(기구등 살균소독제) 350mL', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버(기구등 살균소독제) 1L', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버(기구등 살균소독제) 4L', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버(기구등 살균소독제) 18L', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 30mL', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 60mL', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 300mL', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 350mL', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 500mL', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 1L', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 4L', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 18L', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 원터치 냉장고용', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 원터치 신발장용', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 원터치 옷장용', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 원터치 화장실용', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  insert into client_production values('플레버 원터치 차량용', '약품', '플레버', '완제품', '','','육안검사','','fourever');
  
  insert into client_production values(
  '선반', 'daechang99', '진열','daechang');
    insert into client_production values(
  '엔진', 'easy8','조립', 'easy');
    insert into client_production values(
  '드론', 'ec0', '완제품', 'ecovers');
    insert into client_production values(
  '스토리지', 'sbu09', '완제품' , 'sbu');
    insert into client_production values(
  '마스크', 'sbum111', '조립', 'sbum');
    insert into client_production values(
  '포장박스', '박스', '1호' , '종이박스', '갯수', 'KS', '육안검사', '육안검사', 'sy');
    insert into client_production values(
  '플레버 신선도 유지제', '약품', '유지제' , '액체형제조', '갯수', 'KS', '육안검사', '육안검사', 'fourever');
    insert into client_production values(
  'MAX 24', '하드웨어', '스토리지' , '스토리지', '갯수', 'KS', '육안검사', '육안검사', 'sbu');
  
drop table client_production

-- 거래처
create table client_forever (
num number not null,
mutual varchar2(100),
businessCondition varchar2(100),
sortation varchar2(100),
sector varchar2(100),
repName varchar2(100), --대표
contact varchar2(100),
businessNumber varchar2(100), --사업자등록번호
fax varchar2(100), --중분류
chrgName varchar2(100), --담당자명
client_email varchar2(100),
address varchar2(100),
memo varchar2(100),
postalCode varchar2(100),
company varchar2(100)
);

create sequence client_forever_seq;

insert into client_forever values(client_forever_seq.nextval, '유니철강재', '상', '매입처', 
'개발', '양승호', '010-1234-5678', '101-24-14689', '062-333-3333', null, null, null, null, null, 'daechang');
insert into client_forever values(client_forever_seq.nextval, '남동철재', '상', '매입처', 
'개발', '이서연', '010-9876-4533', '111-87-98899', '062-333-3333', null, null, null, null, null, 'daechang');


insert into client_forever values(client_forever_seq.nextval, '유니화학', '상', '매입처', 
'개발', '강동호', '010-9876-4045', '123-097-47756', '062-333-3333', null, null, null, null, null, 'fourever');

insert into client_forever values(client_forever_seq.nextval, '유니제지', '상', '매입처', 
'개발', '강동호', '010-9876-4045', '123-097-47756', '062-333-3333', null, null, null, null, null, 'sy');

--sbu
insert into client_forever values(client_forever_seq.nextval, '유니제지', '상', '매입처', 
'개발', '강동호', '010-9876-4045', '123-097-47756', '062-333-3333', null, null, null, null, null, 'sbu');

--sbum
insert into client_forever values(client_forever_seq.nextval, '유니제지', '상', '매입처', 
'개발', '강동호', '010-9876-4045', '123-097-47756', '062-333-3333', null, null, null, null, null, 'sbum');

select * from client_forever
drop table client_forever

DELETE FROM client_forever WHERE sortation='매출처'

--품목
create table st_product (
product_num number not null,
product_name varchar2(100) not null,
product_classification varchar2(100) not null, --구분
unit varchar2(100) not null, --단위
product_class_code varchar2(100), --안씀
process_routing_id varchar2(100), --라우팅
class_code_a varchar2(100), --대분류
class_code_b varchar2(100), --중분류
class_code_c varchar2(100), --소분류 --안씀
product_count varchar2(100), --수량
company varchar2(100)
);
DELETE FROM st_product WHERE product_num='60'
select * from st_product
select * from st_product where company='fourever' order by product_num
 
ALTER TABLE st_product ADD PRIMARY KEY (product_num);

--포에버 부자재
   insert into st_product values(
st_product_seq.nextval, '건', '부자재', '30mL', '5000', '생산',
 '화학', '정밀화학', '원재', '30', 'fourever');
 
 
   insert into st_product values(
st_product_seq.nextval, '고무캡', '부자재', '개수', '5000', '생산',
 '고무캡', '원터치', '원재', '30', 'fourever'); 
    insert into st_product values(
st_product_seq.nextval, '기둥', '부자재', '개수', '5000', '생산',
 '기둥', '원터치', '원재', '30', 'fourever'); 
 
      insert into st_product values(
st_product_seq.nextval, '단상자', '부자재', '300mL', '5000', '생산',
 '단상자', '플레버', '원재', '3', 'fourever'); 
      insert into st_product values(
st_product_seq.nextval, '단상자', '부자재', '350mL', '5000', '생산',
 '단상자', '플레버', '원재', '3', 'fourever'); 
       insert into st_product values(
st_product_seq.nextval, '단상자', '부자재', '500mL', '5000', '생산',
 '단상자', '플레버', '원재', '3', 'fourever'); 
      insert into st_product values(
st_product_seq.nextval, '단상자', '부자재', '1L', '5000', '생산',
 '단상자', '플레버', '원재', '3', 'fourever'); 
 
     insert into st_product values(
st_product_seq.nextval, '단상자', '부자재', '300mL', '5000', '생산',
 '단상자', '플레버(기구등의 살균소독제)', '원재', '3', 'fourever'); 
      insert into st_product values(
st_product_seq.nextval, '단상자', '부자재', '350mL', '5000', '생산',
 '단상자', '플레버(기구등의 살균소독제)', '원재', '3', 'fourever'); 
      insert into st_product values(
st_product_seq.nextval, '단상자', '부자재', '1L', '5000', '생산',
 '단상자', '플레버(기구등의 살균소독제)', '원재', '3', 'fourever'); 
      insert into st_product values(
st_product_seq.nextval, '단상자', '부자재', '300mL', '5000', '생산',
 '단상자', '플레버(식품첨가물)', '원재', '30', 'fourever'); 
      insert into st_product values(
st_product_seq.nextval, '단상자', '부자재', '350mL', '5000', '생산',
 '단상자', '플레버(식품첨가물)', '원재', '30', 'fourever'); 
      insert into st_product values(
st_product_seq.nextval, '단상자', '부자재', '1L', '5000', '생산',
 '단상자', '플레버(식품첨가물)', '원재', '30', 'fourever'); 
 
      insert into st_product values(
st_product_seq.nextval, '단상자', '부자재', ' ', ' ', '생산',
 '단상자', '원터치', '원재', '660', 'fourever'); 
 
 insert into st_product values(
st_product_seq.nextval, '단상자(개입)', '부자재', '개수', ' ', '생산',
 '단상자', '원터치', '원재', '660', 'fourever'); 
 
  insert into st_product values(
st_product_seq.nextval, '디스펜서', '부자재', '개수', ' ', '생산',
 '디스펜서', '원터치', '원재', '60', 'fourever');
 
   insert into st_product values(
st_product_seq.nextval, '라벨 300mL', '부자재', '개수', '개수', '생산',
 '라벨', '플레버(식품첨가물)', '원재', '100', 'fourever');
 insert into st_product values(
st_product_seq.nextval, '라벨 350mL', '부자재', '개수', ' ', '생산',
 '라벨', '플레버(식품첨가물)', '원재', '100', 'fourever');
  insert into st_product values(
st_product_seq.nextval, '라벨 1L', '부자재', '개수', ' ', '생산',
 '라벨', '플레버(식품첨가물)', '원재', '100', 'fourever');
  insert into st_product values(
st_product_seq.nextval, '라벨 3L', '부자재', '개수', ' ', '생산',
 '라벨', '플레버(식품첨가물)', '원재', '100', 'fourever');
  insert into st_product values(
st_product_seq.nextval, '라벨 18L', '부자재', '개수', ' ', '생산',
 '라벨', '플레버(식품첨가물)', '원재', '100', 'fourever');
 
    insert into st_product values(
st_product_seq.nextval, '용기 30mL', '부자재', '개수', '개수', '생산',
 '용기', ' ', '원재', '1000', 'fourever');
   insert into st_product values(
st_product_seq.nextval, '실링지 300mL', '부자재', '개수', '개수', '생산',
 '실링지', ' ', '원재', '1000', 'fourever');
 insert into st_product values(
st_product_seq.nextval, '실링지 350mL', '부자재', '개수', ' ', '생산',
 '실링지', ' ', '원재', '1000', 'fourever');
  insert into st_product values(
st_product_seq.nextval, '용기 500mL', '부자재', '개수', ' ', '생산',
 '용기', ' ', '원재', '1000', 'fourever');
  insert into st_product values(
st_product_seq.nextval, '실링지 1L', '부자재', '개수', ' ', '생산',
 '실링지', ' ', '원재', '1000', 'fourever');
  insert into st_product values(
st_product_seq.nextval, '실링지 4L', '부자재', '개수', ' ', '생산',
 '실링지', ' ', '원재', '1000', 'fourever');
  insert into st_product values(
st_product_seq.nextval, '실링지 18L', '부자재', '개수', ' ', '생산',
 '실링지', ' ', '원재', '1000', 'fourever');
   insert into st_product values(
st_product_seq.nextval, '자동건', '부자재', '개수', ' ', '생산',
 '본품', '', '원재', '1000', 'fourever');
 
 --포에버 원자재
  insert into st_product values(
st_product_seq.nextval, '아염소산나트륨', '원자재', 'L', '5000', '원자재 투입',
 '화학', '정밀화학', '원재', '5', 'fourever');
  insert into st_product values(
st_product_seq.nextval, '무수구연산', '원자재', 'L', '300', '원자재 투입',
 '화학', '정밀화학', '원재', '3', 'fourever');
  insert into st_product values(
st_product_seq.nextval, '제1인산나트륨', '원자재', 'L', '250', '원자재 투입',
 '화학', '정밀화학', '원재', '70', 'fourever');
  insert into st_product values(
st_product_seq.nextval, '고흡수성수지', '원자재', 'm', '5000', '원자재 투입',
 '화학', '정밀화학', '원재', '10', 'fourever');
 
insert into st_product values(
st_product_seq.nextval, '알루미늄', '원자재', 'L', '5000', '원자재 투입',
 '화학', '정밀화학', '원재', '50', 'daechang');
 
insert into st_product values(
st_product_seq.nextval, '알루미늄', '원자재', 'L', '5000', '원자재 투입',
 '화학', '정밀화학', '원재', '50', 'easy');
 
 insert into st_product values(
st_product_seq.nextval, '알루미늄', '원자재', 'L', '5000', '원자재 투입',
 '화학', '정밀화학', '원재', '50', 'ecovers');
 
 insert into st_product values(
st_product_seq.nextval, '스테인리스', '원자재', 'L', '5000', '원자재 투입',
 '화학', '정밀화학', '원재', '50', 'sbu');
 
 insert into st_product values(
st_product_seq.nextval, '부직포', '원자재', 'L', '5000', '원자재 투입',
 '화학', '정밀화학', '원재', '50', 'sbum');
 
 insert into st_product values(
st_product_seq.nextval, '알루미늄', '원자재', 'L', '5000', '원자재 투입',
 '화학', '정밀화학', '원재', '50', 'sy');
 


drop table st_product;

create sequence st_product_seq;


--생산계획
create table 




--생산일보


--생산실적조회
create table ct_production_labor_forever (
num number not null,
productionDate date not null,
shift varchar2(100) not null,
process varchar2(100) not null,
facilities varchar2(100) not null,
product_id varchar2(100) not null,
process_routing_id varchar2(100),
performanceQuantity varchar2(100), 
goodProductQuantity varchar2(100), 
defectQuantity varchar2(100), 
defectCode varchar2(100),
department varchar2(100),
writer varchar2(100),
views varchar2(100)
);

drop table ct_production_labor_forever

create sequence ct_production_labor_forever_seq;

insert into ct_production_labor_forever values(
ct_production_labor_forever_seq.nextval, sysdate, '4', '5', '4', '5', '6',
 '7', '8', '9', '0', '1', '12', '12')
 
 insert into ct_production_labor_forever values(
ct_production_labor_forever_seq.nextval, sysdate, 'Day', '가공', 'K-3', 'OS12', '3L01Y21',
 '172', '170', '2', 'E-026', '설비부', '김수빈', '5-30');

insert into ct_production_labor_forever values(
ct_production_labor_forever_seq.nextval, sysdate, 'Night', '운반', 'A-1', 'OS12', '1A01Q21',
 '1435', '1430', '5', 'S-002', '생산부', '엄지원', '06-14');

insert into ct_production_labor_forever values(
ct_production_labor_forever_seq.nextval, sysdate, 'D/E', '품질검사', 'K-5', 'OS12', '6R01G21',
 '684', '682', '2', 'A-002', '기술지원부', '최다빈', '06-28');
 
 select * from ct_production_labor_forever

--BOM


-- 작업지시 15
create table ct_workorder (
ord_schedule date,
ord_code varchar2(100), --설비코드
ord_name varchar2(100), --설비명
ord_count varchar2(100), --작업수
ord_product_id varchar2(100), --품번
ord_product_name varchar2(100), --품명
ord_work varchar2(100), --작업순서
ord_planned_quantity varchar2(100), --계획수량
ord_performance_quantity varchar2(100), --실적수량
ord_remarks varchar2(100), --비고
ord_order_no varchar2(100), --작업지시번호
company varchar2(100) -- 회사
);

insert into ct_workorder values(
'2022-8-16', 'CR09', '조립', '33', 'U',
 'E', '8', '7', '', '1332', '', 'sy');

drop table ct_workorder
select * from table ct_workorder

--출고 관리 (x)
create table ct_goods_out_bound (
outbound_no varchar2(50) not null, --출고번호
outbound_plan_no varchar2(50), --출고계획번호
outbound_plan_date varchar2(50), --지시일자
man_in_charge varchar2(50), --담당자
out_bound_client varchar2(100), --거래처
outbound_expect_date varchar2(50), --출고예정일
customer_delivery varchar2(50), --배송처
contact_tel varchar2(50), --연락처
customer_id varchar2(50),
tenancy_id varchar2(15) not null,
reg_id varchar2(16),
reg_datetime char(14),
cor_id char(16),
correct_datetime char(14)
);


--생산계획 pp
create table production_plan(
pp_num number,
pp_date date,
pp_equipment_name varchar2(100),
pp_equipment_code varchar2(100),
pp_item_num varchar2(100),
pp_item_name varchar2(100),
company varchar2(100)
)
drop table production_plan;
create sequence pp_seq;

select * from production_plan;

insert into production_plan values(
pp_seq.nextval, '2022-08-22', '선로','BL09', '', '박스','sy'
);


--자재발주
create table materials_order(
mat_num number, --발주번호
mat_inputDate date, --입력일자
mat_orderDate date, --발주일자
mat_dueDate date, --납기일자
mat_place varchar2(100),--납품장소
mat_effectivedate date, --유효일자
mat_conditions varchar2(100), --결제조건
mat_address varchar2(100), --주소
mat_charge varchar2(100), --담당자
mat_contact varchar2(100), --연락처
mat_request varchar2(100), --요청사항
mat_amount varchar2(100), --총금액
mat_productNum number, --품목번호
company varchar2(100), --회사
constraint fk_prdnum foreign key(mat_productNum) references st_product(product_num)
);
create sequence mat_seq;
drop table materials_order;

insert into materials_order (
mat_num, 
mat_orderDate, 
mat_dueDate,
company
) 
VALUES 
(
01,
'2022-08-10',
'2022-08-12',
'fourever'
)
















