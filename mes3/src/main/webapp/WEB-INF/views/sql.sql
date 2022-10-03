--------------------------
--------- 기준정보 ---------
--------------------------

--사용자
create table member(
num number not null,
company varchar2(100) not null,
userid varchar2(100) not null,
username varchar2(100) not null,
userpw varchar2(100) not null,
mainProcess varchar2(100) not null,
userRight varchar2(100) not null,
department varchar2(100),
contact varchar2(100),
email varchar2(100)
);

DELETE FROM member_mes WHERE userRight='slc1'

update member set userid='gaga', username='nana', userpw='d', mainProcess='x',userRight='x', department='', contact='', email=''where num='272'

create sequence mem_seq;


drop table member;

create table user_group(
ug_num number not null,
ug_name varchar2(100),
company varchar2(100)
);
select * from user_group;
drop table user_group;
insert into user_group values(ug_seq.nextval, '시스템 사용자', 'fourever');
insert into user_group values(ug_seq.nextval, '시스템 관리자', 'fourever');
DELETE FROM user_group WHERE ug_name='sfda'

create sequence ug_seq;

create table user_group_right(
group_name varchar2(100),
ugr_name varchar2(100),
ugr_id varchar2(100),
ugr_use varchar2(100),
company varchar2(100),
ugr_seq_num number
);

create sequence ugr_seq;
select * from user_group_right;
drop table user_group_right;
insert into user_group_right values('시스템 사용자', '사용자 관리','', '0', 'fourever');
insert into user_group_right values('시스템 사용자', '설정 관리','', '0', 'fourever');
insert into user_group_right values('시스템 사용자', '로케이션','', '1', 'fourever');
insert into user_group_right values('시스템 사용자', '공정 관리','', '1', 'fourever');
insert into user_group_right values('시스템 사용자', '거래처 관리','', '0', 'fourever');
insert into user_group_right values('시스템 사용자', '제품 관리','', '0', 'fourever');
insert into user_group_right values('시스템 사용자', '자재 관리','', '0', 'fourever');
insert into user_group_right values('시스템 사용자', 'BOM 관리','', '0', 'fourever');

insert into user_group_right values('시스템 관리자', '사용자 관리','', '0', 'fourever');
insert into user_group_right values('시스템 관리자', '설정 관리','', '0', 'fourever');
insert into user_group_right values('시스템 관리자', '로케이션','', '0', 'fourever');
insert into user_group_right values('시스템 관리자', '공정 관리','', '0', 'fourever');
insert into user_group_right values('시스템 관리자', '거래처 관리','', '0', 'fourever');
insert into user_group_right values('시스템 관리자', '제품 관리','', '0', 'fourever');
insert into user_group_right values('시스템 관리자', '자재 관리','', '0', 'fourever');
insert into user_group_right values('시스템 관리자', 'BOM 관리','', '0', 'fourever');



--설정 관리
--분류코드
create table clsfc_code (
cc_num number, --시퀀스 번호
cc_class varchar2(100), --분류코드 (부서, 품목 대분류...)
cc_use varchar2(100), --사용여부
cc_value varchar2(100), --시스템코드값
cc_name varchar2(100), --코드명
cc_expln varchar2(100), --코드설명
company varchar2(100)
);
select * from clsfc_code;
create sequence clsfc_seq;

insert into clsfc_code values(
clsfc_seq.nextval, '부서', '1', '001', '인사', ' d', 'fourever'
);
insert into clsfc_code values(
clsfc_seq.nextval, '품목대분류', '1', '001', '품목', ' d', 'fourever'
);
insert into clsfc_code values(
clsfc_seq.nextval, '시프트', '1', '001', '품목', ' d', 'fourever'
);
drop table clsfc_code


--로케이션
create table location (
lc_seq_num number, --시퀀스 번호
lc_class varchar2(100), --로케이션 분류
lc_parent varchar2(100), --상위 로케이션
lc_name varchar2(100), --로케이션 명
lc_num varchar2(100), --사용자 입력값
lc_type varchar2(100), --유형
lc_jang varchar2(100), --유형
lc_pok varchar2(100), --유형
lc_go varchar2(100), --유형
lc_yeol varchar2(100), --유형
lc_yeon varchar2(100), --유형
lc_dan varchar2(100), --유형
lc_memo varchar2(100), --유형
company varchar2(100)
);
select * from location;
drop table location;
create sequence lc_seq;
select * from location where lc_class='재고로케이션분류';

