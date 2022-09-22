package com.uni.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
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
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

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
		model.addAttribute("analysis", analysis);
		return "trend_analysis";
	}
	
	
	@RequestMapping("/login.do")
	public String login(customerVO vo, Model model) {
		if (vo.getId().equals("admin")) {
			vo.setName("비비엔다");
			vo.setSortation("admin"); 
			customer = vo;
		} else if (vo.getId().equals("mj")) {
			vo.setName("김민지");
			vo.setSortation("user");
			customer = vo;
		};
		return "redirect:/mainjsp.do";
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
		String urlStr = "https://info.sweettracker.co.kr/api/v1/trackingInfo?t_key=RYGUeWCvAxYjySIJEkk22A&t_code=04&t_invoice=650951690445";
		
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
		for (int i = 0; i < list.size(); i++) {
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
			}else if(list.get(i).getManufacturer().equals("F02")) {
				analysis.setF2(analysis.getF2()+1);
			}else if(list.get(i).getManufacturer().equals("F03")) {
				analysis.setF3(analysis.getF3()+1);
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
		}
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
		return "redirect:/trend_analysisjsp.do?select=0";
	}
}
