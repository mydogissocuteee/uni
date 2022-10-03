package com.uni.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.uni.domain.goodsVO;
import com.uni.domain.inspectionVO;
import com.uni.domain.locationVO;
import com.uni.domain.materialVO;
import com.uni.domain.MemberVO;
import com.uni.domain.badVO;
import com.uni.domain.clientVO;
import com.uni.domain.codeVO;
import com.uni.domain.dailyVO;
import com.uni.domain.goodsOrderVO;
import com.uni.domain.materials_orderVO;
import com.uni.domain.outBoundVO;
import com.uni.domain.proOrderVO;
import com.uni.domain.processVO;
import com.uni.domain.productionPerformanceVO;
import com.uni.domain.productionPlanVO;
import com.uni.domain.userGroupRightVO;
import com.uni.domain.userGroupVO;
import com.uni.domain.workOrderVO;


public interface BoardMapper {
	
	//로그인
	@Select("select * from (select * from member where userid='${vo.getUserid}' and userpw='${vo.getUserpw}' order by rownum desc) where rownum=1")
	public MemberVO login(@Param("vo") MemberVO vo );
		
	// 사용자관리 조회
	@Select("select * from member where company='${company}' order by num")
	public List<MemberVO> userSelect(@Param("company") String company);
	
	// 추가
	@Insert("insert into member values(mes_seq.nextval, '${vo.company}', '${vo.userid}', '${vo.username}', '${vo.userpw}', '${vo.mainProcess}', '${vo.userRight}', '${vo.department}', '${vo.contact}', '${vo.email}')")
	public void userInsert(@Param("vo") MemberVO vo);
	
	// 삭제
	@Delete("DELETE FROM member WHERE num=${num} and company='fourever'")
	public void userDelete(@Param("num") String num);
	
	// 수정
	@Update("update member set userid='${vo.userid}', username='${vo.username}', userpw='${vo.userpw}', mainProcess='${vo.mainProcess}',userRight='${vo.userRight}',"
			+ " department='${vo.department}', contact='${vo.contact}', email='${vo.email}' where num='${vo.num}'")
	public void userUpdate(@Param("vo") MemberVO vo);
	
	// 사용자그룹 조회
	@Select("select * from user_group where company='${company}'")
	public List<userGroupVO> userGroupSelect(@Param("company") String company);
	
	// 추가
	@Insert("insert into user_group values(ug_seq.nextval, '${vo.ug_name}', '${vo.company}')")
	public void userGroupInsert(@Param("vo") userGroupVO vo);
	
	// 삭제
	@Delete("DELETE FROM user_group WHERE ug_num=${ug_num}")
	public void userGroupDelete(@Param("ug_num") String ug_num);
	
	// 사용자그룹 권한 조회
	@Select("select * from user_group_right where group_name='${group_name}'")
	public List<userGroupRightVO> userGroupRightSelect(@Param("group_name") String group_name);
	
	// 추가 - 사용자그룹 추가하면 반복문 안에 들어갈 것
	@Insert("insert into user_group_right values('${vo.group_name}', '${vo.ugr_name}', '${vo.ugr_id}', '${vo.ugr_use}', '${vo.company}', ugr_seq.nextval)")
	public void userGroupRightInsert(@Param("vo") userGroupRightVO vo);
	
	// 삭제
	@Delete("DELETE FROM user_group_right WHERE group_name='${vo.group_name}' and ugr_name='${vo.ugr_name}' and company='${vo.company}'")
	public void userGroupRightDelete(@Param("vo") userGroupRightVO vo);
	
	// 수정
	@Update("update user_group_right set ugr_use='${ugr_use}'"
			+ " where group_name='${group_name}' and ugr_name='${ugr_name}' and company='${company}'")
	public void userGroupRightUpdate(@Param("group_name") String group_name, @Param("ugr_name") String ugr_name, @Param("ugr_use") String ugr_use, @Param("company") String company);
	