--공정관리
create table process(
pr_seq_num number, -- sql 부여 번호
pr_num varchar2(100), -- 사용자 입력 번호
pr_name varchar2(100),
pr_sortation varchar2(100),
pr_facilities varchar2(100),
pr_reviewer varchar2(100),
pr_approver varchar2(100),
pr_memo varchar2(100),
company varchar2(100)
)
create sequence pr_seq_num;
insert into process values(pr_seq_num.nextval, '0001', '공정명', '구분', '설비', '검토자', '승인자', '메모', 'fourever');
insert into process values(pr_seq_num.nextval, '0002', 'db 연결 완', '구분', '설비', '검토자', '승인자', '메모', 'fourever');

select * from process

drop table process

--공정관리 / 검사
create table inspection(
pr_num number, --어떤 공정의 번호인지
in_seq_num number,
in_code_a varchar2(100), --검사대분류
in_code_b varchar2(100), --검사중분류
in_code_c varchar2(100), --검사소분류
in_goods varchar2(100), --검사항목명
in_inputValue varchar2(100),
in_standard varchar2(100),
in_how varchar2(100),
in_max varchar2(100),
in_min varchar2(100),
in_unit varchar2(100),
in_sample varchar2(100), --시료수
in_sort varchar2(100), --정렬
in_self varchar2(100), --자주검사
company varchar2(100)
)

create sequence in_seq_num;
select * from inspection
drop table inspection;

-- 거래처
create table client (
ct_num number, --시퀀스
ct_mutual varchar2(100), --상호
ct_sortation varchar2(100), --구분
ct_repName varchar2(100), --대표자명
ct_businessNumber varchar2(100), --사업자번호
ct_chrgName varchar2(100), --담당자명
ct_postalCode varchar2(100), --우편번호
ct_address varchar2(100), --주소
ct_condition varchar2(100), --업태
ct_industry varchar2(100), --업종
ct_contact varchar2(100), --연락처
ct_fax varchar2(100), --fax
ct_email varchar2(100),
company varchar2(100)
);

insert into client(ct_num,ct_mutual,company ) values(client_seq.nextval, 'db연결, 삭제 완료 입력 남음', 'fourever')

create sequence client_seq;

select * from client
drop table client

DELETE FROM client_forever WHERE sortation='매출처'


--제품관리
create table goods (
gs_seq_num number, --제품번호 시퀀스
gs_num varchar2(100), --제품번호 입력받기
gs_name varchar2(100), --제품명
gs_sortation varchar2(100), --제품구분
gs_unit varchar2(100), --단위
gs_family varchar2(100), --제품군
gs_routing varchar2(100), --라우팅
gs_code_a varchar2(100), --품목대분류
gs_code_c varchar2(100), --품목소분류
gs_standard varchar2(100), --규격
gs_price varchar2(100), --단가
gs_client varchar2(100), --거래처
gs_packingUnit varchar2(100), --포장단위
gs_packingAmount varchar2(100), --포장단위수량
gs_safeAmount varchar2(100), --안전수량
gs_location varchar2(100), --로케이션
gs_memo varchar2(100), --메모
gs_attach varchar2(100), --첨부파일
gs_image varchar2(100), --이미지
company varchar2(100)
);

create sequence gs_seq_num;

select * from client_production where company='fourever' order by pro_name

DELETE FROM client_production WHERE pro_family='slc1';

select * from goods;

drop table goods

insert into goods(gs_seq_num, gs_name, company) values(gs_seq_num.nextval, 'db연결', 'fourever');

--자재관리
create table material (
ml_seq_num number, --자재 시퀀스 번호
ml_num  varchar2(100), --제품번호
ml_name varchar2(100), --제품명
ml_sortation varchar2(100), --제품구분
ml_uni varchar2(100), --단위
ml_family varchar2(100), --제품군
ml_routing varchar2(100), --라우팅
ml_code_a varchar2(100), --품목대분류
ml_code_c varchar2(100), --품목소분류
ml_standard varchar2(100), --규격
ml_price varchar2(100), --단가
ml_client varchar2(100), --거래처
ml_packingUnit varchar2(100), --포장단위
ml_packingAmount varchar2(100), --포장단위수량
ml_safeAmount varchar2(100), --안전수량
ml_location varchar2(100), --로케이션
company varchar2(100)
);
DELETE FROM st_product WHERE product_num=
select ml_seq_num from material
 
ALTER TABLE st_product ADD PRIMARY KEY (product_num);
select * from material;
drop table material;

create sequence ml_seq;
insert into material(ml_seq_num, ml_num, company) values(ml_seq.nextval, 'db연결', 'fourever');

