 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.uni.domain.MemberVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Soultion U MES</title>
    <link rel="icon" href="./resources/img/favicon.png">
    <!-- css -->

  <link rel="stylesheet" href="./resources/css/0817/product.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/customer.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/goods.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/main.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/user.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/login.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/Fin_product.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/order_plan.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/order.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/plan.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/material.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/out_order.css" type="text/css">
    <link rel="stylesheet" href="./resources/css/0817/produc_faulty.css" type="text/css">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="./resources/css/0817/main.css" media="screen and(min-width: 215px) and (max-width: 1024px)" rel="stylesheet">
    <style type="text/css" media="screen and(min-width: 215px) and (max-width: 1024px)">
        @import url(./resources/css/0817/main.css) screen and(min-width: 215px) and (max-width: 1024px);
    </style>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script  src="http://d3js.org/d3.v3.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/036f0eb301.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

     <!-- chart 라이브러리 -->
     <script type="text/javascript" charset="utf-8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>

  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <!-- pdf.js -->
     <script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script> 
     <script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
     <script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
     
</head>

<body>
<div id="main_nav">
        <header id="header">
          <section class="hbody" id="header">
            <article class="nav">
              <div style="float:left">
              <c:if test="${company=='sy'}">
                    <img src="./resources/img/logo_sy.png" id="main_" style="align-items: center; width: 150px;">
                </c:if>
                <c:if test="${company=='fourever'}">
                    <img src="./resources/img/logo_fourever.png" id="main_" style="align-items: center; width: 150px;">
                </c:if>
                <c:if test="${company=='sbum'}">
                    <img src="./resources/img/logo_sbum.png" id="main_" style="align-items: center; width: 150px;">
                </c:if>
                <c:if test="${company=='sbu'}">
                    <img src="./resources/img/logo_sbu.png" id="main_" style="align-items: center; width: 150px;">
                </c:if>
                <c:if test="${company=='easy'}">
                    <img src="./resources/img/logo_easy.png" id="main_" style="align-items: center; width: 150px;">
                </c:if>
                <c:if test="${company=='ecovers'}">
                    <img src="./resources/img/logo_ecovers.png" id="main_" style="align-items: center; width: 150px;">
                </c:if>
                <c:if test="${company=='daechang'}">
                    <img src="./resources/img/logo_daechang.png" id="main_" style="align-items: center; width: 150px;">
                </c:if>
                </div>
              <div class="title"><a><img src="./resources/img/logo.png" id="main_" style="align-items: center; width: 190px;"></a></div>
               <div><ul id="menu"><li style=" float: right;"><a href="logout.do"><button>로그아웃</button></a></li><li style=" float: right;"><a id="typing"></a><a class="typing-txt">${username}님, 환영합니다&nbsp;&nbsp;</a></li></ul></div>
            </article>
          </section>
       </header>
        <nav class="sidebar" id="scrollBar">
        <ul>
            <li class="active">
                <a href="#" class="one-btn"><i class="fa-regular fa-circle-user"></i>기준정보
                <div class="fa-solid fa-angle-down first"></div>
                </a>
                <ul class="one-show">
                    <li><a href="#" id="user_li">사용자 관리</a></li>
                    <li><a href="#" id="finProduct_li">제품관리</a></li>
                    <li><a href="#" id="goods_li">품목정보 관리</a></li>
                    <li><a href="#" id="customer_li">거래처 관리</a></li>
                    <li><a href="#" id="bom_li">BOM 관리</a></li>
                </ul>
            </li>
            <li class="active">
                <a href="#" class="two-btn"><i class="fa-solid fa-file-pen"></i>생산 관리
                <div class="fa-solid fa-angle-down second"></div>
                </a>
                <ul class="two-show">
                    <li><a href="#" id="producPlan_li">생산계획</a></li>
                    <li><a href="#" id="order_li">작업지시</a></li>
                    <li><a href="#" id="orderView_li">작업지시조회</a></li>
                    <li><a href="#" id="product_li" >생산일보</a></li>
                    <li><a href="#" id="productView_li">생산실적조회</a></li>
                </ul>
            </li>
            <li class="active">
                <a href="#" class="three-btn"><i class="fa-solid fa-cart-arrow-down"></i>자재 관리
                <div class="fa-solid fa-angle-down third"></div>
                </a>
                <ul class="three-show">
                    <li><a href="#" id="material_li">자재 발주</a></li>
                    <li><a href="#" id="materialView_li">자재 발주 조회</a></li>
                    <li><a href="#" id="materialArrival_li">자재 입고 현황</a></li>
                    <li><a href="#" id="inventoryList_li">자재 재고 현황</a></li>
                </ul>
            </li>
            <li class="active">
                <a href="#" class="four-btn"><i class="fa-solid fa-truck"></i>물류 관리
                <div class="fa-solid fa-angle-down forth"></div>
                </a>
                <ul class="four-show">
                    <li><a href="#" id="outOrder_li">출고 지시</a></li>
                    <li><a href="#" id="release_li">출고 조회</a></li>
                </ul>
            </li>
            <li class="active">
                <a href="#" class="five-btn"><i class="fa-solid fa-screwdriver-wrench"></i>품질 관리
                <div class="fa-solid fa-angle-down fifth"></div>
                </a>
                <ul class="five-show">
                    <li><a href="#" id="produFaulty_li">불량 수량 입력</a></li>
                    <li><a href="#" id="qualityInspection_li">품질 검사 내역 조회</a></li>
                    <li><a href="#" id="processDefect_li">공정 불량 현황</a></li>
                    <li><a href="#" id="faultyList_li">불량률 조회</a></li>
                </ul>
            </li>
            <li class="active">
              <a href="#" class="six-btn"><i class="fa-solid fa-basket-shopping"></i>주문 관리
              <div class="fa-solid fa-angle-down sixth"></div>
              </a>
              <ul class="six-show">
                  <li><a href="#" id="proOrder_li">주문 내역 조회</a></li>
                  <li><a href="#" id="orderAdmin_li">오더 관리</a></li>
              </ul>
          </li>
            <li class="active">
                <a href="#" class="seve-btn" id="xrAdmin_li"><i class="fa-solid fa-chart-line"></i>X-R 관리도
                </a>
            </li>
        </ul>
    </nav>
  </div>
    <div id="productView">
      <div class="use_wrapper">
        <div class="menu">생산&nbsp&nbsp > &nbsp&nbsp생산실적 조회
        </div>
      </div>
      <div class="productView_wrapp">
    <div class="use_wrapper">
      <div style="margin-top: 10px;">
        <div class="btn">
          <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
            <a style="padding:8px;" >실적 작성일</a>
            <input class="us" type="date"  >
          </div>
          <b style="color: #126AEA;">&nbsp;~&nbsp;</a><input  class="us" type="date"></b>
          <div class="btn_search" style="margin-right: 30px;padding: 0px 6px 0px 0px;padding-right: 10px;">
          <input class="us" >
          <a style="padding:8px" ><i class="fa-solid fa-magnifying-glass"></i>검색</a>
        </div>
        </div>
      </div>
    <div class="produc" style="margin-top: 30px; height: 760px;">
      <table class="user_tb">
        <tr>
          <td></td>
          <th >생산일</th>  
          <th >시프트</th>
          <th >공정명</th>
          <th >설비명</th>
          <th >품목번호</th>
          <th >LOT번호</th>
          <th >실적수량</th>
          <th >양품수량</th>
          <th >불량수량</th>
          <th >불량코드</th>
          <th >부서</th>
          <th >작성자</th>
          <th >조회</th>
        </tr>
        <c:forEach var="vo" items="${productionPerformancelist}">
    		 	<tr>
    		 	<td><input type="checkbox"></td>
    		 	<td>${vo.productionDate}</td>
    			<td>${vo.shift }</td>
    			<td>${vo.process }</td>
    			<td>${vo.facilities }</td>
    			<td>${vo.product_id }</td>
    			<td>${vo.process_routing_id }</td>
    			<td>${vo.performanceQuantity }</td>
    			<td>${vo.goodProductQuantity }</td>
    			<td>${vo.defectQuantity }</td>
    			<td>${vo.defectCode }</td>
    			<td>${vo.department }</td>
    			<td>${vo.writer }</td>
    			<td>${vo.views }</td>
    			<!-- <td><button class="user-delete" type="button" onclick="deleteRow(this)" style="border-color:gray"></button></td> -->
    		 	</tr>
    		 
    	</c:forEach>
          <tr>
            <td><input type="checkbox"></td>
            <td colspan="14"></td>
          </tr>
          <tr>
            <td><input type="checkbox"></td>
            <td colspan="14"></td>
          </tr>
          <tr>
            <td><input type="checkbox"></td>
            <td colspan="14"></td>
          </tr>
          <tr>
            <td><input type="checkbox"></td>
            <td colspan="14"></td>
          </tr>
          <tr>
            <td><input type="checkbox"></td>
            <td colspan="14"></td>
          </tr>
          <tr>
            <td><input type="checkbox"></td>
            <td colspan="14"></td>
          </tr>
          <tr>
            <td><input type="checkbox"></td>
            <td colspan="14"></td>
          </tr>
          <tr>
            <td><input type="checkbox"></td>
            <td colspan="14"></td>
          </tr>
          <tr>
            <td><input type="checkbox"></td>
            <td colspan="14"></td>
          </tr>
      </table>
    </div>
    </div>
  </div>
</div>

   <!-- 제품관리 -->
   <div id="fin_product">
    <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;margin-top:-77px"">
      <div id="usertitle">기준정보&nbsp&nbsp > &nbsp&nbsp제품관리</div>
    </section>
        <section class="user">
    <section class="fin_choice">  
     <!--완제품현황 선택란-->
     <article class="choice-table">                       
      <div class="finproduc-btn2">
        <button id="submit_production" class="finproduc-btn1"><i class="fa-solid fa-box-archive"></i>&nbsp&nbsp분류코드 저장</button>
      </div> 
        <table class="table table-boardered">
          <tr>
              <td class="num"></td>
              <td class="col-user1" style="text-align: left; border-left: 1px solid #E6E6E6; border-bottom: 1px solid #E6E6E6;">분류코드</td>
              <td class="col-user1" style="border-left: 1px solid #E6E6E6; border-bottom: 1px solid #E6E6E6;">입력란</td>
          </tr>
          <tr>
              <td class="num">1</td>
              <td class="col-user2">제품명</td>
              <td class="col-user3"><input type="text" id="pro_name" name="pro_name"></td>
          </tr>
          <tr>
              <td class="num">2</td>
              <td class="col-user2">품목 대분류</td>
              <td class="col-user3"><input type="text" id="pro_code_a" name="pro_code_a"></td>          
          </tr>
          <tr>
              <td class="num">3</td>
              <td class="col-user2">품목 중분류</td>
              <td class="col-user3"><input type="text" id="pro_code_b" name="pro_code_b"></td>
          </tr>
          <tr>
              <td class="num">4</td>
              <td class="col-user2">제품구분</td>
              <td class="col-user3">
              
              <select name="pro_family" id="pro_family" style="width:400px;height:30px;font-size:15px;height: 30px;width: 160px;text-align: center;">
                    <option value="slc1" selected>선택</option>
                    <option value="완제품">완제품</option>
                    <option value="원자재">원자재</option>
                    <option value="부자재">부자재</option>
                  </select>
              </td>
          </tr>
          <tr>
            <td class="num">5</td>
            <td class="col-user2">검사항목 입력단위</td>
            <td class="col-user3"><input type="text" id="pro_unit" name="pro_unit"></td>
           </tr>
          <tr>
            <td class="num">6</td>
            <td class="col-user2">검사기준</td>
            <td class="col-user3"><input type="text" id="pro_standard" name="pro_standard"></td>    
          </tr>
          <tr>
            <td class="num">7</td>
            <td class="col-user2">검사방법</td>
            <td class="col-user3"><input type="text" id="pro_how" name="pro_name"></td>    
          </tr>
          <tr>
            <td class="num">8</td>
            <td class="col-user2">작업 구분</td>
            <td class="col-user3"><input type="text" id="pro_work" name="pro_work"></td>    
          </tr>   
      </table>
      </article>
    </section>
    
    <!-- 제품관리 입력 -->
    <script type="text/javascript">
	$('#submit_production').click(function() {
		let pro_name = $('#pro_name').val();
        let pro_code_a = $('#pro_code_a').val();
        let pro_code_b = $('#pro_code_b').val();
        let pro_family = $('#pro_family').val();
        let pro_unit = $('#pro_unit').val();
        let pro_standard = $('#pro_standard').val();
        let pro_how = $('#pro_how').val();
        let pro_work = $('#pro_work').val();
		
		$.ajax({
			url : "productonInsert.do",
		      type : "GET",
		      async:false,
		      data : {"pro_name":pro_name,
		    	  "pro_code_a":pro_code_a,
		    	  "pro_code_b":pro_code_b,
		    	  "pro_family":pro_family,
		    	  "pro_unit":pro_unit,
		    	  "pro_standard":pro_standard,
		    	  "pro_how":pro_how,
		    	  "pro_work":pro_work,
		      },
		      success: function(result) {
          if (result) {
              alert("제품 등록이 완료되었습니다.");
              let url="mainjsp.do?page=production"
           	  location.replace(url);
          } else {
              alert("전송된 값 없음");
          }
      },
      error: function() {
          alert("에러 발생");
      }
		   });
	});
	</script>
    
    
    <!-- 등록된 제품 -->
    <section class="fin-list" style="overflow-y: scroll;">
        <table class="fin-table">
          <tr class="fin-main">
            <th class="menu" style=" width: 22%;">제품명</th>
            <th class="code_name" style=" width: 22%;">품목분류</th>
            <th class="code_cont" style=" width: 22%;">제품군</th>
            <th class="code_cont" style=" width: 22%;">검사방법</th>
            <th class="fin_delete" style=" width: 12%;">삭제</th>
          </tr>
          <!-- <tr>
            <td class="menu">플레버 신선도 유지제</td>
            <td class="code_name">fourever001</td>
            <td class="code_cont">액체형제조</td>
            <td class="fin_delete">
              <button class="fin-delete" type="button" onclick="deleteRow(this)" style="background-color: #41515e; color:white;  height: 20px; width: 20px;">X</button>
            </td>
          </tr> -->
          <c:forEach var="pro" items="${client_productionlist}">
              <tr>
              <td>${pro.pro_name }</td>
              <td>${pro.pro_code_a } > ${pro.pro_code_b }</td>
              <td>${pro.pro_family }</td>
              <td>${pro.pro_how }</td>
             <td><button class="user-delete" type="button" onclick="deleteRow(this)" style="border-color:gray">X</button></td>
              </tr>
           
           </c:forEach>
        </table>
    </section>
  </div>



  <!-- 생산일보 -->
  <div id="product">
    <div class="use_wrapper">
      <div class="menu">생산&nbsp&nbsp > &nbsp&nbsp생산일보
    </div>
    </div>
   
    <div class="wrapper_produc">
      <div class="wrapp">
        <div>
      <div class="btn" >
      <button class="user_btn" style="background-color: #5EBA8E;padding: 5.5px;margin-top: 5px;">저장</button>
      <button class="user_btn"><i class="fa-solid fa-print"></i>&nbsp;이동표 출력</button>
      <button class="user_btn"><i class="fa-solid fa-list"></i>&nbsp;생산일보 목록</button>
    </div>
    <div class="produc_add">
      <div class="tb_title" style="width: 100%;background-color:#41515E; border-radius: 10px 10px 0px 0px;">
        <i class="fa-solid fa-calendar"></i><a>&nbsp;생산일자 및 시프트</a>
    </div>
        <table>
          <tr>
            <td class="name">생산일자</td>
            <td><input type="date"></td>
          </tr>
          <tr>
            <td class="name">시프트</td>
            <td><input></td>
          </tr>
          <tr>
            <td class="name">입력시간</td>
            <td><input></td> 
          </tr>
        </table>
        <button class="btn_add">추가</button>
    </div>
       
    <div class="produc_add">
      <div class="tb_title" >
        <i class="fa-solid fa-gear"></i><a class="table_title" colspan="2"></a>&nbsp;공정 및 설비</a>
    </div>
      <table>
        <tr>
          <td class="name">&nbsp;&nbsp;공정&nbsp;&nbsp;</td>
          <td><input></td>
        </tr>
        <tr>
          <td class="name">&nbsp;&nbsp;설비&nbsp;&nbsp;</td>
          <td><input></td>
        </tr>
      </table>
      <button class="btn_add" type="" >추가</button>
  </div>

  <div class="produc_add">
    <div class="tb_title" >
      <i class="fa-solid fa-user-large"></i><a class="table_title">&nbsp;작업자</a>
    </div>
    <table >
      <tr>
        <td class="name">부서명</td>
        <td><input></td>
      </tr>
      <tr>
        <td class="name">작성자명</td>
        <td><input></td>
      </tr>
    </table>
    <button class="btn_add" type="" >추가</button>