	// 분류코드 조회
	@Select("select * from clsfc_code where cc_class='${class_name}' and company='${company}'")
	public List<codeVO> codeSelect(@Param("class_name") String class_name, @Param("company") String company);
	
	// 추가
	@Insert("insert into clsfc_code values(clsfc_seq.nextval, '${vo.cc_class}', '${vo.cc_use}', '${vo.cc_value}', '${vo.cc_name}', '${vo.cc_expln}', '${vo.company}')")
	public void codeInsert(@Param("vo") codeVO vo);
	
	// 삭제
	@Delete("DELETE FROM clsfc_code WHERE cc_num='${cc_num}'")
	public void codeDelete(@Param("cc_num") String cc_num);
	
	// 로케이션 조회
	@Select("select * from location where lc_class='${lc_class}' and company='${company}'")
	public List<locationVO> locationSelect(@Param("lc_class") String lc_class, @Param("company") String company);
	
	// 추가
	@Insert("insert into location values(lc_seq.nextval, '${vo.lc_class}', '${vo.lc_parent}', '${vo.lc_name}', '${vo.lc_num}', '${vo.lc_type}', '${vo.lc_jang}', "
			+ "'${vo.lc_pok}', '${vo.lc_go}', '${vo.lc_yeol}', '${vo.lc_yeon}', '${vo.lc_dan}', '${vo.lc_memo}', '${vo.company}' )")
	public void locationInsert(@Param("vo") locationVO vo);
	
	// 삭제
	@Delete("DELETE FROM location WHERE lc_seq_num='${lc_seq_num}'")
	public void locationDelete(@Param("lc_seq_num") String lc_seq_num);
	
	// 수정
	@Update("update location set lc_class='${vo.lc_class}', lc_parent='${vo.lc_parent}', lc_name='${vo.lc_name}', lc_num='${vo.lc_num}', lc_type='${vo.lc_type}', "
		+ " lc_jang='${vo.lc_jang}', lc_pok='${vo.lc_pok}', lc_go='${vo.lc_go}', lc_yeol='${vo.lc_yeol}', lc_yeon='${vo.lc_yeon}', lc_dan='${vo.lc_dan}' where lc_seq_num=${vo.lc_seq_num}")
	public void locationUpdate(@Param("vo") locationVO vo);
	
	// 공정관리 조회
	@Select("select * from process where company='${company}'")
	public List<processVO> processSelect(@Param("company") String company);
	
	// 추가
	@Insert("insert into process values(pr_seq_num.nextval, '${vo.pr_num}', '${vo.pr_name}', '${vo.pr_sortation}', '${vo.pr_facilities}', '${vo.pr_reviewer}', "
			+ " '${vo.pr_approver}', '${vo.pr_memo}','${vo.company}' )")
	public void processInsert(@Param("vo") processVO vo, @Param("company") String company);
	
	// 삭제
	@Delete("DELETE FROM process WHERE pr_seq_num=${vo.pr_seq_num} and company='${vo.company}'")
	public void processDelete(@Param("vo") processVO vo);
	
	// 수정
	@Update("update process set pr_num='${vo.pr_num}', pr_name='${vo.pr_name}', pr_sortation='${vo.pr_sortation}', pr_facilities='${vo.pr_facilities}', pr_reviewer='${vo.pr_reviewer}', "
			+ " pr_approver='${vo.pr_approver}', pr_memo='${vo.pr_memo}' where pr_seq_num=${vo.pr_seq_num}")
	public void processUpdate(@Param("vo") processVO vo);
	
	// 거래처 조회
	@Select("select * from client where company='${company}'")
	public List<clientVO> clientSelect(@Param("company") String company);
	
	// 추가
	@Insert("insert into client values(client_seq.nextval, '${vo.ct_mutual}', '${vo.ct_sortation}', '${vo.ct_repName}', '${vo.ct_businessNumber}',"
			+ " '${vo.ct_chrgName}', '${vo.ct_postalCode}', '${vo.ct_address}', '${vo.ct_condition}', '${vo.ct_industry}',"
			+ " '${vo.ct_contact}', '${vo.ct_fax}', '${vo.ct_email}', '${vo.company}')")
	public void clientInsert(@Param("vo") clientVO vo, @Param("company") String company);
	
