<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<title>슬기로운 BB 플랫폼</title>
	<link rel="stylesheet" href="./resources/css/profile.css" type="text/css">

	<!-- favion 아이콘 -->
	<script src="https://kit.fontawesome.com/036f0eb301.js" crossorigin="anonymous"></script>

	<!-- 모달 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	<header class="header">
		<div class="header_01">
			<img src="./resources/img/profile/사용자.png">
			<a>${customer.name }님, 안녕하세요</a>
		</div>
		<div class = "header_02" onclick="location.href='mainjsp.do'">
			<img src="./resources/img/profile/그림2.png">
		</div>
		<div class="header_03">
			<input type="text">
			<button><img src="./resources/img/profile/검색.png"></button>
		</div>
	</header>
	<div class="content">
		<div class="profile_title"><a>회원정보</a></div>
		<div class="profile_main">
			<div class="profile_left">
				<table class="profile">
					<tr>
						<td colspan="2"><img src="./resources/img/profile/profile_사용자.png" class="profile_img"></td>
					</tr>
					<tr>
						<td colspan="2"><span class="profileName_text">김민지</span></td>
					</tr>
					<tr>
						<td colspan="2"><button class="set_btn"><img src="./resources/img/profile/set.png"></button></td>
					</tr>
					<tr>
						<td><img class="point_img" src="./resources/img/profile/point.png" alt="포인트"></td>
						<td><img class="list_img" src="./resources/img/profile/gift.png" alt="구매목록"></td>
					</tr>
					<tr>
						<td class="profile_td_st"><a>포인트 1,222p</a></td>
						<td class="profile_td_st" style="color:#FFA216"><a>구매목록</a></td>
					</tr>
					<tr>
						<td><img class="coupon_img" src="./resources/img/profile/coupon.png" alt="쿠폰"></td>
						<td><img class="service_img" src="./resources/img/profile/service.png" alt="고객센터"></td>
					</tr>
					<tr>
						<td><a>쿠폰</a></td>
						<td><a>고객센터</a></td>
					</tr>
				</table>
			</div>
			<div class="profile_right">
				<div class="produc1">
					<table class="profile_tb">
						<tr>
							<td rowspan="2" class="tb_img"><img class="produc_img" src="./resources/img/profile/egg.png"></td>
							<td colspan="2" class="situation"><a style="color:#cbcbcb">09/02(금) 구매확정</a><a
									style="font-weight: bold; margin-left:-0.55vw;">도착완료</a></td>
							<td class="return_request_text"> <button class="request_btn"><img
										src="./resources/img/profile/request_btn.png" class="request_btn2"></button></td>
						</tr>
						<tr>
							<td class="my_producName"><span>계란후라이 아기이불</span>
								<p>80,000원</p>
							</td>
							<td class="my_producDetail">
								<pre>1차옵션: 아이보리</pre>
								<pre>2차옵션 : 대형</pre>
								<a>갯수 : 2개</a>
							</td>
							<td class="td_vertical">
								<div><img class="writeRv_btn" src="./resources/img/profile/write.png"></div>
								<div>
									<button class="delivery_tracking_btn3" data-toggle="modal" href="#deliveryModal" onclick="loadData()">
										<img src="./resources/img/profile/delivery_view.png">
									</button>
									</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="produc2">
					<table class="profile_tb">
						<tr>
							<td rowspan="2" class="tb_img"><img class="produc_img" src="./resources/img/profile/baby.png"></td>
							<td colspan="2" class="situation"><a style="color:#cbcbcb">09/02(금) 구매확정</a><a
									style="font-weight: bold; margin-left:-0.55vw;">도착완료</a></td>
							<td class="return_request_text"> <button class="request_btn"><img
										src="./resources/img/profile/request_btn.png" class="request_btn2"></button></td>
						</tr>
						<tr>
							<td class="my_producName"><span>아이 쿨매트</span>
								<p>80,000원</p>
							</td>
							<td class="my_producDetail">
								<pre>1차옵션: 아이보리</pre>
								<pre>2차옵션 : 대형</pre>
								<a>갯수 : 2개</a>
							</td>
							<td class="td_vertical">
								<div><img class="writeRv_btn" src="./resources/img/profile/write.png"></div>
								<button class="delivery_tracking_btn2" onclick="open1()">
									<img src="./resources/img/profile/delivery_view.png">
								</button>
							</td>
						</tr>
					</table>
				</div>
				<div class="produc3">
					<table class="profile_tb">
						<tr>
							<td rowspan="2" class="tb_img"><img class="produc_img" src="./resources/img/profile/bed.png"></td>
							<td colspan="2" class="situation"><img class="shipping_img" src="./resources/img/profile/shipping.png"></td>
							<td class="return_request_text"> <button class="request_btn"><img
										src="./resources/img/profile/request_btn.png" class="request_btn2"></button></td>
						</tr>
						<tr>
							<td class="my_producName"><pre>범퍼침대 특대형</pre>
								<a>300,000원</a>
							</td>
							<td class="my_producDetail">
								<pre>1차옵션: 패턴01</pre>
								<pre>2차옵션 : 대형</pre>
								<a>갯수 : 1개</a>
							</td>
							<td class="td_vertical">
								<div><img class="repurchase_btn" src="./resources/img/profile/repurchase.png"></div>
								<button class="delivery_tracking_btn1" onclick="open1()">
									<img src="./resources/img/profile/delivery_view.png">
								</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- 배송조회 모달-->
		<div class="modal" id="deliveryModal" style="display:none">
			<div class="modal_body">
				<button type="button"  class="close" onclick="close1()">X</button>
				<div class="modal_header">
					<h3 class="modal_head">배송조회</h3>
				</div>
				<div class="modal_content">
					<div class="modal_produc">
						<img class="delevery_produc" src="./resources/img/profile/modal_img.png">
						<div class="modal_wrapp" style="display: grid">
							<span class="modal_date">22.09.03</span>
							<span class="modal_name">범퍼침대 특대형</span>
							<span class="modal_price">300,000원</span>
						</div>
					</div>
					<div class="delivery_modal_tb">
						<img class="delivery_grid_00" src="./resources/img/profile/배달창_체크.png">
						<img class="delivery_grid_01" src="./resources/img/profile/배달창_결제완료_이미지.png">
						<img class="delivery_grid_02" src="./resources/img/profile/배달창_결제완료_텍스트.png">
						<img class="delivery_grid_10" src="./resources/img/profile/배달창_체크.png">
						<img class="delivery_grid_11" src="./resources/img/profile/배달창_제조_이미지.png">
						<img class="delivery_grid_12" src="./resources/img/profile/배달창_제조_텍스트.png">
						<img class="delivery_grid_20" src="./resources/img/profile/배달창_언체크.png">
						<img class="delivery_grid_21" src="./resources/img/profile/배달창_집하_이미지.png">
						<img class="delivery_grid_22" src="./resources/img/profile/배달창_집하_텍스트.png">
						<img class="delivery_grid_30" src="./resources/img/profile/배달창_언체크.png">
						<img class="delivery_grid_31" src="./resources/img/profile/배달창_배송_이미지.png">
						<img class="delivery_grid_32" src="./resources/img/profile/배달창_배송_텍스트.png">
						<img class="delivery_grid_40" src="./resources/img/profile/배달창_언체크.png">
						<img class="delivery_grid_41" src="./resources/img/profile/배달창_배송완료_이미지.png">
						<img class="delivery_grid_42" src="./resources/img/profile/배달창_배송완료_텍스트.png">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 배송조회 javaScript -->
