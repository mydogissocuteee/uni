package com.uni.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.uni.domain.BoardVO;
import com.uni.domain.GoodsVO;
import com.uni.domain.MemberVO;
import com.uni.domain.clientVO;
import com.uni.domain.client_productionVO;
import com.uni.domain.materials_orderVO;
import com.uni.domain.productionPerformanceVO;
import com.uni.domain.productionPlanVO;
import com.uni.domain.workOrderVO;


public interface BoardMapper {
	
	@Select("select * from (select * from member_mes where userid='${vo.getUserid}' and userpw='${vo.getUserpw}' order by rownum desc) where rownum=1")
	public MemberVO login(@Param("vo") MemberVO vo );
	
	@Insert("insert into member values(mem_seq.nextval, '${userid}', '${userpw}')")
	public void join(@Param("userid") String userid, @Param("userpw") String userpw);
	
	// 사용자 추가
	@Insert("insert into member_mes values(mes_seq.nextval, '${vo.company}', '${vo.userid}', '${vo.username}', '${vo.userpw}', '${vo.mainProcess}', '${vo.userRight}', '${vo.department}', '${vo.contact}', '${vo.email}', '${vo.memo}', null, null)")
	public void userInsert(@Param("vo") MemberVO vo);
	
	// id 체크
	@Select("select * from member_mes where userid='${userid}'")
	public MemberVO checkId(String userid);
	
	// 사용자관리 조회
	@Select("select * from member_mes where company='${company}' order by num")
	public List<MemberVO> userSelect(@Param("company") String company);
	
	// 품목 추가
	@Insert("insert into st_product values(st_product_seq.nextval, '${vo.product_name}', '${vo.product_classification}', '${vo.unit}', '${vo.product_class_code}', '${vo.process_routing_id}', '${vo.class_code_a}', '${vo.class_code_b}', '${vo.class_code_c}', '${vo.product_count}',  ${'company'})")
	public void goodsInsertForever(@Param("vo") GoodsVO vo, @Param("company") String company);
	
	
	// 작업지시
	@Select("select * from ct_workorder where company='${company}'")
	public List<workOrderVO> workOrderSelect(@Param("company") String company);
	
	@Insert("insert into ct_workorder values('${vo.facilities_code}', '${vo.facilities_name}', '${vo.operations_no}', '${vo.prd_schedule_year}', '${vo.prd_schedule_month}', '${vo.prd_schedule_day}',"
			+ " '${vo.product_id}', '${vo.product_name}', '${vo.work_order}', '${vo.planned_quantity}', '${vo.performance_quantity}', '${vo.remarks}', '${vo.order_no}', '${vo.order_detail_seq}', '${company}')")
	public void workOrderInsert(@Param("vo") workOrderVO vo);
	
	// 제품관리
	@Select("select * from client_production where company='${company}'")
	public List<client_productionVO> client_productionSelect(@Param("company") String company);
	
	@Insert("insert into client_production values('${vo.pro_name}', '${vo.pro_code_a}', '${vo.pro_code_b}', '${vo.pro_family}', '${vo.pro_unit}', '${vo.pro_standard}',"
			+ " '${vo.pro_how}', '${vo.pro_work}', '${company}')")
	public void productonInsert(@Param("vo") client_productionVO vo, @Param("company") String company);
	
	// 품목정보 관리
	@Select("select * from st_product where company='${company}'")
	public List<GoodsVO> goodsSelect(@Param("company") String company);
	
	
	@Select("select * from ct_production_labor_forever order by num")
	public List<productionPerformanceVO> productionPerformanceForever();
	
	// 거래처
	@Select("select * from client_forever where company='${company}'")
	public List<clientVO> clientSelect(@Param("company") String company);
	
	@Select("DELETE FROM member_mes WHERE num='${vo.num}'")
	public void userDelete(@Param("vo") MemberVO vo);

	// 거래처 추가
	@Insert("insert into client_forever values(client_forever_seq.nextval, '${vo.mutual}', '${vo.businessCondition}', '${vo.sortation}', '${vo.sector}', '${vo.repName}', '${vo.contact}', '${vo.businessNumber}', '${vo.fax}', '${vo.chrgName}', null, '${vo.address}', '${vo.memo}', '${vo.postalCode}', '${company}')")
	public void clientInsert(@Param("vo") clientVO vo, @Param("company") String company);
	
	// 생산계획
	@Insert("insert into production_plan values(pp_seq.nextval, '${vo.pp_date}', '${vo.pp_equipment_name}', '${vo.pp_equipment_code}', '${vo.pp_item_num}', '${vo.pp_item_name}', '${vo.company}')")
	public void productionPlanInsert(@Param("vo") productionPlanVO vo);
	
	@Select("select * from production_plan where company='${company}'")
	public List<productionPlanVO> productionPlanSelect(@Param("company") String company);
	
	// 자재발주
	@Select("select * from materials_order where company='${company}'")
	public List<materials_orderVO> materials_orderSelect(@Param("company") String company);
}
