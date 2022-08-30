<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.uni.domain.GoodsVO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>MAIN PAGE</title>
    <link rel="stylesheet" href="./resources/css/goods.css" type="text/css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="./resources/css/main.css" media="screen and(min-width: 215px) and (max-width: 1024px)" rel="stylesheet">
    <style type="text/css" media="screen and(min-width: 215px) and (max-width: 1024px)">
        @import url(./resources/css/main.css) screen and(min-width: 215px) and (max-width: 1024px);
    </style>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script  src="http://d3js.org/d3.v3.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/036f0eb301.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
    <header>
        <section class="hbody">
          <article class="nav">
            <div style="font-size: 22px;">에스비유엠(주)</div>
            <div class="title"><a href="mainjsp.do"><img src="./resources/img/logo.png" style="align-items: center; width: 190px;"></a></div>
            <ul id="menu"><a href="logout.do"><button>로그아웃</button></a></ul>
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
                    <li><a href="userjsp.do">사용자관리</a></li>
                    <li><a href="#">사용 권한 관리</a></li>
                    <li><a href="#">제품관리</a></li>
                    <li><a href="goodsjsp.do">품목정보 관리</a></li>
                    <li><a href="#">공정 관리</a></li>
                    <li><a href="clientjsp.do">거래처 관리</a></li>
                    <li><a href="#">BOM 관리</a></li>
                </ul>
            </li>
            <li class="active">
                <a href="#" class="two-btn"><i class="fa-solid fa-file-pen"></i>생산 관리
                <div class="fa-solid fa-angle-down second"></div>
                </a>
                <ul class="two-show">
                    <li><a href="#">생산계획</a></li>
                    <li><a href="#">작업지시</a></li>
                    <li><a href="#">작업지시조회</a></li>
                    <li><a href="dailyProductionjsp.do">생산일보</a></li>
                    <li><a href="productionPerformancejsp.do">생산실적조회</a></li>
                </ul>
            </li>
            <li class="active">
                <a href="#" class="three-btn"><i class="fa-solid fa-cart-arrow-down"></i>자재 관리
                <div class="fa-solid fa-angle-down third"></div>
                </a>
                <ul class="three-show">
                    <li><a href="#">자재 발주</a></li>
                    <li><a href="#">자재 발주 조회</a></li>
                    <li><a href="#">자재 입고 현황</a></li>
                    <li><a href="#">자재 재고 현황</a></li>
                </ul>
            </li>
            <li class="active">
                <a href="#" class="four-btn"><i class="fa-solid fa-truck"></i>물류 관리
                <div class="fa-solid fa-angle-down forth"></div>
                </a>
                <ul class="four-show">
                    <li><a href="#">출고 지시</a></li>
                    <li><a href="#">출고 조회</a></li>
                </ul>
            </li>
            <li class="active">
                <a href="#" class="five-btn"><i class="fa-solid fa-screwdriver-wrench"></i>품질 관리
                <div class="fa-solid fa-angle-down fifth"></div>
                </a>
                <ul class="five-show">
                    <li><a href="#">불량 수량 입력</a></li>
                    <li><a href="#">품질 검사 내역 조회</a></li>
                    <li><a href="#">공정 불량 현황</a></li>
                    <li><a href="#">불량률 조회</a></li>
                </ul>
            </li>
            <li class="active">
              <a href="#" class="six-btn"><i class="fa-solid fa-basket-shopping"></i>주문 관리
              <div class="fa-solid fa-angle-down sixth"></div>
              </a>
              <ul class="six-show">
                  <li><a href="#">주문 내역 조회</a></li>
                  <li><a href="#">명세서 발행</a></li>
                  <li><a href="#">오더 관리</a></li>
              </ul>
          </li>
            <li class="active">
                <a href="#" class="seve-btn"><i class="fa-solid fa-chart-line"></i>X-R 관리도
                </a>
            </li>
        </ul>
    </nav>
    <section style="position:absolute; background-color: white; width: 85%; height: 62px; margin-left: 15%;">
      <div id="title">기준정보&nbsp&nbsp > &nbsp&nbsp&nbsp품목정보관리</div>
    </section>

    <section style="margin-top: 77px; margin-left: 16%; width: 83%;">
        <div class="search">
          <input type="text" placeholder="검색어 입력" class="search2">
          <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" class="search3">
        </div>
    </section>

    <section class="goods-choice" >
      <form action="goodsInsertForever.do" method="post">
        <table class="goods-table">
          <tr>
              <td class="col-goods1" style="width: 166px; color: #5dba8e;">품목번호</td>
              <td class="col-goods2">
                <input class="goods-num" type="text" id="product_id" name="product_id" maxlength="50">
              </td>
              <td class="col-goods1">대분류</td>
              <td class="col-goods2">
              <select name="class_code_a" id="class_code_a" style="width:400px;height:30px;font-size:15px;">
                <option value="slc1" selected>선택</option>
                <option value="a">기계ㆍ소재</option>
                <option value="">정보통신</option>
                <option value="">화학</option>
                <option value="">세라믹</option>
              </select>
            </td>
          </tr>
          <tr>
              <td class="col-goods1" style="color: #5dba8e;">품목명</td>
              <td class="col-goods2">
                <input type="text" id="product_name" name="product_name" maxlength="100">
              </td>
              <td class="col-goods1">중분류</td>
              <td class="col-goods2">
              <select name="class_code_b" id="class_code_b" style="width:400px;height:30px;font-size:15px;">
                <option value="slc1" selected>선택</option>
                <option value="a">기계ㆍ소재 > 요소부품</option>
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
              <td class="col-goods1" style="color: #5dba8e;">품목구분</td>
              <td class="col-goods2">
                <select name="product_classification" id="product_classification" style="width:400px;height:30px;font-size:15px;">
                  <option value="slc1" selected>선택</option>
                  <option value="a">일반품목</option>
                  <option value="">물품관리</option>
                  <option value="">-----</option>
                </select>
              </td>
              <td class="col-goods1">소분류</td>
              <td class="col-goods2">
              <select name="class_code_c" id="class_code_c" style="width:400px;height:30px;font-size:15px;">
                <option value="slc1" selected>선택</option>
                <option value="a">기계ㆍ소재 > 요소부품 > 체결용 요소부품</option>
                <option value="">기계ㆍ소재 > 요소부품 > 기타 요소부품</option>
                <option value="">기계ㆍ소재 > 정밀생산기계 > 절삭 가공기계</option>
                <option value="">기계ㆍ소재 > 정밀생산기계 > 광 에너지 응용 가공기계</option>
                <option value="">기계ㆍ소재 > 산업/일반기계 > 인쇄/섬유기계</option>
                <option value="">기계ㆍ소재 > 산업/일반기계 > 식품포장기계</option>
                <option value="">바이오ㆍ의료 > 의약 바이오 > 백신</option>
                <option value="">바이오ㆍ의료 > 의약 바이오 > 천연물의약품</option>
                <option value="">바이오ㆍ의료 > 산업 바이오 > 바이오 화학소재</option>
                <option value="">바이오ㆍ의료 > 산업 바이오 > 기능성 화장품소재</option>
                <option value="">바이오ㆍ의료 > 그린 바이오 > 친환경 작물 보호제</option>
                <option value="">바이오ㆍ의료 > 그린 바이오 > 기타 그린바이오 제품/기술</option>
                <option value="">화학 > 정밀화학 > 의약 중간체/원제</option>
                <option value="">화학 > 정밀화학 > 윤활유</option>
                <option value="">화학 > 고분자재료 > 종합반응/공정기술</option>
                <option value="">화학 > 고분자재료 > 기타 고분자 재료</option>
                <option value="">화학 > 섬유제조공정 > 디자인/봉제기술</option>
                <option value="">화학 > 섬유제조공정 > 섬유제조설비</option>
                <option value="">세라믹 > 광전자소재 > 유전체소재</option>
                <option value="">세라믹 > 광전자소재 > 반도석세라믹</option>
                <option value="">세라믹 > 기계ㆍ구조소재 > 내열소재</option>
                <option value="">세라믹 > 기계ㆍ구조소재 > 구조소재</option>
                <option value="">세라믹 > 생활세라믹 > 도자기ㆍ타일ㆍ벽돌</option>
                <option value="">세라믹 > 생활세라믹 > 유리ㆍ유리가공</option>
              </select>
            
          </tr>
          <tr>
              <td class="col-goods1" style="color: #5dba8e;">단위</td>
              <td class="col-goods2">
                <select name="unit" id="unit" style="width:400px;height:30px;font-size:15px;">
                  <option value="slc1" selected>선택</option>
                  <option value="a">L</option>
                  <option value="">ml</option>
                  <option value="">g</option>
                  <option value="">kg</option>
                </select>
              </td>
              <td class="col-goods1">제품군</td>
              <td class="col-goods2">
              <select name="product_class_code" id="product_class_code" style="width:400px;height:30px;font-size:15px;">
                <option value="slc1" selected>선택</option>
                <option value="a">플레버 신선도 유지제</option>
                <option value="">플레버 살균ㆍ탈취제</option>
                <option value="">플레버 펫</option>
                <option value="">확실히 사라지는 탈취제</option>
              </select>
              </td>
          </tr>
          <tr>
            <td class="col-goods1">수량</td>
            <td class="col-goods2">
              <input class="goods-num" type="text" id="product_id" name="spec" maxlength="50">
            </td>
            <td class="col-goods1">거래처</td>
            <td class="col-goods2">
              <input type="text" id="spec" name="spec" maxlength="16">
            </td>
          </tr>
          <tr>
            <td class="col-goods1">라우팅</td>
            <td class="col-goods2">
              <select name="process_routing_id" id="process_routing_id" style="width:400px;height:30px;font-size:15px;">
                <option value="slc1" selected>선택</option>
                <option value="a">원자재 투입</option>
                <option value="">반제품 제조</option>
                <option value="">충진</option>
                <option value="">생산</option>
                <option value="">품질검사</option>
                <option value="">완제품 출고</option>
              </select>
            </td>
            <td class="col-goods1" style="width: 166px;">단가</td>
              <td class="col-goods2">
                <input type="text" id="price" name="price" maxlength="16">
              </td>
          </tr>          <tr style="text-align: right; width: 160px;">
              <td colspan="4" style="padding: 14px;" >
              <button type="reset" class="reset-goods" value="초기화">초기화</button>
              <button id="submit-goods" type="submit" class="submit-goods" value="전송">전송</button>
              </td>
          </tr>     
      </table>
      </form>
    </section>
    <section class="goods-list" style="overflow-y: scroll;">
        <table class="goodslist-table">
          <tr class="goodslist-main">
            <th>품목번호</th>
            <th>품목명</th>
            <th>제품군</th>
            <th>라우팅</th>
            <th>수량</th>
            <th>삭제</th>
          </tr>
          <c:forEach var="vo" items="${goodslist}">
                <tr>
                <td>${vo.product_id }</td>
                <td>${vo.product_name }</td>
                <td>${vo.product_class_code }</td>
                <td>${vo.process_routing_id }</td>
                <td>${vo.spec }</td>
                <td><a href="goodsDelete"><button class="user-delete" type="button" style="border-radius: 7px; background-color: #41515e; color:white;  height: 20px; width: 20px;">X</button></a></td>
                </tr>
             
             </c:forEach>
        </table>
    </section>
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

</body>
</html>