</div>
</div>
</div>

<div class="user1" >
<div class="user_wrapper">
<div class="btn">
  <button class="user_btn" style="margin-left: 10px;">작업지시 추가</button>
  <button class="user_btn" >품목 추가</button>
</div>
<div class="produc_ad" id="use_date">
<table class="user_tb">
  <tr>
    <th >작업지시번호</th>  
    <th >품목번호</th>
    <th >품목명</th>
    <th >규격</th>
    <th >생산LOT번호</th>
    <th >계획수량</th>
    <th >실적수량</th>
    <th >양품수량</th>
    <th >불량수량</th>
    <th >불량코드</th>
    <th >불량률</th>
    <th >삭제</th>
  </tr>
  <tr>
	  <td>200508</td>
	  <td>55</td>
	  <td>알루미늄</td>
	  <td></td>
	  <td></td>
	  <td></td>
	  <td></td>
	  <td></td>
	  <td></td>
	  <td></td>
	  <td></td>
	  <td></td>
  </tr>
</table>
</div>
<div class="btn">
  <button class="user_btn">투입자재 및 반제품 저장</button>
</div>
<div class="produc_ad">
  <table class="user_tb">
    <tr>
      <td>작업자</td>
      <td>작업코드</td>
      <td>작업지시번호</td>
      <td>시작시간</td>
      <td>종료시간</td>
      <td>실적수량</td>
      <td>양품수량</td>
      <td>불량수량</td>
      <td>불량코드</td>
      <td>불량률</td>
      <td>삭제</td>
    </tr>
    <tr>
	  <td>김수빈</td>
	  <td>20504</td>
	  <td>1332</td>
	  <td>09:08</td>
	  <td>15:21</td>
	  <td>135</td>
	  <td>130</td>
	  <td>5</td>
	  <td>EU</td>
	  <td>0.04</td>
	  <td></td>
  </tr>
  </table>
</div>
<div class="btn">
<button class="user_btn">작업 추가</button>
</div>
<div class="produc_ad">
  <table class="user_tb">
    <tr>
      <td>품목구분</td>
      <td>품목번호</td>
      <td>품목명</td>
      <td>투입LOT번호</td>
      <td>소요량</td>
      <td>투입량</td>
      <td>삭제</td>
    </tr>
    <tr>
      <td>일반품목</td>
      <td>55</td>
      <td>알루미늄</td>
      <td>188544</td>
      <td>50</td>
      <td>50</td>
      <td></td>
    </tr>
  </table>
</div>
</div>
</div>
</div>
</div>

<!-- 거래처관리 -->
<div id="customer_admin">
  <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;margin-top: -77px;">
    <div id="custitle">기준정보&nbsp&nbsp > &nbsp&nbsp거래처 관리</div>
  </section>


  <section style="margin-top: 77px; margin-left: 16%; width: 83%;">
      <div class="search1">
        <input type="text" placeholder="검색어 입력" class="search5">
        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" class="search6">
      </div>
  </section>

  <section class="customer-choice">
    <form action="" method="post">
      <table class="customer-table" >
        <tr>
            <td class="col-cus1" style="width: 161px; color: #5dba8e;">상호</td>
            <td class="col-cus2">
              <input class="goods-num" type="text" id="mutual" name="mutual" maxlength="50">
            </td>
            <td class="col-cus1" style="width: 160px;" >업태</td>
            <td class="col-cus2">
              <input class="goods-num" type="text" id="businessCondition" name="businessCondition" maxlength="50">
            </td>
        </tr>
        <tr>
            <td class="col-cus1" style="color: #5dba8e;">거래처구분</td>
            <td class="col-cus3">
              &nbsp; &nbsp;&nbsp;<input type="radio" id="sortation" name="sortation" value="매출처" style="width:20px;"><a style="margin-left: 5px; margin-right: 10px;">매출처</a>
              <input type="radio" id="" name="" value="매입처" style="width:20px;"><a style="margin-left: 8px; margin-right: 10px;">매입처</a>
              <input type="radio" id="" name="" value="외주처" style="width:20px;"><a style="margin-left: 5px; margin-right: 10px;">외주처</a> 
            </td>
            <td class="col-cus1">업종</td>
            <td class="col-cus2">
              <input class="goods-num" type="text" id="sector" name="sector" maxlength="50">
            </td>
        </tr>
        <tr>
          <td class="col-cus1" style="color: #5dba8e;">대표자 명</td>
          <td class="col-cus2"><input type="text" id="repName" name="repName" maxlength="100">
          </td>
          <td class="col-cus1">연락처</td>
          <td class="col-cus2">
            <input class="goods-num" type="text" id="contact" name="contact" maxlength="50">
          </td>
        </tr>
        <tr>
          <td class="col-cus1" style="color: #5dba8e;">사업자번호</td>
          <td class="col-cus2"><input type="text" id="businessNumber" name="businessNumber" maxlength="100">
          </td>
          <td class="col-cus1">FAX</td>
          <td class="col-cus2">
            <input class="goods-num" type="text" id="fax" name="fax" maxlength="50">
          </td>
        </tr>
        <tr>
          <td class="col-cus1" style="color: #5dba8e;" >담당자명</td>
          <td class="col-cus2"><input type="text" id="chrgName" name="chrgName" maxlength="100">
          </td>
          <td class="col-cus1">우편번호</td>
          <td class="col-cus2"><input type="text" id="postalCode" name="postalCode" maxlength="100">
          </td>
        </tr>
        <tr>
          <td class="col-cus1">주소</td>
          <td class="col-cus2"><input type="text" id="address" name="address" maxlength="100">
          </td>
          <td class="col-cus1">비고</td>
          <td class="col-cus2">
            <input class="goods-num" type="text" id="memo" name="memo" maxlength="50">
          </td>
        </tr>
        <tr>
          
          <td colspan="4" style="padding: 11px; text-align: center;">
            <button type="reset" class="reset-custo" value="초기화">초기화</button>
            <button id="submit-customer" type="submit" class="submit-custo" value="등록">등록</button>
            </td>
        </tr>
        
    </table>
  </section>
  
<script type="text/javascript">
	$('#submit-customer').click(function() {
		let mutual = $('#mutual').val();
        let businessCondition = $('#businessCondition').val();
        let sortation = $('#sortation').val();
        let sector = $('#sector').val();
        let repName = $('#repName').val();
        let contact = $('#contact').val();
        let businessNumber = $('#businessNumber').val();
        let fax = $('#fax').val();
        let chrgName = $('#chrgName').val();
        let address = $('#address').val();
        let memo = $('#memo').val();
        let postalCode = $('#postalCode').val();
		
		$.ajax({
			url : "clientInsert.do",
		      type : "GET",
		      async:false,
		      data : {"mutual":mutual,
		    	  "businessCondition":businessCondition,
		    	  "sortation":sortation,
		    	  "sector":sector,
		    	  "repName":repName,
		    	  "contact":contact,
		    	  "businessNumber":businessNumber,
		    	  "fax":fax,
		    	  "chrgName":chrgName,
		    	  "address":address,
		    	  "memo":memo,
		    	  "postalCode":postalCode,
		      },
		      success: function(result) {
          if (result) {
              alert("완료");
          } else {
              alert("전송된 값 없음");
          }
      },
      error: function() {
          alert("에러 발생");
      }
		   });
	});
	</script>

  <section class="customer-list" style="overflow-y: scroll;">
      <table class="customerlist-table">
        <tr class="customerlist-main">
          <th>거래처명</th>
          <th>거래처번호</th>
          <th>대표자명</th>
          <th>사업자 등록번호</th>
          <th>구분</th>
          <th>삭제</th>
        </tr>
        <c:forEach var="vo" items="${clientlist}">
              <tr>
              <td>${vo.mutual }</td>
             <td>${vo.contact }</td>
             <td>${vo.repName }</td>
             <td>${vo.businessNumber }</td>
             <td>${vo.sortation }</td>
             <td><button class="user-delete" type="button" onclick="deleteRow(this)" style="border-color:gray">X</button></td>
              </tr>
           
           </c:forEach>

      </table>
  </section>
</div>

    <!-- 품목정보관리 -->
    <div id="goods">
      <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;margin-top: -77px;">
        <div id="title">기준정보&nbsp&nbsp > &nbsp&nbsp&nbsp품목정보관리</div>
      </section>
  
      <section style="margin-top: 77px; margin-left: 16%; width: 83%;">
        <div class="search1">
          <input type="text" placeholder="검색어 입력" class="search5">
          <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" class="search6">
        </div>
    </section>
  
      <section class="goods-choice" >
        <form action="" method="post">
          <table class="goods-table">
            <tr>
                <td class="col-goods1" style="color: #5dba8e;">품목명</td>
                <td class="col-goods2">
                  <input type="text" id="product_name" name="product_name" maxlength="100">
                </td>
                <td class="col-goods1">대분류</td>
                <td class="col-goods2">
                <select name="class_code_a" id="class_code_a" style="height:30px;font-size:15px;">
                  <option value="slc1" selected>선택</option>
                  <option value="">기계ㆍ소재</option>
                  <option value="">정보통신</option>
                  <option value="">화학</option>
                  <option value="">세라믹</option>
                </select>
              </td>
                
            </tr>
            <tr>
                <td class="col-goods1" style="color: #5dba8e;">품목구분</td>
                <td class="col-goods2">
                  <select name="product_classification" id="product_classification" style="height:30px;font-size:15px;">
                    <option value="slc1" selected>선택</option>
                    <option value="완제품">완제품</option>
                    <option value="원자재">원자재</option>
                    <option value="부자재">부자재</option>
                  </select>
                </td>
                <td class="col-goods1">중분류</td>
                <td class="col-goods2">
                <select name="class_code_b" id="class_code_b" style="height:30px;font-size:15px;">
                  <option value="slc1" selected>선택</option>
                  <option value="">기계ㆍ소재 > 요소부품</option>
                  <option value="">기계ㆍ소재 > 정밀생산기계</option>
                  <option value="">기계ㆍ소재 > 산업/일반기계</option>
                  <option value="">바이오ㆍ의료 > 의약 바이오</option>
                  <option value="">바이오ㆍ의료 > 산업 바이오</option>
                  <option value="">바이오ㆍ의료 > 그린 바이오</option>
                  <option value="">화학 > 정밀화학</option>
                  <option value="">화학 > 고분자재료</option>
                  <option value="">화학 > 섬유제조공정</option>
                  <option value="">세라믹 > 광전자소재</option>
                  <option value="">세라믹 > 기계ㆍ구조소재</option>
                  <option value="">세라믹 > 생활세라믹</option>
                </select>
              </td>
                
              
            </tr>
            <tr>
                <td class="col-goods1" style="color: #5dba8e;">단위</td>
                <td class="col-goods2">
                  <select name="unit" id="unit" style="height:30px;font-size:15px;">
                    <option value="slc1" selected>선택</option>
                    <option value="">L</option>
                    <option value="">ml</option>
                    <option value="">g</option>
                    <option value="">kg</option>
                  </select>
                </td>
                
              <td class="col-goods1">라우팅</td>
              <td class="col-goods2">
                <select name="process_routing_id" id="process_routing_id" style="height:30px;font-size:15px;">
                  <option value="slc1" selected>선택</option>
                  <option value="원자재 투입">원자재 투입</option>
                  <option value="반제품 제조">반제품 제조</option>
                  <option value="충진">충진</option>
                  <option value="생산">생산</option>
                  <option value="품질검사">품질검사</option>
                  <option value="완제품 출고">완제품 출고</option>
                </select>
              </td>
            </tr>
            <tr>
              <td class="col-goods1">수량</td>
              <td class="col-goods2">
                <input class="goods-num" type="text" id="product_count" name="product_count" maxlength="50">
              </td>
              
            </tr>
            <tr style="text-align: right; ">
                <td colspan="4" style="padding: 14px;" >
                <button type="reset" class="reset-goods" value="초기화">초기화</button>
                <button id="submit-goods" type="submit" class="submit-goods" value="등록" onclick="goodsinsert">등록</button>
                </td>
            </tr>     
        </table>
      </section>
      
      <!-- 품목정보 -->
      <script type="text/javascript">
      $('#submit-goods').click(function goodsinsert() {
          let class_code_a = $('#class_code_a').val();
          let product_name = $('#product_name').val();
          let class_code_b = $('#class_code_b').val();
          let product_classification = $('#product_classification').val();
          let class_code_c = $('#class_code_c').val();
          let unit = $('#unit').val();
          let product_class_code = $('#product_class_code').val();
          let spec = $('#spec').val();
          let process_routing_id = $('#process_routing_id').val();
  		
  		$.ajax({
  			url : "goodsInsertForever.do",
  		      type : "GET",
  		      async:false,
  		      data : {"class_code_a":class_code_a,
  		    	  "product_name":product_name,
  		    	  "class_code_b":class_code_b,
  		    	  "product_classification":product_classification,
  		    	  "class_code_c":class_code_c,
  		    	  "unit":unit,
  		    	  "product_class_code":product_class_code,
  		    	  "spec":spec,
  		    	  "process_routing_id":process_routing_id,
  		    	"company":company
  		      },
		      success: function(result) {
          if (result) {
              alert("완료");
          } else {
              alert("전송된 값 없음");
          }
      },
      error: function() {
          alert("에러 발생");
      }
		   });
	});
	</script>
      
      <section class="goods-list" style="overflow-y: scroll;">
          <table class="goodslist-table">
            <tr class="goodslist-main">
              <th>품목번호</th>
              <th>품목명</th>
              <th>품목구분</th>
              <th>라우팅</th>
              <th>단위<th>
              <th>수량</th>
              <th>삭제</th>
            </tr>
            <c:forEach var="vo" items="${goodslist}">
                <tr>
                <td>${vo.product_num }</td>
                <td>${vo.product_name }</td>
                <td>${vo.product_classification }</td>
                <td>${vo.process_routing_id }</td>
                <td>${vo.unit }</td>
                <td>${vo.product_count }</td>
                <td><a href="goodsDelete"><button class="user-delete" type="button" style="border-radius: 7px; background-color: #41515e; color:white;  height: 20px; width: 20px;">X</button></a></td>
                </tr>
             </c:forEach>
          </table>
      </section>
    </div>
