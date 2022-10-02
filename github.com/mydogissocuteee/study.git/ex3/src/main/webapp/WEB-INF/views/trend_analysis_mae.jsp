<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=2.0">
    <title>슬기로운 BB 플랫폼</title>
    <link rel="icon" href="./resources/img/trend_analysis/그림3.png">
    
    <!-- css -->
     <link rel="stylesheet" href="./resources/css/trend_analysis.css" type="text/css">
     
    <!-- favion 아이콘 -->
     <script src="https://kit.fontawesome.com/036f0eb301.js" crossorigin="anonymous"></script>
     
     <!-- slick  -->
	<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	
	<!--  chart.js-->
	 <script type="text/javascript" charset="utf-8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
 	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 	 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<c:if test="${param.select eq '0'}">
<script>	
	$(function () {
    console.log(${analysis.p3});
    
    document.getElementById('p3').setAttribute('style','height:${analysis.p3}%');
    document.getElementById('p6').setAttribute('style','height:${analysis.p6}%');
    document.getElementById('p8').setAttribute('style','height:${analysis.p8}%');
    document.getElementById('p10').setAttribute('style','height:${analysis.p10}%');
    document.getElementById('f1').setAttribute('style','height:${analysis.f1}%');
    document.getElementById('f5').setAttribute('style','height:${analysis.f5}%');
    document.getElementById('f14').setAttribute('style','height:${analysis.f14}%');
    document.getElementById('f17').setAttribute('style','height:${analysis.f17}%');
    document.getElementById('c1').setAttribute('style','height:${analysis.c1}%');
    document.getElementById('c2').setAttribute('style','height:${analysis.c2}%');
    document.getElementById('c3').setAttribute('style','height:${analysis.c3}%');
    document.getElementById('c4').setAttribute('style','height:${analysis.c4}%');
    document.getElementById('c7').setAttribute('style','height:${analysis.c7}%');
    document.getElementById('c12').setAttribute('style','height:${analysis.c12}%');
    document.getElementById('m1').setAttribute('style','height:${analysis.m1}%');
    document.getElementById('m2').setAttribute('style','height:${analysis.m2}%');
    document.getElementById('m4').setAttribute('style','height:${analysis.m4}%');
    
	});
	</script>
	</c:if>
