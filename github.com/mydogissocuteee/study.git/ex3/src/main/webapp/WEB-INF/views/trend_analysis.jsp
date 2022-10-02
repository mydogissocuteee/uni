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
     <link rel="stylesheet" href="./resources/css/trend_analysis_01.css" type="text/css">
     
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
<script>	


	$(function () {
    console.log(${analysis.p3});
    const arrPattern = [{p1:${analysis.p1}}, {p2:${analysis.p2}}, ${analysis.p3}, ${analysis.p4}, ${analysis.p5}, ${analysis.p6}, ${analysis.p7}, ${analysis.p8}];
    const arrMaterial = [${analysis.m1}, ${analysis.m2}, ${analysis.m3}, ${analysis.m4}];
    const arrManu = [${analysis.f1}, ${analysis.f5}, ${analysis.f10}, ${analysis.f11}, ${analysis.f12}, ${analysis.f13}, ${analysis.f14}, ${analysis.f15}, ${analysis.f16}, ${analysis.f17}, ${analysis.f18}, ${analysis.f19}, ${analysis.f20}];
    const arrColor = [${analysis.c1}, ${analysis.c2}, ${analysis.c3}, ${analysis.c4}, ${analysis.c7}, ${analysis.c10}, ${analysis.c11}, ${analysis.c12}];
    console.log(arrPattern);
    document.getElementById('p1').setAttribute('style','height:${analysis.p1}%');
    document.getElementById('p2').setAttribute('style','height:${analysis.p2}%');
    document.getElementById('p3').setAttribute('style','height:${analysis.p3}%');
    document.getElementById('p4').setAttribute('style','height:${analysis.p4}%');
    document.getElementById('p5').setAttribute('style','height:${analysis.p5}%');
    document.getElementById('p6').setAttribute('style','height:${analysis.p6}%');
    document.getElementById('p7').setAttribute('style','height:${analysis.p7}%');
    document.getElementById('p8').setAttribute('style','height:${analysis.p8}%');
    document.getElementById('p9').setAttribute('style','height:${analysis.p9}%');
    document.getElementById('p10').setAttribute('style','height:${analysis.p10}%');
    document.getElementById('p11').setAttribute('style','height:${analysis.p11}%');
    document.getElementById('p12').setAttribute('style','height:${analysis.p12}%');
    document.getElementById('p13').setAttribute('style','height:${analysis.p13}%');
    document.getElementById('p14').setAttribute('style','height:${analysis.p14}%');
    document.getElementById('p15').setAttribute('style','height:${analysis.p15}%');
    document.getElementById('p16').setAttribute('style','height:${analysis.p16}%');
    document.getElementById('p17').setAttribute('style','height:${analysis.p17}%');
    document.getElementById('p18').setAttribute('style','height:${analysis.p18}%');
    document.getElementById('p19').setAttribute('style','height:${analysis.p19}%');
    document.getElementById('p20').setAttribute('style','height:${analysis.p20}%');
    document.getElementById('f1').setAttribute('style','height:${analysis.f1}%');
    document.getElementById('f2').setAttribute('style','height:${analysis.f2}%');
    document.getElementById('f3').setAttribute('style','height:${analysis.f3}%');
    document.getElementById('f4').setAttribute('style','height:${analysis.f4}%');
    document.getElementById('f5').setAttribute('style','height:${analysis.f5}%');
    document.getElementById('f6').setAttribute('style','height:${analysis.f6}%');
    document.getElementById('f7').setAttribute('style','height:${analysis.f7}%');
    document.getElementById('f8').setAttribute('style','height:${analysis.f8}%');
    document.getElementById('f9').setAttribute('style','height:${analysis.f9}%');
    document.getElementById('f10').setAttribute('style','height:${analysis.f10}%');
    document.getElementById('f11').setAttribute('style','height:${analysis.f11}%');
    document.getElementById('f12').setAttribute('style','height:${analysis.f12}%');
    document.getElementById('f13').setAttribute('style','height:${analysis.f13}%');
    document.getElementById('f14').setAttribute('style','height:${analysis.f14}%');
    document.getElementById('f15').setAttribute('style','height:${analysis.f15}%');
    document.getElementById('f16').setAttribute('style','height:${analysis.f16}%');
    document.getElementById('f17').setAttribute('style','height:${analysis.f17}%');
    document.getElementById('f18').setAttribute('style','height:${analysis.f18}%');
    document.getElementById('f19').setAttribute('style','height:${analysis.f19}%');
    document.getElementById('f20').setAttribute('style','height:${analysis.f20}%');
    document.getElementById('c1').setAttribute('style','height:${analysis.c1}%');
    document.getElementById('c2').setAttribute('style','height:${analysis.c2}%');
    document.getElementById('c3').setAttribute('style','height:${analysis.c3}%');
    document.getElementById('c4').setAttribute('style','height:${analysis.c4}%');
    document.getElementById('c5').setAttribute('style','height:${analysis.c5}%');
    document.getElementById('c6').setAttribute('style','height:${analysis.c6}%');
    document.getElementById('c7').setAttribute('style','height:${analysis.c7}%');
    document.getElementById('c8').setAttribute('style','height:${analysis.c8}%');
    document.getElementById('c9').setAttribute('style','height:${analysis.c9}%');
    document.getElementById('c10').setAttribute('style','height:${analysis.c10}%');
    document.getElementById('c11').setAttribute('style','height:${analysis.c11}%');
    document.getElementById('c12').setAttribute('style','height:${analysis.c12}%');
    document.getElementById('m1').setAttribute('style','height:${analysis.m1}%');
    document.getElementById('m2').setAttribute('style','height:${analysis.m2}%');
    document.getElementById('m3').setAttribute('style','height:${analysis.m3}%');
    document.getElementById('m4').setAttribute('style','height:${analysis.m4}%');
    
	});
	</script>
