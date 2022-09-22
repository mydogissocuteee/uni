<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>슬기로운 BB 플랫폼</title>
    <link rel="stylesheet" href="./resources/css/product_manage.css" type="text/css">
    <script type="text/javascript" src="./resources/js/product_manage.js"></script>
</head>
<body>
    <header class="header">
        <div class = "header_01">
            <button class="user_btn">
                <img src="./resources/img/product_manage/사용자.png">
            </button>
             <c:choose>
					<c:when test="${customer.sortation eq 'user'}"><a href="profilejsp.do">${customer.name }님, 안녕하세요</a></c:when>
					<c:when test="${customer.sortation eq 'admin'}"><a href="product_managejsp.do">${customer.name }님, 안녕하세요</a></c:when>
			 </c:choose>
        </div>
        <div class = "header_02" onclick="location.href='mainjsp.do'">
            <img src="./resources/img/product_manage/그림2.png">
        </div>
        <div class = "header_03">
            <input type="text">
            <button><img src="./resources/img/product_manage/검색.png"></button>
        </div>
    </header>
    <div class="produc_main">
        <div class="produc_title">
            <a>생산정보</a>
        </div>
        <c:set var="ran1"><%= java.lang.Math.round(java.lang.Math.random() * 130) %></c:set>
        <c:set var="ran2"><%= java.lang.Math.round(java.lang.Math.random() * 70) %></c:set>
        <c:set var="ran3"><%= java.lang.Math.round(java.lang.Math.random() * 30) %></c:set>
        <c:set var="ran4"><%= java.lang.Math.round(java.lang.Math.random() * 20) %></c:set>
        <c:set var="percent1" value="${ran1/130*100 }"></c:set>
        <c:set var="percent2" value="${ran2/70*100 }"></c:set>
        <c:set var="percent3" value="${ran3/30*100 }"></c:set>
        <c:set var="percent4" value="${ran4/20*100 }"></c:set>
        <div class="rates">
            <div class="progress">
                <div class="p_title"><img src="./resources/img/product_manage/진행률.png"></div>
                <div class="p_rate">
                    <div class="rate_1">
                        <div class="rate_text" for="file">베개</div>
                        <progress id="file1" max="100" value="${percent1}"></progress>
                        <table class="rate_table">
                            <tr>
                                <td>생산개수 : ${ran1 }EA</td>
                                <td>필요개수 : 130EA</td>
                            </tr>
                        </table>
                    </div>
                    <div class="rate_2">
                        <div class="rate_text" for="file">범퍼침대</div>
                        <progress id="file2" max="100" value="${percent2}"></progress>
                        <table class="rate_table">
                            <tr>
                                <td>생산개수 : ${ran2 }EA</td>
                                <td>필요개수 : 70EA</td>
                            </tr>
                        </table>
                    </div>
                    <div class="rate_3">
                        <div class="rate_text" for="file">이불</div>
                        <progress id="file3" max="100" value="${percent3}"></progress>
                        <table class="rate_table">
                            <tr>
                                <td>생산개수 : ${ran3 }EA</td>
                                <td>필요개수 : 30EA</td>
                            </tr>
                        </table>
                    </div>
                    <div class="rate_4">
                        <div class="rate_text" for="file">수면조끼</div>
                        <progress id="file4" max="100" value="${percent4}"><div id="label">90%</div></progress>
                        <table class="rate_table">
                            <tr>
                                <td>생산개수 : ${ran4 }EA</td>
                                <td>필요개수 : 20EA</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="arrow"><img src="./resources/img/product_manage/다각형 2.png"></div>
            <div class="achieve">
                <div class="a_title"><img src="./resources/img/product_manage/달성률.png"></div>
                <div class="a_rate"> 
                   <div class="pillow">
                     <div><img  class="pil-img" src="./resources/img/product_manage/cate_베개.png"></div>
                     <div class="chart doughnut1"><span class="center">75%</span></div>
                   </div>
                   <div class="bed">
                    <div><img class="bed-img" src="./resources/img/product_manage/cate_범퍼침대.png"></div>
                    <div class="chart doughnut2"><span class="center">50%</span></div>

                   </div>
                   <div class="bedding">
                    <div><img class="ding-img" src="./resources/img/product_manage/cate_블랭킷.png"></div>
                    <div class="chart doughnut3"><span class="center">25%</span></div>

                   </div>
                   <div class="mat">
                    <div><img class="mat-img" src="./resources/img/product_manage/cate_매트.png"></div>
                    <div class="chart doughnut4"><span class="center">100%</span></div>

                   </div>
                </div>
            </div>
            <div class="arrow"><img src="./resources/img/product_manage/다각형 2.png"></div>
            <div class="outgoing">
                <div class="o_title"><img src="./resources/img/product_manage/출하.png"></div>
                <div class="o_rate">
                    <div class="o_table_1">
                        <div class="o_produc_1">베개</div>
                        <table class="o_rate_table">
                            <tr>
                                <td>출고예정 : 22.07.07</td>
                                <td>20EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.05</td>
                                <td>120EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.09</td>
                                <td>80EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.13</td>
                                <td>50EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.25</td>
                                <td>70EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="o_table_2">
                        <div class="o_produc_2">쿨매트</div>
                        <table class="o_rate_table">
                            <tr>
                                <td>출고예정 : 22.07.07</td>
                                <td>20EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.05</td>
                                <td>120EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.09</td>
                                <td>80EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.13</td>
                                <td>50EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.25</td>
                                <td>70EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="o_table_3">
                        <div class="o_produc_3">수면조끼</div>
                        <table class="o_rate_table">
                            <tr>
                                <td>출고예정 : 22.07.07</td>
                                <td>20EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.05</td>
                                <td>120EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.09</td>
                                <td>80EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.13</td>
                                <td>50EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                            <tr>
                                <td>출고예정 : 22.07.25</td>
                                <td>70EA</td>
                                <td><img src="./resources/img/product_manage/명단확인.png"></td>
                            </tr>
                        </table>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    const chart1 = document.querySelector('.doughnut1');
    const chart2 = document.querySelector('.doughnut2');
    const chart3 = document.querySelector('.doughnut3');
    const chart4 = document.querySelector('.doughnut4');

    const makeChart = (percent, classname, color) => {
    let i = 1;
    let chartFn = setInterval(function() {
        if (i < percent) {
        colorFn(i, classname, color);
        i++;
        } else {
        clearInterval(chartFn);
        }
    }, 10);
    }

    const colorFn = (i, classname, color) => {
    classname.style.background = "conic-gradient(" + color + " 0% " + i + "%, #dedede " + i + "% 100%)";
    }

    const rand1 = Math.floor(Math.random() * 101);
    const rand2 = Math.floor(Math.random() * 101);
    const rand3 = Math.floor(Math.random() * 101);
    const rand4 = Math.floor(Math.random() * 101);
    document.getElementsByClassName('center')[0].innerText = rand1+"%";
    document.getElementsByClassName('center')[1].innerText = rand2+"%";
    document.getElementsByClassName('center')[2].innerText = rand3+"%";
    document.getElementsByClassName('center')[3].innerText = rand4+"%";
    
    const replay = () => {
    makeChart(rand1, chart1, '#f5b914');
    makeChart(rand2, chart2, '#f5b914');
    makeChart(rand3, chart3, '#f5b914');
    makeChart(rand4, chart4, '#f5b914');
    }

    makeChart(rand1, chart1, '#f5b914');
    makeChart(rand2, chart2, '#f5b914');
    makeChart(rand3, chart3, '#f5b914');
    makeChart(rand4, chart4, '#f5b914');
</script>
</html>