<form action="selectTrend.do">
       <header class="header">
        <div class = "header_01">
             <img src="./resources/img/trend_analysis/사용자.png">
             <c:choose>
					<c:when test="${customer.sortation eq 'user'}"><a href="profilejsp.do">${customer.name }님, 안녕하세요</a></c:when>
					<c:when test="${customer.sortation eq 'admin'}"><a href="product_managejsp.do">${customer.name }님, 안녕하세요</a></c:when>
			 </c:choose>
        </div>
        <div class = "header_02" onclick="location.href='mainjsp.do'">
            <img src="./resources/img/trend_analysis/home.png">
        </div>
        <div class = "header_03">
            <input type="text">
            <button type="submit"><img src="./resources/img/trend_analysis/검색.png"></button>
        </div>
    </header>
    
    
    <div class="content">
    <div class="trend_title"><a>구매자 트렌드 분석</a><p>다양한 분야로 상세한 정보를 쉽고 빠르게 확인해보세요</p></div>
		<div class="trend_total_wrapp">
			<div class="searchbtn_btn"><button class="trend_search"><img src="./resources/img/trend_analysis/trend_search.png" class="trend_search_img"></button></div>
			<div class="trend_top">
			<table class="keyword_tb">
				<tr>
					<th class="keyword_tb_header">키워드 선택</th>
					<td colspan="2"  class="keyword_td" >
						<select id="분류1" name="product_type">
						    <option value="alltype">분류1</option>
						    <option value="type01">블랭킷</option>
						    <option value="type02">베개</option>
						    <option value="type03">범퍼침대</option>
						    <option value="type04">매트</option>
						</select>
						<a class="sel_subtext">></a>
						<select id="분류2" name="season">
						    <option value="allseason">기간</option>
						    <option value="SS">S/S</option>
						    <option value="FW">F/W</option>
						</select>
					</td>
					
				</tr>
				<tr>
				<th>성별</th>
					<td   class="keyword_td" >
						<label><input type="radio" name="gender" value="allgender" checked>&nbsp;전체</label>
      					<label><input type="radio" name="gender" value="f" class="age_text">&nbsp;여성</label>
      					<label><input type="radio" name="gender" value="m" class="age_text">&nbsp;남성</label>
      				</td>
				</tr>
				<tr>
					<th>연령</th>
					<td   class="keyword_td" >
						<label><input type="radio" name="allage" value="allage" class="age_all" checked><a class="age_text">&nbsp;전체</a></label>
						   <label><input type="radio" name="age10" value="10대" class="age_10_60"><a class="age_text">&nbsp;10대</a></label>
						   <label><input type="radio" name="age20" value="20대" class="age_10_60"><a class="age_text">&nbsp;20대</a></label>
						   <label><input type="radio" name="age30" value="30대" class="age_10_60"><a class="age_text">&nbsp;30대</a></label>
						   <label><input type="radio" name="age40" value="40대"  class="age_10_60"><a class="age_text">&nbsp;40대</a></label>
						   <label><input type="radio" name="age50" value="50대" class="age_10_60"><a class="age_text">&nbsp;50대</a></label>
						   <label><input type="radio" name="age60" value="60대" class="age_10_60"><a class="age_text">&nbsp;60대 이상</a></label>
					  </td>
				</tr>
			</table>

		</div>
		
		<div class="trend_bott">
			<div class="graph_wrapp">
				<div class="graph_title_head">
					<h2 class="graph_head">통계 그래프</h2>
					<button class="download_btn"><img class="total_btn" src="./resources/img/trend_analysis/total_down.png" alt="통계다운로드"></button></h2>
				</div>
				<!-- 연령통계 그래프 -->
				<div class="trend_graph">
					<div class="trend_grid" style="margin-top: 1vh;">
					<span class="graph_title">패턴디자인</span>
						<div class="vertical_chart_box">
							<div class="chart_box">
							  <ul class="axis_x">
								<li class="item">
									<button type="button" class="graph">
									  <span id="p1" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">P1</strong>
									  </div>
								  </li>
								  <li class="item">
									<button type="button" class="graph">
									  <span id="p2" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">P2</strong>
									  </div>
								  </li>
								  <li class="item">
									<button type="button" class="graph">
									  <span id="p3" class="time data1" style="height:0%;"><span class="blind">p3내용물</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">P3</strong>
									  </div>
								  </li>
								  <li class="item">
									<button type="button" class="graph">
									  <span id="p4" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">P4</strong>
									  </div>
								  </li>
								  <li class="item">
									<button type="button" class="graph">
									  <span id="p5" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">P5</strong>
									  </div>
								  </li>
								  <li class="item">
									<button type="button" class="graph">
									  <span id="p6" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">P6</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p7" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P7</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p8" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P8</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p9" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P9</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p10" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P10</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p11" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P11</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p12" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P12</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p13" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P13</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p14" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P14</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p15" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P15</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p16" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P16</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p17" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P17</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p18" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P18</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p19" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P19</strong>
									  </div>
								  </li>
								  <li class="item">
									  <button type="button" class="graph">
									  <span id="p20" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									  <div class="text_box">
										<strong class="text_box_text">P20</strong>
									</div>
								  </li>
							  </ul>
							</div>                                                 
						  </div>
					</div>
					<div class="trend_grid">
					<span class="graph_title">선택 제조사</span>
						<div class="vertical_chart_box">
							<div class="chart_box">
							  <ul class="axis_x">
								<li class="item">
								  <button type="button" class="graph">
									  <span id="f1" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">F1</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="f2" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">F2</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="f3" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">F3</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="f4" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">F4</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="f5" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">F5</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="f6" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">F6</strong>
								  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f7" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F7</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f8" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F8</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f9" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F9</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f10" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F10</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f11" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F11</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f12" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F12</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f13" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F13</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f14" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F14</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f15" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F15</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f16" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F16</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f17" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F17</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f18" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F18</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f19" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F19</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="f20" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">F20</strong>
									</div>
								</li>
							  </ul>
							</div>                                                 
						  </div>
					</div>
					<div class="trend_grid" style="margin-bottom: 3vh;">
						<span class="graph_title">컬러</span>
						<div class="vertical_chart_box">
							<div class="chart_box">
							  <ul class="axis_x">
								<li class="item">
								  <button type="button" class="graph">
									  <span id="c1" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">C1</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="c2" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">C2</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="c3" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">C3</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="c4" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">C4</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="c5" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">C5</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="c6" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">C6</strong>
								  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="c7" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">C7</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="c8" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">C8</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="c9" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">C9</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="c10" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">C10</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="c11" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">C11</strong>
									  </div>
								</li>
								<li class="item">
									<button type="button" class="graph">
									  <span id="c12" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
									<div class="text_box">
										<strong class="text_box_text">C12</strong>
									  </div>
								</li>
							  </ul>
							</div>                                                 
						  </div>
					</div>
					<div class="trend_grid">
						<span class="graph_title">소재</span>
						<div class="vertical_chart_box">
							<div class="chart_box">
							  <ul class="axis_x">
								<li class="item">
								  <button type="button" class="graph">
									  <span id="m1" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">M1</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="m2" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">M2</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="m3" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">M3</strong>
								  </div>
								</li>
								<li class="item">
								  <button type="button" class="graph">
									  <span id="m4" class="time data1" style="height:0%;"><span class="blind">data 타입 1</span></span>
									</button>
								  <div class="text_box">
									<strong class="text_box_text">M4</strong>
								  </div>
								</li>
							  </ul>
							</div>                                                 
						  </div>
					</div>
				</div>
			</div>
		</div>
		
		</div>
		
		
	</div>
	</form>
	<!-- select 년도, 월, 일 마지막 날짜 계산 -->
	<script src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
	<script>

	
var start_year="2015";// 시작할 년도
var today = new Date();
var today_year= today.getFullYear();
var index=0;