	// 삭제
	@Delete("DELETE FROM client WHERE ct_num=${ct_num}")
	public void clientDelete(@Param("ct_num") String ct_num);
	
	// 수정
	@Update("update client set ct_mutual='${vo.ct_mutual}', ct_sortation='${vo.ct_sortation}', ct_repName='${vo.ct_repName}', ct_businessNumber='${vo.ct_businessNumber}',"
			+ " ct_chrgName='${vo.ct_chrgName}', ct_postalCode='${vo.ct_postalCode}', ct_address='${vo.ct_address}', ct_condition='${vo.ct_condition}', ct_industry='${vo.ct_industry}',"
			+ " ct_contact='${vo.ct_contact}', ct_fax='${vo.ct_fax}', ct_email='${vo.ct_email}' where ct_num=${vo.ct_num}")
	public void clientUpdate(@Param("vo") clientVO vo);
	
	// 제품관리 조회
	@Select("select * from goods where company='${company}'")
	public List<goodsVO> goodsSelect(@Param("company") String company);
	
	// 추가
	@Insert("insert into goods values(gs_seq_num.nextval, '${vo.gs_num}', '${vo.gs_name}', '${vo.gs_sortation}', '${vo.gs_unit}', '${vo.gs_family}', "
			+ " '${vo.gs_routing}', '${vo.gs_code_a}','${vo.gs_code_c}','${vo.gs_standard}', '${vo.gs_price}', "
			+ " '${vo.gs_client}', '${vo.gs_packingUnit}', '${vo.gs_packingAmount}', '${vo.gs_safeAmount}', '${vo.gs_location}', "
			+ " '${vo.gs_memo}', '${vo.gs_attach}', '${vo.gs_image}', '${vo.company}' )")
	public void goodsInsert(@Param("vo") goodsVO vo);
	
	// 삭제
	@Delete("DELETE FROM goods WHERE gs_seq_num=${gs_seq_num}")
	public void goodsDelete(@Param("gs_seq_num") String gs_seq_num);
	
	// 수정
	@Update("update goods set gs_num='${vo.gs_num}', gs_name='${vo.gs_name}', gs_sortation='${vo.gs_sortation}', gs_unit='${vo.gs_unit}', gs_family='${vo.gs_family}', "
			+ " gs_routing='${vo.gs_routing}', gs_code_a='${vo.gs_code_a}', gs_code_c='${vo.gs_code_c}',gs_standard='${vo.gs_standard}', gs_price='${vo.gs_price}', "
			+ " gs_client='${vo.gs_client}', gs_packingUnit='${vo.gs_packingUnit}', gs_packingAmount='${vo.gs_packingAmount}', gs_safeAmount='${vo.gs_safeAmount}', gs_location='${vo.gs_location}', "
			+ " gs_memo='${vo.gs_memo}' WHERE gs_seq_num=${vo.gs_seq_num} ")
	public void goodsUpdate(@Param("vo") goodsVO vo);
	
	// 자재관리 조회
	@Select("select * from material where company='${company}'")
	public List<materialVO> materialSelect(@Param("company") String company);
	
	// 추가
	@Insert("insert into material values(ml_seq.nextval, '${vo.ml_num}', '${vo.ml_name}', '${vo.ml_sortation}', '${vo.ml_uni}', '${vo.ml_family}', "
			+ " '${vo.ml_routing}', '${vo.ml_code_a}','${vo.ml_code_c}','${vo.ml_standard}', '${vo.ml_price}', "
			+ " '${vo.ml_client}', '${vo.ml_packingUnit}','${vo.ml_packingAmount}','${vo.ml_safeAmount}', '${vo.ml_location}', "
			+ " '${vo.company}' )")
	public void materialInsert(@Param("vo") materialVO vo);
	
	// 삭제
	@Delete("DELETE FROM material WHERE ml_seq_num=${ml_seq_num}")
	public void materialDelete(@Param("ml_seq_num") String ml_seq_num);
	