</div>
    <!-- 자재 발주 조회 -->
    <div id="material_view">
      <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;">
        <div id="title">자재관리&nbsp&nbsp > &nbsp&nbsp&nbsp자재발주 조회</div>
      </section>
    
    <div class="use_wrapper">
      <div class="btn" style="margin-top: 77px;">
        <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
          <a style="padding:8px;" >발주일자</a>
          <input class="us" type="date"  >
        </div>
        <div style="float: left;"><h2 style="color: #126AEA;">&nbsp;&nbsp;~&nbsp;</h2></div><div class="btn_search"  style="float: left;margin-left: 10px;padding-right:10px;"><input  class="us" type="date">&nbsp&nbsp<i class="fa-solid fa-magnifying-glass"></i>검색&nbsp</div>
        <div style="float: right;margin-right: 10px;" >
          <a class="user_btn" style="padding:4px"><i class="fa-solid fa-file-excel"></i>&nbsp엑셀</a>
        </div>
      </div>
      
        
  <div class="produc" style="margin-top: 80px; height: 760px;">
    <table class="user_tb">
      <tr>
        <th >발주번호</th>  
        <th >발주일</th>
        <th >납품일</th>
        <th >발주업체</th>
        <th >총금</th>
        <th >대표품</th>
        <th >발주수량</th>
        <th >상세조회</th>
      </tr>
      <c:forEach var="list" items="${matordlist}">
              <tr>
             <td>${list.mat_num }</td>
             <td>${list.mat_orderDate }</td>
             <td>${list.mat_dueDate }</td>
             <td></td>
              </tr>
           </c:forEach>
      <!-- <tr>
        <td><input type="checkbox"></td>
        <td>F46DSTY76</td>
        <td>21-08-08</td>
        <td>21-08-13</td>
        <td>유니컴퍼니</td>
        <td>560,000</td>
        <td>플래버 신선도 유지제</td>
        <td>200</td>
        <td></td>
        </tr> -->
    </table>
  </div>
  </div>
</div>

<!-- 자재 입고 현황 -->
<!-- 자재 입고 현황 -->
 <div id="material_arrival">
  <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;">
    <div id="title">자재관리&nbsp&nbsp > &nbsp&nbsp&nbsp자재 입고 현황</div>
  </section>

<div class="use_wrapper">
    <div class="btn" style="margin-top: 70px;">
        <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
          <a style="padding:10px;" >발주일자</a>
          <input class="us" type="date"  >
        </div>
        <div style="float: left;">
        <b style="color: #126AEA;">&nbsp;~&nbsp;<input  class="us" type="date"></b>&nbsp&nbsp
        &nbsp; &nbsp;&nbsp;<input type="radio" id="" name="" value="매출처"><a style="margin-left: 13px; margin-right: 20px;">전체</a>
        <input type="radio" id="" name="" value="매입처"><a style="margin-left: 13px; margin-right: 20px;">원부자재</a> 
        <input type="radio" id="" name="" value="외주처"><a style="margin-left: 13px; margin-right: 20px;">외주가공품</a> 
        <input type="radio" id="" name="" value="외주처"><a style="margin-left: 13px; margin-right: 20px;">상품</a> 
        <input type="radio" id="" name="" value="외주처"><a style="margin-left: 13px; margin-right: 20px;">생산</a> 
      </div>
      <div class="Marrival_btn" style="margin-top: -10px;"  >
        <div style="float: right;margin-right: 10px;">
          <a class="arrival_btn" style="padding:4px"><i class="fa-solid fa-magnifying-glass"></i>&nbsp검색</a>
        </div>
        <div style="margin-top: 27px;float: right;margin-right: -52px;">
          <a class="user_btn" style="padding:4px"><i class="fa-solid fa-file-excel"></i>&nbsp엑셀</a>
          <a class="user_btn" style="padding:4px"><i class="fa-solid fa-barcode"></i>&nbsp바코드 입고</a>
          <a class="arrival_btn" style="padding:4px"><i class="fa-solid fa-circle-plus"></i>&nbsp새 입고 추가</a>
          <a class="user_btn" style="padding:4px; background-color:#FBAF38 ;"><i class="fa-solid fa-box-archive"></i>&nbsp저장</a>
        </div>
      </div>
    
<div class="produc" style="margin-top:60px;height: 760px;">
<table class="user_tb">
  <tr>
    <th >발주번호</th>  
    <th >발주일</th>
    <th >납품일</th>
    <th >발주업체</th>
    <th >총금</th>
    <th >대표품</th>
    <th >발주수량</th>
    <th >상세조회</th>
  </tr>
  <tr>
    <td><input type="checkbox"></td>
    <td>F09DSTY76</td>
    <td>21-07-28</td>
    <td>21-08-01</td>
    <td>유니컴퍼니</td>
    <td>1,008,020</td>
    <td>FEVER 살균소독제</td>
    <td>10,000</td>
    <td></td>
    </tr>
</table>
</div>
</div>
</div>
</div>



  <!-- 메인페이지 -->
  <div id="main_graph">
  <div class="wrapper">
    <div class="main_produc" >
     <div class="graph" ><a style="font-size: 25px; color: #166cea;">생산량&ensp;</a>
       <a class="clear">Total : </a><hr style="color: gray; margin-top: 10px;width: 100%;">
     <div class="main_chart">
       <canvas id="myChart"  style="margin-top:12%; width: 440px;"></canvas>
     </div>
   </div> 
   </div>

     <div class="main_produc" >
       <div class="graph">
           <a style="font-size: 25px; color: #166cea;">계획대비 생산 효율&ensp;</a>
           <a class="clear">Total : </a><hr style="color: gray; margin-top: 10px; width: 100%;">
           <div class="main_chart">
           <canvas id="chart_" style="margin-top:12%; width: 440px;"></canvas> 
           </div>
        </div>
     </div>

     <div class="main_produc" >
       <div class="graph"><a style="font-size: 25px; color: #166cea;">전년대비 납기율&ensp;</a>
         <a class="clear">Total : </a><hr style="color: gray; margin-top: 10px;width: 100%;">
         <div class="main_chart">
           <canvas id="rate_chart"  style="margin-top:12%; width: 440px;"></canvas>
         </div>
       </div>
     </div>

   <div class="main_produc">
     <div class="sec_cal">
       <div class="cal_nav">
         <a href="javascript:;" class="nav-btn go-prev">prev</a>
         <div class="year-month">월 들어가기</div>
         <a href="javascript:;" class="nav-btn go-next">next</a>
       </div>
       <div class="cal_wrap">
         <div class="days">
           <div class="day">MON</div>
           <div class="day">TUE</div>
           <div class="day">WED</div>
           <div class="day">THU</div>
           <div class="day">FRI</div>
           <div class="day">SAT</div>
           <div class="day">SUN</div>
         </div>
         <div class="dates"></div>
       </div>
     </div>
   </div>
  </div>
</div>

    <!-- 사용자관리 -->
    <div id="user_admin">
      <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;margin-top: -77px;">
        <div id="usertitle">기준정보&nbsp&nbsp > &nbsp&nbsp사용자관리</div>
      </section>
                                                <!--회원가입 폼-->
      <section class="user">
        <article class="user-form">
          <table class="table table-boarder">
            <tr>
                <td class="col-user1" style="color: #5dba8e;">사용자 ID</td>
                <td class="col-user2">
                  <input class="input-id" type="text" id="userid" name="userid" maxlength="5" style="width:100%;height:30px;font-size:15px;">
                  <font id="checkId" size="2"></font>
                </td>
            </tr>
            <tr>
                <td class="col-user1" style="color: #5dba8e;">사용자명</td>
                <td class="col-user2"><input type="text" id="username" name="username" maxlength="5" style="width:100%;height:30px;font-size:15px;"></td>
            </tr>
            <tr>
                <td class="col-user1" style="color: #5dba8e;">비밀번호</td>
                <td class="col-user2">
                    <input type="password" id="userpw" name="userpw" maxlength="16" style="width:100%;height:30px;font-size:15px;">
                </td>
            </tr>
            <tr>
                <td class="col-user1" style="color: #5dba8e;">주 공정</td>
                <td class="col-user2"><input type="text" id="mainProcess" name="mainProcess" maxlength="16" style="width:100%;height:30px;font-size:15px;"></td>
            </tr>
            <tr>
                <td class="col-user1" style="color: #5dba8e;">권 한</td>
                <td class="col-user2">
                  <select name="userRight" id="userRight" style="width:100%;height:30px;font-size:15px;">
                    <option value="slc1" selected>선택</option>
                    <option value="manager">대 표(관리자)</option>
                    <option value="staff">직 원</option>
                </select>
                </td>
            </tr>   
            <tr>
                <td class="col-user1">부서명</td>
                <td class="col-user2"><input type="text" id="department" name="department" maxlength="5" style="width:100%;height:30px;font-size:15px;"></td>
            </tr>
            <tr>
              <td class="col-user1">연락처</td>
              <td class="col-user2"><input type="text" id="contact" name="contact" maxlength="15" style="width:100%;height:30px;font-size:15px;"></td>
             </tr>
             <tr>
              <th class="col-user1">이메일</th>
              <td class="col-user2"><input type="email" id="email" class="form-control" name="email" style="width:100%;height:30px;font-size:15px;"></td>       
            </tr>
            <tr>
              <th class="col-user1">메모</th>
              <td class="col-user2">
               <textarea rows="5" cols="40" name="memo" class="form-control" style="width: 100%;"></textarea>
              </td>     
           </tr>             
            <tr style="text-align: center;">
                <td colspan="2" style="padding: 11px;">
                <button type="reset" class="reset-user" value="초기화">초기화</button>
                <button id="submit-user" type="submit" class="submit-user" value="전송">등록</button>
                </td>
            </tr>     
        </table>
        </form>
        </article>
      </section>

  
      <section style="margin-top:-599px; margin-left: 42%;">
          <div class="search">
            <input type="text" placeholder="검색어 입력" class="search2">
            <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" class="search3">
          </div>
      </section>
                                        <!-- 등록된 회원 리스트 -->
      <section class="user-list" 
            style="overflow-y: scroll;">
          <table class="user-table">
            <tr class="user-main">
              <th>순번</th>
              <th>사용자 ID</th>
              <th>사용자 이름</th>
              <th>부서명</th>
              <th>주 공정</th>
              <th>권한</th>
              <th>삭제</th>
            </tr>
            <c:forEach var="vo" items="${memberlist}">
              <tr>
             <td>${vo.num }</td>
             <td>${vo.userid }</td>
             <td>${vo.username }</td>
             <td>${vo.department }</td>
             <td>${vo.mainProcess }</td>
             <td>${vo.userRight }</td>
             <td>
             <a href="userDelete.do?${vo}"><button class="user-delete" type="button" style="background-color: #41515e; color:white;  height: 20px; width: 20px;">X</button>
            </a></td>
              </tr>
           </c:forEach>
          </table>
      </section>
    </div>

	<script type="text/javascript">
	$('#submit-user').click(function() {
		let userid = $('#userid').val();
        let username = $('#username').val();
        let userpw = $('#userpw').val();
        let mainProcess = $('#mainProcess').val();
        let userRight = $('#userRight').val();
        let department = $('#department').val();
        let contact = $('#contact').val();
        let email = $('#email').val();
        let memo = $('#memo').val();
		
		$.ajax({
			url : "userInsert.do",
		      type : "GET",
		      async:false,
		      data : {"userid":userid,
		    	  "userpw":userpw,
		    	  "username":username,
		    	  "department":department,
		    	  "mainProcess":mainProcess,
		    	  "userRight":userRight,
		    	  "email":email,
		    	  "memo":memo,
		      },
		      success: function(result) {
          if (result) {
              alert("사용자 등록이 완료되었습니다.");
          } else {
              alert("전송된 값 없음");
          }
      },
      error: function() {
          alert("사용자 id, 사용자명, 비밀번호, 주공정, 권한을 모두 입력해주세요.");
      }
		   });
	});
	</script>

	<!-- BOM관리 -->
    <div id="bom_admin">
      <div class="use_wrapper">
        <div class="menu">&nbsp기준정보&nbsp&nbsp > &nbsp&nbspBOM관리 
      </div>
      <div class="btn" style="margin-top: 50px;">
        <div class="btn_search" style="float: left;margin-left: 3%;">
          <input class="us" style="width: 300px;padding: 10px;"><a style="padding:19px 10px" ><i class="fa-solid fa-magnifying-glass"></i>검색</a>
        </div>
        <div style="float: right; margin-right: 10px;" >
          <a class="user_btn" style="padding:8px"><i class="fa-solid fa-file-excel"></i>&nbsp엑셀</a>
        </div>
      </div>
    <div class="bom-wrapper">
     
    <div class="bom_produc" style="height: 760px;">
      <table class="user_tb">
        <tr>
          <th >품목번호</th>  
          <th >품목명</th>
          <th >제품군</th>
          <th >라우팅</th>
          <th >BOM삭제</th>
        </tr>
        
        <c:forEach var="vo" items="${goodslist}">
                <tr>
                <td>${vo.product_num }</td>
                <td>${vo.product_name }</td>
                <td>${vo.product_class_code }</td>
                <td>${vo.process_routing_id }</td>
                <td><a href="goodsDelete"><button class="user-delete" type="button" style="border-radius: 7px; background-color: #41515e; color:white;  height: 20px; width: 20px;">X</button></a></td>
                </tr>
             </c:forEach>
        
      </table>
    </div>
    <div class="bom_produc" style=" height: 760px;">
      <div class="tb_title" style="height: 50px;line-height:50px">
        <a>&nbsp;부품 구성 BOM</a>
    </div>
      <table class="user_tb">
        <tr>
          <th >[구분]부품명</th>  
          <th >품목번호</th>
          <th >소요량</th>
          <th >규격</th>
          <th >단위</th>
          <th >부품추가</th>
          <th >부품삭제</th>
        </tr>
       
                <c:if test="${company=='fourever'}">
                    <tr>
          <td>염화암모늄</td>  
          <td>CY89</td>
          <td>50</td>
          <td>50</td>
          <td>ml</td>
          <td><button class="user-delete">+</button></td>
          <td><button class="user-delete">X</button></td>
        </tr>
        <tr>
          <td>유화제</td>  
          <td>C897</td>
          <td>50</td>
          <td>50</td>
          <td>ml</td>
          <td><button class="user-delete">+</button></td>
          <td><button class="user-delete">X</button></td>
        </tr>
                </c:if>
                <c:if test="${company=='daechang'}">
                    <tr>
          <td>알루미늄판</td>  
          <td>T455T</td>
          <td>50</td>
          <td>50</td>
          <td>cm</td>
          <td><button class="user-delete">+</button></td>
          <td><button class="user-delete">X</button></td>
        </tr>
                </c:if>
       
      </table>
    </div>
  </div>
