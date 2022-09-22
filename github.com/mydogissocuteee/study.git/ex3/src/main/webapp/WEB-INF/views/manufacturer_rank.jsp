<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=2.0">
    <title>슬기로운 BB 플랫폼</title>
    <link rel="icon" href="./resources/img/manufacturer_rank/그림3.png">
    
    <!-- css -->
    	<link rel="stylesheet" href="./resources/css/manufacturer_rank.css" type="text/css">
    <!-- favion 아이콘 -->
     <script src="https://kit.fontawesome.com/036f0eb301.js" crossorigin="anonymous"></script>
     
 
</head>
<body>
    <header class="header">
        <div class = "header_01">
             <img src="./resources/img/manufacturer_rank/사용자.png">
             <c:choose>
					<c:when test="${customer.sortation eq 'user'}"><a href="profilejsp.do">${customer.name }님, 안녕하세요</a></c:when>
					<c:when test="${customer.sortation eq 'admin'}"><a href="product_managejsp.do">${customer.name }님, 안녕하세요</a></c:when>
			 </c:choose>
        </div>
        <div class = "header_02" onclick="location.href='mainjsp.do'">
            <img src="./resources/img/manufacturer_rank/그림2.png">
        </div>
        <div class = "header_03">
            <input type="text">
            <button><img src="./resources/img/manufacturer_rank/검색.png"></button>
        </div>
    </header>
    <div class="manu_total">
    <div class="manu_head">제조사 매칭 순위</div>
    <div class="manu_wrapp">
      <span>실시간 순위</span>
	     <div class="realTime_ranking">
			<button class="rank_num1">
				<img src="./resources/img/manufacturer_rank/비비엔다.png">
			</button>
			<button class="rank_num2">
				<img src="./resources/img/manufacturer_rank/포그니.png">
			</button>
			<button class="rank_num3">
				<img src="./resources/img/manufacturer_rank/그룹순위3.png">
			</button>
			<button class="rank_num4">
				<img src="./resources/img/manufacturer_rank/그룹순위4.png">
			</button>
			<button class="rank_num5">
				<img src="./resources/img/manufacturer_rank/그룹순위5.png">
			</button>
	        </div>
     
     <span class="maching_text">전체 순위</span>
     <div class="ranking_wrapper">
     	<table class="total_ranking">
     		<tr>
     			<th>총 순위</th>
     			<th>업체명</th>
     			<th>순위 변동</th>
     			<th>주문 순위</th>
     			<th>리뷰 순위(수)</th>
     			<th>리뷰 순위(별5)</th>
     			<th>리뷰 키워드</th>
     		</tr>
     		<tr class="ranking_tr">
     			<td class="ranking_td">1</td>
     			<td class="ranking_td">비비엔다</td>
     			<td class="ranking_td"><div class="rankPlus_btn">+1</div></td>
     			<td class="ranking_td">1</td>
     			<td class="ranking_td">1</td>
     			<td class="ranking_td">1</td>
     			<td class="ranking_td">빠른 배송/ 높은 품질/ 친절한 고객 대응/ 다양한 할인 이벤트</td>
     		</tr>
     		<tr class="ranking_tr">
     			<td class="ranking_td">2</td>
     			<td class="ranking_td">(주)포그니</td>
     			<td class="ranking_td"><div class="rankMinus_btn">-1</div></td>
     			<td class="ranking_td">4</td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     		</tr>
     		<tr class="ranking_tr">
     		<td  class="ranking_td">3</td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     		</tr>
     		<tr class="ranking_tr">
     			<td  class="ranking_td">4</td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     		</tr>
     		<tr class="ranking_tr">
     			<td  class="ranking_td">5</td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     		</tr>
     		<tr class="ranking_tr">
     			<td class="ranking_td">-</td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     		</tr>
     		<tr class="ranking_tr">
     			<td class="ranking_td">-</td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     		</tr>
     		<tr class="ranking_tr">
				<td class="ranking_td">-</td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     		</tr>
     		<tr class="ranking_tr">
     			<td class="ranking_td">-</td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     			<td class="ranking_td"></td>
     		</tr>
     		<tr class="last_tr">
     			<td class="ranking_last_td">-</td>
     			<td class="ranking_last_td"></td>
     			<td class="ranking_last_td"></td>
     			<td class="ranking_last_td"></td>
     			<td class="ranking_last_td"></td>
     			<td class="ranking_last_td"></td>
     			<td class="ranking_last_td"></td>
     		</tr>
     	</table>
     </div>
     </div>
    </div>
</body>
</html>