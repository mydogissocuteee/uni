package com.uni.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.ibatis.ognl.ParseException;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.uni.domain.analysisVO;
import com.uni.domain.customerVO;
import com.uni.domain.trendVO;
import com.uni.mapper.BoardMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)

	public void favicon( HttpServletRequest request, HttpServletResponse reponse ) {

	try {

	  reponse.sendRedirect("/resources/favicon.ico");

	} catch (IOException e) {

	  e.printStackTrace();

	}

	}
	
	// 로그인한 계정
	customerVO customer;
	analysisVO analysis;

	@Autowired BoardMapper boardmapper;

	// 페이지 이동 	
	@RequestMapping("/")
	public String loginjsp() {
		
		return "login";
	}
	@RequestMapping("/joinjsp.do")
	public String joinjsp() {
		
		return "join";
	}
	@RequestMapping("/mainjsp.do")
	public String mainjsp(Model model) {
		System.out.println(customer);
		model.addAttribute("customer", customer);
		return "main";
	}
	@RequestMapping("/product_infojsp.do")
	public String product_infojsp(Model model) {
		model.addAttribute("customer", customer);
		return "product_info";
	}
	@RequestMapping("/profilejsp.do")
	public String profilejsp(Model model) {
		model.addAttribute("customer", customer);
		return "profile";
	}
	@RequestMapping("/product_managejsp.do")
	public String product_managejsp(Model model) {
		model.addAttribute("customer", customer);
		return "product_manage";
	}
	@RequestMapping("/manufacturer_rankjsp.do")
	public String manufacturer_rankjsp(Model model) {
		model.addAttribute("customer", customer);
		return "manufacturer_rank";
	}
	@RequestMapping("/apijsp.do")
	public String apijsp(Model model) {
		model.addAttribute("customer", customer);
		return "api";
	}
	@RequestMapping("/trend_analysisjsp.do")
	public String trend_analysisjsp(Model model) {
		model.addAttribute("customer", customer);
		analysis = new analysisVO();
		List<trendVO> list = boardmapper.selectTrendAll();
		analysis = count(list);
		model.addAttribute("analysis", analysis);
		return "trend_analysis";
	}
	@RequestMapping("/tt.do")
	public String tt(Model model) {
		model.addAttribute("customer", customer);
		return "trend_analysis_mae";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/login.do")
	public String login(customerVO vo, Model model) {
		String path="redirect:/mainjsp.do";
		if (vo.getId().equals("admin")&&vo.getPw().equals("admin")) {
			vo.setName("비비엔다");
			vo.setSortation("admin"); 
			customer = vo;
		} else if (vo.getId().equals("mj")&&vo.getPw().equals("mj")) {
			vo.setName("김민지");
			vo.setSortation("user");
			customer = vo;
		} else{
			path = "redirect:/";
		};
		return path;
	}
	public static void run() throws IOException {
        String testurl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";

        URL url = new URL(testurl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        int resCode = conn.getResponseCode();

        System.out.println(resCode);
        System.out.println(conn.getResponseMessage());
        System.out.println(conn.getContent().toString());

        Object result = conn.getContent();
        int ch;
        while((ch=((InputStream)result).read()) != -1) {
            System.out.print((char) ch);
        }
    }
	
	
	@ResponseBody
	@RequestMapping("/api.do")
	public String aapi() throws IOException {
		String urlStr = "https://info.sweettracker.co.kr/api/v1/trackingInfo?t_key=RYGUeWCvAxYjySIJEkk22A&t_code=04&t_invoice=650562709770";
		
		URL url = new URL(urlStr);
		
		URLConnection connection = url.openConnection();
		connection.setDoOutput(true);
		
		connection.setRequestProperty("CONTENT-TYPE", "text/xml");
		
		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
		
		String inputLine;
		String buffer ="";
		
		while ((inputLine = in.readLine()) !=null){
			buffer += inputLine.trim();
		}
		
		String tracker ="";
		
		if(buffer.contains("완료")) {
			tracker="3";
		}else if(buffer.contains("간선")){
			tracker="2";
		}else if(buffer.contains("집화")){
			tracker="1";
		}else {
			tracker="0";
		}
		System.out.println(buffer);
		System.out.println(tracker);
		return tracker;
	}
	/*
	 * @RequestMapping("/selectTrendFemale.do") public List<trendVO>
	 * selectTrendFemale() { List<trendVO> list = boardmapper.selectTrendFemale();
	 * return list; }
	 * 
	 * @RequestMapping("/selectTrendMale.do") public List<trendVO> selectTrendMale()
	 * { List<trendVO> list = boardmapper.selectTrendMale(); return list; }
	 */

	// 카운트 함수
	public analysisVO count(List<trendVO> list) {
		try {
		for (int i = 0; i < list.size(); i++) {
			if(Double.parseDouble(list.get(i).getAge())<60) {
				if(Double.parseDouble(list.get(i).getAge())>=20) {
			
			//패턴
			if(list.get(i).getPattern().equals("P01")) {
				analysis.setP1(analysis.getP1()+1);
			}else if(list.get(i).getPattern().equals("P02")) {
				analysis.setP2(analysis.getP2()+1);
			}else if(list.get(i).getPattern().equals("P03")) {
				analysis.setP3(analysis.getP3()+1);
			}else if(list.get(i).getPattern().equals("P04")) {
				analysis.setP4(analysis.getP4()+1);
			}else if(list.get(i).getPattern().equals("P05")) {
				analysis.setP5(analysis.getP5()+1);
			}else if(list.get(i).getPattern().equals("P06")) {
				analysis.setP6(analysis.getP6()+1);
			}else if(list.get(i).getPattern().equals("P03")) {
				analysis.setP7(analysis.getP7()+1);
			}else if(list.get(i).getPattern().equals("P07")) {
				analysis.setP8(analysis.getP8()+1);
			}else if(list.get(i).getPattern().equals("P08")) {
				analysis.setP3(analysis.getP3()+1);
			}else if(list.get(i).getPattern().equals("P09")) {
				analysis.setP9(analysis.getP9()+1);
			}else if(list.get(i).getPattern().equals("P10")) {
				analysis.setP10(analysis.getP10()+1);
			}
			
			//제조사
			if(list.get(i).getManufacturer().equals("F01")) {
				analysis.setF1(analysis.getF1()+1);
			}else if(list.get(i).getManufacturer().equals("F04")) {
				analysis.setF4(analysis.getF4()+1);
			}else if(list.get(i).getManufacturer().equals("F05")) {
				analysis.setF5(analysis.getF5()+1);
			}else if(list.get(i).getManufacturer().equals("F06")) {
				analysis.setF6(analysis.getF6()+1);
			}else if(list.get(i).getManufacturer().equals("F07")) {
				analysis.setF7(analysis.getF7()+1);
			}else if(list.get(i).getManufacturer().equals("F08")) {
				analysis.setF8(analysis.getF8()+1);
			}else if(list.get(i).getManufacturer().equals("F09")) {
				analysis.setF9(analysis.getF9()+1);
			}else if(list.get(i).getManufacturer().equals("F10")) {
				analysis.setF10(analysis.getF10()+1);
			}else if(list.get(i).getManufacturer().equals("F11")) {
				analysis.setF11(analysis.getF11()+1);
			}else if(list.get(i).getManufacturer().equals("F12")) {
				analysis.setF12(analysis.getF12()+1);
			}else if(list.get(i).getManufacturer().equals("F13")) {
				analysis.setF13(analysis.getF13()+1);
			}else if(list.get(i).getManufacturer().equals("F14")) {
				analysis.setF14(analysis.getF14()+1);
			}else if(list.get(i).getManufacturer().equals("F15")) {
				analysis.setF15(analysis.getF15()+1);
			}else if(list.get(i).getManufacturer().equals("F16")) {
				analysis.setF16(analysis.getF16()+1);
			}else if(list.get(i).getManufacturer().equals("F17")) {
				analysis.setF17(analysis.getF17()+1);
			}else if(list.get(i).getManufacturer().equals("F18")) {
				analysis.setF18(analysis.getF18()+1);
			}else if(list.get(i).getManufacturer().equals("F19")) {
				analysis.setF19(analysis.getF19()+1);
			}else if(list.get(i).getManufacturer().equals("F20")) {
				analysis.setF20(analysis.getF20()+1);
			}
			
			//컬러
			if(list.get(i).getColor().equals("c01")) {
				analysis.setC1(analysis.getC1()+1);
			}else if(list.get(i).getColor().equals("c02")) {
				analysis.setC2(analysis.getC2()+1);
			}else if(list.get(i).getColor().equals("c03")) {
				analysis.setC3(analysis.getC3()+1);
			}else if(list.get(i).getColor().equals("c04")) {
				analysis.setC4(analysis.getC4()+1);
			}else if(list.get(i).getColor().equals("c05")) {
				analysis.setC5(analysis.getC5()+1);
			}else if(list.get(i).getColor().equals("c06")) {
				analysis.setC6(analysis.getC6()+1);
			}else if(list.get(i).getColor().equals("c07")) {
				analysis.setC7(analysis.getC7()+1);
			}else if(list.get(i).getColor().equals("c08")) {
				analysis.setC8(analysis.getC8()+1);
			}else if(list.get(i).getColor().equals("c09")) {
				analysis.setC9(analysis.getC9()+1);
			}else if(list.get(i).getColor().equals("c10")) {
				analysis.setC10(analysis.getC10()+1);
			}else if(list.get(i).getColor().equals("c11")) {
				analysis.setC11(analysis.getC11()+1);
			}else if(list.get(i).getColor().equals("c12")) {
				analysis.setC12(analysis.getC12()+1);
			}
			
			//소재
			if(list.get(i).getMaterial().equals("M1")) {
				analysis.setM1(analysis.getM1()+1);
			}else if(list.get(i).getMaterial().equals("M2")) {
				analysis.setM2(analysis.getM2()+1);
			}if(list.get(i).getMaterial().equals("M3")) {
				analysis.setM3(analysis.getM3()+1);
			}if(list.get(i).getMaterial().equals("M4")) {
				analysis.setM4(analysis.getM4()+1);
			}
			
			
			//제품명
			if(list.get(i).getProduct_name().equals("베개1")) {
				analysis.setPillow01(analysis.getPillow01()+1);
			}else if(list.get(i).getProduct_name().equals("베개2")) {
				analysis.setPillow02(analysis.getPillow02()+1);
			}else if(list.get(i).getProduct_name().equals("베개3")) {
				analysis.setPillow03(analysis.getPillow03()+1);
			}else if(list.get(i).getProduct_name().equals("베개4")) {
				analysis.setPillow04(analysis.getPillow04()+1);
			}else if(list.get(i).getProduct_name().equals("베개5")) {
				analysis.setPillow05(analysis.getPillow05()+1);
			}else if(list.get(i).getProduct_name().equals("베개6")) {
				analysis.setPillow06(analysis.getPillow06()+1);
			}else if(list.get(i).getProduct_name().equals("베개7")) {
				analysis.setPillow07(analysis.getPillow07()+1);
			}else if(list.get(i).getProduct_name().equals("베개8")) {
				analysis.setPillow08(analysis.getPillow08()+1);
			}else if(list.get(i).getProduct_name().equals("범퍼침대1")) {
				analysis.setBed01(analysis.getBed01()+1);
			}else if(list.get(i).getProduct_name().equals("범퍼침대2")) {
				analysis.setBed02(analysis.getBed02()+1);
			}else if(list.get(i).getProduct_name().equals("범퍼침대3")) {
				analysis.setBed03(analysis.getBed03()+1);
			}else if(list.get(i).getProduct_name().equals("범퍼침대4")) {
				analysis.setBed04(analysis.getBed04()+1);
			}else if(list.get(i).getProduct_name().equals("범퍼침대5")) {
				analysis.setBed05(analysis.getBed05()+1);
			}else if(list.get(i).getProduct_name().equals("범퍼침대6")) {
				analysis.setBed06(analysis.getBed06()+1);
			}else if(list.get(i).getProduct_name().equals("범퍼침대7")) {
				analysis.setBed07(analysis.getBed07()+1);
			}else if(list.get(i).getProduct_name().equals("범퍼침대8")) {
				analysis.setBed08(analysis.getBed08()+1);
			}else if(list.get(i).getProduct_name().equals("블랭킷1")) {
				analysis.setBedding01(analysis.getBedding01()+1);
			}else if(list.get(i).getProduct_name().equals("블랭킷2")) {
				analysis.setBedding02(analysis.getBedding02()+1);
			}else if(list.get(i).getProduct_name().equals("블랭킷3")) {
				analysis.setBedding03(analysis.getBedding03()+1);
			}else if(list.get(i).getProduct_name().equals("블랭킷4")) {
				analysis.setBedding04(analysis.getBedding04()+1);
			}else if(list.get(i).getProduct_name().equals("블랭킷5")) {
				analysis.setBedding05(analysis.getBedding05()+1);
			}else if(list.get(i).getProduct_name().equals("블랭킷6")) {
				analysis.setBedding06(analysis.getBedding06()+1);
			}else if(list.get(i).getProduct_name().equals("블랭킷7")) {
				analysis.setBedding07(analysis.getBedding07()+1);
			}else if(list.get(i).getProduct_name().equals("블랭킷8")) {
				analysis.setBedding08(analysis.getBedding08()+1);
			}else if(list.get(i).getProduct_name().equals("매트1")) {
				analysis.setMat01(analysis.getMat01()+1);
			}else if(list.get(i).getProduct_name().equals("매트2")) {
				analysis.setMat02(analysis.getMat02()+1);
			}else if(list.get(i).getProduct_name().equals("매트3")) {
				analysis.setMat03(analysis.getMat03()+1);
			}else if(list.get(i).getProduct_name().equals("매트4")) {
				analysis.setMat04(analysis.getMat04()+1);
			}else if(list.get(i).getProduct_name().equals("매트5")) {
				analysis.setMat05(analysis.getMat05()+1);
			}else if(list.get(i).getProduct_name().equals("매트6")) {
				analysis.setMat06(analysis.getMat06()+1);
			}else if(list.get(i).getProduct_name().equals("매트7")) {
				analysis.setMat07(analysis.getMat07()+1);
			}else if(list.get(i).getProduct_name().equals("매트8")) {
				analysis.setMat08(analysis.getMat08()+1);
			}}}}} catch (Exception e) {
				// TODO: handle exception
			}
			analysis.setBestPatternName1("p3");
			analysis.setBestPatternName2("p10");
			analysis.setBestPatternName3("p8");
			analysis.setBestPatternName4("p6");
			analysis.setBestManuFacturerName1("f14");
			analysis.setBestManuFacturerName2("f17");
			analysis.setBestManuFacturerName3("f16");
			analysis.setBestManuFacturerName4("f19");
			analysis.setBestColorName1("c11");
			analysis.setBestColorName2("c12");
			analysis.setBestColorName3("c10");
			analysis.setBestColorName4("c2");
			analysis.setBestMaterialName1("m4");
			analysis.setBestMaterialName2("m2");
			analysis.setBestMaterialName3("m1");
			analysis.setBestMaterialName4("m3");
			analysis.setBestBedName1("범퍼침대01");
			analysis.setBestBedName2("범퍼침대08");
			analysis.setBestBedName3("범퍼침대06");
			analysis.setBestBedName4("범퍼침대05");
			analysis.setBestPillowName1("베개02");
			analysis.setBestPillowName2("베개04");
			analysis.setBestPillowName3("베개01");
			analysis.setBestPillowName4("베개03");
			analysis.setBestBeddingName1("이불03");
			analysis.setBestBeddingName2("이불07");
			analysis.setBestBeddingName3("이불08");
			analysis.setBestBeddingName4("이불01");
			analysis.setBestMatName1("매트05");
			analysis.setBestMatName2("매트02");
			analysis.setBestMatName3("매트04");
			analysis.setBestMatName4("매트03");
			
			analysis.setBestPatternName1("니혼바리");
			analysis.setBestPatternName2("싱글 삼봉");
			analysis.setBestPatternName3("이본 오바룩");
			analysis.setBestPatternName4("오바룩");
			analysis.setBestManuFacturerName1("비비엔다");
			analysis.setBestManuFacturerName2("아가방");
			analysis.setBestManuFacturerName3("블루오션");
			analysis.setBestManuFacturerName4("코튼");
			analysis.setBestColorName1("라마 브라운");
			analysis.setBestColorName2("베어 브라운");
			analysis.setBestColorName3("브라운");
			analysis.setBestColorName4("베이지");
			analysis.setBestMaterialName1("순면");
			analysis.setBestMaterialName2("매쉬");
			analysis.setBestMaterialName3("린넨");
			analysis.setBestMaterialName4("울");
			analysis.setBestBedName1("범퍼침대01");
			analysis.setBestBedName2("범퍼침대08");
			analysis.setBestBedName3("범퍼침대06");
			analysis.setBestBedName4("범퍼침대05");
			analysis.setBestPillowName1("베개02");
			analysis.setBestPillowName2("베개04");
			analysis.setBestPillowName3("베개01");
			analysis.setBestPillowName4("베개03");
			analysis.setBestBeddingName1("이불03");
			analysis.setBestBeddingName2("이불07");
			analysis.setBestBeddingName3("이불08");
			analysis.setBestBeddingName4("이불01");
			analysis.setBestMatName1("매트05");
			analysis.setBestMatName2("매트02");
			analysis.setBestMatName3("매트04");
			analysis.setBestMatName4("매트03");
			
			float aa = analysis.getP3()+analysis.getP10()+analysis.getP8()+analysis.getP6();
			double a1=Double.parseDouble(String.format("%.2f",analysis.getP3()/aa));
			double a2=Double.parseDouble(String.format("%.2f",analysis.getP10()/aa));
			double a3=Double.parseDouble(String.format("%.2f",analysis.getP8()/aa));
			double a4=Double.parseDouble(String.format("%.2f",analysis.getP6()/aa));
			a1=Math.round(100*a1);
			a2=Math.round(100*a2);
			a3=Math.round(100*a3);
			a4=Math.round(100*a4);
			analysis.setBestPattern1(a1);
			analysis.setBestPattern2(a2);
			analysis.setBestPattern3(a3);
			analysis.setBestPattern4(a4);
			
			aa = analysis.getF14()+analysis.getF17()+analysis.getF16()+analysis.getF19();
			a1=Double.parseDouble(String.format("%.2f",analysis.getF14()/aa));
			a2=Double.parseDouble(String.format("%.2f",analysis.getF17()/aa));
			a3=Double.parseDouble(String.format("%.2f",analysis.getF16()/aa));
			a4=Double.parseDouble(String.format("%.2f",analysis.getF19()/aa));
			a1=Math.round(100*a1);
			a2=Math.round(100*a2);
			a3=Math.round(100*a3);
			a4=Math.round(100*a4);
			analysis.setBestManuFacturer1(a1);
			analysis.setBestManuFacturer2(a2);
			analysis.setBestManuFacturer3(a3);
			analysis.setBestManuFacturer4(a4);
			
			aa = analysis.getC11()+analysis.getC12()+analysis.getC10()+analysis.getC2();
			a1=Double.parseDouble(String.format("%.2f",analysis.getC11()/aa));
			a2=Double.parseDouble(String.format("%.2f",analysis.getC12()/aa));
			a3=Double.parseDouble(String.format("%.2f",analysis.getC10()/aa));
			a4=Double.parseDouble(String.format("%.2f",analysis.getC2()/aa));
			a1=Math.round(100*a1);
			a2=Math.round(100*a2);
			a3=Math.round(100*a3);
			a4=Math.round(100*a4);
			analysis.setBestColor1(a1);
			analysis.setBestColor2(a2);
			analysis.setBestColor3(a3);
			analysis.setBestColor4(a4);
			
			aa = analysis.getM4()+analysis.getM2()+analysis.getM1()+analysis.getM3();
			a1=Double.parseDouble(String.format("%.2f",analysis.getM4()/aa));
			a2=Double.parseDouble(String.format("%.2f",analysis.getM2()/aa));
			a3=Double.parseDouble(String.format("%.2f",analysis.getM1()/aa));
			a4=Double.parseDouble(String.format("%.2f",analysis.getM3()/aa));
			a1=Math.round(100*a1);
			a2=Math.round(100*a2);
			a3=Math.round(100*a3);
			a4=Math.round(100*a4);
			System.out.println(a1+ a2+ a3+ a4);
			analysis.setBestMaterial1(a1);
			analysis.setBestMaterial2(a2);
			analysis.setBestMaterial3(a3-1);
			analysis.setBestMaterial4(a4);
			
			aa = analysis.getBed01()+analysis.getBed08()+analysis.getBed06()+analysis.getBed05();
			a1=analysis.getBed01();
			a2=analysis.getBed08();
			a3=analysis.getBed06();
			a4=analysis.getBed05();
			a1=Double.parseDouble(String.format("%.2f",a1/aa));
			a2=Double.parseDouble(String.format("%.2f",a2/aa));
			a3=Double.parseDouble(String.format("%.2f",a3/aa));
			a4=Double.parseDouble(String.format("%.2f",a4/aa));
			System.out.println(a1);
			System.out.println(a2);
			System.out.println(a3);
			System.out.println(a4);
			BigDecimal aa1 = new BigDecimal(a1);
			BigDecimal aa2 = new BigDecimal(a2);
			BigDecimal aa3 = new BigDecimal(a3);
			BigDecimal aa4 = new BigDecimal(a4);
			BigDecimal a360 = new BigDecimal("360");
			aa1 = aa1.multiply(a360);
			aa2 = aa2.multiply(a360);
			aa3 = aa3.multiply(a360);
			aa4 = aa4.multiply(a360);
			System.out.println(aa1);
			System.out.println(aa2);
			System.out.println(aa3);
			System.out.println(aa4);
			a1 = aa1.doubleValue();
			a2 = aa2.doubleValue();
			a3 = aa3.doubleValue();
			a4 = aa4.doubleValue();
			a1 = Math.round(a1);
			a2 = Math.round(a2);
			a3 = Math.round(a3);
			a4 = Math.round(a4);
			analysis.setBestBed1(360);
			analysis.setBestBed2(360-a1);
			analysis.setBestBed3(360-a1-a2);
			analysis.setBestBed4(360-a1-a2-a3);
			
			aa = analysis.getPillow02()+analysis.getPillow04()+analysis.getPillow01()+analysis.getPillow03();
			System.out.println(aa);
			a1=analysis.getPillow02();
			a2=analysis.getPillow04();
			a3=analysis.getPillow01();
			a4=analysis.getPillow03();
			a1=Double.parseDouble(String.format("%.2f",a1/aa));
			a2=Double.parseDouble(String.format("%.2f",a2/aa));
			a3=Double.parseDouble(String.format("%.2f",a3/aa));
			a4=Double.parseDouble(String.format("%.2f",a4/aa));
			aa1 = new BigDecimal(a1);
			aa2 = new BigDecimal(a2);
			aa3 = new BigDecimal(a3);
			aa4 = new BigDecimal(a4);
			a360 = new BigDecimal("360");
			aa1 = aa1.multiply(a360);
			aa2 = aa2.multiply(a360);
			aa3 = aa3.multiply(a360);
			aa4 = aa4.multiply(a360);
			a1 = aa1.doubleValue();
			a2 = aa2.doubleValue();
			a3 = aa3.doubleValue();
			a4 = aa4.doubleValue();
			a1 = Math.round(a1);
			a2 = Math.round(a2);
			a3 = Math.round(a3);
			a4 = Math.round(a4);
			analysis.setBestPillow1(360);
			analysis.setBestPillow2(360-a1);
			analysis.setBestPillow3(360-a1-a2);
			analysis.setBestPillow4(360-a1-a2-a3);
			
			
			
			aa = analysis.getBedding03()+analysis.getBedding07()+analysis.getBedding08()+analysis.getBedding01();
			System.out.println(aa);
			a1=analysis.getBedding03();
			a2=analysis.getBedding07();
			a3=analysis.getBedding08();
			a4=analysis.getBedding01();
			a1=Double.parseDouble(String.format("%.2f",a1/aa));
			a2=Double.parseDouble(String.format("%.2f",a2/aa));
			a3=Double.parseDouble(String.format("%.2f",a3/aa));
			a4=Double.parseDouble(String.format("%.2f",a4/aa));
			aa1 = new BigDecimal(a1);
			aa2 = new BigDecimal(a2);
			aa3 = new BigDecimal(a3);
			aa4 = new BigDecimal(a4);
			a360 = new BigDecimal("360");
			aa1 = aa1.multiply(a360);
			aa2 = aa2.multiply(a360);
			aa3 = aa3.multiply(a360);
			aa4 = aa4.multiply(a360);
			a1 = aa1.doubleValue();
			a2 = aa2.doubleValue();
			a3 = aa3.doubleValue();
			a4 = aa4.doubleValue();
			a1 = Math.round(a1);
			a2 = Math.round(a2);
			a3 = Math.round(a3);
			a4 = Math.round(a4);
			analysis.setBestBedding1(360);
			analysis.setBestBedding2(360-a1);
			analysis.setBestBedding3(360-a1-a2);
			analysis.setBestBedding4(360-a1-a2-a3);
			
			aa = analysis.getMat05()+analysis.getMat02()+analysis.getMat04()+analysis.getMat03();
			System.out.println(aa);
			a1=analysis.getMat05();
			a2=analysis.getMat02();
			a3=analysis.getMat04();
			a4=analysis.getMat03();
			a1=Double.parseDouble(String.format("%.2f",a1/aa));
			a2=Double.parseDouble(String.format("%.2f",a2/aa));
			a3=Double.parseDouble(String.format("%.2f",a3/aa));
			a4=Double.parseDouble(String.format("%.2f",a4/aa));
			aa1 = new BigDecimal(a1);
			aa2 = new BigDecimal(a2);
			aa3 = new BigDecimal(a3);
			aa4 = new BigDecimal(a4);
			a360 = new BigDecimal("360");
			aa1 = aa1.multiply(a360);
			aa2 = aa2.multiply(a360);
			aa3 = aa3.multiply(a360);
			aa4 = aa4.multiply(a360);
			a1 = aa1.doubleValue();
			a2 = aa2.doubleValue();
			a3 = aa3.doubleValue();
			a4 = aa4.doubleValue();
			a1 = Math.round(a1);
			a2 = Math.round(a2);
			a3 = Math.round(a3);
			a4 = Math.round(a4);
			analysis.setBestMat1(360);
			analysis.setBestMat2(360-a1);
			analysis.setBestMat3(360-a1-a2);
			analysis.setBestMat4(360-a1-a2-a3);
			
		
		return analysis;
	}
	
	public analysisVO gendercount(trendVO vo, List<trendVO> list) {
		List<trendVO> resultlist = new ArrayList<>();
		//연령 모든 나이
		if(vo.getAllage()!=null) {
			// list = boardmapper.selectTrendAll();
			System.out.println(list.size());
			analysis = count(list);
		}else { // 모든나이 x 나이 선택 시
			if(vo.getAge20()!=null) { //20대 선택시
				System.out.println("20대 선택 됐는지");
				for(int i=0;i<list.size();i++) {
					//나이 숫자로
					int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
					
					if( age<30 ) {
						System.out.println(vo);
						resultlist.add(list.get(i));
					}
				}
			}
			if(vo.getAge30()!=null) { //30대 선택시
				System.out.println("30대 선택 됐는지");
				for(int i=0;i<list.size();i++) {
					//나이 숫자로
					int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
					
					if( age>=30 && age<40) {
						System.out.println(age);
						resultlist.add(list.get(i));
					}
				}
			}
			if(vo.getAge40()!=null) { //40대 선택시
				System.out.println("40대 선택 됐는지");
				for(int i=0;i<list.size();i++) {
					//나이 숫자로
					int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
					
					if( age>=40 && age<50) {
						System.out.println(age);
						resultlist.add(list.get(i));
					}
				}
			}
			if(vo.getAge50()!=null) { //50대 선택시
				System.out.println("50대 선택 됐는지");
				for(int i=0;i<list.size();i++) {
					//나이 숫자로
					int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
					
					if( age>=50 && age<60) {
						System.out.println(age);
						resultlist.add(list.get(i));
					}
				}
			}
			analysis = count(resultlist);
		}//나이선택 로직 끝
		return analysis;
	}
	
	public analysisVO seasoncount(trendVO vo, List<trendVO> list, List<trendVO> genderlist) {
		List<trendVO> resultlist = new ArrayList<>();
		//성별
		if(vo.getGender().equals("allgender")) {
			//연령 모든 나이
			if(vo.getAllage()!=null) {
				// list = boardmapper.selectTrendAll();
				System.out.println(list.size());
				analysis = count(list);
			}else { // 모든나이 x 나이 선택 시
				if(vo.getAge20()!=null) { //20대 선택시
					System.out.println("20대 선택 됐는지");
					for(int i=0;i<list.size();i++) {
						//나이 숫자로
						int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
						
						if( age<30 ) {
							System.out.println(vo);
							resultlist.add(list.get(i));
						}
					}
				}
				if(vo.getAge30()!=null) { //30대 선택시
					System.out.println("30대 선택 됐는지");
					for(int i=0;i<list.size();i++) {
						//나이 숫자로
						int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
						
						if( age>=30 && age<40) {
							System.out.println(age);
							resultlist.add(list.get(i));
						}
					}
				}
				if(vo.getAge40()!=null) { //40대 선택시
					System.out.println("40대 선택 됐는지");
					for(int i=0;i<list.size();i++) {
						//나이 숫자로
						int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
						
						if( age>=40 && age<50) {
							System.out.println(age);
							resultlist.add(list.get(i));
						}
					}
				}
				if(vo.getAge50()!=null) { //50대 선택시
					System.out.println("50대 선택 됐는지");
					for(int i=0;i<list.size();i++) {
						//나이 숫자로
						int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
						
						if( age>=50 && age<60) {
							System.out.println(age);
							resultlist.add(list.get(i));
						}
					}
				}
				analysis = count(resultlist);
			}//나이선택 로직 끝
		}else if(vo.getGender().equals("f")) {
			System.out.println("여자임");
			for(int i =0;i<list.size();i++) {
				if(list.get(i).getGender().equals("f")) {
				genderlist.add(list.get(i));
				}
			}
			analysis = gendercount(vo, genderlist);
		}else {
			System.out.println("남자임");
			for(int i =0;i<list.size();i++) {
				if(list.get(i).getGender().equals("m")) {
				genderlist.add(list.get(i));
				}
			}
			analysis = gendercount(vo, genderlist);
		}
		return analysis;
	}
	
	public analysisVO productcount(trendVO vo, List<trendVO> list, List<trendVO> genderlist, List<trendVO> seasonlist) {
		List<trendVO> resultlist = new ArrayList<>();
		//기간
		if(vo.getSeason().equals("allseason")) {
			//성별
			if(vo.getGender().equals("allgender")) {
				//연령 모든 나이
				if(vo.getAllage()!=null) {
					// list = boardmapper.selectTrendAll();
					System.out.println(list.size());
					analysis = count(list);
				}else { // 모든나이 x 나이 선택 시
					if(vo.getAge20()!=null) { //20대 선택시
						System.out.println("20대 선택 됐는지");
						for(int i=0;i<list.size();i++) {
							//나이 숫자로
							int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
							
							if( age<30 ) {
								System.out.println(vo);
								resultlist.add(list.get(i));
							}
						}
					}
					if(vo.getAge30()!=null) { //30대 선택시
						System.out.println("30대 선택 됐는지");
						for(int i=0;i<list.size();i++) {
							//나이 숫자로
							int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
							
							if( age>=30 && age<40) {
								System.out.println(age);
								resultlist.add(list.get(i));
							}
						}
					}
					if(vo.getAge40()!=null) { //40대 선택시
						System.out.println("40대 선택 됐는지");
						for(int i=0;i<list.size();i++) {
							//나이 숫자로
							int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
							
							if( age>=40 && age<50) {
								System.out.println(age);
								resultlist.add(list.get(i));
							}
						}
					}
					if(vo.getAge50()!=null) { //50대 선택시
						System.out.println("50대 선택 됐는지");
						for(int i=0;i<list.size();i++) {
							//나이 숫자로
							int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
							
							if( age>=50 && age<60) {
								System.out.println(age);
								resultlist.add(list.get(i));
							}
						}
					}
					analysis = count(resultlist);
				}//나이선택 로직 끝
			}else if(vo.getGender().equals("f")) {
				System.out.println("여자임");
				for(int i =0;i<list.size();i++) {
					if(list.get(i).getGender().equals("f")) {
					genderlist.add(list.get(i));
					}
				}
				analysis = gendercount(vo, genderlist);
			}else {
				System.out.println("남자임");
				for(int i =0;i<list.size();i++) {
					if(list.get(i).getGender().equals("m")) {
					genderlist.add(list.get(i));
					}
				}
				analysis = gendercount(vo, genderlist);
			}
		}else if(vo.getSeason().equals("SS")) {
			System.out.println("ss");
			for(int i =0;i<list.size();i++) {
				if(list.get(i).getSeason().equals("S/S")) {
				seasonlist.add(list.get(i));
				System.out.println(list.get(i));
				}
			}analysis = seasoncount(vo, seasonlist, genderlist);
		}else {
			System.out.println("fw");
			for(int i =0;i<list.size();i++) {
				if(list.get(i).getSeason().equals("F/W")) {
				seasonlist.add(list.get(i));
				}
			}analysis = seasoncount(vo, seasonlist, genderlist);
		}
		return analysis;
	}
	
	@SuppressWarnings("null")
	@RequestMapping("/selectTrend.do")
	public String selectTrend(trendVO vo, Model model) {
		System.out.println(vo);
		List<trendVO> list;
		list = boardmapper.selectTrendAll();
		List<trendVO> resultlist = new ArrayList<>();
		System.out.println("선언하면 어케생겻는지"+analysis);
		analysis = new analysisVO();
		List<trendVO> genderlist = new ArrayList<>();
		List<trendVO> seasonlist = new ArrayList<>();
		List<trendVO> productlist = new ArrayList<>();
		// 분류
		if(vo.getProduct_type().equals("alltype")) {
			//기간
			if(vo.getSeason().equals("allseason")) {
				//성별
				if(vo.getGender().equals("allgender")) {
					//연령 모든 나이
					if(vo.getAllage()!=null) {
						// list = boardmapper.selectTrendAll();
						System.out.println(list.size());
						analysis = count(list);
					}else { // 모든나이 x 나이 선택 시
						if(vo.getAge20()!=null) { //20대 선택시
							System.out.println("20대 선택 됐는지");
							for(int i=0;i<list.size();i++) {
								//나이 숫자로
								int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
								
								if( age<30 ) {
									System.out.println(vo);
									resultlist.add(list.get(i));
								}
							}
						}
						if(vo.getAge30()!=null) { //30대 선택시
							System.out.println("30대 선택 됐는지");
							for(int i=0;i<list.size();i++) {
								//나이 숫자로
								int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
								
								if( age>=30 && age<40) {
									System.out.println(age);
									resultlist.add(list.get(i));
								}
							}
						}
						if(vo.getAge40()!=null) { //40대 선택시
							System.out.println("40대 선택 됐는지");
							for(int i=0;i<list.size();i++) {
								//나이 숫자로
								int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
								
								if( age>=40 && age<50) {
									System.out.println(age);
									resultlist.add(list.get(i));
								}
							}
						}
						if(vo.getAge50()!=null) { //50대 선택시
							System.out.println("50대 선택 됐는지");
							for(int i=0;i<list.size();i++) {
								//나이 숫자로
								int age = Integer.parseInt(list.get(i).getAge().split("\\.")[0]);
								
								if( age>=50 && age<60) {
									System.out.println(age);
									resultlist.add(list.get(i));
								}
							}
						}
						analysis = count(resultlist);
					}//나이선택 로직 끝
				}else if(vo.getGender().equals("f")) {
					System.out.println("여자임");
					for(int i =0;i<list.size();i++) {
						if(list.get(i).getGender().equals("f")) {
						genderlist.add(list.get(i));
						}
					}
					analysis = gendercount(vo, genderlist);
				}else {
					System.out.println("남자임");
					for(int i =0;i<list.size();i++) {
						if(list.get(i).getGender().equals("m")) {
						genderlist.add(list.get(i));
						}
					}
					analysis = gendercount(vo, genderlist);
				}
			}else if(vo.getSeason().equals("SS")) {
				System.out.println("ss");
				for(int i =0;i<list.size();i++) {
					if(list.get(i).getSeason().equals("S/S")) {
					seasonlist.add(list.get(i));
					System.out.println(list.get(i));
					}
				}analysis = seasoncount(vo, seasonlist, genderlist);
			}else {
				System.out.println("fw");
				for(int i =0;i<list.size();i++) {
					if(list.get(i).getSeason().equals("F/W")) {
					seasonlist.add(list.get(i));
					}
				}analysis = seasoncount(vo, seasonlist, genderlist);
			}
		}else if(vo.getProduct_type().equals("type01")) {
			System.out.println("type01");
			for(int i =0;i<list.size();i++) {
				if(list.get(i).getProduct_type().equals("type01")) {
				productlist.add(list.get(i));
				System.out.println(list.get(i));
				}
			}analysis = productcount(vo, productlist, genderlist, seasonlist);
		}else if(vo.getProduct_type().equals("type02")) {
			System.out.println("type02");
			for(int i =0;i<list.size();i++) {
				if(list.get(i).getProduct_type().equals("type02")) {
				productlist.add(list.get(i));
				System.out.println(list.get(i));
				}
			}analysis = productcount(vo, productlist, genderlist, seasonlist);
		}
		else if(vo.getProduct_type().equals("type03")) {
			System.out.println("type03");
			for(int i =0;i<list.size();i++) {
				if(list.get(i).getProduct_type().equals("type03")) {
				productlist.add(list.get(i));
				System.out.println(list.get(i));
				}
			}analysis = productcount(vo, productlist, genderlist, seasonlist);
		}else {
			System.out.println("type04");
			for(int i =0;i<list.size();i++) {
				if(list.get(i).getProduct_type().equals("type04")) {
				productlist.add(list.get(i));
				System.out.println(list.get(i));
				}
			}analysis = productcount(vo, productlist, genderlist, seasonlist);
		}
		
		System.out.println("끝"+analysis);
		model.addAttribute("analysis", analysis);
		return "redirect:/tt.do?select=0&vo="+vo.getAge10();
	}


	@RequestMapping("/excel.do")
	public void downloadExcel(HttpServletResponse response)throws IOException{
		  Workbook workbook = new HSSFWorkbook();
	        Sheet sheet = workbook.createSheet("구매트렌드분석");
	        int rowNo = 0;
	        
	        Row headerRow = sheet.createRow(rowNo++);
	        headerRow.createCell(0).setCellValue("성별");
	        headerRow.createCell(1).setCellValue("나이");
	        headerRow.createCell(2).setCellValue("제품유형");
	        headerRow.createCell(3).setCellValue("컬러");
	        headerRow.createCell(4).setCellValue("패턴");
	        headerRow.createCell(5).setCellValue("소재");
	        headerRow.createCell(6).setCellValue("선택제조사");
	        headerRow.createCell(7).setCellValue("제품명");
	 
	        List<trendVO> list = boardmapper.selectTrendAll();
	        
	        for (trendVO trend : list) {
	        	System.out.println("ddd"+trend.getAge());
	        	if(Double.parseDouble(trend.getAge())<60) {
	        		if(Double.parseDouble(trend.getAge())>=20) {
	            Row row = sheet.createRow(rowNo++);
	            row.createCell(0).setCellValue(trend.getGender());
	            row.createCell(1).setCellValue(trend.getAge().substring(0, 2));
	            row.createCell(2).setCellValue(trend.getProduct_type());
	            row.createCell(3).setCellValue(trend.getColor());
	            row.createCell(4).setCellValue(trend.getPattern());
	            row.createCell(5).setCellValue(trend.getMaterial());
	            row.createCell(6).setCellValue(trend.getManufacturer());
	            row.createCell(7).setCellValue(trend.getProduct_name());
	        }}}
	 
	        response.setContentType("ms-vnd/excel");
	        response.setHeader("Content-Disposition", "attachment;filename=boardlist.xls");
	 
	        workbook.write(response.getOutputStream());
	        workbook.close();
	}


	

}