</div>
</div>


<!-- 출고지시 -->
<div id="out_order">
  <div class="mater_wrapper" >
    <div class="menu" > 물류관리&nbsp&nbsp > &nbsp&nbsp출고지시</div>
  </div>
<div class="wrapper_mater">
  <div class="wrapp-mater2">
    <div>
    <div class="mater_add">
      <div class="tb_title-mater" style="width: 100%;background-color:#41515E; border-radius: 10px 10px 0px 0px;">
        <i class="fa-solid fa-scroll" style="margin-left:17px"></i><a style="margin-left:2px">&nbsp&nbsp출고지시</a>
      </div>
        <table>
          <tr>
            <td class="mater-name" style="width: 161px;">출고지시번호</td>
            <td><input style="height: 25px;"></td>
            <td class="mater-name" style="width: 161px;">거래처</td>
            <td><input style="height: 25px;"></td> 
          </tr>
          <tr>
            <td class="mater-name">주문번호</td>
            <td><input></td>
            <td class="mater-name">출고예정일</td>
            <td><input type="date"></td>
          </tr>
          <tr>
            <td class="mater-name">지시일자</td>
            <td><input></td> 
            <td class="mater-name">배송처</td>
            <td><input></td>
          </tr>
          <tr>
            <td class="mater-name">담당자</td>
            <td><input></td> 
            <td class="mater-name">연락처</td>
            <td><input></td> 
          </tr>
        </table>
        <button class="mater-btn_add">저장</button>
    </div>
</div>
</div>
<div class="materlist_wrapper">
<div class="materlist-btn">
  <button class="materlistuser_btn" style="position: right; margin-left: 8px; margin-top: 17px;"><i class="fa-solid fa-circle-plus"></i>&nbsp품목/사양 추가</button>
</div>
<div class="mater_ad" style="overflow-y: scroll;">
<table class="mater_tb">
  <tr>
    <td></td>
    <th >주문상세번호</th>
    <th >품목번호</th>
    <th >품목명</th>
    <th >비고</th>
    <th >삭제</th>
  </tr>
  <tr>
    <td><input type="checkbox"></td>
    <td>F09DSTY76</td>
    <td>2055</td>
    <td>소독제</td>
    <td>공란</td>
    <td></td>
    </tr>

</table>
</div>
</div>
</div>
</div>
    <!-- 출고 조회 -->
    <div id="release">
      <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;">
        <div id="title">물류관리&nbsp&nbsp > &nbsp&nbsp&nbsp출고조회</div>
      </section>
    
    <div class="use_wrapper">
        <div class="btn" style="margin-top: 77px;">
            <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
              <a style="padding:10px;" >발주일자</a>
              <input class="us" type="date"  >
            </div>
            <div style="float: left;">
            <b style="color: #126AEA;">&nbsp;~&nbsp;<input  class="us" type="date"></b>&nbsp&nbsp
            <div class="btn_search" style="float: right;"><a><input   class="us">&nbsp<i class="fa-solid fa-magnifying-glass"></i>&nbsp검색&nbsp</a> </div>
          </div>
          <div style="float: right; margin-right: 10px;" >
            <a class="user_btn" style="padding:4px"><i class="fa-solid fa-file-excel"></i>&nbsp엑셀</a>
          </div>
        </div>
        
  <div class="produc" style="margin-top: 80px; height: 760px;">
    <table class="user_tb">
      <tr>
        <td><input type="checkbox"></td>
        <th >발주번호</th>  
        <th >발주일</th>
        <th >납품일</th>
        <th >발주업체</th>
        <th >총금</th>
        <th >대표품</th>
        <th >발주수량</th>
        <th >상세조회</th>
      </tr>
      <tr>
    <td><input type="checkbox"></td>
    <td>F09DSTY76</td>
    <td>21-07-28</td>
    <td>21-08-01</td>
    <td>유니컴퍼니</td>
    <td>1,008,020</td>
    <td>FEVER 살균소독제</td>
    <td>10,000</td>
    <td></td>
    </tr>
    </table>
  </div>
  </div>
</div>

 <!-- 품질 검사 내역 조회 -->
 <div id="quality_inspection">
  <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;">
    <div id="title">품질관리&nbsp&nbsp > &nbsp&nbsp&nbsp품질 검사 내역 조회</div>
  </section>

<div class="use_wrapper">
    <div class="btn" style="margin-top: 77px;">
        <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
          <a style="padding:10px;" >출고일</a>
          <input class="us" type="date"  >
        </div>
        <div style="float: left;">
        <b style="color: #BCBCBC;">&nbsp;~&nbsp;<input  class="us" type="date"></b>&nbsp&nbsp
        <div class="btn_search" style="float: right;"><a><input   class="us">&nbsp<i class="fa-solid fa-magnifying-glass"></i>&nbsp검색&nbsp</a> </div>
      </div>
      <div style="float: right; margin-right: 10px;" >
        <a class="user_btn" style="padding:4px" ><i class="fa-solid fa-file-pen"></i>&nbsp승인</a>
        <a class="user_btn" style="padding:4px"><i class="fa-solid fa-file-excel"></i>&nbsp엑셀</a>
      </div>
    </div>
    
    <div class="produc" style="margin-top: 80px; height: 760px;">
      <table class="user_tb">
        <tr>
          <td><input type="checkbox"></td>
          <th>검사일</th>  
          <th>시프트</th>
          <th>공정명</th>
          <th>품목번호</th>
          <th>품목명</th>
          <th>제품LOT번호</th>
          <th>원자재LOT번호</th>
          <th>부서</th>
          <th>판정</th>
          <th>작성자</th>
          <th>승인자</th>
          <th>조회</th>
        </tr>
        <tr>
          <td><input type="checkbox"></td>
          <td>21-05-06</td>
          <td></td>
          <td>포장</td>
          <td>F46DGTY76</td>
          <td>플레버 신선도 유지제</td>
          <td>공란</td>
          <td>공란</td>
          <td>설비부</td>
          <td>승인</td>
          <td>최다빈</td>
          <td>김대환</td>
          <td></td>
          </tr>
      </table>
    </div>
</div>
</div>

<!-- 공정 불량 현황 -->
<div id="process_defect">
  <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;">
    <div id="title">품질관리&nbsp&nbsp > &nbsp&nbsp&nbsp공정 불량 현황</div>
  </section>

<div class="use_wrapper">
    <div class="btn" style="margin-top: 77px;">
        <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
          <a style="padding:10px;" >출고일</a>
          <input class="us" type="date"  >
        </div>
        <div style="float: left;">
        <b style="color: #BCBCBC;">&nbsp;~&nbsp;<input  class="us" type="date"></b>&nbsp&nbsp
        <div class="btn_search" style="float: right;"><a><input   class="us">&nbsp<i class="fa-solid fa-magnifying-glass"></i>&nbsp검색&nbsp</a> </div>
      </div>
      <div style="float: right; margin-right: 10px;" >
        <a class="user_btn" style="padding:4px;background-color: #42B38D;" ><i class="fa-solid fa-box-archive"></i>&nbsp저장</a>
        <a class="user_btn" style="padding:4px;background-color: #FF515E;"  ><i class="fa-solid fa-trash-can"></i>&nbsp삭제</a>
        <a class="user_btn" style="padding:4px"><i class="fa-solid fa-file-excel"></i>&nbsp엑셀</a>
      </div>
    </div>
    
    <div class="produc" style="margin-top: 80px; height: 760px;">
      <table class="user_tb">
        <tr>
          <td><input type="checkbox"></td>
          <th>검사일</th>  
          <th>시프트</th>
          <th>공정명</th>
          <th>품목번호</th>
          <th>품목명</th>
          <th>제품LOT번호</th>
          <th>원자재LOT번호</th>
          <th>부서</th>
          <th>판정</th>
          <th>작성자</th>
          <th>조회</th>
        </tr>
          <tr>
          <td><input type="checkbox"></td>
          <td>2022.08.01</td>
          <td></td>
          <td>포장</td>
          <td>F46DGTY76</td>
          <td>플레버 신선도 유지제</td>
          <td></td>
          <td></td>
          <td>설비부</td>
          <td>통과</td>
          <td>김단비</td>
		  <td></td>
          </tr>
      </table>
    </div>
</div>
</div>

	<!-- 작업지시 -->
	<div id="order">
		<div class="use_wrapper">
			<div class="menu">생산&nbsp&nbsp > &nbsp&nbsp작업지시</div>
		</div>

		<div class="wrapper_produc">
				<div class="btn"  style="margin-top: 40px;">
					<div class="btn_search"
          style=" margin-left: 10px;padding-left:10px;float:left">
						<a>작업일자</a> <input class="us2" type="date">
					</div>
				</div>
        <div class="btn" style="margin-top: 40px; ">
          <div class="btn_search"
               style=" padding-left: 10px; margin-left: 10px;float:left">
               <a style="padding: 10px;">설비코드</a> <input class="us">
             </div>
          <div class="btn_search"
               style=" padding-right: 10px; margin-left: 10px;float:left">
               <input class="us"> &nbsp<i
                 class="fa-solid fa-magnifying-glass"></i><a
                 style="padding: 10px;">검색</a>
             </div>
           </div>
				<div class="order_wrapp">
					<button id="submit-workorder">입력</button>
					<table class="order_tb">
						<tr>
							<th>No.</th>
							<th>설비코드</th>
							<th>설비명</th>
							<th>작업수</th>
						</tr>
						<tr>
							<td>1</td>
							<td><input type="text" name="facilities_code"></td>
							<td><input type="text" name="facilities_name"></td>
							<td><input type="text" name="operations_no"></td>
						</tr>

					</table>
					
					<script type="text/javascript">
    $('#submit-workorder').click(function() {
        $.ajax({
              url : "workOrderInsert.do",
              type : "GET",
              async:false,
              data : {"workOrderVO":workOrderVO},
              // dataType : "json",
              success : workOrderSelect,
              error : function(){alert("error");  }
           });
    })
    </script>
				</div>
				<div class="order_wrapp">
					<table class="order_tb">
						<tr>
							<th>No.</th>
							<th>품번</th>
							<th>품명</th>
							<th>작업순서</th>
							<th>계획수량</th>
							<th>실적수량</th>
							<th>비고</th>
							<th>작업지시번호</th>
						</tr>
						<tr>
							<td>1</td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
							<td><input type="text"></td>
						</tr>
					</table>
				</div>

			</div>
		</div>
	</div>


	<!-- 작업지시조회 -->
<div id="order_view">
  <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;">
  <div id="custitle">생산관리&nbsp&nbsp > &nbsp&nbsp작업지시조회</div>
