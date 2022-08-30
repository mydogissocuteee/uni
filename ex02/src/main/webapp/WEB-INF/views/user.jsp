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
    <title>Solution U</title>
    <link rel="stylesheet" href="./resources/css/user.css" type="text/css">
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
            	<c:if test="${company=='sy'}">
            		<div style="font-size: 22px;">수영산업</div>
				</c:if>
				<c:if test="${company=='fourever'}">
            		<div style="font-size: 22px;">주식회사 포에버</div>
				</c:if>
				<c:if test="${company=='sbum'}">
            		<div style="font-size: 22px;">에스비유엠</div>
				</c:if>
				<c:if test="${company=='sbu'}">
            		<div style="font-size: 22px;">에스비유</div>
				</c:if>
				<c:if test="${company=='easy'}">
            		<div style="font-size: 22px;">이지시스템</div>
				</c:if>
				<c:if test="${company=='ecovers'}">
            		<div style="font-size: 22px;">이커버스</div>
				</c:if>
				<c:if test="${company=='daechang'}">
            		<div style="font-size: 22px;">대창앵글몰</div>
				</c:if>
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
      <div id="usertitle">기준정보&nbsp&nbsp > &nbsp&nbsp사용자관리</div>
    </section>
                                              <!--회원가입 폼-->
    <section class="user">
      <article class="user-form">
        <form action="userInsert.do" method="post">
        <table class="table table-boardered">
          <tr>
              <td class="col-user1">사용자 ID</td>
              <td class="col-user2">
                <input class="input_id" type="text" id="userid" name="userid" maxlength="5" style="width:250px;height:30px;font-size:15px;">
                <font id="checkId" size="2"></font>
              </td>
          </tr>
          <tr>
              <td class="col-user1">사용자명</td>
              <td class="col-user2"><input type="text" id="username" name="username" maxlength="5" style="width:250px;height:30px;font-size:15px;"></td>
          </tr>
          <tr>
              <td class="col-user1">비밀번호</td>
              <td class="col-user2">
                  <input type="password" id="userpw" name="userpw" maxlength="16" style="width:250px;height:30px;font-size:15px;">
              </td>
          </tr>
          <tr>
              <td class="col-user1">주 공정</td>
              <td class="col-user2"><input type="text" id="mainProcess" name="mainProcess" maxlength="16" style="width:250px;height:30px;font-size:15px;"></td>
          </tr>
          <tr>
              <td class="col-user1">권 한</td>
              <td class="col-user2">
                <select name="userRight" id="userRight" style="width:250px;height:30px;font-size:15px;">
                  <option value="slc1" selected>선택</option>
                  <option value="manager">대 표(관리자)</option>
                  <option value="staff">직 원</option>
              </select>
              </td>
          </tr>   
          <tr>
              <td class="col-user1">부서명</td>
              <td class="col-user2"><input type="text" id="department" name="department" maxlength="5" style="width:250px;height:30px;font-size:15px;"></td>
          </tr>
          <tr>
            <td class="col-user1">연락처</td>
            <td class="col-user2"><input type="text" id="contact" name="contact" maxlength="15" style="width:250px;height:30px;font-size:15px;"></td>
           </tr>
           <tr>
            <th class="col-user1">이메일</th>
            <td class="col-user2"><input type="email" id="email" class="form-control" name="email" style="width:250px;height:30px;font-size:15px;"></td>       
          </tr>
          <tr>
            <th class="col-user1">메모</th>
            <td class="col-user2">
             <textarea rows="5" cols="40" name="memo" class="form-control" style="width: 300px;"></textarea>
            </td>     
         </tr>             
          <tr style="text-align: center;">
              <td colspan="2" style="padding: 11px;">
              <button type="reset" class="reset-user" value="초기화">초기화</button>
              <button id="submit-user" type="submit" class="submit-user" value="전송">전송</button>             
          </td>
          </tr>     
      </table>
      </article>
    </section>

    <section style="margin-top: -540px; margin-left: 38%;">
        <div class="search">
          <input type="text" placeholder="검색어 입력" class="search2">
          <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" class="search3">
        </div>
    </section>
                                      <!-- 등록된 회원 리스트 -->
    <section class="user-list" 
          style="overflow-y: scroll;">
          <div id="view"></div>
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
<script type="text/javascript">

	$('#submit-user').click(function() {
		$.ajax({
		      url : "userInsert.do",
		      type : "GET",
		      async:false,
		      data : {"MemberVO":MemberVO},
		      // dataType : "json",
		      success : userSelect,
		      error : function(){alert("error");  }
		   });
	}) 
	</script>
   

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
                                            <!-- 리스트 삭제-->
    <script>
      function deleteRow(ths){
          var ths = $(ths);
          
          ths.parents("tr").remove();
      }
    </script>
                                            <!-- 아이디 중복 체크 -->
    <script>
       $('.input_id').focusout(function(){
          let userid = $('.input_id').val();

          $.ajax({
             url:"checkId.do"
              type:"get",
              data:{userid:userid}
              dataType:'json',
              success:function(result){
                  if(result == 0){
                      $("#checkId").html('사용할 수 있는 아이디입니다');
                      $("#checkId").attr('color', 'red');
                  }else{
                      $("#checkId").html('사용할 수 없는 아이디입니다');
                      $("#checkId").attr('color', 'green');
                  }
              },
              error : function(){
                  alert("id check 서버요청실패");
              }
          })
      })
    </script>
                                                <!--빈 입력란 뭐라하기-->
    <script>
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
          
    </script>
</body>
</html>