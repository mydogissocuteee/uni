package com.uni.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uni.domain.GoodsVO;
import com.uni.domain.MemberVO;
import com.uni.domain.clientVO;
import com.uni.domain.client_productionVO;
import com.uni.domain.productionPerformanceVO;
import com.uni.domain.productionPlanVO;
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
	
	@RequestMapping("/joinjsp.do")
	public String joinjsp() {
		
		return "join";
	}
	
	@RequestMapping("/login.do")
	public String login(MemberVO vo, HttpSession session) {
		System.out.println(vo.getUserid());
		MemberVO mvo = boardmapper.login(vo);
		if (mvo != null) { // 로그인 성공
			loginid = mvo.getUserid();
			System.out.println("로그인 성공 ! ");
			System.out.println("사용자가 입력한 id: " + mvo.getUserid());
		}
		else {
			
		}
		return "redirect:/";
	}
	
	@RequestMapping("/join.do")
	public String join(String userid, String userpw, HttpSession session, Locale locale, Model model) {
		Date date = new Date();

		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		System.out.println("사용자가 입력한 id: " + userid);
		System.out.println("사용자가 입력한 pw: " + userpw);
		boardmapper.join(userid, userpw);
		
		joinid = userid;
		
		return "redirect:/";
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
			return "redirect:/mainjsp.do";
		}
		else {
			loginid = "로그인 실패";
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
		List<MemberVO> memberlist = boardmapper.userSelect(company);
		session.setAttribute("memberlist", memberlist);
		
		
		//거래처 관리
		List<clientVO> clientlist = boardmapper.clientSelect(company);
		session.setAttribute("clientlist", clientlist);
		
		//생산실적 조회
		List<productionPerformanceVO> productionPerformancelist = boardmapper.productionPerformanceForever();
		session.setAttribute("productionPerformancelist", productionPerformancelist);
		
		// 작업지시 조회
		List<workOrderVO> workOrderlist = boardmapper.workOrderSelect(company);
		session.setAttribute("workOrderlist", workOrderlist);
		
		// 제품관리
		List<client_productionVO> client_productionlist = boardmapper.client_productionSelect(company);
		session.setAttribute("client_productionlist", client_productionlist);
		
		//품목정보 가져오기
		List<GoodsVO> goodslist = boardmapper.goodsSelect(company);
		session.setAttribute("goodslist", goodslist);
		
		return "main0829_3";
	}
	@RequestMapping("/userjsp.do")
	public String userjsp(HttpSession session) {
		System.out.println(session.getAttribute("company"));
		System.out.println("company:" +company);
		List<MemberVO> memberlist = boardmapper.userSelect(company);
		session.setAttribute("memberlist", memberlist);
		session.setMaxInactiveInterval(-1);
		return "user";
	}
	
	
	// 거래처
		@RequestMapping("/clientjsp.do")
		public String clientjsp(HttpSession session) {
			List<clientVO> clientlist = boardmapper.clientSelect(company);
			session.setAttribute("clientlist", clientlist);
			session.setMaxInactiveInterval(-1);
			return "client";
	}
	
	@RequestMapping("/showcalendar.do")
	public String showcalendar() {
		
		return "MainMEScalendar";
	}
	
	// 회원가입
	@RequestMapping("/userInsert.do")
	public String userInsert(MemberVO vo, HttpSession session) {
		String company = (String) session.getAttribute("company");
		vo.setCompany(company);
		boardmapper.userInsert(vo);
		System.out.println("호원가입");
		return "redirect:/userjsp.do";
	}
	
	// 아이디 중복체크
	// vo가 존재하면 result 1이고 가입할 수 없음
	@RequestMapping("/checkId.do")
	public int checkId(String userid) {
		int result = 0;
		MemberVO vo = boardmapper.checkId(userid);
		if (vo!=null) result=1;
		else result=0;
		return result;
	}
	
	// 회원 삭제하기
	@RequestMapping("/userDelete.do")
	public String userDelete(MemberVO vo) {
		boardmapper.userDelete(vo);
		return "redirect:/userjsp.do";
	}
	
	// 품목 넣기
	@RequestMapping("/goodsInsertForever.do")
	public String goodsInsertForever(GoodsVO vo) {
		System.out.println("커몬");
		boardmapper.goodsInsertForever(vo, company);
		System.out.println( "굿즈 품목 브이오 "+vo);
		return "redirect:/goodsjsp.do";
	}
	
	@RequestMapping("/workOrderInsert.do")
	public void workOrderInsert(workOrderVO vo) {
		boardmapper.workOrderInsert(vo);
	}
	
	// 거래처 넣기
	@RequestMapping("/clientInsert.do")
	public String cilentInsert(clientVO vo, HttpSession session) {
		System.out.println("커몬");
		String company = (String) session.getAttribute("company");
		vo.setCompany(company);
		boardmapper.clientInsert(vo, company);
		System.out.println(vo);
		return "redirect:/userjsp.do";
	}
	
	@RequestMapping("/productonInsert.do")
	public String productonInsert(client_productionVO vo) {
		System.out.println(" 제품입력 커몬");
		boardmapper.productonInsert(vo, company);
		System.out.println(vo);
		return "redirect:/mainjsp.do";
	}
	
	// 생산계획 입력
	@RequestMapping("/productionPlanInsert.do")
	public String productionPlanInsert(productionPlanVO vo) {
		vo.setPp_item_name(company);
		boardmapper.productionPlanInsert(vo);
		System.out.println(vo.getPp_date());
		
		return "redirect:/mainjsp.do";
	}
}