</section>
  
  <div class="use_wrapper">
      <div class="btn" style="margin-top: 77px;">
        <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
          <a style="padding:8px;" >작업일자</a>
          <input class="us" type="date"  >
        </div>
        <div style="float: left;"><h2 style="color: #126AEA;">&nbsp;&nbsp;~&nbsp;</h2></div><div class="btn_search"  style="float: left;margin-left: 10px;padding-right:10px;"><input  class="us" type="date">&nbsp&nbsp<i class="fa-solid fa-magnifying-glass"></i>검색&nbsp</div>
        <div style="float: right;margin-right: 10px;" >
          <a class="user_btn" style="padding:4px"><i class="fa-solid fa-file-excel"></i>&nbsp엑셀</a>
        </div>
      </div>
      
<div class="produc" style="margin-top: 80px; height: 760px;">
  <table class="user_tb">
    <tr>
      <td><input type="checkbox"></td>
      <th >품번</th>  
      <th >품명</th>
      <th >작업순서</th>
      <th >계획수량</th>
      <th >실적수량</th>
      <th >비고</th>
      <th >작업지시번호</th>
      <th >상세조회</th>
    </tr>
    <c:forEach var="workOrder" items="${workOrderlist}">
              <tr>
      <td><input type="checkbox"></td>
             <td>${workOrder.ord_product_id }</td>
             <td>${workOrder.ord_product_name }</td>
             <td>${workOrder.ord_work }</td>
             <td>${workOrder.ord_planned_quantity }</td>
             <td>${workOrder.ord_performance_quantity }</td>
             <td>${workOrder.ord_remarks }</td>
             <td>${workOrder.ord_order_no }</td>
             <td><button>조회</button></td>
              </tr>
           </c:forEach>
  </table>
</div>
</div>
</div>

<!-- 생산계획 -->
<div id="produc_plan">
  <div class="use_wrapper" >
    <div class="menu" > 생산관리&nbsp&nbsp > &nbsp&nbsp생산계획
  </div>
  </div>
<div class="wrapper_plan">
  <div class="wrapp">
    <div>
    <div class="plan">
     <form>
        <table>
          <tr>
            <td class="name">계획년월</td>
            <td><input type="date"></td>
          </tr>
          <tr>
            <td class="name">설비코드</td>
            <td><div class="inputWrap" style="width: 100%" ><input><button class="sear_btn">찾기</button></div></td>
          </tr>
          <tr>
            <td class="name">품번</td>
            <td><input type="text"></td> 
          </tr>
          <tr>
              <td class="name">품명</td>
              <td><input type="text"></td> 
            </tr>
           
            </table>
    <button class="plan_btn" type=""><div style="margin-top: -3px;"><a><i class="fa-solid fa-magnifying-glass"></i>&nbsp검색</a></div></button>
    <button class="btn_add" type="" style="background-color: #ffffff;border: 1px solid #EDEDED;">초기화</button>
    
        </form>
    </div>
       
       
       <!-- 입력창 -->
   <div class="plan">
   <form>
        <table>
          <tr>
            <td class="name">계획년월</td>
            <td><input type="date" id="pp_date" name="pp_date"></td>
          </tr>
          <tr>
            <td class="name">설비명</td>
            <td><input type="text" id="pp_equipment_name" name="pp_equipment_name"></td>
          </tr>
          <tr>
            <td class="name">설비코드</td>
            <td><input type="text" id="pp_equipment_code" name="pp_equipment_code"></td>
          </tr>
          <tr>
            <td class="name">품번</td>
            <td><input type="text" id="pp_item_num" name="pp_item_num"></td>
          </tr>
          <tr>
            <td class="name">품명</td>
            <td><input type="text" id="pp_item_name" name="pp_item_name"></td> 
          </tr>
          <tr>
          <td colspan="2" style="padding: 0px;">
          <button type="reset" class="reset-custo" value="초기화">초기화</button>
            <button id="submit-pp" type="submit" class="submit-custo" value="등록">등록</button>
                </td>
                </tr>
          </table>
          </form>
    </div>
<!-- 입력창 끝 -->

<!-- 입력 기능 구현 DB -->
 <script type="text/javascript">
	$('#submit-pp').click(function() {
		let pp_date = $('#pp_date').val();
        let pp_equipment_name = $('#pp_equipment_name').val();
        let pp_equipment_code = $('#pp_equipment_code').val();
        let pp_item_num = $('#pp_item_num').val();
        let pp_item_name = $('#pp_item_name').val();
		
		$.ajax({
			url : "productionPlanInsert.do",
		      type : "GET",
		      async:false,
		      data : {"pp_date":pp_date,
		    	  "pp_equipment_name":pp_equipment_name,
		    	  "pp_equipment_code":pp_equipment_code,
		    	  "pp_item_num":pp_item_num,
		    	  "pp_item_name":pp_item_name;
		      },
		      success: function(result) {
          if (result) {
              alert("생산계획 등록이 완료되었습니다.");
          } else {
              alert("전송된 값 없음");
          }
      },
      error: function() {
          alert("계획년월, 설비명, 설비코드, 품번, 품명을 모두 입력해주세요.");
      }
		   });
	});
	</script>
</div>
</div>
<div class="user_wrapper">
<div class="plan_wrapp">
  <table class="plan_tb">
  
    <tr>
      <td><input type="checkbox"></td>
      <td>설비명</td>
      <td>품번</td>
      <td>품명</td>
      <td>01</td>
      <td>02</td>
      <td>03</td>
      <td>04</td>
      <td>05</td>
    </tr>
    <c:forEach var="pp" items="${pplist}">
              <tr>
              <td><input type="checkbox"></td>
             <td>${pp.pp_equipment_name }</td>
             <td>${pp.pp_item_num }</td>
             <td>${pp.pp_item_name }</td>
             <td>${pp.pp_date }</td>
             <td></td>
             <td></td>
             <td></td>
             <td></td>
              </tr>
           </c:forEach>
  </table>
</div>
</div>
</div>
</div>

<!-- 불량률조회 -->
<div id="faulty_list">
  <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;">
      <div id="title">품질관리&nbsp&nbsp > &nbsp&nbsp&nbsp불량률조회</div>
    </section>
  
  <div class="use_wrapper">
      <div class="btn" style="margin-top: 77px;">
          <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
            <a style="padding:10px;" >불량일자</a>
            <input class="us" type="date"  >
          </div>
          <div style="float: left;">
          <b style="color: #126AEA;">&nbsp;~&nbsp;<input  class="us" type="date"></b>&nbsp&nbsp
          </div>
          <div class="hscode">
            <a style="padding:10px;" >품목코드</a>
            <input class="us" type="text"  >
          </div>
        <div class="faultyList_btn_search" ><a><i class="fa-solid fa-magnifying-glass"></i>&nbsp검색&nbsp</a> </div>
      </div>
      
<div class="produc" style="margin-top: 80px; height: 760px; overflow-y: scroll;">
  <table class="user_tb">
    <tr>
      <th>No.</th>
      <th >품목코드</th>  
      <th >품명</th>
      <th >Lot 번호</th>
      <th >지시일자</th>
      <th >지시번호</th>
      <th >공정</th>
      <th >상태</th>
      <th >불량요인</th>
      <th >불량수량</th>
      <th >작업자</th>
    </tr>
    <tr>
      <td>1</td>
      <td>F46DGTY76</td>
      <td>플레버 신선도 유지제</td>
      <td>공백</td>
      <td>2022.08.01</td>
      <td>01523</td>
      <td>포장공정</td>
      <td><div style="background-color:#fbb03b;
        color: white;
        width:75px;
        height:29px;
        border-radius:75px;
        text-align:center;
        margin:0 auto;
        line-height:28px;">가동중</div></td>
      <td>자재 부족</td>
      <td>20장</td>
      <td>***</td>
    </tr>
    <tr>
      <td>2</td>
      <td>F46DGTY76</td>
      <td>플레버 신선도 유지제</td>
      <td>공백</td>
      <td>2022.08.01</td>
      <td>01523</td>
      <td>포장공정</td>
      <td><div style="background-color:#808080;
        color: white;
        width:75px;
        height:29px;
        border-radius:75px;
        text-align:center;
        margin:0 auto;
        line-height:28px;">종료</div></td>
      <td>자재 부족</td>
      <td>20장</td>
      <td>***</td>
    </tr>
  </table>
</div>
</div>
</div>

<!-- 자재 재고 현황 -->
<div id="inventory_list">
  <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;">
      <div id="title">자재관리&nbsp&nbsp > &nbsp&nbsp&nbsp자재 재고 현황</div>
    </section>
  <div class="use_wrapper">
    <div class="btn" style="margin-top: 87px;">
      <div style="margin-left:80%; margin-bottom:-30px;">품목분류&nbsp;&nbsp;
        <select style="width: 150px; height: 30px;">
          <option value="전체">전체</option>
          <option value="주요품목">주요품목</option>
          <option value="주 보조품목">주 보조품목</option>
          <option value="수리 부속품">수리 부속품</option>
        </select>
      </div>
      <div class="btn_search" style="margin-right: 74%;">
          <a style="padding:10px;" >품목코드</a>
          <input class="us" type="text"  >
      </div>
    <div class="btn_search" style="padding:5px;margin-right: -26%;"><a><i class="fa-solid fa-magnifying-glass"></i>&nbsp검색&nbsp</a> </div>
  </div>
      
<div class="produc" style="margin-top: 88px; height: 760px; overflow-y: scroll;">
  <table class="user_tb">
    <tr>
      <th>No.</th>
      <th >품목코드</th>  
      <th >품명</th>
      <th >Lot 번호</th>
      <th >규격</th>
      <th >단위</th>
      <th >판매단가</th>
      <th >구매단가</th>
      <th >창고</th>
      <th >현재재고</th>
      <th >입고상태</th>
    </tr>
    <tr>
      <td>1</td>
      <td>F46DGTY76</td>
      <td>플레버 신선도 유지제</td>
      <td>공백</td>
      <td>2022.08.01</td>
      <td>01523</td>
      <td>포장공정</td>
      <td>ffg</td>
      <td>자재 부족</td>
      <td>20장</td>
      <td>***</td>
    </tr>
    <tr>
      <td>2</td>
      <td>F46DGTY76</td>
      <td>플레버 신선도 유지제</td>
      <td>공백</td>
      <td>2022.08.01</td>
      <td>01523</td>
      <td>포장공정</td>
      <td>vdsg</td>
      <td>자재 부족</td>
      <td>20장</td>
      <td>***</td>
    </tr>
  </table>
</div>
</div>
</div>
<!-- 자재발주 -->
<div id="material">
  <div class="mater_wrapper" >
    <div class="menu" > 자재관리&nbsp&nbsp > &nbsp&nbsp자재발주</div>
  </div>
  <div class="mater_search" style="padding: 0px 6px 0px 0px; padding-right:6px; margin-left: 16.4%; margin-top: 10px;">
    <input class="us" >
    <a style="padding:8px" ><i class="fa-solid fa-magnifying-glass"></i>검색</a>
   </div>
<div class="wrapper_mater">
  <div class="wrapp-mater5">
    <div>
    <div class="mater_add">
      <div class="tb_title-mater" style="width: 100%;background-color:#41515E; border-radius: 10px 10px 0px 0px;">
        <i class="fa-solid fa-user-large" style="margin-left:17px"></i><a style="margin-left:2px">&nbsp;발주서 정보</a>
      </div>
        <table>
          <tr>
            <td class="mater-name" style="width: 161px;">발주번호</td>
            <td><input style="height: 25px;" id="mat_num" name="mat_num"></td>
            <td class="mater-name" style="width: 161px;">입력일자</td>
            <td id="mat_inputDate">
            <script>
            var today = new Date();

            var year = today.getFullYear();
            var month = ('0' + (today.getMonth() + 1)).slice(-2);
            var day = ('0' + today.getDate()).slice(-2);

            var dateString = year + '-' + month  + '-' + day;

            $('#mat_inputDate').text(dateString);
            </script>
            </td> 
          </tr>
          <tr>
            <td class="mater-name">발주일자</td>
            <td><input type="date" id="mat_orderDate"></td>
            <td class="mater-name">납기일자</td>
            <td><input type="date" id="mat_dueDate"></td>
          </tr>
          <tr>
            <td class="mater-name">납품장소</td>
            <td><input type="text" id="mat_place"></td> 
            <td class="mater-name">유효일자</td>
            <td><input type="date" id="mat_effectivedate"></td>
          </tr>
          <tr>
            <td class="mater-name">결제조건</td>
            <td><input type="text" id="mat_conditions"></td> 
            <td class="mater-name">주소</td>
            <td><input type="text" id="mat_address"></td> 
          </tr>
          <tr>
            <td class="mater-name">담당자</td>
            <td><input type="text" id="mat_charge"></td> 
            <td class="mater-name">연락처</td>
            <td><input type="text" id="mat_contact"></td> 
          </tr>
          <tr>
            <td class="mater-name">요청사항</td>
            <td><input type="text" id="mat_request"></td> 
            <td class="mater-name">총 금액</td>
            <td id="mat_amount">바로 계산해서 나오도록</td> 
          </tr>
        </table>
        <button id="submit_materials_order" class="materlistuser_btn" style="margin-left: 50%; background-color:#5EBA8E;">추가</button>
    </div>
</div>
</div>
</div>
<div class="materlist_wrapper">
<div class="mater_ad" style="overflow-y: scroll;" width="70%">
<table class="mater_tb">
  <tr>
    <td></td>
    <th >품목번호</th>
    <th >품목명</th>
    <th >규격</th>
    <th >사양</th>
    <th >단위</th>
    <th >단가</th>
    <th >발주수량</th>
    <th >할인율</th>
    <th >부가세</th>
    <th >공급가액</th>
    <th >합계</th>
    <th >삭제</th>
  </tr>
  <c:forEach var="vo" items="${goodslist}">
                <tr>
                <td><input type="checkbox" value="${vo.product_num }"></td>
                <td>${vo.product_num }</td>
                <td>${vo.product_name }</td>
                <td>-</td>
                <td>-</td>
                <td>${vo.unit }</td>
                <td><input type="text" id="" name=""></td>
                <td><input type="text" id="" name=""></td>
                <td><input type="text" id="" name=""></td>
                <td>10%</td>
                <td><input type="text" id="" name=""></td>
                <td>합계금액</td>
                <td><a href="goodsDelete"><button class="user-delete" type="button" style="border-radius: 7px; background-color: #41515e; color:white;  height: 20px; width: 20px;">X</button></a></td>
                </tr>
             </c:forEach>

