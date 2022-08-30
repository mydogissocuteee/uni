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
    <link rel="stylesheet" href="./resources/css/client.css" type="text/css">
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
      <div id="custitle">기준정보&nbsp&nbsp > &nbsp&nbsp거래처관리</div>
    </section>

    <section style="margin-top: 77px; margin-left: 16%;">
        <div class="search">
          <input type="text" placeholder="검색어 입력" class="search2">
          <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" class="search3">
        </div>
    </section>

    <section class="customer-choice">
      <form action="" method="post">
        <table class="customer-table" >
          <tr>
              <td class="col-cus1" style="width: 161px; color: #5dba8e;">거래처명</td>
              <td class="col-cus2">
                <input class="goods-num" type="text !important" id="product_id" name="product_id" maxlength="50">
              </td>
              <td class="col-cus1" style="width: 160px;">업태</td>
              <td class="col-cus2">
                <input class="goods-num" type="text" id="product_id" name="product_id" maxlength="50">
              </td>
          </tr>
          <tr>
              <td class="col-cus1" style="color: #5dba8e;">구분</td>
              <td class="col-cus3">
                &nbsp; &nbsp;&nbsp;<input type="radio" id="product_name" name="product_name" value="매출처"><a style="margin-left: 13px; margin-right: 20px;">매출처</a> &nbsp; &nbsp; &nbsp;
                <input type="radio" id="product_name" name="product_name" value="매입처"><a style="margin-left: 13px; margin-right: 20px;">매입처</a> &nbsp; &nbsp;&nbsp;&nbsp;
                <input type="radio" id="product_name" name="product_name" value="외주처"><a style="margin-left: 13px; margin-right: 20px;">외주처</a> &nbsp; &nbsp;&nbsp;&nbsp;
              </td>
              <td class="col-cus1">업종</td>
              <td class="col-cus2">
                <input class="goods-num" type="text" id="product_id" name="product_id" maxlength="50">
              </td>
          </tr>
          <tr>
            <td class="col-cus1" style="color: #5dba8e;">대표자 명</td>
            <td class="col-cus2"><input type="text" id="product_name" name="product_name" maxlength="100">
            </td>
            <td class="col-cus1">연락처</td>
            <td class="col-cus2">
              <input class="goods-num" type="text" id="product_id" name="product_id" maxlength="50">
            </td>
          </tr>
          <tr>
            <td class="col-cus1" style="color: #5dba8e;">사업자번호</td>
            <td class="col-cus2"><input type="text" id="product_name" name="product_name" maxlength="100">
            </td>
            <td class="col-cus1">FAX</td>
            <td class="col-cus2">
              <input class="goods-num" type="text" id="product_id" name="product_id" maxlength="50">
            </td>
          </tr>
          <tr>
            <td class="col-cus1">담당자명</td>
            <td class="col-cus2"><input type="text" id="product_name" name="product_name" maxlength="100">
            </td>
            <td class="col-cus1">E-mail</td>
            <td class="col-cus2">
              <input class="goods-num" type="text" id="product_id" name="product_id" maxlength="50">
            </td>
          </tr>
          <tr>
            <td class="col-cus1">주소</td>
            <td class="col-cus2"><input type="text" id="product_name" name="product_name" maxlength="100">
            </td>
            <td class="col-cus1">비고</td>
            <td class="col-cus2">
              <input class="goods-num" type="text" id="product_id" name="product_id" maxlength="50">
            </td>
          </tr>
          <tr>
            <td class="col-cus1">우편번호</td>
            <td class="col-cus2"><input type="text" id="product_name" name="product_name" maxlength="100">
            </td>
            <td colspan="2" style="padding: 11px; text-align: right;">
              <button type="reset" class="reset-custo" value="초기화">초기화</button>
              <button id="submit" type="submit" class="submit-custo" value="전송">전송</button>
              </td>
          </tr>
          
      </table>
    </section>

    <section class="customer-list" style="overflow-y: scroll;">
        <table class="customerlist-table">
          <tr class="customerlist-main">
            <th>거래처명</th>
            <th>연락처</th>
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
             <td><button class="user-delete" type="button" onclick="deleteRow(this)" style="border-color:gray"></button></td>
              </tr>
           
           </c:forEach>
          
          <tr>

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