	// 수정
	@Update("update material set ml_num='${vo.ml_num}', ml_name='${vo.ml_name}', ml_sortation='${vo.ml_sortation}', ml_uni='${vo.ml_uni}', ml_family='${vo.ml_family}', "
			+ "	ml_routing='${vo.ml_routing}', ml_code_a='${vo.ml_code_a}',ml_code_c='${vo.ml_code_c}',ml_standard='${vo.ml_standard}', ml_price='${vo.ml_price}', "
			+ "	ml_client='${vo.ml_client}', ml_packingUnit='${vo.ml_packingUnit}',ml_packingAmount='${vo.ml_packingAmount}',ml_safeAmount='${vo.ml_safeAmount}', ml_location='${vo.ml_location}' "
			+ "	 WHERE ml_seq_num=${vo.ml_seq_num}")
	public void materialUpdate(@Param("vo") materialVO vo);
	
	
	// 검사 조회
	@Select("select * from inspection where pr_num='${pr_num}'")
	public List<inspectionVO> inspectionSelect(@Param("pr_num") String pr_num);
	
	// 추가
	@Insert("insert into inspection values('${vo.pr_num}', in_seq_num.nextval, '${vo.in_code_a}', '${vo.in_code_b}', '${vo.in_code_c}', '${vo.in_goods}', "
			+ " '${vo.in_inputValue}', '${vo.in_standard}','${vo.in_how}','${vo.in_max}', '${vo.in_min}', "
			+ " '${vo.in_unit}', '${vo.in_sample}', '${vo.in_sort}', '${vo.in_self}', '${vo.company}' )")
	public void inspectionInsert(@Param("vo") inspectionVO vo);
	
	// 삭제
	@Delete("DELETE FROM inspection WHERE in_seq_num=${in_seq_num}")
	public void inspectionDelete(@Param("in_seq_num") String in_seq_num);
	
	// 주문 관리
	@Select("select * from goods_order where company='${company}'")
	public List<goodsOrderVO> goodsOrderSelect(@Param("company") String company);
	
	// 추가
	@Insert("insert into goods_order values(go_seq.nextval, '${vo.go_goods_seq}', '${vo.go_goods_name}', '${vo.go_goods_count}', '${vo.go_client}',"
			+ " '${vo.go_orderDate}', '${vo.go_dueDate}', '${vo.go_place}','${vo.go_address}','${vo.go_price}',"
			+ " '${vo.go_amount}', '${vo.go_taxation}', '${vo.go_now}', '${vo.company}' )")
	public void goodsOrderInsert(@Param("vo") goodsOrderVO vo);
	
	// 삭제
	@Delete("DELETE FROM goods_order WHERE go_num=${go_num}")
	public void goodsOrderDelete(@Param("go_num") String go_num);

	
	
	
	
	
	
	
	// 작업지시
	@Select("select * from ct_workorder where company='${company}'")
	public List<workOrderVO> workOrderSelect(@Param("company") String company);
	
	@Insert("insert into ct_workorder values(ord_seq.nextval, '${vo.ord_schedule}', '${vo.ord_code}', '${vo.ord_name}', '${vo.ord_count}', '${vo.ord_product_id}',"
			+ " '${vo.ord_product_name}', '${vo.ord_work}', '${vo.ord_planned_quantity}', '${vo.ord_performance_quantity}', '${vo.ord_remarks}', '${vo.ord_order_no}', '${vo.company}')")
	public void workOrderInsert(@Param("vo") workOrderVO vo);
	

	

	@Select("select * from ct_production_labor_forever order by num")
	public List<productionPerformanceVO> productionPerformanceForever();
	
	
	
	// 생산계획
	@Insert("insert into production_plan values(pp_seq.nextval, '${vo.pp_date}', '${vo.pp_equipment_name}', '${vo.pp_equipment_code}', '${vo.pp_item_num}', '${vo.pp_item_name}', '${vo.company}')")
	public void productionPlanInsert(@Param("vo") productionPlanVO vo);
	
