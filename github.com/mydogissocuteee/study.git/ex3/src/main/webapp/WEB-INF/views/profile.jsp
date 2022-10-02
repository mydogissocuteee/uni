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
					<c:when test="${customer.sortation eq 'user'}">
						<button class="user_input_modal_bt" onclick="location.href='profilejsp.do'">
                  		<img src="./resources/img/mainpage/회원정보.png">
               			</button>
					</c:when>
					<c:when test="${customer.sortation eq 'admin'}">
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
		<div class="header_01">
			<button class="user_btn" id="user_btn" onclick="user_btn()">
                <img src="./resources/img/mainpage/사용자.png">
            </button>
			<c:choose>
					<c:when test="${customer.sortation eq 'user'}"><a href="profilejsp.do">${customer.name }님, 안녕하세요</a></c:when>
					<c:when test="${customer.sortation eq 'admin'}"><a href="product_managejsp.do">${customer.name }님, 안녕하세요</a></c:when>
			 </c:choose>
		</div>
		<div class="header_02">
			<img src="./resources/img/profile/그림2.png"  onclick="location.href='mainjsp.do'">
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
								<button class="delivery_tracking_btn2" data-toggle="modal" href="#deliveryModal" onclick="loadData1()">
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
								<button class="delivery_tracking_btn1" data-toggle="modal" href="#deliveryModal" onclick="loadData2()">
									<img src="./resources/img/profile/delivery_view.png">
								</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- 배송조회 모달 계란-->
		<div class="modal_01" id="deliveryModal_01" style="display:none">
			<div class="modal_body_01">
				<button type="button" class="close_01" data-dismiss="modal_01">X</button>
				<div class="modal_header_01">
					<h3 class="modal_head_01">배송조회</h3>
				</div>
				<div class="modal_content_01">
					<div class="modal_produc_01">
						<img class="delevery_produc_01" src="./resources/img/profile/egg.png">
						<div class="modal_wrapp_01" style="display: grid">
							<span class="modal_date_01">22.09.02</span>
							<span class="modal_shipping_01">송장번호:650951690445</span>
							<span class="modal_name_01">계란후라이 아기이불</span>
							<span class="modal_price_01">80,000원</span>
						</div>
					</div>
					<div class="delivery_modal_tb_01">
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
				<!-- 배송조회 모달 쿨매트-->
		<div class="modal_02" id="deliveryModal_02" style="display:none">
			<div class="modal_body_02">
				<button type="button" class="close_02" data-dismiss="modal_02">X</button>
				<div class="modal_header_02">
					<h3 class="modal_head_02">배송조회</h3>
				</div>
				<div class="modal_content_02">
					<div class="modal_produc_02">
						<img class="delevery_produc_02" src="./resources/img/profile/baby.png">
						<div class="modal_wrapp_02" style="display: grid">
							<span class="modal_date_02">22.09.02</span>
							<span class="modal_shipping_02">송장번호:564999104331</span>
							<span class="modal_name_02">아이 쿨매트</span>
							<span class="modal_price_02">80,000원</span>
						</div>
					</div>
					<div class="delivery_modal_tb_02">
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
				<!-- 배송조회 모달 특대형-->
		<div class="modal_03" id="deliveryModal_03" style="display:none">
			<div class="modal_body_03">
				<button type="button" class="close_03" data-dismiss="modal_03">X</button>
				<div class="modal_header_03">
					<h3 class="modal_head_03">배송조회</h3>
				</div>
				<div class="modal_content_03">
					<div class="modal_produc_03">
						<img class="delevery_produc_03" src="./resources/img/profile/bed.png">
						<div class="modal_wrapp_03" style="display: grid">
							<span class="modal_date_03">22.09.02</span>
							<span class="modal_shipping_03">송장번호:650562709770</span>
							<span class="modal_name_03">범퍼침대 특대형</span>
							<span class="modal_price_03">300,000원</span>
						</div>
					</div>
					<div class="delivery_modal_tb_03">
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

	<!-- 모달창 javaScript -->
	<script>
//계란
		const deliveryModal_01 = document.querySelector('#deliveryModal_01');
		const btnOpenPopup_01 = document.querySelector('.delivery_tracking_btn3');
		const btnClose_01 = document.querySelector('.close_01');
		deliveryModal_01.style.display = 'none';

		btnOpenPopup_01.addEventListener('click', () => {
			deliveryModal_01.style.display = 'block';
		});

		btnClose_01.addEventListener('click', () => {
			deliveryModal_01.style.display = 'none';
		});

//쿨매트
		const deliveryModal_02 = document.querySelector('#deliveryModal_02');
		const btnOpenPopup_02 = document.querySelector('.delivery_tracking_btn2');
		const btnClose_02 = document.querySelector('.close_02');
		deliveryModal_02.style.display = 'none';

		btnOpenPopup_02.addEventListener('click', () => {
			deliveryModal_02.style.display = 'block';
		});

		btnClose_02.addEventListener('click', () => {
			deliveryModal_02.style.display = 'none';
		});

// 특대형
		const deliveryModal_03 = document.querySelector('#deliveryModal_03');
		const btnOpenPopup_03 = document.querySelector('.delivery_tracking_btn1');
		const btnClose_03 = document.querySelector('.close_03');
		deliveryModal_03.style.display = 'none';

		btnOpenPopup_03.addEventListener('click', () => {
			deliveryModal_03.style.display = 'block';
		});

		btnClose_03.addEventListener('click', () => {
			deliveryModal_03.style.display = 'none';
		});			

	// 배송 api
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
	function loadData1(){
		 $.ajax({
		        url:'api.do',
		        type : 'get',
		        success :  function(data){
		            var tracker = data;
		            if (tracker>=1) {
		            document.getElementsByClassName( 'delivery_grid_20' )[1].setAttribute( 'src', './resources/img/profile/배달창_체크.png' );
		            	if(tracker>=2) {
		            		document.getElementsByClassName( 'delivery_grid_30' )[1].setAttribute( 'src', './resources/img/profile/배달창_체크.png' );
		            		if(tracker>=3) {
		            			document.getElementsByClassName( 'delivery_grid_40' )[1].setAttribute( 'src', './resources/img/profile/배달창_체크.png' );
		            }}}
		        },
		        error: function(){
		        	alert("안돼여..");
		    	}
		    })	
		
	}
	function loadData2(){
		 $.ajax({
		        url:'api.do',
		        type : 'get',
		        success :  function(data){
		            var tracker = data;
		            if (tracker>=1) {
		            document.getElementsByClassName( 'delivery_grid_20' )[2].setAttribute( 'src', './resources/img/profile/배달창_체크.png' );
		            	if(tracker>=2) {
		            		document.getElementsByClassName( 'delivery_grid_30' )[2].setAttribute( 'src', './resources/img/profile/배달창_체크.png' );
		            		}}
		        },
		        error: function(){
		        	alert("안돼여..");
		    	}
		    })	
		
	}
		
	</script>




</body>

</html>