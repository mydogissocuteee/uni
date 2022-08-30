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
    <title>MAIN PAGE</title>
	<link rel="stylesheet" href="./resources/css/main.css" type="text/css">
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

    <!-- chart 라이브러리 -->
    <script type="text/javascript" charset="utf-8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
</head>

<style>

html, body{
  height: 100% ;
  align-items: center;
}
.chart{
    display: inline-block;
    overflow: hidden;
    padding: 0;
}

.rate{
  display: inline-block;
}
.produc{
 text-align: center;
 overflow: hidden;
 display: inline-block;
}
.produc a{
  text-align: center;
}

.rate_chart{
  display: inline-block;
}


</style>

<body class="main">
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

          </ul>
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
    <div class="wrapper">
       <div class="produc" >
        <div class="graph" ><a style="font-size: 25px; color: #166cea;">생산량&ensp;</a>
          <a class="clear">Total : </a><hr style="color: gray; margin-top: 10px;width: 100%;">
        <div class="chart">
          <canvas id="myChart"  style="margin-top:8%; width: 500px;"></canvas>
        </div>
      </div> 
      </div>

        <div class="produc" >
          <div class="graph">
              <a style="font-size: 25px; color: #166cea;">계획대비 생산 효율&ensp;</a>
              <a class="clear">Total : </a><hr style="color: gray; margin-top: 10px; width: 100%;">
              <div class="chart">
              <canvas id="chart_" style="margin-top:8%; width: 500px;"></canvas> 
              </div>
           </div>
        </div>

        <div class="produc" >
          <div class="graph"><a style="font-size: 25px; color: #166cea;">전년대비 납기율&ensp;</a>
            <a class="clear">Total : </a><hr style="color: gray; margin-top: 10px;width: 100%;">
            <div class="chart">
              <canvas id="rate_chart"  style="margin-top:8%; width: 500px;"></canvas>
            </div>
          </div>
        </div>

      <div class="produc">
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
  window.onload = function() {
  var ctx = $('#chart_').get(0).getContext("2d"); 
  window.theChart = new Chart(ctx, {
   type: 'bar',
   data: barChartData,
   options: {
 
    legend: {display: false},
    scales: {
        xAxes: [{
          gridLines: { 
            display: false,
            drawBorder: false,
          },
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
        }],
     
      }
   }
  });
  }
  </script>

</body>
</html>