	@Select("select * from production_plan where company='${company}'")
	public List<productionPlanVO> productionPlanSelect(@Param("company") String company);
	
	//출고지시
	@Select("select * from ct_goods_out_bound where company='${company}'")
	public List<outBoundVO> outBoundSelect(@Param("company") String company);
	
	@Insert("insert into ct_goods_out_bound values('${vo.company}'||goods_out_seq.nextval, '${vo.out_client}', '${vo.out_dateOrder}', '${vo.out_date}', '${vo.out_amount}', '${vo.out_delivery}', '${vo.out_charge}', '${vo.out_contact}', '${vo.out_count}', '${vo.out_pro_num}', '${vo.company}')")
	public void outBoundInsert(@Param("vo") outBoundVO vo);
	
	//오더관리
	@Select("select * from pro_order where company='${company}'")
	public List<proOrderVO> proOrderSelect(@Param("company") String company);
	
	@Insert("insert into pro_order values(pro_order_seq.nextval, '${vo.order_proName}', '${vo.order_client}', '${vo.order_charge}', '${vo.order_outDay}', '${vo.order_Day}', '${vo.order_address}', '${vo.order_contact}', '${vo.order_memo}', '${vo.company}')")
	public void proOrderInsert(@Param("vo") proOrderVO vo);
	
	//불량수량 입력
	@Insert("insert into bad values(bad_seq.nextval, 'x', '${vo.bad_inspection}', '${vo.bad_count}', '${vo.bad_date}', '${vo.bad_shift}', '${vo.bad_process}', '${vo.bad_facilities}', '${vo.bad_worker}', '${vo.bad_payer}', '${vo.bad_pro}', '${vo.bad_dstrb}', '${vo.company}')")
	public void badInsert(@Param("vo") badVO vo);

	// 품질검사 내역조회(승인전)
	@Select("select * from bad where company='${company}' and bad_check='x'")
	public List<badVO> badSelectCheckX(@Param("company") String company);
	
	// 품질 검사 내역 조회 승인하기
	@Update("update bad set bad_check='o' where bad_num=${checknum}")
	public void badUpdate(@Param("checknum") String checknum);
	
	//공정 불량 현황 조회(승인후)
	@Select("select * from bad where company='${company}' and bad_check='o'")
	public List<badVO> badSelectCheckO(@Param("company") String company);

	//생산일보 넣기
	@Insert("insert into daily_product values(daily_seq.nextval, '${vo.da_date}', '${vo.da_shift}', '${vo.da_time}', '${vo.da_process}', '${vo.da_facilities}', '${vo.company}')")
	public void dailyInsert(@Param("vo") dailyVO vo);
	
	//생산실적조회
	@Select("select * from daily_product where company='${company}'")
	public List<dailyVO> dailySelect(@Param("company") String company);
	
	//자재발주 넣기
	@Insert("insert into materials_order values(mat_seq.nextval, '${vo.mat_inputDate}', '${vo.mat_orderDate}', '${vo.mat_dueDate}', '${vo.mat_place}', '${vo.mat_effectivedate}', '${vo.mat_conditions}', '${vo.mat_address}', '${vo.mat_client}', '${vo.mat_contact}', '${vo.mat_request}', '${vo.mat_amount}', '${vo.mat_proName}','x', '${vo.company}')")
	public void matOrderInsert(@Param("vo") materials_orderVO vo);
	
	// 자재발주 입고현황
	@Select("select * from materials_order where company='${company}' and mat_complete='x'")
	public List<materials_orderVO> materials_orderSelectX(@Param("company") String company);
	
	//자재발주 입고 수정
	@Update("update materials_order set mat_complete='o' where mat_num=${mat_check}")
	public void matOrderUpdate(@Param("mat_check") String mat_check);
	
	// 자재 발주 조회
	@Select("select * from materials_order where company='${company}' and mat_complete='o'")
	public List<materials_orderVO> materials_orderSelectO(@Param("company") String company);
	
}