<script>
    /* 메인페이지 모달 팝업창 */
    function user_btn(){
        $(".user_input_modal_window").fadeIn();
    }

    function main_btnclose_X(){
        $(".user_input_modal_window").fadeOut();
    }
</script>
    <!-- 프로필 모달창 -->
    <div class="user_input_modal_window" id="user_input_modal_window" style="display: none;">
        <div class="user_input_modal">
          <div class="user_input_modal_top">
            <div class="user_input_modal_top_txt">${customer.name }님</div>
            <div class="main_btnclose">
                <button class="main_btnclose_X" onclick="main_btnclose_X()"><a>X</a></button>
            </div>
          </div>
          <div class="user_input_modal_mid">
            <div class="user_input_modal_bot">
            <c:choose>
					<c:when test="${customer.sortation eq 'admin'}">
						<button class="user_input_modal_bt" onclick="location.href='profilejsp.do'">
                  		<img src="./resources/img/mainpage/회원정보.png">
               			</button>
					</c:when>
					<c:when test="${customer.sortation eq 'user'}">
						<button class="user_input_modal_bt" onclick="location.href='product_managejsp.do'">
                  		<img src="./resources/img/mainpage/회원정보.png">
                		</button>
					</c:when>
			 </c:choose>
              </div>
              <div class="user_input_modal_bot_01">
                <button class="user_input_modal_bt_01" onclick="location.href='logout.do'">
                    <img src="./resources/img/mainpage/로그아웃.png">
                  </button>
              </div>
          </div>

        </div>
      </div>
       <header class="header">
        <div class = "header_01">
             <button class="user_btn" id="user_btn" onclick="user_btn()">
                <img src="./resources/img/mainpage/사용자.png">
            </button>
             <c:choose>
					<c:when test="${customer.sortation eq 'admin'}"><a href="profilejsp.do">${customer.name }님, 안녕하세요</a></c:when>
					<c:when test="${customer.sortation eq 'user'}"><a href="product_managejsp.do">${customer.name }님, 안녕하세요</a></c:when>
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
	<c:choose>
		<c:when test="${customer.sortation eq 'admin'}"><div class="trend_total_wrapp"></c:when>
		<c:when test="${customer.sortation eq 'user'}"><div class="trend_total_wrapp_new"></c:when>
	</c:choose>
	<c:choose>
		<c:when test="${customer.sortation eq 'admin'}"><div class="trend_circle_zip"></c:when>
		<c:when test="${customer.sortation eq 'user'}"><div class="trend_circle_zip_new"></c:when>
	</c:choose>
			<div class="trend_circle_zip_title">2022년 트렌드 제품</div>
			<div class="trend_circle_zip_top04">
				<button class="trend_circle_zip_top04_01"><img src="./resources/img/trend_analysis/트렌드 순위.png"></button>
			</div>
			<div class="trend_circle_zip_graph">
				<div class="chart_01">
					<div class="chart-bar_01" data-deg="${analysis.bestPillow4 }"></div>  <!--4위-->
					<div class="chart-bar_01" data-deg="${analysis.bestPillow3 }"></div>  <!--3위-->
					<div class="chart-bar_01" data-deg="${analysis.bestPillow2 }"></div> <!--2위-->
					<div class="chart-bar_01" data-deg="${analysis.bestPillow1 }"></div>  <!--1위-->
					<div class="chart-total_01"><span class="chart-total-num"><img src="./resources/img/trend_analysis/베개.png"></span></div>
				</div>
				<div class="chart_02">
					<div class="chart-bar_02" data-deg="${analysis.bestBed4 }"></div>
					<div class="chart-bar_02" data-deg="${analysis.bestBed3 }"></div>
					<div class="chart-bar_02" data-deg="${analysis.bestBed2 }"></div>
					<div class="chart-bar_02" data-deg="${analysis.bestBed1 }"></div>
					<div class="chart-total_02"><span class="chart-total-num"><img src="./resources/img/trend_analysis/범퍼침대.png"></span></div>

				</div>
				<div class="chart_03">
					<div class="chart-bar_03" data-deg="${analysis.bestBedding4 }"></div>
					<div class="chart-bar_03" data-deg="${analysis.bestBedding3 }"></div>
					<div class="chart-bar_03" data-deg="${analysis.bestBedding2 }"></div>
					<div class="chart-bar_03" data-deg="${analysis.bestBedding1 }"></div>
					<div class="chart-total_03"><span class="chart-total-num"><img src="./resources/img/trend_analysis/이불.png"></span></div>
				</div>
				<div class="chart_04">
					<div class="chart-bar_04" data-deg="${analysis.bestMat4 }"></div>
					<div class="chart-bar_04" data-deg="${analysis.bestMat3 }"></div>
					<div class="chart-bar_04" data-deg="${analysis.bestMat2 }"></div>
					<div class="chart-bar_04" data-deg="${analysis.bestMat1 }"></div>
					<div class="chart-total_04"><span class="chart-total-num"><img src="./resources/img/trend_analysis/매트.png"></span></div>
				</div>
			</div>
			<div class="trend_circle_zip_graph_list">
				<div class="trend_circle_zip_graph_list_zip">
					<div class="trend_circle_zip_graph_list_01">
						<table>
							<tr>
								<td>1위 : ${analysis.bestPillowName1 }</td>
							</tr>
							<tr>
								<td>2위 : ${analysis.bestPillowName2 }</</td>
							</tr>
							<tr>
								<td>3위 : ${analysis.bestPillowName3 }</</td>
							</tr>
							<tr>
								<td>4위 : ${analysis.bestPillowName4 }</</td>
							</tr>
						</table>
					</div>
					<div class="trend_circle_zip_graph_list_02">
						<table>
							<tr>
								<td>1위 : ${analysis.bestBedName1 }</</td>
							</tr>
							<tr>
								<td>2위 : ${analysis.bestBedName2 }</td>
							</tr>
							<tr>
								<td>3위 : ${analysis.bestBedName3 }</td>
							</tr>
							<tr>
								<td>4위 : ${analysis.bestBedName4 }</td>
							</tr>
						</table>
					</div>
					<div class="trend_circle_zip_graph_list_03">
						<table>
							<tr>
								<td>1위 : ${analysis.bestBeddingName1 }</td>
							</tr>
							<tr>
								<td>2위 : ${analysis.bestBeddingName2 }</td>
							</tr>
							<tr>
								<td>3위 : ${analysis.bestBeddingName3 }</td>
							</tr>
							<tr>
								<td>4위 : ${analysis.bestBeddingName4 }</td>
							</tr>
						</table>
					</div>
					<div class="trend_circle_zip_graph_list_04">
						<table>
							<tr>
								<td>1위 : ${analysis.bestMatName1 }</td>
							</tr>
							<tr>
								<td>2위 : ${analysis.bestMatName2 }</td>
							</tr>
							<tr>
								<td>3위 : ${analysis.bestMatName3 }</td>
							</tr>
							<tr>
								<td>4위 : ${analysis.bestMatName4 }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<c:choose>
		<c:when test="${customer.sortation eq 'user'}"><div class="trend_allData_zip"></c:when>
		<c:when test="${customer.sortation eq 'admin'}"><div class="trend_allData_zip_new"></c:when>
	</c:choose>
			<div class="trend_allData_zip_title">전체 데이터 분포도</div>
			<div class="trend_allData_zip_top04">
				<button class="trend_allData_zip_top04_01">
					<img src="./resources/img/trend_analysis/트렌드 순위.png">
				</button>
			</div>
			<div class="trend_allData_zip_graph">
				<div class="trend_allData_zip_graph_00">
					<div class="trend_allData_zip_graph_01">
						<div class="trend_allData_zip_graph_01_01">
							<div class="trend_allData_zip_graph_01_01_title">
								<button class="trend_allData_zip_graph_01_01_title_btn"><img src="./resources/img/trend_analysis/Color.png"></button>
							</div>
							<div class="trend_allData_zip_graph_01_01_top04">
								<table>
									<tr>
										<td>1위 : ${analysis.bestColorName1 }</td>
										<td>2위 : ${analysis.bestColorName2 }</td>
										<td>3위 : ${analysis.bestColorName3 }</td>
										<td>4위 : ${analysis.bestColorName4 }</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="trend_allData_zip_graph_01_02">
							<div class="trend_allData_zip_graph_01_02_mak">
								<canvas id="stChart" width="100%" height="3vh"></canvas>
							</div>
						</div>
					</div>
					<div class="trend_allData_zip_graph_02">
						<div class="trend_allData_zip_graph_02_01">
							<div class="trend_allData_zip_graph_02_01_title">
								<button class="trend_allData_zip_graph_02_01_title_btn"><img src="./resources/img/trend_analysis/Matrial.png"></button>
							</div>
							<div class="trend_allData_zip_graph_02_01_top04">
								<table>
									<tr>
										<td>1위 : ${analysis.bestMaterialName1 }</td>
										<td>2위 : ${analysis.bestMaterialName2 }</td>
										<td>3위 : ${analysis.bestMaterialName3 }</td>
										<td>4위 : ${analysis.bestMaterialName4 }</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="trend_allData_zip_graph_02_02_mak">
							<canvas id="stChart2" width="100%" height="3vh"></canvas>
						</div>
					</div>
					<div class="trend_allData_zip_graph_03">
						<div class="trend_allData_zip_graph_03_01">
							<div class="trend_allData_zip_graph_03_01_title">
								<button class="trend_allData_zip_graph_03_01_title_btn"><img src="./resources/img/trend_analysis/Design.png"></button>
							</div>
							<div class="trend_allData_zip_graph_03_01_top04">
								<table>
									<tr>
										<td>1위 : ${analysis.bestPatternName1 }</td>
										<td>2위 : ${analysis.bestPatternName2 }</td>
										<td>3위 : ${analysis.bestPatternName3 }</td>
										<td>4위 : ${analysis.bestPatternName4 }</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="trend_allData_zip_graph_03_02">
							<div class="trend_allData_zip_graph_03_02_mak">
								<canvas id="stChart3" width="100%" height="3vh"></canvas>
							</div>
						</div>
					</div>
					<div class="trend_allData_zip_graph_04">
						<div class="trend_allData_zip_graph_04_01">
							<div class="trend_allData_zip_graph_04_01_title">
								<button class="trend_allData_zip_graph_04_01_title_btn"><img src="./resources/img/trend_analysis/ManuFacture.png"></button>
							</div>
							<div class="trend_allData_zip_graph_04_01_top04">
								<table>
									<tr>
										<td>1위 : ${analysis.bestManuFacturerName1 }</td>
										<td>2위 : ${analysis.bestManuFacturerName2 }</td>
										<td>3위 : ${analysis.bestManuFacturerName3 }</td>
										<td>4위 : ${analysis.bestManuFacturerName4 }</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="trend_allData_zip_graph_04_02">
							<div class="trend_allData_zip_graph_04_02_mak">
								<canvas id="stChart4" width="100%" height="3vh"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${customer.sortation eq 'admin'}">
		<div class="trend_bott">
			<div class="graph_wrapp">
				<div class="graph_title_head">
					<h2 class="graph_head">통계 그래프</h2>
					<button class="download_btn" onclick="location.href='excel.do'"><img class="total_btn" src="./resources/img/trend_analysis/total_down.png" alt="통계다운로드"></button></h2>
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
		</c:if>
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
<script>
	/* 원차트_01 */
	var _chart_01 = document.querySelector('.chart_01');
	var _chartBar_01 = document.querySelectorAll('.chart-bar_01');
	var color_01 = ['#AB9F9F','#D2D0D1 ','#FFB316','#f599dc'] //색상
	var newDeg_01 = []; //차트 deg

	function chartDraw_01(){ 
	for( var i=0;i<_chartBar_01.length;i++){
		var _num = _chartBar_01[i].dataset.deg
		newDeg_01.push( _num )
	}

	var num = newDeg_01.length - newDeg_01.length;
	_chart_01.style.background = 'conic-gradient(#D2D0D1 '+
													newDeg_01[0]+'deg, #AB9F9F '+
													newDeg_01[0]+'deg '+newDeg_01[1]+'deg, #FFB316 '+
													newDeg_01[1]+'deg '+newDeg_01[2]+'deg, #FC6401 '+
													newDeg_01[2]+'deg '+newDeg_01[3]+'deg )';
	}

	chartDraw_01();