</table>
</div>
</div>
</div>

<script type="text/javascript">
	$('#submit_materials_order').click(function() {
		let mat_num = $('#mat_num').val();
        let mat_inputDate = $('#mat_inputDate').val();
        let mat_orderDate = $('#mat_orderDate').val();
        let mat_dueDate = $('#mat_dueDate').val();
        let mat_place = $('#mat_place').val();
        let mat_effectivedate = $('#mat_effectivedate').val();
        let mat_conditions = $('#mat_conditions').val();
        let mat_address = $('#mat_address').val();
        let mat_charge = $('#mat_charge').val();
        let mat_contact = $('#mat_contact').val();
        let mat_request = $('#mat_request').val();
        let mat_amount = $('#mat_amount').val();
        let mat_productNum = $('#mat_productNum').val();
		
		$.ajax({
			url : "userInsert.do",
		      type : "GET",
		      async:false,
		      data : {"mat_num":mat_num,
		    	  "mat_inputDate":mat_inputDate,
		    	  "mat_orderDate":mat_orderDate,
		    	  "mat_dueDate":mat_dueDate,
		    	  "mat_place":mat_place,
		    	  "mat_effectivedate":mat_effectivedate,
		    	  "mat_conditions":mat_conditions,
		    	  "mat_address":mat_conditions,
		    	  "mat_charge":mat_charge,
		    	  "mat_contact":mat_contact,
		    	  "mat_request":mat_request,
		    	  "mat_amount":mat_amount,
		    	  "mat_productNum":mat_productNum
		      },
		      success: function(result) {
          if (result) {
              alert("사용자 등록이 완료되었습니다.");
          } else {
              alert("전송된 값 없음");
          }
      },
      error: function() {
          alert("사용자 id, 사용자명, 비밀번호, 주공정, 권한을 모두 입력해주세요.");
      }
		   });
	});
	</script>

<!-- 불량수량입력 -->
<div id="produ_faulty">
  <div class="mater_wrapper" >
    <div class="menu" > 품질관리&nbsp&nbsp > &nbsp&nbsp불량수량입력</div>
  </div>
<div class="wrapper_mater">
  <div class="wrapp-mater2">
    <div class="button_ss">
      <table>
        <tr class="one_button" style="width: 100px;">
          <td><input type="radio" id="sample" name="sample" value="샘플링검사" style="width: 33px;"><a>샘플링검사</a></td>
          <td><input type="radio" id="total_ins" name="total_ins" value="전수검사" style="width: 33px;"><a>전수검사</a></td>
          <td>&nbsp;&nbsp;<a>수량</a><input type="number" id="workTime" name="workTime" min="0" max="1000" style="width: 70px; margin-left: 10px;"></td>
          <td>
            <button  class="faulty_btn" ><i class="fa-solid fa-box-archive"></i>&nbsp;저장</button>
          </td>
          <td><button  class="faulty_btn2"><i class="fa-solid fa-trash-can"></i>&nbsp;삭제</button>
          </td>
          <td><button class="faulty_btn3"><i class="fa-solid fa-file-excel"></i>&nbsp;엑셀 다운로드</button>
          </td>
        </tr>
      </table>
    </div>
    <div>
    <div class="mater_add1">
      <div class="tb_title-mater"><i class="fa-solid fa-calendar"></i><a>&nbsp&nbsp검사일자 및 시프트</a></div>
        <table>
          <tr>
            <td class="mater-name" style="width: 118px; text-align: center;">검사일자</td>
            <td><input type="date" style="height: 25px;"></td>
          </tr>
          <tr>
            <td class="mater-name" style="text-align: center;">시프트</td>
            <td><input></td>
          </tr>
        </table>
    </div>
    <div class="mater_add2" style="margin-top: -147px; margin-left: 318px;">
      <div class="tb_title-mater"><i class="fa-solid fa-gear"></i><a>&nbsp&nbsp공정 및 설비</a></div>
        <table>
          <tr>
            <td class="mater-name" style="width: 118px; height: 80px;">&nbsp;&nbsp;공&nbsp;&nbsp;&nbsp;&nbsp;정</td>
            <td><input></td>
          </tr>
        </table>
    </div>
    <div class="mater_add3" style="margin-top: -147px; margin-left: 635px;">
      <div class="tb_title-mater"><i class="fa-solid fa-user-large"></i><a>&nbsp&nbsp작업자</a></div>
        <table>
          <tr>
            <td><input type="text" style="height: 60px; text-align: center;"></td>
          </tr>
        </table>
    </div>
    <div class="mater_add4" style="margin-top: -147px; margin-left: 952px;">
      <div class="tb_title-mater"><i class="fa-solid fa-user-check"></i><a>&nbsp&nbsp결재</a></div>
        <table>
          <tr>
            <td><input type="text" style="height: 60px; text-align: center;"></td>
          </tr>
        </table>
    </div>
    <div class="mater_add5" style="margin-top: -147px; margin-left: 1270px;">
      <div class="tb_title-mater"><i class="fa-solid fa-file-pen"></i><a>&nbsp&nbsp메모</a></div>
        <table>
          <tr>
            <td><input type="text" style="height: 60px; text-align: center;"></td>
          </tr>
        </table>
    </div>
    <div class="mater_add_1">
      <div class="tb_title-mater"><i class="fa-solid fa-list"></i><a>&nbsp&nbsp품목정보</a></div>
        <table>
          <tr>
            <td></td>
          </tr>
        </table>
    </div>
    <div class="mater_add_12" style="margin-top: -200px; margin-left: 800px;">
      <div class="tb_title-mater"><i class="fa-solid fa-dolly"></i><a>&nbsp&nbsp물류정보</a></div>
        <table>
          <tr>
            <td></td>
          </tr>
        </table>
    </div>
  </div>
</div>
<section class="custome-list" style="overflow-y: scroll;">
  <table class="customerlist-table">
    <tr class="customerlist-main">
      <th>대분류</th>
      <th>중분류</th>
      <th>소분류</th>
      <th>항목</th>
      <th>검사기준</th>
      <th>검사방법</th>
      <th>결과</th>
      <th>판정</th>
    </tr>
    <tr>
      <td>화학</td>
      <td>고분자재료</td>
      <td>기타 고분자 재료</td>
      <td>공백</td>
      <td>공백</td>
      <td>공백</td>
      <td>불량률 : 0%</td>
      <td>합격</td>
    </tr>
    <tr>

  </table>
</section>
</div>
</div>
</div>
<!-- 오더 관리 -->
<div id="order_admin">
  <div class="mater_wrapper" >
    <div class="menu" > 주문관리&nbsp&nbsp > &nbsp&nbsp오더관리</div>
  </div>
<div class="wrapper_mater">
  <div class="wrapp-mater2">
    <div>
    <div class="mater_add">
      <div class="tb_title-mater" style="width: 100%;background-color:#41515E; border-radius: 10px 10px 0px 0px;">
        <i class="fa-solid fa-scroll" style="margin-left:17px"></i><a style="margin-left:2px">&nbsp&nbsp주문등록</a>
      </div>
        <table>
          <form id="orderAdmin">
          <tr>
            <td class="mater-name" style="width: 161px;">주문번호</td>
            <td><a>자동으로 부여됩니다.</a></td>
            <td class="mater-name" style="width: 161px;">주문자</td>
            <td><input style="height: 25px;"></td> 
          </tr>
          <tr>
            <td class="mater-name">제품명</td>
             <td><div class="inputWrap" style="width: 100%" ><input><button class="sear_btn">찾기</button></div></td>
            <td class="mater-name">출고예정일</td>
            <td><input type="date"></td>
          </tr>
          <tr>
            <td class="mater-name">주문일자</td>
            <td><input type="date"></td> 
            <td class="mater-name">배송지</td>
            <td ><div class="inputWrap" style="width: 100%"><input type="text" style="margin-right:10px"><button class="sear_btn" style="margin-left:10px">찾기</button></div></td>
          </tr>
          <tr>
            <td class="mater-name">담당자</td>
            <td><input></td> 
            <td class="mater-name">연락처</td>
            <td><input></td> 
          </tr>
          <tr>
            <td class="mater-name">비고</td>
            <td><input></td> 
            <td class="mater-name"></td>
            <td><button class="mater-btn_add" type="submit" id="orderAdmin_saveBtn">저장</button> 
               <button class="mater-btn_add">초기화</button>
            </td> 
          </tr>
        </form>
        </table>
      
    </div>
</div>
</div>
<div class="materlist_wrapper">


</div>
<div class="wrapper_produc">
  
  <div class="user_wrapper">

    <div class="btn">

      <div style="float: left;">
        <select  id="class_code_a2">
          <option value="slc1">
            <div style="float: left;margin-right: 10px;" >
              <a class="user_btn" style="padding:4px"><i class="fa-solid fa-file-excel"></i>&nbsp주문서(간단인쇄)</a>
            </div></option>
          <option value="slc1"><a class="user_btn" style="padding:4px"><i class="fa-solid fa-file-excel"></i>&nbsp주문서(상세인쇄)</a></div></option>
          <option value="slc1"><a class="user_btn" style="padding:4px"><i class="fa-solid fa-file-excel"></i>&nbsp거래명세서</a></div></option>
        </select>
      </div>
      <div style="float: left;margin-right: 10px;" >
        <a class="user_btn" style="padding:4px"><i class="fa-solid fa-file-excel"></i>&nbsp인쇄</a>
      </div>
  </div>
<div class="orderA_wrapp">
  <div id="image_container" >
    <!-- 인쇄 미리보기 -->
	<table class="show_print">
    <cation class="order_print">상품주문서</caption>
		<tr>
			<th>주문일자</th>
			<td colspan="2">2022년7월26일</td>
      <th>주문번호</th>
      <td colspan="2">제143호</td>
		</tr>
		<tr>
      <th rowspan='3'>수신</th>
			<th>회사명</th>
			<td></td>		
			<th>대표자</th>
			<td colspan="2"></td>
    </tr>
		<tr>
      <th>참조</th>
      <td colspan="4"></td>
  </tr>
    <tr>
      <th>전화번호</th>
      <td></td>
      <th>FAX번호</th>
      <td colspan="2"></td>
    </tr>
    <tr>
      <th>제목</th>
      <td colspan="5"></td>
    </tr>
    <tr>
      <th>합계금액</th>
      <td colspan="5">일금_______원정(_____),세액 포함</td>
    </tr>
    <tr>
      <th>No</th>
      <th>상품명</th>
      <th>규격 사양</th>
      <th>수량</th>
      <th>단가</th>
      <th>금액</th>
    </tr>
    <tr>
      <td>1</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>2</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
     <td>3</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
     <td>4</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
     <td>5</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>

    <tr>
      <th rowspan="4">주문자</th>
      <th>배송지 주소</th>
      <td colspan="4"></td>
    </tr>
    <tr>
      <th>회사명</th>
      <td></td>
      <th>대표자</th>
      <td style="text-align:right" colspan="2">(인)&nbsp</td>
    </tr>
    <tr>
      <th>담당자명</th>
      <td></td>
      <th>전화번호</th>
      <td colspan="2"></td>
    </tr>
    <tr>
      <th>FAX번호</th>
      <td></td>
      <th>E-mail</th>
      <td colspan="2"></td>
    </tr>
	</table>

  </div>
</div>
</div>
<div class="user1" >
  <div class="user_wrapper">
  <div class="btn">
  <button class="user_btn" style="margin-left: 10px;">삭제</button>
  </div>
  <div class="orderA_wrapp" id="use_date">
  <table class="user_tb">
    <tr>
      <td></td>
      <th>주문일자</th>
      <th>주문번호</th>
      <th>주문자</th>
      <th>제품명</th>
      <th>주문수량</th>
      <th>출고예정일</th>
      <th>배송지</th>
      <th>연락처</th>
      <th>비고</th>
    </tr>
  <tr class="tb_tr">
    <td>1</td>
  <td colspan="9"></td>
  </tr>
  <tr class="tb_tr">
    <td>2</td>
    <td colspan="9"></td>
  </tr>
  <tr class="tb_tr">
    <td>3</td>
    <td colspan="9"></td>
  </tr>
  <tr class="tb_tr">
    <td>4</td>
    <td colspan="9"></td>
  </tr>
  </table>
  </div>
  </div>
  </div>
  </div>
  </div>
  </div>
  