--------------------------
--------- 주문관리 ---------
--------------------------
create table goods_order(
go_num varchar2(100), --주문번호 시퀀스
go_goods_seq varchar2(100), --주문제품 품목번호
go_goods_name varchar2(100), --주문제품 품목명
go_goods_count varchar2(100), --주문수량
go_client varchar2(100), --거래처
go_orderDate varchar2(100), --접수일자
go_dueDate varchar2(100), --납기일자
go_place varchar2(100),--고객발주번호
go_address varchar2(100), --배송지
go_price varchar2(100), --공급가액
go_amount varchar2(100), --합계금액
go_taxation varchar2(100), --과세형태
go_now varchar2(100), --처리상태
company varchar2(100) --회사
);
insert into goods_order(go_num, go_goods_seq, company) values(go_seq.nextval, 234, 'fourever');
select * from goods_order;
select * from goods_order where company='fourever'
create sequence go_seq;

--------------------------
--------- 자재관리 ---------
--------------------------

--자재발주
create table materials_order(
mo_num varchar2(100), --발주코드
mo_inputDate varchar2(100), --입력일자
mo_orderDate varchar2(100), --발주일자
mo_dueDate varchar2(100), --납기일자
mo_place varchar2(100),--납품장소
mo_effectivedate varchar2(100), --유효일자
mo_conditions varchar2(100), --결제조건
mo_address varchar2(100), --주소
mo_client varchar2(100), --발주업체
mo_contact varchar2(100), --연락처
mo_request varchar2(100), --요청사항
mo_amount varchar2(100), --총금액
mo_proName varchar2(100), --품목명
mo_complete varchar2(100), --완료
company varchar2(100) --회사
);
create sequence mat_seq;
drop table materials_order;

select * from materials_order;


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
ord_num number,
ord_schedule varchar2(100),
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
create sequence ord_seq;
insert into ct_workorder values(
'2022-8-16', 'CR09', '조립', '33', 'U',
 'E', '8', '7', '', '1332', '', 'fourever');
DELETE FROM ct_workorder WHERE ord_product_name='sdf'
drop table ct_workorder
select * from ct_workorder;

--출고 관리
create table goods_out (
go_no varchar2(100), --출고지시번호
go_client varchar2(100), --발주업체
go_dateOrder varchar2(100), --발주일
go_date varchar2(100), --납품일
go_amount varchar2(50), --총금
go_delivery varchar2(50), --배송처
go_charge varchar2(50), --담당자
go_contact varchar2(50), --연락처
go_count varchar2(50), --발주수량
go_pro_num varchar2(50), --제품번
company varchar2(100)
);
create sequence goods_out_seq;
select * from ct_goods_out_bound
drop table ct_goods_out_bound
insert into ct_goods_out_bound(out_no) VALUES (goods_out_seq.nextval||'hi')

--생산계획 pp
create table production_plan(
pp_num number,
pp_date varchar2(100),
pp_equipment_name varchar2(100),
pp_equipment_code varchar2(100),
pp_item_num varchar2(100),
pp_item_name varchar2(100),
company varchar2(100)
)
drop table production_plan;
create sequence pp_seq;
DELETE FROM production_plan WHERE pp_equipment_name='d'
select * from production_plan;




--bad 품질
create table bad_goods(
bg_num number,
bg_check varchar2(100),
bg_inspection varchar2(100),
bg_count varchar2(100),
bg_date varchar2(100),
bg_shift varchar2(100),
bg_process varchar2(100),
bg_facilities varchar2(100),
bg_worker varchar2(100),
bg_payer varchar2(100),
bg_pro varchar2(100), --선택한 제품의 이름
bg_dstrb varchar2(100), --물류 머들어가지..
company varchar2(100)
);

create sequence bg_seq;
drop table bg

select * from bg;

select * from bg where company='fourever' and bg_check='o'


--생산일보
create table daily_product(
da_num number,
da_date varchar2(100),
da_shift varchar2(100),
da_time varchar2(100),
da_process varchar2(100),
da_facilities varchar2(100),
company varchar2(100)
)

create sequence daily_seq;


create table out_order(
oo_num number,
oo_goods varchar2(100),
oo_company varchar2(100),
oo_count varchar2(100),
oo_orderdate varchar2(100),
oo_outdate varchar2(100),
oo_address varchar2(100),
oo_manager varchar2(100),
oo_tel varchar2(100),
oo_amount varchar2(100),
oo_state varchar2(100),
company varchar2(100)
)