/* 원차트_02 */
	var _chart_02 = document.querySelector('.chart_02');
	var _chartBar_02 = document.querySelectorAll('.chart-bar_02');
	var color_02 = ['#AB9F9F','#D2D0D1','#FFB316','#f599dc'] //색상
	var newDeg_02 = []; //차트 deg

	function chartDraw_02(){ 
	for( var i=0;i<_chartBar_02.length;i++){
		var _num = _chartBar_02[i].dataset.deg
		newDeg_02.push( _num )
	}

	var num = newDeg_02.length - newDeg_02.length;
	_chart_02.style.background = 'conic-gradient(#D2D0D1 '+
													newDeg_02[0]+'deg, #AB9F9F '+
													newDeg_02[0]+'deg '+newDeg_02[1]+'deg, #FFB316 '+
													newDeg_02[1]+'deg '+newDeg_02[2]+'deg, #FC6401 '+
													newDeg_02[2]+'deg '+newDeg_02[3]+'deg )';
	}

	chartDraw_02();

/* 원차트_03 */
	var _chart_03 = document.querySelector('.chart_03');
	var _chartBar_03 = document.querySelectorAll('.chart-bar_03');
	var color_03 = ['#AB9F9F','#D2D0D1 ','#FFB316','#FC6401'] //색상
	var newDeg_03 = []; //차트 deg

	function chartDraw_03(){ 
	for( var i=0;i<_chartBar_03.length;i++){
		var _num = _chartBar_03[i].dataset.deg
		newDeg_03.push( _num )
	}
	var num = newDeg_03.length - newDeg_03.length;
	_chart_03.style.background = 'conic-gradient(#D2D0D1 '+
													newDeg_03[0]+'deg, #AB9F9F '+
													newDeg_03[0]+'deg '+newDeg_03[1]+'deg, #FFB316 '+
													newDeg_03[1]+'deg '+newDeg_03[2]+'deg, #FC6401 '+
													newDeg_03[2]+'deg '+newDeg_03[3]+'deg )';
	
	}

	chartDraw_03();