<!-- 주문내역조회 -->
    <div id="pro_order">
      <div class="mater_wrapper" >
        <div class="menu" > 주문관리&nbsp&nbsp > &nbsp&nbsp주문내역조회</div>
      </div>
      <div class="wrapper_produc">
          <div class="proOrder_wrapp">
            <i class="fa-solid fa-money-check-dollar fa-4x"></i>
              <p>결제 완료(미배송)</p>
              <a style="font-size: 25px;">0</a> 건
          </div>
          <div class="proOrder_wrapp">
            <i class="fa-solid fa-cubes-stacked fa-4x"></i>
            <p>장기 미배송</p>
            <a style="font-size: 25px;">0</a> 건
          </div>
          <div class="proOrder_wrapp">
            <i class="fas fa-box-open fa-4x"></i>
            <p>상품 준비중</p>
           <a style="font-size: 25px;">0</a> 건
          </div>
          <div class="proOrder_wrapp">
            <i class="fas fa-truck-loading fa-4x"></i> 
            <p>발송 대기</p>
            <a style="font-size: 25px;">0</a> 건
          </div>
          <div class="proOrder_wrapp">
            <i class="fas fa-truck fa-4x"></i>
            <p>배송중</p>
            <a style="font-size: 25px;">0</a> 건
          </div>
      </div>
      <div class="use_wrapper" style="margin-top: 10px;">
        <div class="btn">
            <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
              <a style="padding:10px;" >품목일자</a>
              <input class="us" type="date"  >
            </div>
            <div style="float: left;">
            <b>&nbsp;~&nbsp;<input  class="us" type="date"></b>&nbsp&nbsp
            </div>
            <div style="float: left;"> <a>주문상태</a>
            <select name="class_code_a" id="class_code_a" >
              <option value="slc1" selected>전체</option>
              <option value="">결제 완료(미배송)</option>
              <option value="">장기 미배송</option>
              <option value="">상품 준비중</option>
              <option value="">발송대기</option>
              <option value="">배송중</option>
            </select>
            </div>
            <div  style="float: left;"> <a>입금상태</a>
              <select name="class_code_a" id="class_code_a2" >
                <option value="slc1" selected>전체</option>
                <option value="">입금대기</option>
                <option value="">결제완료</option>
                <option value="">환불</option>
              </select>
              </div>
            <div class="btn_search2" style="float: left; padding-left:10px;">
              <a style="padding:10px;" >주문번호</a>
              <input class="us" type="text"  >
            </div>
          <div class="btn_search" style="padding:10px;margin-right:10px"><a><i class="fa-solid fa-magnifying-glass"></i>&nbsp검색&nbsp</a> </div>
        </div>
        
    <div class="produc">
    <table class="user_tb">
      <tr>
        <th>No.</th>
        <th>주문일시</th>  
        <th>주문번호</th>
        <th>주문자</th>
        <th>제품명</th>
        <th>주문금액</th>
        <th>결제금액</th>
        <th>상태</th>
        <th>수량</th>
        <th>배송지</th>
        <th>비고</th>
      </tr>
      <tr>
        <td>1</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td><div class="btn_operation">배송중</div></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>2</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td><div class="btn_end">완료</div></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>3</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td><div class="btn_end">대기</div></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>4</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>5</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>6</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>7</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>8</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
    </table>
  </div>
  </div>
  </div>
  
</div>
</div>
</div>



<!-- X-R 관리도 -->
<div id="xr_admin">
    <div class="use_wrapper">
      <div class="menu">X-R 관리도</div>
  </div>
    <div class="wrapper_produc_btn">
<div class="btn" style="margin-top: 12px">
    <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
          <a style="padding:8px;">검사일</a>
          <input class="us" type="date">
        </div>
      <div style="float: left;"><h2 style="color: #126AEA;">&nbsp;&nbsp;~&nbsp;</h2></div><input  class="us" type="date">
      <a>&nbsp&nbsp검사종류 : </a><input type="radio" id="자주검사" value="자주검사" checked>
    </div>

  <div class="btn">
    
      <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
        <a style="padding:8px;" >품목</a>
        <input class="us">
      </div>
      <div class="btn_search" style="float: left;padding-left:10px;margin-left: 10px;">
        <a style="padding:8px;" >검사기준(수치)</a>
        <input class="us">
      </div>
      <div class="btn_search" style="padding:10px;margin-left:10px"><a><i class="fa-solid fa-magnifying-glass"></i>&nbsp검색&nbsp</a> </div>
    </div>
  </div>
  
  <div class="wrapper_produc">
	  <div class="wrapp">
		  <div class="produc_add" style="height:340px">
			 <div class="tb_title-mater" style="width: 100%;background-color:#41515E; border-radius: 10px 10px 0px 0px;">
		     	 <a style="margin-left:2px">&nbsp&nbspX bar 관리도</a>
		    </div> 
		      <div class="wrapper_produc2">
		    <canvas id="chart" width:"420px" ></canvas> 
			<div id="chartLegend" class="chartjs-legend" style="height:20%">
		</div>
</div> 
		  </div>
	   
		  <div class="produc_add" style="height:340px">
		 	<div class="tb_title-mater" style="width: 100%;background-color:#41515E; border-radius: 10px 10px 0px 0px;">
		      <a style="margin-left:2px">&nbsp&nbsp히스토그램</a>
		    </div>
		    <div style="display:inline-block;margin-top: 20px;">
		     <canvas id="histogram" width:"420px"></canvas>
		  </div>
	  </div>
	 </div>
	    </div>
	    <div class="wrapper_produc">
    <div class="wrapp2">
  <div class="produc_add" style="height:340px">
   <div class="tb_title-mater" style="width: 100%;background-color:#41515E; border-radius: 10px 10px 0px 0px;">
      <a style="margin-left:2px">&nbsp&nbspR관리도</a>
    </div>
      <div class="wrapper_produc2">
		    <canvas id="rchart" ></canvas> 
			<div id="rchartLegend" class="rchartjs-legend">
		</div>
</div> 
		
    <table class="rAdmin_td">
    	<tr>
    		<th>검사일자</th>
    		<th>군 평균(X)</th>
    		<th>범위(R)</th>
    		<th>샘플</th>
    		<th>초</th>
    		<th>중</th>
    		<th>종</th>
    	</tr>
    </table>
 </div>
 <div class="produc_add" style="height:340px">
   <div class="tb_title-mater" style="width: 100%;background-color:#41515E; border-radius: 10px 10px 0px 0px;">
      <a style="margin-left:2px">&nbsp&nbspX bar/ R</a>
    </div>
    <table class="xrAdmin_td">
    	<tr>
    		<th></th>
    		<th>-- X bar --</th>
    		<th>-- R --</th>
    	</tr>
    	<tr>
    		<td>평균:</td>
    		<td colspan="2"></td>
    	</tr>
    	<tr>
    		<td>UCL:</td>
    		<td colspan="2"></td>
    	</tr>
    	<tr>
    		<td>CL:</td>
    		<td colspan="2"></td>
    	</tr>
    	<tr>
    		<td>LCL:</td>
    		<td colspan="2"></td>
    	</tr>
    	<tr>
    		<td>관리한계이탈수:</td>
    		<td colspan="2"></td>
    	</tr>
    	<tr>
    		<td>최대 런 길이:</td>
    		<td colspan="2"></td>
    	</tr>
    </table>
    
    </div>
    <div class="produc_add" style="height:340px">
       <div class="tb_title-mater" style="width: 100%;background-color:#41515E; border-radius: 10px 10px 0px 0px;">
      	<a style="margin-left:2px">&nbsp&nbsp통계/공정지수(cpk)</a>
    	</div>
		     <table class="xrAdmin_td">
		    	<tr>
		    		<td>규격상한:</td>
		    		<td></td>
		    	</tr>
		    		<tr>
		    		<td>규격하한:</td>
		    		<td></td>
		    	</tr>
		    	<tr>
		    		<td>총 시료수(n):</td>
		    		<td></td>
		    	</tr>
				<tr>
		    		<td>표준편차:</td>
		    		<td></td>
		    	</tr>	
		    	<tr>
		    		<td>최대값:</td>
		    		<td></td>
		    	</tr>
		    	<tr>
		    		<td>최소값:</td>
		    		<td></td>
		    	</tr>		
		    	<tr>
		    		<td>공정능력(Cp):</td>
		    		<td></td>
		    	</tr>				    	
				<tr>
		    		<td>치우침(k):</td>
		    		<td></td>
		    	</tr>
		    	<tr>
		    		<td>공정능력지수(Cpk):</td>
		    		<td></td>
		    	</tr>			
		    </table>
  </div>
  </div>
     </div>
</div>
 </div>
  </div>
  </div>


    <script> /*하위 사이드바 제이쿼리*/
        $('.one-btn').click(function(){
          $('nav ul .one-show').toggleClass("show");
          $('nav ul .first').toggleClass("rotate");
        });
        $('.two-btn').click(function(){
          $('nav ul .two-show').toggleClass("show2");
          $('nav ul .second').toggleClass("rotate");
        });
        $('.three-btn').click(function(){
          $('nav ul .three-show').toggleClass("show3");
          $('nav ul .third').toggleClass("rotate");
        });
        $('.four-btn').click(function(){
          $('nav ul .four-show').toggleClass("show4");
          $('nav ul .forth').toggleClass("rotate");
        });
        $('.five-btn').click(function(){
          $('nav ul .five-show').toggleClass("show5");
          $('nav ul .fifth').toggleClass("rotate");
        });
        $('.six-btn').click(function(){
          $('nav ul .six-show').toggleClass("show6");
          $('nav ul .sixth').toggleClass("rotate");
        });
        $('nav ul li').click(function(){
           $(this).addClass("active").siblings().removeClass("active");
        });
    </script>
 
<script>
  d3.selectAll("span")
    .datum(function(){return this.dataset})
    .style("height","0%")
    .style("right",(d,i)=>(i*80)+"px")
    .transition().duration(1500)
    .style("height",d=>d.val+"%");
</script>

<script>
      $(document).ready(()=>{
      calendarInit()
    });
    function calendarInit() {
  
      $('.year-month').text("몇월?")
      
        // 날짜 정보 가져오기
        var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
        var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
        var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
        var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
      
        var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
        // 달력에서 표기하는 날짜 객체
      
        
        var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
        var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
        var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일
  
        // kst 기준 현재시간
        // console.log(thisMonth);
  
        // 캘린더 렌더링
        renderCalender(thisMonth);
  
        function renderCalender(thisMonth) {
  
            // 렌더링을 위한 데이터 정리
            currentYear = thisMonth.getFullYear();
            currentMonth = thisMonth.getMonth();
            currentDate = thisMonth.getDate();
  
            // 이전 달의 마지막 날 날짜와 요일 구하기
            var startDay = new Date(currentYear, currentMonth, 0);
            var prevDate = startDay.getDate();
            var prevDay = startDay.getDay();
  
            // 이번 달의 마지막날 날짜와 요일 구하기
            var endDay = new Date(currentYear, currentMonth + 1, 0);
            var nextDate = endDay.getDate();
            var nextDay = endDay.getDay();
  
            // console.log(prevDate, prevDay, nextDate, nextDay);
  
            // 현재 월 표기
            $('.year-month').text(currentYear + '.' + (currentMonth + 1));
            
            // 렌더링 html 요소 생성
            calendar = document.querySelector('.dates')
            calendar.innerHTML = '';
            
            // 지난달
            for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
                calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
            }
            // 이번달
            for (var i = 1; i <= nextDate; i++) {
                calendar.innerHTML = calendar.innerHTML + '<div class="day current" id="' +(currentYear + '.' + (currentMonth + 1)+'.'+i) + '">' + i + '</div>'
            }
            // 다음달
            for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
                calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
            }
  
            // 오늘 날짜 표기
            if (today.getMonth() == currentMonth) {
                todayDate = today.getDate();
                var currentMonthDate = document.querySelectorAll('.dates .current');
                currentMonthDate[todayDate -1].classList.add('today');
            }
        }
  
        // 이전달로 이동
        $('.go-prev').on('click', function() {
            thisMonth = new Date(currentYear, currentMonth - 1, 1);
            renderCalender(thisMonth);
        });
  
        // 다음달로 이동
        $('.go-next').on('click', function() {
            thisMonth = new Date(currentYear, currentMonth + 1, 1);
            renderCalender(thisMonth); 
        });
    }
</script>
  <!-- 생산량 -->
  <script>
    var ctx = document.getElementById('myChart').getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'bar',
      options: {
        pieceLabel: {
              mode:"label",
              position:"inside",
              fontSize: '18px',
              fontStyle: 'bold'
          },
          
        responsive: false,
        maintainAspectRatio: false,
        legend: {
          display: false,
        },
        
        scales: {
          xAxes: [{
            gridLines: { //A축 gridLines 지우는 옵션
              display: false,
              drawBorder: false,
            },
            ticks: {
              fontSize: 15,
              fontColor: 'black'
            }
          }],
          yAxes: [{
            gridLines: { //Y축 gridLines 지우는 옵션
              drawBorder: false,
              display: false,
            },
            ticks: {
              display: false,
              beginAtZero: true,
            }
          }]
        },
        tooltips: {
          backgroundColor: '#166cea'
        },
      },
      data: {
        labels: ['4월', '5월', '6월', '7월'],
      datasets: [{
        data: [200, 1000, 400, 800],
        backgroundColor: '#3f65b8',
        datalabels:{
                      color:'white',
                      font:{size:15},
                  }

        }]
    },
   
  });
</script>

<!-- 전년대비 납기율 -->
<script>

var ctx = document.getElementById('rate_chart').getContext('2d');
var myChart = new Chart(ctx, {
type: 'bar',
  options: {
    responsive: false,
    maintainAspectRatio: false,
    legend: {display: false},
    scales: {
      xAxes: [{
        gridLines: { 
          display: false,
          drawBorder: false,
        },
        ticks: {
          fontSize: 15,
          fontColor: 'black'
        }
      }],
      yAxes: [{
        gridLines: { 
          drawBorder: false,
          display: false,
        },
        ticks: {
          display: false,
          beginAtZero: true,
        }
      }]
    },
  
  },
  data: {
    labels: ['4월', '5월', '6월', '7월'],
  datasets: [{
    data: [10, 20, 40, 80],
    backgroundColor: '#5dba8e',
    datalabels:{
                      color:'white',
                      font:{size:15},
                  }
  }]
},

});
</script>




<script> 
var barChartData = { 
labels: ["월", "화", "수", "목", "금"],
 datasets: [{
   label: '지난주',
   backgroundColor: "#CCCCCC",
   data: [40,80,60,30,100],
   datalabels:{
                      color:'white',
                      font:{size:15},
                  }
  },
  {
  label: '이번주',
  backgroundColor: "#FBB03B",
  data: [50,90,40,60,90],
  datalabels:{
                      color:'white',
                      font:{size:15},
                  }
 },

]
 };
window.addEventListener('load',function() {
var ctx = $('#chart_').get(0).getContext("2d"); 
window.theChart = new Chart(ctx, {
 type: 'bar',
 data: barChartData,
 options: {
	 plugins:{
         legend: {
             display: false
         }
	 },
  legend: {display: false},
  scales: {
      xAxes: {
          display: true,
          drawBorder: true,
          drawOnChartArea : false,
          borderColor:'#797979',
    	  borderWidth:1
      },
      yAxes: {
      
          drawBorder: false,
          display: false,
          drawOnChartArea : false,
          borderColor:'#797979',
    	  borderWidth:1
      },
   
    }
 }
});
});
</script>





