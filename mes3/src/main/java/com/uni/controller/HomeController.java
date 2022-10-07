package com.uni.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uni.domain.goodsVO;
import com.uni.domain.inspectionVO;
import com.uni.domain.locationVO;
import com.uni.domain.materialVO;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.uni.domain.MemberVO;
import com.uni.domain.badVO;
import com.uni.domain.bomVO;
import com.uni.domain.clientVO;
import com.uni.domain.codeVO;
import com.uni.domain.dailyVO;
import com.uni.domain.goodsOrderVO;
import com.uni.domain.materials_orderVO;
import com.uni.domain.outBoundVO;
import com.uni.domain.proOrderVO;
import com.uni.domain.processRoutingVO;
import com.uni.domain.processVO;
import com.uni.domain.productItemVO;
import com.uni.domain.productPlanVO;
import com.uni.domain.productionPerformanceVO;
import com.uni.domain.userGroupRightVO;
import com.uni.domain.userGroupVO;
import com.uni.domain.workOrderVO;
import com.uni.mapper.BoardMapper;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private String loginid;
	private String joinid;
	private String company;
	private String username;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("loginid", loginid );
		model.addAttribute("joinid", joinid );
		
		return "home";
	}
	
	@Autowired
	BoardMapper boardmapper;
	
	@RequestMapping("/practice.do")
	public String clientjsp() {
		return "client";
	}
	
	
	@RequestMapping("/main.do")
	public String loginMES() {
		return "loginMES";
	}
	
	@RequestMapping("/loginMes.do")
	public String loginMes(MemberVO vo, HttpSession session) {
		System.out.println(vo.getUserid());
		MemberVO mvo = boardmapper.login(vo);
		if (mvo != null) { // 로그인 성공
			company = mvo.getCompany();
			username = mvo.getUsername();
			session.setAttribute("company", company);
			session.setAttribute("username", username);
			session.setMaxInactiveInterval(-1);
			System.out.println("로그인 성공 ! ");
			System.out.println("사용자가 입력한 id: " + mvo.getUserid());
			System.out.println("사용자가 입력한 id의 회사: " + company);
			
			// mainjsp를 회사별로 만들고 해당 mainjsp로 가게 만들기
			return "redirect:/main0923.do";
		}
		else {
			loginid = "로그인 실패";
			System.out.println("fail");
			return "loginMES";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "loginMES";
	}
	@RequestMapping("/mainjsp.do")
	public String mainjsp(HttpSession session) {
		System.out.println("메인");
		//사용자관리 가져오기
		try {
			//List<MemberVO> memberlist = boardmapper.userSelect(company);
			//session.setAttribute("memberlist", memberlist);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return "m0928";
	}
	
	
	// 사용자 관리 입력
	
	@ResponseBody
	@RequestMapping("/userInsert.do")
	public void userInsert(MemberVO vo, HttpSession session) {
		System.out.println(vo.getCompany());
		String company = (String) session.getAttribute("company");
		session.setAttribute("page","user");
		//vo.setCompany("fourever");
		vo.setDepartment(vo.getDepartment().replace(" ", ""));
		boardmapper.userInsert(vo);
		System.out.println("---회원가입");
	}
	
	@ResponseBody
	@RequestMapping("/userSelect.do")
	public List<MemberVO> userSelect() {
		List<MemberVO> data = boardmapper.userSelect("fourever");
		System.out.println("회사의 회원리스트");
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/userDelete.do")
	public void userDelete(String num) {
		System.out.println(num+"---회원삭제");
		boardmapper.userDelete(num);
	}	
	
	@ResponseBody
	@RequestMapping("/userUpdate.do")
	public void userUpdate(MemberVO vo) {
		System.out.println(vo.getNum()+"---회원수정");
		boardmapper.userUpdate(vo);
	}

	@ResponseBody
	@RequestMapping("/userGroupSelect.do")
	public List<userGroupVO> userGroupSelect(String company) {
		List<userGroupVO> data = boardmapper.userGroupSelect(company);
		System.out.println("회사의 그룹 리스트");
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/userGroupInsert.do")
	public void userGroupInsert(userGroupVO vo) {
		boardmapper.userGroupInsert(vo);
		System.out.println("회사의 그룹 리스트 추가");
	}
	
	@ResponseBody
	@RequestMapping("/userGroupDelete.do")
	public void userGroupDelete(String ug_num, userGroupRightVO vo) {
		System.out.println(ug_num+"---그룹 삭제");
		boardmapper.userGroupDelete(vo.getUgr_id());
		ArrayList<String> pageName = new ArrayList<String>();
		pageName.add("사용자 관리");
		pageName.add("설정 관리");
		pageName.add("로케이션");
		pageName.add("공정 관리");
		pageName.add("거래처 관리");
		pageName.add("제품 관리");
		pageName.add("자재 관리");
		pageName.add("BOM 관리");
		pageName.add("주문 관리");
		pageName.add("주문 내역 조회");
		pageName.add("생산 계획");
		pageName.add("작업 지시");
		pageName.add("생산 일보");
		pageName.add("작업 지시 조회");
		pageName.add("생산 실적 조회");
		pageName.add("자재 발주");
		pageName.add("자재 발주 조회");
		pageName.add("자재 입고 현황");
		pageName.add("자재 재고 현황");
		pageName.add("품질 검사 내역 입력");
		pageName.add("품질 검사 내역 조회");
		pageName.add("공정 불량 현황");
		pageName.add("불량률 조회");
		pageName.add("출고 지시");
		pageName.add("출고 조회");
		pageName.add("제품 재고 현황");
		pageName.add("LOT 추적");
		pageName.add("LOT 정보 조회");
		pageName.add("X-R 관리도");
		for (String page : pageName) {
			vo.setUgr_name(page);
			boardmapper.userGroupRightDelete(vo);
		}
	}
	
	@ResponseBody
	@RequestMapping("/userGroupRightSelect.do")
	public List<userGroupRightVO> userGroupRightSelect(String group_name) {
		List<userGroupRightVO> data = boardmapper.userGroupRightSelect(group_name);
		System.out.println("회사의 그룹 권한 리스트"+group_name+data.size());
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/userGroupRightUpdate.do")
	public void userGroupRightUpdate(String group_name, String ugr_name, String ugr_use, String company) {
		System.out.println("---사용자관리 그룹 권한 수정"+group_name);
		System.out.println("---사용자관리 그룹 권한 수정"+ugr_name);
		System.out.println("---사용자관리 그룹 권한 수정"+ugr_use);
		boardmapper.userGroupRightUpdate(group_name, ugr_name, ugr_use, company);
	}
	
	@ResponseBody
	@RequestMapping("/userGroupRightInsert.do")
	public void userGroupRightInsert(userGroupRightVO vo) {
		ArrayList<String> pageName = new ArrayList<String>();
		pageName.add("사용자 관리");
		pageName.add("설정 관리");
		pageName.add("로케이션");
		pageName.add("공정 관리");
		pageName.add("거래처 관리");
		pageName.add("제품 관리");
		pageName.add("자재 관리");
		pageName.add("BOM 관리");
		pageName.add("주문 관리");
		pageName.add("주문 내역 조회");
		pageName.add("생산 계획");
		pageName.add("작업 지시");
		pageName.add("생산 일보");
		pageName.add("작업 지시 조회");
		pageName.add("생산 실적 조회");
		pageName.add("자재 발주");
		pageName.add("자재 발주 조회");
		pageName.add("자재 입고 현황");
		pageName.add("자재 재고 현황");
		pageName.add("품질 검사 내역 입력");
		pageName.add("품질 검사 내역 조회");
		pageName.add("공정 불량 현황");
		pageName.add("불량률 조회");
		pageName.add("출고 지시");
		pageName.add("출고 조회");
		pageName.add("제품 재고 현황");
		pageName.add("LOT 추적");
		pageName.add("LOT 정보 조회");
		pageName.add("X-R 관리도");
		for (String page : pageName) {
			vo.setUgr_name(page);
			System.out.println(page);
			boardmapper.userGroupRightInsert(vo);
			
		}
		System.out.println("회사의 그룹 리스트 추가");
	}
	
	// 설정 관리
	@ResponseBody
	@RequestMapping("/codeSelect.do")
	public List<codeVO> codeSelect(String className, String company) {
		className = className.replace(" ", "");
		company = company.replace(" ", "");
		className = className.replace("\n", "");
		company = company.replace("\n", "");
		List<codeVO> data = boardmapper.codeSelect(className, company);
		return data;
	}
	@ResponseBody
	@RequestMapping("/codeInsert.do")
	public void codeInsert(codeVO vo, HttpSession session) {
		System.out.println(vo.getCompany());
		String company = (String) session.getAttribute("company");
		vo.setCc_class(vo.getCc_class().replace(" ", ""));
		vo.setCc_class(vo.getCc_class().replace("\n", ""));
		//vo.setCompany("fourever");
		boardmapper.codeInsert(vo);
		System.out.println("---코드 입력");
	}
	@ResponseBody
	@RequestMapping("/codeDelete.do")
	public void codeDelete(String cc_num) {
		System.out.println(cc_num+"---코드삭제");
		boardmapper.codeDelete(cc_num);
	}
	
	// 로케이션 관리
	@ResponseBody
	@RequestMapping("/locationSelect.do")
	public List<locationVO> locationSelect(String locationClassName, String company) {
		List<locationVO> data = boardmapper.locationSelect(locationClassName, company);
		System.out.println("로케이션 조회");
		return data;
	}
	@ResponseBody
	@RequestMapping("/locationInsert.do")
	public void locationInsert(locationVO vo) {
		boardmapper.locationInsert(vo);
		System.out.println("---로케이션 입력");
	}
	@ResponseBody
	@RequestMapping("/locationUpdate.do")
	public void locationUpdate(String lc_seq_num) {
		System.out.println(lc_seq_num+"---로케이션 삭제");
		boardmapper.locationDelete(lc_seq_num);
	}
	@ResponseBody
	@RequestMapping("/locationDelete.do")
	public void locationDelete(String lc_seq_num) {
		System.out.println(lc_seq_num+"---로케이션 삭제");
		boardmapper.locationDelete(lc_seq_num);
	}
	
	
	// 공정 관리
	@ResponseBody
	@RequestMapping("/processSelect.do")
	public List<processVO> processSelect() {
		List<processVO> data = boardmapper.processSelect("fourever");
		System.out.println("공정관리리스트");
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/processInsert.do")
	public void processInsert(processVO vo, String company) {
		vo.setPr_facilities(vo.getPr_facilities().replace(" ", ""));
		vo.setPr_reviewer(vo.getPr_reviewer().replace(" ", ""));
		vo.setPr_approver(vo.getPr_approver().replace(" ", ""));
		boardmapper.processInsert(vo, "fourever");
		System.out.println("---공정입력");
	}
	
	@ResponseBody
	@RequestMapping("/processDelete.do")
	public void processDelete(processVO vo) {
		System.out.println(vo);
		System.out.println(vo.getPr_seq_num()+"---공정삭제");
		boardmapper.processDelete(vo);
	}
	
	@ResponseBody
	@RequestMapping("/processUpdate.do")
	public void processUpdate(processVO vo) {
		System.out.println(vo.getPr_seq_num()+"---공정수정");
		vo.setPr_reviewer(vo.getPr_reviewer().replace(" ", ""));
		vo.setPr_approver(vo.getPr_approver().replace(" ", ""));
		boardmapper.processUpdate(vo);
	}
	
	//공정 관리 - 라우팅
	@ResponseBody
	@RequestMapping("/processRoutingSelect.do")
	public List<processRoutingVO> processRoutingSelect(String company) {
		List<processRoutingVO> data = boardmapper.processRoutingSelect(company);
		System.out.println("라우팅 리스트");
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/processRoutingInsert.do")
	public void processRoutingInsert(processRoutingVO vo) {
		boardmapper.processRoutingInsert(vo);
		System.out.println(vo+"---라우팅 입력");
	}
	
	// 공정 관리 - 검사
	@ResponseBody
	@RequestMapping("/inspectionSelect.do")
	public List<inspectionVO> inspectionSelect(String pr_num) {
		List<inspectionVO> data = boardmapper.inspectionSelect(pr_num);
		System.out.println("공정관리리스트");
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/inspectionInsert.do")
	public void inspectionInsert(inspectionVO vo) {
		vo.setIn_code_a(vo.getIn_code_a().replace(" ", ""));
		vo.setIn_code_c(vo.getIn_code_c().replace(" ", ""));
		vo.setIn_inputValue(vo.getIn_inputValue().replace(" ", ""));
		vo.setIn_how(vo.getIn_how().replace(" ", ""));
		vo.setIn_unit(vo.getIn_unit().replace(" ", ""));
		boardmapper.inspectionInsert(vo);
		System.out.println("---검사 입력");
	}
	
	@ResponseBody
	@RequestMapping("/inspectionDelete.do")
	public void inspectionDelete(String in_seq_num) {
		System.out.println(in_seq_num+"---검사 삭제");
		boardmapper.inspectionDelete(in_seq_num);
	}
	

	
	// 거래처 관리
	@ResponseBody
	@RequestMapping("/clientSelect.do")
	public List<clientVO> clientSelect() {
		List<clientVO> data = boardmapper.clientSelect("fourever");
		System.out.println("거래처 리스트");
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/clientInsert.do")
	public void clientInsert(clientVO vo, String company) {
		boardmapper.clientInsert(vo, "fourever");
		System.out.println("---거래처 입력");
	}
	
	@ResponseBody
	@RequestMapping("/clientDelete.do")
	public void clientDelete(String ct_num) {
		System.out.println(ct_num+"---거래처 삭제");
		boardmapper.clientDelete(ct_num);
	}
	
	@ResponseBody
	@RequestMapping("/clientUpdate.do")
	public void clientUpdate(clientVO vo) {
		System.out.println(vo.getCt_num()+"---회원수정");
		boardmapper.clientUpdate(vo);
	}
	
	// 제품 관리
	@ResponseBody
	@RequestMapping("/goodsSelect.do")
	public List<goodsVO> goodsSelect() {
		List<goodsVO> data = boardmapper.goodsSelect("fourever");
		System.out.println("제품 리스트");
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/goodsInsert.do")
	public void goodsInsert(goodsVO vo) {
		boardmapper.goodsInsert(vo);
		System.out.println("---제품 입력");
	}
	
	@ResponseBody
	@RequestMapping("/goodsDelete.do")
	public void goodsDelete(String gs_seq_num) {
		System.out.println(gs_seq_num+"---제품 삭제");
		boardmapper.goodsDelete(gs_seq_num);
	}
	
	@ResponseBody
	@RequestMapping("/goodsUpdate.do")
	public void goodsUpdate(goodsVO vo) {
		System.out.println(vo.getGs_seq_num()+"---회원수정");
		boardmapper.goodsUpdate(vo);
	}
	
	// 자재 관리
	@ResponseBody
	@RequestMapping("/materialSelect.do")
	public List<materialVO> materialSelect(String company) {
		company="fourever";
		List<materialVO> data = boardmapper.materialSelect(company);
		System.out.println(company+"회사의 자재 리스트");
		return data;
	}
	
	//입력
	@ResponseBody
	@RequestMapping("/materialInsert.do")
	public void materialInsert(materialVO vo) {
		boardmapper.materialInsert(vo);
		System.out.println(vo+"---자재 입력");
	}
	
	// 삭제
	@ResponseBody
	@RequestMapping("/materialDelete.do")
	public void materialDelete(String ml_seq_num) {
		System.out.println(ml_seq_num+"---자재 삭제");
		boardmapper.materialDelete(ml_seq_num);
	}
	
	// 수정
	@ResponseBody
	@RequestMapping("/materialUpdate.do")
	public void materialUpdate(materialVO vo) {
		System.out.println(vo.getMl_seq_num()+"---회원수정");
		boardmapper.materialUpdate(vo);
	}
	
	// bom 관리
	@ResponseBody
	@RequestMapping("/bomSelect.do")
	public List<bomVO> bomSelect(String b_goods_seq) {
		List<bomVO> data = boardmapper.bomSelect(b_goods_seq);
		System.out.println(b_goods_seq+"bom 리스트");
		System.out.println(data.size());

		return data;
	}
	
	//입력
	@ResponseBody
	@RequestMapping("/bomInsert.do")
	public void bomInsert(bomVO vo) {
		boardmapper.bomInsert(vo);
		System.out.println(vo+"---자재 입력");
	}
	
	// 삭제
	@ResponseBody
	@RequestMapping("/bomDelete.do")
	public void bomDelete(String ml_seq_num) {
		System.out.println(ml_seq_num+"---자재 삭제");
		boardmapper.bomDelete(ml_seq_num);
	}
	
	// 수정
	@ResponseBody
	@RequestMapping("/bomUpdate.do")
	public void bomUpdate(bomVO vo) {
		System.out.println(vo.getB_seq_num()+"---회원수정");
		boardmapper.bomUpdate(vo);
	}
	
	/////////주문 관리///////////
	@ResponseBody
	@RequestMapping("/goodsOrderSelect.do")
	public List<goodsOrderVO> goodsOrderSelect(String company) {
		List<goodsOrderVO> data = boardmapper.goodsOrderSelect(company);
		System.out.println(company+"회사의 주문 리스트");
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/goodsOrderSelectSequence.do")
	public goodsOrderVO goodsOrderSelectSequence(String go_num) {
		goodsOrderVO data = boardmapper.goodsOrderSelectSequence(go_num);
		System.out.println(company+"회사의 주문 리스트");
		System.out.println(data.getGo_num());
		return data;
	}
	
	//입력
	@ResponseBody
	@RequestMapping("/goodsOrderInsert.do")
	public void goodsOrderInsert(goodsOrderVO vo) {
		boardmapper.goodsOrderInsert(vo);
		System.out.println(vo+"---자재 입력");
	}
	
	// 삭제
	@ResponseBody
	@RequestMapping("/goodsOrderDelete.do")
	public void goodsOrderDelete(String go_num) {
		System.out.println(go_num+"---자재 삭제");
		boardmapper.goodsOrderDelete(go_num);
	}
	
	// 수정
	@ResponseBody
	@RequestMapping("/goodsOrderUpdate.do")
	public void goodsOrderUpdate(goodsOrderVO vo) {
		System.out.println(vo.getGo_num()+"---회원수정");
		boardmapper.goodsOrderUpdate(vo);
	}
	
	/////////생산 관리/////////
	// 생산 계획 관리
	@ResponseBody
	@RequestMapping("/productPlanSelect.do")
	public List<productPlanVO> productPlanSelect(String company) {
		List<productPlanVO> data = boardmapper.productPlanSelect(company);
		System.out.println(company+"회사의 생산 계획 리스트");
		System.out.println(data.size());
		return data;
	}
	
	//입력
	@ResponseBody
	@RequestMapping("/productPlanInsert.do")
	public void productPlanInsert(productPlanVO vo) {
		boardmapper.productPlanInsert(vo);
		System.out.println(vo+"---자재 입력");
	}
	
	// 삭제
	@ResponseBody
	@RequestMapping("/productPlanDelete.do")
	public void productPlanDelete(String pp_num) {
		System.out.println(pp_num+"---자재 삭제");
		boardmapper.productPlanDelete(pp_num);
	}
	
	// 수정
	@ResponseBody
	@RequestMapping("/productPlanUpdate.do")
	public void productPlanUpdate(productPlanVO vo) {
		System.out.println(vo.getPp_num()+"---회원수정");
		boardmapper.productPlanUpdate(vo);
	}
	
	// 생산 품목
	@ResponseBody
	@RequestMapping("/productItemSelect.do")
	public List<productItemVO> productItemSelect(String company) {
		List<productItemVO> data = boardmapper.productItemSelect(company);
		System.out.println(company+"회사의 생산 계획 리스트");
		System.out.println(data.size());
		return data;
	}
	
	//입력
	@ResponseBody
	@RequestMapping("/productItemInsert.do")
	public void productItemInsert(productItemVO vo) {
		boardmapper.productItemInsert(vo);
		vo.setPi_process(vo.getPi_process().replace(" ", ""));
		vo.setPi_process_type(vo.getPi_process_type().replace(" ", ""));
		vo.setPi_client(vo.getPi_client().replace(" ", ""));
		vo.setPi_material(vo.getPi_material().replace(" ", ""));
		vo.setPi_material_unit(vo.getPi_material_unit().replace(" ", ""));
		vo.setPi_move(vo.getPi_move().replace(" ", ""));
		vo.setPi_move_name(vo.getPi_move_name().replace(" ", ""));
		System.out.println(vo+"---생산품목 입력");
	}
	
	// 삭제
	@ResponseBody
	@RequestMapping("/productItemDelete.do")
	public void productItemDelete(String pp_num) {
		System.out.println(pp_num+"---자재 삭제");
		boardmapper.productItemDelete(pp_num);
	}
	
	// 수정
	@ResponseBody
	@RequestMapping("/productItemUpdate.do")
	public void productItemUpdate(productItemVO vo) {
		System.out.println(vo.getPi_num()+"---회원수정");
		boardmapper.productItemUpdate(vo);
	}
	
	// 작업지시
	@ResponseBody
	@RequestMapping("/workOrderSelect.do")
	public List<workOrderVO> workOrderSelect(String company) {
		List<workOrderVO> data = boardmapper.workOrderSelect(company);
		System.out.println(company+"회사의 생산 계획 리스트");
		return data;
	}
	
	//입력
	@ResponseBody
	@RequestMapping("/workOrderInsert.do")
	public void workOrderInsert(workOrderVO vo) {
		boardmapper.workOrderInsert(vo);
		vo.setWo_process_type(vo.getWo_process_type().replace(" ", ""));
		vo.setWo_goods_name(vo.getWo_goods_name().replace(" ", ""));
		System.out.println(vo+"---생산품목 입력");
	}
	
	// 삭제
	@ResponseBody
	@RequestMapping("/workOrderDelete.do")
	public void workOrderDelete(String wo_num) {
		System.out.println(wo_num+"---자재 삭제");
		boardmapper.workOrderDelete(wo_num);
	}
	
	// 수정
	@ResponseBody
	@RequestMapping("/workOrderUpdate.do")
	public void workOrderUpdate(workOrderVO vo) {
		System.out.println("---회원수정");
		boardmapper.workOrderUpdate(vo);
	}
	
	
	@ResponseBody
	@RequestMapping("/json.do")
	public void json(HttpServletResponse response)throws IOException{
		
		JsonParser parser = new JsonParser();
		
		String original = ("C:\\Users\\user\\Desktop\\라벨링0927\\7874(66)\\");
		String after = ("C:\\Users\\user\\Desktop\\라벨링0927\\7874(66)_라벨링\\");
		
		for(int i = 1;i<10;i++) {
			FileReader reader = new FileReader(original+"scene0000"+i+".json");
			
	        Object obj = parser.parse(reader); 
			
	        JsonObject jsonObj = (JsonObject)obj;
	        
	        jsonObj.remove("imageData");
	        
	        System.out.println("지울부분"+jsonObj.get("version"));
			
	        try {
	        	 
	    		FileWriter file = new FileWriter(after+"scene0000"+i+".json");
	    		file.write(jsonObj.toString());
	    		file.flush();
	    		file.close();
	     
	    	} catch (IOException e) {
	    		e.printStackTrace();
	    	}
	        
		}
		
		
		for(int i = 10;i<67;i++) {
			FileReader reader = new FileReader(original+"scene000"+i+".json");
			
	        Object obj = parser.parse(reader); 
			
	        JsonObject jsonObj = (JsonObject)obj;
	        
	        jsonObj.remove("imageData");
	        
	        System.out.println("지울부분"+jsonObj.get("version"));
			
	        try {
	        	 
	    		FileWriter file = new FileWriter(after+"scene000"+i+".json");
	    		file.write(jsonObj.toString());
	    		file.flush();
	    		file.close();
	     
	    	} catch (IOException e) {
	    		e.printStackTrace();
	    	}
	        
		}
		
		
	}
}