/* 원차트_04 */
	var _chart_04 = document.querySelector('.chart_04');
	var _chartBar_04 = document.querySelectorAll('.chart-bar_04');
	var color_04 = ['#AB9F9F','#D2D0D1','#FFB316','#FC6401'] //색상
	var newDeg_04 = []; //차트 deg

	function chartDraw_04(){ 
	for( var i=0;i<_chartBar_04.length;i++){
		var _num = _chartBar_04[i].dataset.deg
		newDeg_04.push( _num );
		console.log(newDeg_04);
	}

	console.log(newDeg_04[4]);
	_chart_04.style.background = 'conic-gradient(#D2D0D1 '+
													newDeg_04[0]+'deg, #AB9F9F '+
													newDeg_04[0]+'deg '+newDeg_04[1]+'deg, #FFB316 '+
													newDeg_04[1]+'deg '+newDeg_04[2]+'deg, #FC6401 '+
													newDeg_04[2]+'deg '+newDeg_04[3]+'deg )';
	}

	chartDraw_04();

</script>

<script>
drawColumnChart();
function drawColumnChart() {
	var barOptions_stacked = {
		tooltips: {
			enabled: false
		},
		hover :{
			animationDuration:0,
			mode:null
		},
		scales: {
			xAxes: [{
				ticks: {
					beginAtZero:true,
					display: false
				},
				scaleLabel:{
					display:false
				},
				gridLines: {
					display:false
				}, 
				stacked: true
			}],
			yAxes: [{
				gridLines: {
					display:false,
					zeroLineWidth: 0
				},
				ticks: {
					display: false,
					fontSize:11
				},
				gridLines: {
					display:false
				},
				stacked: true
			}]
		},
		legend:{
			display:false
		},
		plugins: {
        datalabels: {
          display: false  
        },
      },
	};

	// Color 그래프
	var ctx_01 = document.getElementById("stChart");
	var myChart = new Chart(ctx_01, {
		type: 'horizontalBar',
		data: {
			datasets: [{
				// label:'a',
				data:[${analysis.bestColor1}],
				backgroundColor: ["#FC6401","#FFB316","#AB9F9F",],
			},{
				data: [${analysis.bestColor2}],
				backgroundColor: "#FFB316",
			},{
				data: [${analysis.bestColor3}],
				backgroundColor: "#AB9F9F",
			},{
				data: [${analysis.bestColor4}],
				backgroundColor: "#D2D0D1",
				// hoverBackgroundColor: "rgba(46,185,235,1)" 마우스 호버하면 색 변경
			}],
		},
		options: barOptions_stacked,
	});

// Matrial 그래프
	var ctx_02 = document.getElementById("stChart2");
	var myChart2 = new Chart(ctx_02, {
		type: 'horizontalBar',
		data: {
			datasets: [{
				data:[${analysis.bestMaterial1}],
				backgroundColor: ["#FC6401","#FFB316","#AB9F9F",],
			},{
				data: [${analysis.bestMaterial2}],
				backgroundColor: "#FFB316",
			},{
				data: [${analysis.bestMaterial3}],
				backgroundColor: "#AB9F9F",
			},{
				data: [${analysis.bestMaterial4}],
				backgroundColor: "#D2D0D1",
				// hoverBackgroundColor: "rgba(46,185,235,1)" 마우스 호버하면 색 변경
			}],
		},
		options: barOptions_stacked,
	});

// Design 그래프
	var ctx_03 = document.getElementById("stChart3");
	var myChart3 = new Chart(ctx_03, {
		type: 'horizontalBar',
		data: {
			datasets: [{
				data:[${analysis.bestPattern1}],
				backgroundColor: ["#FC6401","#FFB316","#AB9F9F",],
			},{
				data: [${analysis.bestPattern2}],
				backgroundColor: "#FFB316",
			},{
				data: [${analysis.bestPattern3}],
				backgroundColor: "#AB9F9F",
			},{
				data: [${analysis.bestPattern4}],
				backgroundColor: "#D2D0D1",
				// hoverBackgroundColor: "rgba(46,185,235,1)" 마우스 호버하면 색 변경
			}],
		},
		options: barOptions_stacked,
	});

// ManuFacture 그래프
	var ctx_04 = document.getElementById("stChart4");
	var myChart4 = new Chart(ctx_04, {
		type: 'horizontalBar',
		data: {
			datasets: [{
				data:[${analysis.bestManuFacturer1}],
				backgroundColor: ["#FC6401","#FFB316","#AB9F9F",],
			},{
				data: [${analysis.bestManuFacturer2}],
				backgroundColor: "#FFB316",
			},{
				data: [${analysis.bestManuFacturer3}],
				backgroundColor: "#AB9F9F",
			},{
				data: [${analysis.bestManuFacturer4}],
				backgroundColor: "#D2D0D1",
				// hoverBackgroundColor: "rgba(46,185,235,1)" 마우스 호버하면 색 변경
			}],
		},
		options: barOptions_stacked,
	});
}
</script>
</body>
</html>