<script>
  document.getElementById('main_graph').style.display = 'block';
  document.getElementById('main_nav').style.display = 'block';
  document.getElementById('quality_inspection').style.display = 'none';
  document.getElementById('process_defect').style.display = 'none';
  document.getElementById('release').style.display = 'none';
  document.getElementById('bom_admin').style.display = 'none';
  document.getElementById('material_view').style.display = 'none';
  document.getElementById('product').style.display = 'none';
  document.getElementById('productView').style.display = 'none';
  document.getElementById('customer_admin').style.display = 'none';
  document.getElementById('goods').style.display = 'none';
  document.getElementById('user_admin').style.display = 'none';
  document.getElementById('fin_product').style.display = 'none';
  document.getElementById('order_view').style.display = 'none';
  document.getElementById('order').style.display = 'none';
  document.getElementById('produc_plan').style.display = 'none';
  document.getElementById('faulty_list').style.display = 'none';
  document.getElementById('inventory_list').style.display = 'none';
  document.getElementById('material').style.display = 'none';
  document.getElementById('produ_faulty').style.display = 'none';
  document.getElementById('out_order').style.display = 'none';
  document.getElementById('material_arrival').style.display = 'none';
  document.getElementById('order_admin').style.display = 'none';
  document.getElementById('pro_order').style.display = 'none';
  document.getElementById('xr_admin').style.display = 'none';

  $('#product_li').click(function() { // 생산일보
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('product').style.display = 'block';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';

})

  $('#productView_li').click(function() { // 생산실적 조회
    document.getElementById('productView').style.display = 'block';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('product').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


})




$('#customer_li').click(function() { // 거래처관리
    document.getElementById('customer_admin').style.display = 'block';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


})

$('#goods_li').click(function() { // 품목정보관리
    document.getElementById('goods').style.display = 'block';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


})

$('#main_').click(function() { // 메인
    document.getElementById('main_graph').style.display = 'block';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })

  $('#materialView_li').click(function() { // 자재 발주 조회
    document.getElementById('material_view').style.display = 'block';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })

  
  $('#user_li').click(function() { // 사용자관리
    document.getElementById('user_admin').style.display = 'block';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })
  
  $('#bom_li').click(function() { // BOM 관리
    document.getElementById('bom_admin').style.display = 'block';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })

  $('#qualityInspection_li').click(function() { // 품질 검사 내역 조회
    document.getElementById('quality_inspection').style.display = 'block';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })

  $('#release_li').click(function() { // 출고조회
    document.getElementById('release').style.display = 'block';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })

  $('#qualityInspection_li').click(function() { // 공정 불량 현황
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'block';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })

   $('#processDefect_li').click(function() { // 공정 불량 현황
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'block';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })

  $('#finProduct_li').click(function() { // 제품관리
    document.getElementById('fin_product').style.display = 'block';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })


  $('#producPlan_li').click(function() { // 작업계획
    document.getElementById('produc_plan').style.display = 'block';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })


  $('#orderView_li').click(function() { // 작업지시조회
    document.getElementById('order_view').style.display = 'block';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })



  $('#order_li').click(function() { // 작업지시
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'block';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })

  $('#faultyList_li').click(function() { // 불량률조회
    document.getElementById('faulty_list').style.display = 'block';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';

  })
  $('#inventoryList_li').click(function() { // 자재재고현황
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'block';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })

  $('#materialArrival_li').click(function() { // 자재입고현황
    document.getElementById('material_arrival').style.display = 'block';
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';

  })


  $('#material_li').click(function() { // 자재발주
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'block';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })
  $('#produFaulty_li').click(function() { // 불량수량입력
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'block';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })

  
  $('#outOrder_li').click(function() { // 출고지시
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'block';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';


  })

  $('#orderAdmin_li').click(function() { // 오더 관리
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'block';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'none';

  })

  $('#proOrder_li').click(function() { // 주문내역조회
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'block';
    document.getElementById('xr_admin').style.display = 'none';

  })

  $('#xrAdmin_li').click(function() { // x-r관리도
    document.getElementById('faulty_list').style.display = 'none';
    document.getElementById('order_view').style.display = 'none';
    document.getElementById('fin_product').style.display = 'none';
    document.getElementById('release').style.display = 'none';
    document.getElementById('quality_inspection').style.display = 'none';
    document.getElementById('bom_admin').style.display = 'none';
    document.getElementById('main_nav').style.display = 'block';
    document.getElementById('user_admin').style.display = 'none';
    document.getElementById('main_graph').style.display = 'none';
    document.getElementById('product').style.display = 'none';
    document.getElementById('productView').style.display = 'none';
    document.getElementById('customer_admin').style.display = 'none';
    document.getElementById('goods').style.display = 'none';
    document.getElementById('material_view').style.display = 'none';
    document.getElementById('process_defect').style.display = 'none';
    document.getElementById('order').style.display = 'none';
    document.getElementById('produc_plan').style.display = 'none';
    document.getElementById('inventory_list').style.display = 'none';
    document.getElementById('material').style.display = 'none';
    document.getElementById('produ_faulty').style.display = 'none';
    document.getElementById('out_order').style.display = 'none';
    document.getElementById('material_arrival').style.display = 'none';
    document.getElementById('order_admin').style.display = 'none';
    document.getElementById('pro_order').style.display = 'none';
    document.getElementById('xr_admin').style.display = 'block';

  })
</script>




<script>
$('#order_admin .user_btn').click(function() {
  //pdf_wrap을 canvas객체로 변환 orderA_wrapp div#image_container
  html2canvas($('#order_admin div#image_container')[0]).then(function(canvas) {
    var imgData = canvas.toDataURL('image/png', 1.0); //캔버스를 이미지로 변환
    var windowContent = '<!DOCTYPE html>';
    windowContent += '<html>'
    windowContent += '<head><title>Print canvas</title></head>';
    windowContent += '<body>'
    windowContent += '<img src="' + imgData + '" ';
    windowContent += '</body>';
    windowContent += '</html>';
    var printWin = window.open('','','width=1920,height=1080');
    printWin.document.open();
    printWin.document.write(windowContent);
    

    printWin.document.addEventListener('load', function() {
        printWin.focus();
        printWin.print();
        printWin.document.close();
        printWin.close();            
    }, true);
  });
});
</script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <!-- 히스토그램 -->
<script>
// setup 
const data = {
  labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
  datasets: [{
    label: 'Weekly Sales',
    data: [0.5, -0.1, 0.2, 0.4, 0.3, 0.1, -0.5],
    backgroundColor: ['rgba(255, 26, 104, 0.2)'],
    borderColor: 'rgba(54, 162, 235, 1)',
    tension: 0.4,
    yAxisID:'y'
  },
  {
      label: 'Percentage',
      data: [-0.5, 0.1, 0.4, 0.5, 0.1, 0.2, 0.3],
      backgroundColor: ['rgba(255, 26, 104, 0.2)'],
      borderColor: 'rgba(54, 162, 235, 1)',
      tension: 0.4,
      yAxisID:'percentage'
    }]
};

// config 
const config = {
  type: 'line',
  data,
  options: {
	  responsive: false,
      maintainAspectRatio: false,
	  elements: {
   	   point: {
   	   radius: 0,
   	  },
   },
	  plugins:{
          legend: {
              display: false
          },
     
      },
    scales: {
    	xAxes: {
            grid : { 
              display: true,
              drawBorder: true,
              drawOnChartArea : false,
              borderColor:'#797979',
        	  	 borderWidth:1
              
            },
            ticks: {
                  display: true,
                  beginAtZero: true,
                }
          },
      y: {
        beginAtZero: true,
        type:'linear',
        position:'left',
        grid:{
      	  drawOnChartArea : false,
               borderColor:'#797979',
         	  	 borderWidth:1
        }
      },
      percentage: {
          beginAtZero: true,
          type:'linear',
          position:'right',
          grid:{
        	  drawOnChartArea : false,
                 borderColor:'#797979',
           	  	 borderWidth:1
          }
        }
    }
  }
};

// render init block
const histogramChart = new Chart(document.getElementById('histogram'),config);
</script>



<!-- X-R 관리도 chart-->
  <script>
  var xbarData = {        
	        /* labels: [0.8, 0.6, 0.4, 0.2, 0.0, -0.2,-0.4,-0.6,-0.8], */
	        datasets: [{
	        	label: 'X bar',
	            type: 'line',
	            backgroundColor: "#3F65B8",
	            data: [0.4, 0.2, 0.6, 0.3, 0.0, -0.1,-0.4,-0.3,-0.8]
	           
	        }, 
	        {
	            type: 'line',
	            label: 'CL ',
	            backgroundColor: "#5DBA8E",
	            data: [0.8, 0.6, 0.4, 0.2, 0.0, -0.2,-0.4,-0.6,-0.8]
	           
	        },  
	        {
	        	type: 'line',
        	 	label: 'UCL',
        	 	backgroundColor: "#FBB03B",
        	  	data: [0.8, 0.6, 0.4, 0.2, 0.0, -0.2,-0.4,-0.6,-0.8]
        	  	
        	  	
	        },
	        {
	        	type: 'line',
        	 	label: 'LCL',
        	 	backgroundColor: "#808080",
        	  	data: [0.8, 0.6, 0.4, 0.2, 0.0, -0.2,-0.4,-0.6,-0.8]
	        },

	        ]
	    };
	
	 window.onload = function() {
		 
	    var ctx = $('#chart').get(0).getContext("2d"); 
	    window.theChart = new Chart(ctx, {
	         type: 'line',
	         data: xbarData,	 
	         options: {
	        	 plugins:{
	        		 legend:{
	        			 position:'right'
	        		 }
	        	 },
	        	 responsive: false,
	             maintainAspectRatio: false,
	             legendCallback: function(chart){
	                return drawCustomLegend(chart);
	                
	             },// 사용자 범례를 만들 때 쓰는 함수를 지정하거나 작성한다.
	             scales: {
	                 xAxes: {
	                   grid : { 
	                     display: true,
	                     drawBorder: true,
	                     drawOnChartArea : false,
	                     borderColor:'#797979',
	               	  	 borderWidth:1
	                     
	                   },
	                   ticks: {
		                     display: true,
		                     beginAtZero: true,
		                   }
	                 },
	                 yAxes: {
	                   grid : { 
	                     drawBorder: true,
	                     display: false,
	                     drawOnChartArea : false,
	                     borderColor:'#797979',
	               	  	 borderWidth:1
	                   },
	                   ticks: {
	                	   beginAtZero: true,
	                	   suggestedMin: -0.8,
	                	   suggestedMin: 0.8,
	                	   step:0.2
	                   },
	                 
	                 },
	              
	               }
	         }
	    })
	 }
	 
	
    </script>




<!-- 리스트 삭제-->
<script>
  function deleteRow(ths){
      var ths = $(ths);
      
      ths.parents("tr").remove();
  }
  
  var typingBool = false; 
  var typingIdx=0; 


  // 타이핑될 텍스트를 가져온다 
  var typingTxt = $(".typing-txt").text(); 

  typingTxt=typingTxt.split(""); // 한글자씩 자른다. 

   if(typingBool==false){ 
    // 타이핑이 진행되지 않았다면
     typingBool=true;     
     var tyInt = setInterval(typing,100); // 반복동작 
  }

  function typing(){ 
    if(typingIdx<typingTxt.length){ 
      // 타이핑될 텍스트 길이만큼 반복 
      $("#typing").append(typingTxt[typingIdx]);
      // 한글자씩 이어준다. 
      typingIdx++; 
     } else{ 
       //끝나면 반복종료 
      clearInterval(tyInt); 
     } 
  } 

  
  
</script>
                                        <!-- 아이디 중복 체크
<script>
  $('.input-id').focusout(function(){
      let userId = $('.input_id').val();

      $.ajax({
          type:"post",
          data:{userId:userId},
          dataType:'json',
          success:function(result){
              if(result == 0){
                  $("#checkId").html('사용할 수 없는 아이디입니다');
                  $("#checkId").attr('color', 'red');
              }else{
                  $("#checkId").html('사용할 수 있는 아이디입니다');
                  $("#checkId").attr('color', 'green');
              }
          },
          error : function(){
              alert("서버요청실패");
          }
      })
  })
</script> -->
                                            <!--빈 입력란 뭐라하기-->
<!-- <script>
        $(document).ready(function(){
          $("#username").click(function(){
            if($("#userid").val().length==0){alert("사용자ID 입력해주세요"); $("#userid").focus(); return false;}
          });
          $("#userpw").click(function(){
            if($("#username").val().length==0){alert("사용자명 입력해주세요"); $("#username").focus(); return false;}
          });
          $("#mainProcess").click(function(){
            if($("#userpw").val().length==0){alert("비밀번호 입력해주세요"); $("#userpw").focus(); return false;}
          });
          $("#userRight").click(function(){
            if($("#mainProcess").val().length==0){alert("주 공정 입력해주세요"); $("#mainProcess").focus(); return false;}
          });
          $("#department").click(function(){
            if($("#userRight").val().length==0){alert("권한 선택해주세요"); $("#userRight").focus(); return false;}
          });
          $("#contact").click(function(){
            if($("#department").val().length==0){alert("부서명 입력해주세요"); $("#department").focus(); return false;}
          });
          $("#email").click(function(){
            if($("#contact").val().length==0){alert("연락처 입력해주세요"); $("#contact").focus(); return false;}
          });
          $("#submit").click(function(){
            if($("#email").val().length==0){alert("이메일 입력해주세요"); $("#email").focus(); return false;}
              else if ($("#userid").val().length==0){alert("사용자ID 입력해주세요"); $("#userid").focus(); return false;}
              else if ($("#username").val().length==0){alert("사용자명 입력해주세요"); $("#username").focus(); return false;}
              else if($("#userpw").val().length==0){alert("비밀번호 입력해주세요"); $("#userpw").focus(); return false;}
              else if($("#mainProcess").val().length==0){alert("주 공정 입력해주세요"); $("#mainProcess").focus(); return false;}
              else if ($("#userRight").val().length==0){alert("권한 선택해주세요"); $("#userRight").focus(); return false;}
              else if ($("#department").val().length==0){alert("부서명 입력해주세요"); $("#department").focus(); return false;}
              else if ($("#contact").val().length==0){alert("연락처 입력해주세요"); $("#contact").focus(); return false;}
          });
        });
      
</script> -->

</body>
</html>