for(var y=start_year; y<=today_year; y++){ //start_year ~ 현재 년도
	document.getElementById('select_year').options[index] = new Option(y, y);
	document.getElementById('select_year1').options[index] = new Option(y, y);
	index++;
}
index=0;
for(var m=1; m<=12; m++){
	document.getElementById('select_month').options[index] = new Option(m, m);
	document.getElementById('select_month1').options[index] = new Option(m, m);
	index++;
}

lastday();
$('#select_year').append("<option value='"+ 1 +"' selected>"+  " 년" +"</option>");
$('#select_month').append("<option value='"+ 1 +"' selected>"+  " 월" +"</option>");
$('#select_year1').append("<option value='"+ 1 +"' selected>"+  " 년" +"</option>");
$('#select_month1').append("<option value='"+ 1 +"' selected>"+  " 월" +"</option>");

function lastday(){ //년과 월에 따라 마지막 일 구하기 
	
	var Year=document.getElementById('select_year').value;
	var Year1=document.getElementById('select_year1').value;
	var Month=document.getElementById('select_month').value;
	var Month1=document.getElementById('select_month1').value;
	var day=new Date(new Date(Year,Month,1)-86400000).getDate();
    /* = new Date(new Date(Year,Month,0)).getDate(); */
    
	var dayindex_len=document.getElementById('select_day').length;
	if(day>dayindex_len){
		for(var i=(dayindex_len+1); i<=day; i++){
			document.getElementById('select_day').options[i-1] = new Option(i, i);
			document.getElementById('select_day1').options[i-1] = new Option(i, i);
		}
	}
	else if(day<dayindex_len){
		for(var i=dayindex_len; i>=day; i--){
			document.getElementById('select_day').options[i]=null;
			document.getElementById('select_day1').options[i]=null;
		}
	}
	$('#select_day').append("<option value='"+ 1 +"' selected>"+  "일" +"</option>");
	$('#select_day1').append("<option value='"+ 1 +"' selected>"+  "일" +"</option>");
}
</script>
<script>
	$(document).on("click", "input[name='age']", function(){
		thisRadio = $(this);
		if (thisRadio.hasClass("imChecked")) {
			thisRadio.removeClass("imChecked");
			thisRadio.prop('checked', false);
		} else { 
			thisRadio.prop('checked', true);
			thisRadio.addClass("imChecked");
		};
	})
</script>

<script>
	$(document).on("click", "input[name='age10']", function(){
		thisRadio = $(this);
		if (thisRadio.hasClass("imChecked")) {
			thisRadio.removeClass("imChecked");
			thisRadio.prop('checked', false);
		} else { 
			thisRadio.prop('checked', true);
			thisRadio.addClass("imChecked");
			$(".age_all").prop('checked', false);
		};
	})
</script>
<script>
	$(document).on("click", "input[name='age20']", function(){
		thisRadio = $(this);
		if (thisRadio.hasClass("imChecked")) {
			thisRadio.removeClass("imChecked");
			thisRadio.prop('checked', false);
		} else { 
			thisRadio.prop('checked', true);
			thisRadio.addClass("imChecked");
			$(".age_all").prop('checked', false);
		};
	})
</script>
<script>
	$(document).on("click", "input[name='age30']", function(){
		thisRadio = $(this);
		if (thisRadio.hasClass("imChecked")) {
			thisRadio.removeClass("imChecked");
			thisRadio.prop('checked', false);
		} else { 
			thisRadio.prop('checked', true);
			thisRadio.addClass("imChecked");
			$(".age_all").prop('checked', false);
		};
	})
</script>
<script>
	$(document).on("click", "input[name='age40']", function(){
		thisRadio = $(this);
		if (thisRadio.hasClass("imChecked")) {
			thisRadio.removeClass("imChecked");
			thisRadio.prop('checked', false);
		} else { 
			thisRadio.prop('checked', true);
			thisRadio.addClass("imChecked");
			$(".age_all").prop('checked', false);
		};
	})
</script>
<script>
	$(document).on("click", "input[name='age50']", function(){
		thisRadio = $(this);
		if (thisRadio.hasClass("imChecked")) {
			thisRadio.removeClass("imChecked");
			thisRadio.prop('checked', false);
		} else { 
			thisRadio.prop('checked', true);
			thisRadio.addClass("imChecked");
			$(".age_all").prop('checked', false);
		};
	})
</script>
<script>
	$(document).on("click", "input[name='age60']", function(){
		thisRadio = $(this);
		if (thisRadio.hasClass("imChecked")) {
			thisRadio.removeClass("imChecked");
			thisRadio.prop('checked', false);
		} else { 
			thisRadio.prop('checked', true);
			thisRadio.addClass("imChecked");
			$(".age_all").prop('checked', false);
		};
	})
</script>
<script>
	$(document).on("click", "input[name='allage']", function(){
		thisRadio = $(this);
		if (thisRadio.hasClass("imChecked")) {
			thisRadio.removeClass("imChecked");
			thisRadio.prop('checked', false);
		} else { 
			thisRadio.prop('checked', true);
			thisRadio.addClass("imChecked");
			$(".age_10_60").prop('checked', false);
		};
	})
</script>
</body>
</html>