<script>

function loadData(){
	 $.ajax({
	        url:'api.do',
	        type : 'get',
	        success :  function(data){
	            var tracker = data;
	            if (tracker>=1) {
	            document.getElementsByClassName( 'delivery_grid_20' )[0].setAttribute( 'src', './resources/img/profile/배달창_체크.png' );
	            	if(tracker>=2) {
	            		document.getElementsByClassName( 'delivery_grid_30' )[0].setAttribute( 'src', './resources/img/profile/배달창_체크.png' );
	            		if(tracker>=3) {
	            			document.getElementsByClassName( 'delivery_grid_40' )[0].setAttribute( 'src', './resources/img/profile/배달창_체크.png' );
	            }}}
	        },
	        error: function(){
	        	alert("안돼여..");
	    	}
	    })	
	
}

</script>
<script>
function open1() {
	loadData();
	document.querySelector('#deliveryModal').style.display = 'block';
}

function close1() {
	document.querySelector('#deliveryModal').style.display = 'none';
}


// ESC 누르면 모달창 닫기
$(document).keydown(function(e){
	//keyCode 구 브라우저, which 현재 브라우저
    var code = e.keyCode || e.which;
    if (code == 27) { // 27은 ESC 키번호
        $('#deliveryModal').hide();
    }
});

//모달 영역 밖 클릭 시 모달창 닫기
$(document).mouseup(function (e){
	if($("#deliveryModal").has(e.target).length === 0){
		$("#deliveryModal").hide();
	}
});

</script>

</body>

</html>