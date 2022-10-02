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
    <link rel="stylesheet" href="./resources/css/produc_info.css" type="text/css">
    <script type="text/javascript" src="./resources/js/scroll_color.js"></script>

	<!-- favion 아이콘 -->
	<script src="https://kit.fontawesome.com/036f0eb301.js" crossorigin="anonymous"></script>
     
<!-- slick  -->
	<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
		  $('.main_body_user_cate_in_line_50').slick({
				accessibility: false,
				slidesToShow: 5,
				slidesToScroll: 1,
				// autoplay: true, // 자동슬라이드
				autoplaySpeed: 2000,
				arrows: false,
				vertical:false,
				dots: false, // 도트 네비 생성여부
				swipeToSlide: true,
				infinite: false,
				
			  });
		  
		  });
		   
  
  </script> 
</head>
<style>
  iframe{width: 28vw ;
    height: 60vh;
    margin-left: 1vw;}
  .product_info_3d{
	background: transparent 0% 0% no-repeat padding-box;
    box-shadow: 0px 0px 6px #00000029;
}

.threeD1{
	position:absolute;left:50%;top:50%;
	margin:-30vh 0 0 -45vw;
}

.threeD2{
	position:absolute;left:50%;top:50%;
	margin:-30vh 0 0 -45vw;
}
</style>
<body>
    <header class="header">
        <div class = "header_01">
            <button class="user_btn">
                <img src="./resources/img/produc_info/사용자.png">
            </button>
            <!-- 사용자 이름 -->
             <c:choose>
					<c:when test="${customer.sortation eq 'user'}"><a href="profilejsp.do">${customer.name }님, 안녕하세요</a></c:when>
					<c:when test="${customer.sortation eq 'admin'}"><a href="product_managejsp.do">${customer.name }님, 안녕하세요</a></c:when>
			 </c:choose>
        </div>
        <div class = "header_02" onclick="location.href='mainjsp.do'">
            <img src="./resources/img/produc_info/그림2.png">
        </div>
        <div class = "header_03">
            <input type="text">
            <button><img src="./resources/img/produc_info/검색.png"></button>
        </div>
    </header>
	<div class="product_info_main">
		<div class="product_info_title">
			상품 카테고리 | ${param.product }
		</div>
		<div class="product_info_body">
			<div class="product_info_3d">
				<div class="3d_wrapp" align="center" >
				<c:choose>
					<c:when test="${param.product eq '베개'}"><iframe src="./resources/3d_html/pillow_black.html" class="threeD1" style="border:none"  scrolling="no" align="top"></iframe></c:when>
					<c:when test="${param.product eq '매트'}"><iframe src="./resources/3d_html/mat_blue.html" class="threeD2" style="border:none"  scrolling="no" align="top"></iframe></c:when>
				</c:choose>
				</div>
			</div>
			<c:if test="${customer.sortation eq 'user'}">
			<div class="product_info_main_user">
				<div class="info_main_title_user">
					<pre>비비엔다의 모든제품은</pre>
					<a class="title_left">주문 후 수작업으로 제작됩니다.</a>
					<a class="title_right">제작기간 : 주문 후 최대 5~10일 소요</a>
				</div>
				<div class="info_main_body_user">
					<div class="info_main_body_user_title">
						디자인 설정
					</div>
					<div class="main_body_user_cate">
						<div class="main_body_user_cate_in">
							<div class="main_body_user_cate_in_line_0"></div>
							<div class="main_body_user_cate_in_line_1"></div>
							<div class="main_body_user_cate_in_line_2"></div>
							<div class="main_body_user_cate_in_line_00">
								원단
							</div>
							<div class="main_body_user_cate_in_line_01"></div>
							<div class="main_body_user_cate_in_line_02">
								충전
							</div>
							<div class="main_body_user_cate_in_line_10">
								<button class="user_cate_btn_10_1">
									<img src="./resources/img/produc_info/원단_기능성.png">
								</button>
								<button class="user_cate_btn_10_2">
									<img src="./resources/img/produc_info/원단_냉감.png">
								</button>
								<button class="user_cate_btn_10_3">
									<img src="./resources/img/produc_info/원단_매쉬.png">
								</button>
								<button class="user_cate_btn_10_4">
									<img src="./resources/img/produc_info/원단_소재.png">
								</button>
								<button class="user_cate_btn_10_5">
									<img src="./resources/img/produc_info/원단_향균.png">
								</button>
							</div>
							<div class="main_body_user_cate_in_line_11"></div>
							<div class="main_body_user_cate_in_line_12">
								<button class="user_cate_btn_12_1">
									<img src="./resources/img/produc_info/충전_매쉬.png">
								</button>
								<button class="user_cate_btn_12_2">
									<img src="./resources/img/produc_info/충전_메모리폼.png">
								</button>
								<button class="user_cate_btn_12_3">
									<img src="./resources/img/produc_info/충전_솜.png">
								</button>
								<button class="user_cate_btn_12_4">
								</button>
							</div>
							<div class="main_body_user_cate_in_line_20">
								무늬
							</div>
							<div class="main_body_user_cate_in_line_21"></div>
							<div class="main_body_user_cate_in_line_22">
								마감
							</div>
							<div class="main_body_user_cate_in_line_30">
								<button class="user_cate_btn_30_1">
									<img src="./resources/img/produc_info/무늬_패턴.png">
								</button>
								<button class="user_cate_btn_30_2">
									<img src="./resources/img/produc_info/무늬_레이스.png">
								</button>
								<button class="user_cate_btn_30_3">
									<img src="./resources/img/produc_info/무늬_캐릭터.png">
								</button>
								<button class="user_cate_btn_30_4">
									<img src="./resources/img/produc_info/무늬_플라워.png">
								</button>
								<button class="user_cate_btn_30_5">
									<img src="./resources/img/produc_info/무늬_단색.png">
								</button>
							</div>
							<div class="main_body_user_cate_in_line_31"></div>
							<div class="main_body_user_cate_in_line_32">
								<button class="user_cate_btn_32_1">
									<img src="./resources/img/produc_info/마감_통솔처리.png">
								</button>
								<button class="user_cate_btn_32_2">
									<img src="./resources/img/produc_info/마감_쌈솔처리.png">
								</button>
								<button class="user_cate_btn_32_3"></button>
								<button class="user_cate_btn_32_4">
								</button>
							</div>
							<div class="main_body_user_cate_in_line_40">
								컬러
							</div>
							<div class="main_body_user_cate_in_line_41"></div>
							<div class="main_body_user_cate_in_line_42"></div>
							<div class="main_body_user_cate_in_line_50">
									<button class="user_cate_btn_50_1">
									<img src="./resources/img/produc_info/컬러_흰색.png">
								</button>
								<button class="user_cate_btn_50_2">
									<img src="./resources/img/produc_info/컬러_검은색.png">
								</button>
								<button class="user_cate_btn_50_3">
									<img src="./resources/img/produc_info/컬러_빨간색.png">
								</button>
								<button class="user_cate_btn_50_4">
									<img src="./resources/img/produc_info/컬러_주황색.png">
								</button>
								<button class="user_cate_btn_50_5">
									<img src="./resources/img/produc_info/컬러_노란색.png">
								</button>
								<button class="user_cate_btn_50_6">
									<img src="./resources/img/produc_info/컬러_연두색.png">
									</button>
								<button class="user_cate_btn_50_7">
									<img src="./resources/img/produc_info/컬러_초록색.png">
								</button>
								<button class="user_cate_btn_50_8">
									<img src="./resources/img/produc_info/컬러_청록색.png">
								</button>
								<button class="user_cate_btn_50_9">
									<img src="./resources/img/produc_info/컬러_하늘색.png">
								</button>
								<button class="user_cate_btn_50_10">
									<img src="./resources/img/produc_info/컬러_파란색.png">
								</button>
								<button class="user_cate_btn_50_11">
									<img src="./resources/img/produc_info/컬러_남색.png">
								</button>
								<button class="user_cate_btn_50_12">
									<img src="./resources/img/produc_info/컬러_보라색.png">
								</button>
							</div>
							
								<!-- 패턴 -->
							<div  class="main_body_user_cate_in_line_60">
								<button class="user_cate_btn_60_1">
									<img src="./resources/img/produc_info/컬러_패턴01.png">
								</button>
								<button class="user_cate_btn_60_2">
									<img src="./resources/img/produc_info/컬러_패턴02.png">
								</button>
							</div>
							
							<!-- 캐릭터 -->
							<div  class="main_body_user_cate_in_line_70">
								<button class="user_cate_btn_70_1">
									<img src="./resources/img/produc_info/컬러_캐릭터01.png">
								</button>
								<button class="user_cate_btn_70_2">
									<img src="./resources/img/produc_info/컬러_캐릭터02.png">
								</button>
								<button class="user_cate_btn_70_3">
									<img src="./resources/img/produc_info/컬러_캐릭터03.png">
								</button>
								<button class="user_cate_btn_70_4">
									<img src="./resources/img/produc_info/컬러_캐릭터04.png">
								</button>
							</div>
							
							
							<!-- 플라워 -->
							<div  class="main_body_user_cate_in_line_80">
								<button class="user_cate_btn_80_1">
									<img src="./resources/img/produc_info/컬러_플라워.png">
								</button>
							</div>
							
							
							<div class="main_body_user_cate_in_line_51"></div>
							<div class="main_body_user_cate_in_line_52">
								<button class="user_cate_basket">
									<img src="./resources/img/produc_info/장바구니.png">
								</button>
								<button class="user_cate_sell">
									<img src="./resources/img/produc_info/구매.png">
								</button>
							</div>
						</div>
					</div>
	
				</div>
			</div>
			</c:if>
			<div class="product_info_main_manager">
			<c:if test="${customer.sortation eq 'admin'}">
				<div class="info_main_body_manager">
					<div class="info_main_body_manager_tite">
						도면 정보
					</div>
					<div class="info_main_body_manager_cate">
						<div class="main_user_cate_slide">
							<div class="slide_left">
								<a class="slide_left_prev" onclick="moveSlides(-1)">&#10094;</a>
							</div>
							
							<c:choose>
					<c:when test="${param.product eq '베개'}">
								<div class="slide_midlle">
								<div class="slideitem fade">
									<div><img src="./resources/drawing/20220629_베개.png"></div>
								</div>
								<div class="slideitem fade">
									<div><img src="./resources/drawing/20220629_베개2.png"></div>
								</div>
								<div class="slideitem fade">
									<div><img src="./resources/drawing/20220629_베개3.png"></div>
								</div>
								<div class="slideitem fade">
									<div><img src="./resources/drawing/20220629_베개4.png"></div>
								</div>
							</div>
							<div class="slide_right">
								<a class="slide_right_next" onclick="moveSlides(1)">&#10095;</a>
							</div>
						</div>
						<div class="slide_bottom">
							<div class="slide_bot_left">

							</div>
							<div class = "slide_dot">
								<span class="dot" onclick="currentSlide(0)"><img src="./resources/drawing/20220629_베개.png"></span>
								<span class="dot" onclick="currentSlide(1)"><img src="./resources/drawing/20220629_베개2.png"></span>
								<span class="dot" onclick="currentSlide(2)"><img src="./resources/drawing/20220629_베개3.png"></span>
								<span class="dot" onclick="currentSlide(3)"><img src="./resources/drawing/20220629_베개4.png"></span>
							</div>
					
					</c:when>
					<c:when test="${param.product eq '매트'}">
												<div class="slide_midlle">
								<div class="slideitem fade">
									<div><img src="./resources/drawing/20220628_놀이매트.png"></div>
								</div>
								<div class="slideitem fade">
									<div><img src="./resources/drawing/20220628_놀이매트2.png"></div>
								</div>
								<div class="slideitem fade">
									<div><img src="./resources/drawing/20220628_놀이매트3.png"></div>
								</div>
								<div class="slideitem fade">
									<div><img src="./resources/drawing/20220628_놀이매트4.png"></div>
								</div>
							</div>
							<div class="slide_right">
								<a class="slide_right_next" onclick="moveSlides(1)">&#10095;</a>
							</div>
						</div>
						<div class="slide_bottom">
							<div class="slide_bot_left">

							</div>
							<div class = "slide_dot">
								<span class="dot" onclick="currentSlide(0)"><img src="./resources/drawing/20220628_놀이매트.png"></span>
								<span class="dot" onclick="currentSlide(1)"><img src="./resources/drawing/20220628_놀이매트2.png"></span>
								<span class="dot" onclick="currentSlide(2)"><img src="./resources/drawing/20220628_놀이매트3.png"></span>
								<span class="dot" onclick="currentSlide(3)"><img src="./resources/drawing/20220628_놀이매트4.png"></span>
							</div>
					
					
					</c:when>
					<c:when test="${param.product eq '블랭킷'}">
						<div class="slide_midlle">
						<div class="slideitem fade">
							<div><img src="./resources/drawing/20220624_차렵이불1.png"></div>
						</div>
						<div class="slideitem fade">
							<div><img src="./resources/drawing/20220624_차렵이불2.png"></div>
						</div>
						<div class="slideitem fade">
							<div><img src="./resources/drawing/20220624_차렵이불3.png"></div>
						</div>
						<div class="slideitem fade">
							<div><img src="./resources/drawing/20220624_차렵이불4.png"></div>
						</div>
					</div>
					<div class="slide_right">
						<a class="slide_right_next" onclick="moveSlides(1)">&#10095;</a>
					</div>
					</div>
					<div class="slide_bottom">
						<div class="slide_bot_left">

						</div>
						<div class = "slide_dot">
							<span class="dot" onclick="currentSlide(0)"><img src="./resources/drawing/20220624_차렵이불1.png"></span>
							<span class="dot" onclick="currentSlide(1)"><img src="./resources/drawing/20220624_차렵이불2.png"></span>
							<span class="dot" onclick="currentSlide(2)"><img src="./resources/drawing/20220624_차렵이불3.png"></span>
							<span class="dot" onclick="currentSlide(3)"><img src="./resources/drawing/20220624_차렵이불4.png"></span>
						</div>


				</c:when>
				<c:when test="${param.product eq '범퍼침대'}">
					<div class="slide_midlle">
					<div class="slideitem fade">
						<div><img src="./resources/drawing/20220704_범퍼침대확장1.png"></div>
					</div>
					<div class="slideitem fade">
						<div><img src="./resources/drawing/20220704_범퍼침대확장2.png"></div>
					</div>
					<div class="slideitem fade">
						<div><img src="./resources/drawing/20220704_범퍼침대확장3.png"></div>
					</div>
					<div class="slideitem fade">
						<div><img src="./resources/drawing/20220704_범퍼침대확장4.png"></div>
					</div>
				</div>
				<div class="slide_right">
					<a class="slide_right_next" onclick="moveSlides(1)">&#10095;</a>
					</div>
				</div>
				<div class="slide_bottom">
					<div class="slide_bot_left">

					</div>
					<div class = "slide_dot">
						<span class="dot" onclick="currentSlide(0)"><img src="./resources/drawing/20220704_범퍼침대확장1.png"></span>
						<span class="dot" onclick="currentSlide(1)"><img src="./resources/drawing/20220704_범퍼침대확장2.png"></span>
						<span class="dot" onclick="currentSlide(2)"><img src="./resources/drawing/20220704_범퍼침대확장3.png"></span>
						<span class="dot" onclick="currentSlide(3)"><img src="./resources/drawing/20220704_범퍼침대확장4.png"></span>
					</div>


			</c:when>
				</c:choose>
							

							
							<div class="slide_bot_right">
								<button class="print_btn">
									<img src="./resources/img/produc_info/인쇄.png">
								</button>
								<button class="save_btn">
									<img src="./resources/img/produc_info/저장.png">
								</button>
							</div>
						</div>

					</div>
				</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
<script>
    // 제조사 상품 페이지 슬라이드쇼 //
    var slideIndex = 0; //slide index
        // HTML 로드가 끝난 후 동작
        window.onload=function(){
        showSlides(slideIndex);

        // Auto Move Slide
        var sec = 3000;
        setInterval(function(){
            slideIndex++;
            showSlides(slideIndex);

        }, sec);
        }

        // Next/previous controls
        function moveSlides(n) {
        slideIndex = slideIndex + n
        showSlides(slideIndex);
        }
        // Thumbnail image controls
        function currentSlide(n) {
        slideIndex = n;
        showSlides(slideIndex);
        }

        function showSlides(n) {

        var slides = document.getElementsByClassName("slideitem");
        var dots = document.getElementsByClassName("dot");
        var size = slides.length;

        if ((n+1) > size) {
            slideIndex = 0; n = 0;
        }else if (n < 0) {
            slideIndex = (size-1);
            n = (size-1);
        }

        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }

        slides[n].style.display = "block";
        dots[n].className += " active";
        }
</script>
<script type="text/javascript">
/* 원단 변수 */	
var a = 0;
/* 충전 변수 */
var b = 0;
/* 무늬 변수 */
var c = 0;
/* 마감 변수 */
var d = 0;
/* 컬러 변수 */
var color = 0;
/* 패턴 변수 */
var pat = 0;
/* 캐릭터 변수 */
var cha = 0;
/* 플라워 변수 */
var flo = 0;


	$(".main_body_user_cate_in_line_40").text("")
	$(".main_body_user_cate_in_line_60").hide(); // 패턴
	$(".main_body_user_cate_in_line_50").show(); // 단색
	$(".main_body_user_cate_in_line_70").hide(); // 캐릭터
	$(".main_body_user_cate_in_line_80").hide(); // 플라워
	
	// 패턴 클릭
	 $('.user_cate_btn_30_1').click(function() {
		 $(".main_body_user_cate_in_line_40").text("패턴") 
		 $(".main_body_user_cate_in_line_60").show();
		 $(".main_body_user_cate_in_line_50").hide();
		 $(".main_body_user_cate_in_line_70").hide();
		 $(".main_body_user_cate_in_line_80").hide();
	 });
	 
	// 캐릭터 클릭
	 $('.user_cate_btn_30_3').click(function() {

		 $(".main_body_user_cate_in_line_40").text("캐릭터")
		 $(".main_body_user_cate_in_line_70").show();
		 $(".main_body_user_cate_in_line_50").hide();
		 $(".main_body_user_cate_in_line_60").hide();
		 $(".main_body_user_cate_in_line_80").hide();
	 
	 });
	 
	// 플라워 클릭
	 $('.user_cate_btn_30_4').click(function() {
		 $(".main_body_user_cate_in_line_40").text("플라워")
		 $(".main_body_user_cate_in_line_80").show();
		 $(".main_body_user_cate_in_line_50").hide();
		 $(".main_body_user_cate_in_line_60").hide();
		 $(".main_body_user_cate_in_line_70").hide();
	 });
	
	// 딘색 클릭
	 $('.user_cate_btn_30_5').click(function() {
		 $('.slider').slick('setPosition');
		 $(".main_body_user_cate_in_line_40").text("컬러")
		 $(".main_body_user_cate_in_line_50").show();
		 $(".main_body_user_cate_in_line_70").hide();
		 $(".main_body_user_cate_in_line_60").hide();
		 $(".main_body_user_cate_in_line_80").hide();
	 });


/* 원단 */	
$(".user_cate_btn_10_1").click(function() {
		a = 1;
	   $(".user_cate_btn_10_1 img").attr("src", "./resources/img/produc_info/selected/원단_기능성.png");
	   $(".user_cate_btn_10_2 img").attr("src", "./resources/img/produc_info/원단_냉감.png");
	   $(".user_cate_btn_10_3 img").attr("src", "./resources/img/produc_info/원단_매쉬.png");
	   $(".user_cate_btn_10_4 img").attr("src", "./resources/img/produc_info/원단_소재.png");
	   $(".user_cate_btn_10_5 img").attr("src", "./resources/img/produc_info/원단_향균.png");
	});
	
$(".user_cate_btn_10_2").click(function() {
	   a = 2;
	   $(".user_cate_btn_10_2 img").attr("src", "./resources/img/produc_info/selected/원단_냉감.png");
	   $(".user_cate_btn_10_1 img").attr("src", "./resources/img/produc_info/원단_기능성.png");
	   $(".user_cate_btn_10_3 img").attr("src", "./resources/img/produc_info/원단_매쉬.png");
	   $(".user_cate_btn_10_4 img").attr("src", "./resources/img/produc_info/원단_소재.png");
	   $(".user_cate_btn_10_5 img").attr("src", "./resources/img/produc_info/원단_향균.png");
	});
$(".user_cate_btn_10_3").click(function() {
		a = 3;
	   $(".user_cate_btn_10_3 img").attr("src", "./resources/img/produc_info/selected/원단_매쉬.png");
	   $(".user_cate_btn_10_2 img").attr("src", "./resources/img/produc_info/원단_냉감.png");
	   $(".user_cate_btn_10_1 img").attr("src", "./resources/img/produc_info/원단_기능성.png");
	   $(".user_cate_btn_10_4 img").attr("src", "./resources/img/produc_info/원단_소재.png");
	   $(".user_cate_btn_10_5 img").attr("src", "./resources/img/produc_info/원단_향균.png");
	});
$(".user_cate_btn_10_4").click(function() {
	a = 4;
	   $(".user_cate_btn_10_4 img").attr("src", "./resources/img/produc_info/selected/원단_소재.png");
	   $(".user_cate_btn_10_2 img").attr("src", "./resources/img/produc_info/원단_냉감.png");
	   $(".user_cate_btn_10_1 img").attr("src", "./resources/img/produc_info/원단_기능성.png");
	   $(".user_cate_btn_10_3 img").attr("src", "./resources/img/produc_info/원단_매쉬.png");
	   $(".user_cate_btn_10_5 img").attr("src", "./resources/img/produc_info/원단_향균.png");
	});
$(".user_cate_btn_10_5").click(function() {
	a = 5;
	   $(".user_cate_btn_10_5 img").attr("src", "./resources/img/produc_info/selected/원단_향균.png");
	   $(".user_cate_btn_10_2 img").attr("src", "./resources/img/produc_info/원단_냉감.png");
	   $(".user_cate_btn_10_1 img").attr("src", "./resources/img/produc_info/원단_기능성.png");
	   $(".user_cate_btn_10_4 img").attr("src", "./resources/img/produc_info/원단_소재.png");
	   $(".user_cate_btn_10_3 img").attr("src", "./resources/img/produc_info/원단_매쉬.png");
	});

/* 무늬 */	
$(".user_cate_btn_30_1").click(function() {
	 c = 1;
	   $(".user_cate_btn_30_1 img").attr("src", "./resources/img/produc_info/selected/무늬_패턴.png");
	   $(".user_cate_btn_30_2 img").attr("src", "./resources/img/produc_info/무늬_레이스.png");
	   $(".user_cate_btn_30_3 img").attr("src", "./resources/img/produc_info/무늬_캐릭터.png");
	   $(".user_cate_btn_30_4 img").attr("src", "./resources/img/produc_info/무늬_플라워.png");
	   $(".user_cate_btn_30_5 img").attr("src", "./resources/img/produc_info/무늬_단색.png");
});
	
$(".user_cate_btn_30_2").click(function() {
	 c = 2;
	   $(".user_cate_btn_30_1 img").attr("src", "./resources/img/produc_info/무늬_패턴.png");
	   $(".user_cate_btn_30_2 img").attr("src", "./resources/img/produc_info/selected/무늬_레이스.png");
	   $(".user_cate_btn_30_3 img").attr("src", "./resources/img/produc_info/무늬_캐릭터.png");
	   $(".user_cate_btn_30_4 img").attr("src", "./resources/img/produc_info/무늬_플라워.png");
	   $(".user_cate_btn_30_5 img").attr("src", "./resources/img/produc_info/무늬_단색.png");
	   $(".main_body_user_cate_in_line_40").text("")
	   $(".main_body_user_cate_in_line_60").hide();
		 $(".main_body_user_cate_in_line_50").hide();
		 $(".main_body_user_cate_in_line_70").hide();
		 $(".main_body_user_cate_in_line_80").hide();
		 
});	
$(".user_cate_btn_30_3").click(function() {
	 c = 3;
	   $(".user_cate_btn_30_1 img").attr("src", "./resources/img/produc_info/무늬_패턴.png");
	   $(".user_cate_btn_30_2 img").attr("src", "./resources/img/produc_info/무늬_레이스.png");
	   $(".user_cate_btn_30_3 img").attr("src", "./resources/img/produc_info/selected/무늬_캐릭터.png");
	   $(".user_cate_btn_30_4 img").attr("src", "./resources/img/produc_info/무늬_플라워.png");
	   $(".user_cate_btn_30_5 img").attr("src", "./resources/img/produc_info/무늬_단색.png");
});	
$(".user_cate_btn_30_4").click(function() {
	 c = 4;
	   $(".user_cate_btn_30_1 img").attr("src", "./resources/img/produc_info/무늬_패턴.png");
	   $(".user_cate_btn_30_2 img").attr("src", "./resources/img/produc_info/무늬_레이스.png");
	   $(".user_cate_btn_30_3 img").attr("src", "./resources/img/produc_info/무늬_캐릭터.png");
	   $(".user_cate_btn_30_4 img").attr("src", "./resources/img/produc_info/selected/무늬_플라워.png");
	   $(".user_cate_btn_30_5 img").attr("src", "./resources/img/produc_info/무늬_단색.png");
});	
$(".user_cate_btn_30_5").click(function() {
	 c = 5;
	   $(".user_cate_btn_30_1 img").attr("src", "./resources/img/produc_info/무늬_패턴.png");
	   $(".user_cate_btn_30_2 img").attr("src", "./resources/img/produc_info/무늬_레이스.png");
	   $(".user_cate_btn_30_3 img").attr("src", "./resources/img/produc_info/무늬_캐릭터.png");
	   $(".user_cate_btn_30_4 img").attr("src", "./resources/img/produc_info/무늬_플라워.png");
	   $(".user_cate_btn_30_5 img").attr("src", "./resources/img/produc_info/selected/무늬_단색.png");
});	

/* 컬러 */
$(".user_cate_btn_50_1").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					console.log("here");
					 $(".threeD2").attr("src", "./resources/3d_html/mat_white.html");
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_white.html");
				}
			}
		}
	}
	
	   $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/selected/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/컬러_보라색.png");
	});	
$(".user_cate_btn_50_2").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					 $(".threeD2").attr("src", "./resources/3d_html/mat_black.html");
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_black.html");
				}
			}
		}
	}
	   $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/selected/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/컬러_보라색.png");
	});	
$(".user_cate_btn_50_3").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					 $(".threeD2").attr("src", "./resources/3d_html/mat_red.html");
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_red.html");
				}
			}
		}
	}
	 $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/selected/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/컬러_보라색.png");
	});	
$(".user_cate_btn_50_4").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					 $(".threeD2").attr("src", "./resources/3d_html/mat_orange.html");
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_orange.html");
				}
			}
		}
	}
	   $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/selected/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/컬러_보라색.png");
	   
	});	
$(".user_cate_btn_50_5").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					 $(".threeD2").attr("src", "./resources/3d_html/mat_yellow.html");
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_yellow.html");
				}
			}
		}
	}
	 $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/selected/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/컬러_보라색.png");
	});	
	
$(".user_cate_btn_50_6").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					 $(".threeD2").attr("src", "./resources/3d_html/mat_light_green.html");
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_light_green.html");
				}
			}
		}
	}
	   $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/selected/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/컬러_보라색.png");
	});	
$(".user_cate_btn_50_7").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					 $(".threeD2").attr("src", "./resources/3d_html/mat_green.html");
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_green.html");
				}
			}
		}
	}
	
	 $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/selected/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/컬러_보라색.png");
	});	
$(".user_cate_btn_50_8").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_turquoise.html");
				}
			}
		}
	}
	 $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/selected/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/컬러_보라색.png");
});

$(".user_cate_btn_50_9").click(function() {
	
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					 $(".threeD2").attr("src", "./resources/3d_html/mat_sky.html");
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_sky.html");
				}
			}
		}
	}
	 $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/selected/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/컬러_보라색.png");
});

$(".user_cate_btn_50_10").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					 $(".threeD2").attr("src", "./resources/3d_html/mat_blue.html");
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_blue.html");
				}
			}
		}
	}
	 $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/selected/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/컬러_보라색.png");
	});

$(".user_cate_btn_50_11").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_indigo_blue.html");
				}
			}
		}
	}
	 $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/selected/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/컬러_보라색.png");
	});

$(".user_cate_btn_50_12").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			if(b>0){
				if(d>0){
					 $(".threeD2").attr("src", "./resources/3d_html/mat_violet.html");
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_violet.html");
				}
			}
		}
	}
	 $(".user_cate_btn_50_1 img").attr("src", "./resources/img/produc_info/컬러_흰색.png");
	   $(".user_cate_btn_50_2 img").attr("src", "./resources/img/produc_info/컬러_검은색.png");
	   $(".user_cate_btn_50_3 img").attr("src", "./resources/img/produc_info/컬러_빨간색.png");
	   $(".user_cate_btn_50_4 img").attr("src", "./resources/img/produc_info/컬러_주황색.png");
	   $(".user_cate_btn_50_5 img").attr("src", "./resources/img/produc_info/컬러_노란색.png");
	   $(".user_cate_btn_50_6 img").attr("src", "./resources/img/produc_info/컬러_연두색.png");
	   $(".user_cate_btn_50_7 img").attr("src", "./resources/img/produc_info/컬러_초록색.png");
	   $(".user_cate_btn_50_8 img").attr("src", "./resources/img/produc_info/컬러_청록색.png");
	   $(".user_cate_btn_50_9 img").attr("src", "./resources/img/produc_info/컬러_하늘색.png");
	   $(".user_cate_btn_50_10 img").attr("src", "./resources/img/produc_info/컬러_파란색.png");
	   $(".user_cate_btn_50_11 img").attr("src", "./resources/img/produc_info/컬러_남색.png");
	   $(".user_cate_btn_50_12 img").attr("src", "./resources/img/produc_info/selected/컬러_보라색.png");
});

$(".user_cate_btn_12_1").click(function() {
	b = 1;
	   $(".user_cate_btn_12_1 img").attr("src", "./resources/img/produc_info/selected/충전_매쉬.png");
	   $(".user_cate_btn_12_2 img").attr("src", "./resources/img/produc_info/충전_메모리폼.png");
	   $(".user_cate_btn_12_3 img").attr("src", "./resources/img/produc_info/충전_솜.png");
	});
$(".user_cate_btn_12_2").click(function() {
	b=2;
	   $(".user_cate_btn_12_1 img").attr("src", "./resources/img/produc_info/충전_매쉬.png");
	   $(".user_cate_btn_12_2 img").attr("src", "./resources/img/produc_info/selected/충전_메모리폼.png");
	   $(".user_cate_btn_12_3 img").attr("src", "./resources/img/produc_info/충전_솜.png");
	});	
$(".user_cate_btn_12_3").click(function() {
	b=3;
	   $(".user_cate_btn_12_1 img").attr("src", "./resources/img/produc_info/충전_매쉬.png");
	   $(".user_cate_btn_12_2 img").attr("src", "./resources/img/produc_info/충전_메모리폼.png");
	   $(".user_cate_btn_12_3 img").attr("src", "./resources/img/produc_info/selected/충전_솜.png");
	});

/* 마감 */
$(".user_cate_btn_32_1").click(function() {
	d=1;
	   $(".user_cate_btn_32_1 img").attr("src", "./resources/img/produc_info/selected/마감_통솔처리.png");
	   $(".user_cate_btn_32_2 img").attr("src", "./resources/img/produc_info/마감_쌈솔처리.png");
	});
$(".user_cate_btn_32_2").click(function() {
	d=2;
	   $(".user_cate_btn_32_1 img").attr("src", "./resources/img/produc_info/마감_통솔처리.png");
	   $(".user_cate_btn_32_2 img").attr("src", "./resources/img/produc_info/selected/마감_쌈솔처리.png");
	});

/* 캐릭터 */
$(".user_cate_btn_70_1").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
			if(b>0){
				if(d>0){
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_character_bear.html");
				}
			}
		}else if(c == 4){
		}else if(c == 5){
		}
	}
	   $(".user_cate_btn_70_1 img").attr("src", "./resources/img/produc_info/selected/컬러_캐릭터01.png");
	   $(".user_cate_btn_70_2 img").attr("src", "./resources/img/produc_info/컬러_캐릭터02.png");
	   $(".user_cate_btn_70_3 img").attr("src", "./resources/img/produc_info/컬러_캐릭터03.png");
	   $(".user_cate_btn_70_4 img").attr("src", "./resources/img/produc_info/컬러_캐릭터04.png");
	});
$(".user_cate_btn_70_2").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
			if(b>0){
				if(d>0){
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_design02.html");
				}
			}
		}else if(c == 4){
		}else if(c == 5){
		}
	}
	   $(".user_cate_btn_70_1 img").attr("src", "./resources/img/produc_info/컬러_캐릭터01.png");
	   $(".user_cate_btn_70_2 img").attr("src", "./resources/img/produc_info/selected/컬러_캐릭터02.png");
	   $(".user_cate_btn_70_3 img").attr("src", "./resources/img/produc_info/컬러_캐릭터03.png");
	   $(".user_cate_btn_70_4 img").attr("src", "./resources/img/produc_info/컬러_캐릭터04.png");
	});
$(".user_cate_btn_70_3").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
			if(b>0){
				if(d>0){
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_design01.html");
				}
			}
		}else if(c == 4){
		}else if(c == 5){
		}
	}
	   $(".user_cate_btn_70_1 img").attr("src", "./resources/img/produc_info/컬러_캐릭터01.png");
	   $(".user_cate_btn_70_2 img").attr("src", "./resources/img/produc_info/컬러_캐릭터02.png");
	   $(".user_cate_btn_70_3 img").attr("src", "./resources/img/produc_info/selected/컬러_캐릭터03.png");
	   $(".user_cate_btn_70_4 img").attr("src", "./resources/img/produc_info/컬러_캐릭터04.png");
	});
$(".user_cate_btn_70_4").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
			if(b>0){
				if(d>0){
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_design03.html");
				}
			}
		}else if(c == 4){
		}else if(c == 5){
		}
	}
	   $(".user_cate_btn_70_1 img").attr("src", "./resources/img/produc_info/컬러_캐릭터01.png");
	   $(".user_cate_btn_70_2 img").attr("src", "./resources/img/produc_info/컬러_캐릭터02.png");
	   $(".user_cate_btn_70_3 img").attr("src", "./resources/img/produc_info/컬러_캐릭터03.png");
	   $(".user_cate_btn_70_4 img").attr("src", "./resources/img/produc_info/selected/컬러_캐릭터04.png");
	});

/* 플라워 */
$(".user_cate_btn_80_1").click(function() {
	if (a == 3){
		if (c == 1){
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
			if(b>0){
				if(d>0){
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_flower.html");
				}
			}
		}else if(c == 5){
			
		}
	}
	   $(".user_cate_btn_80_1 img").attr("src", "./resources/img/produc_info/selected/컬러_플라워.png");
	});

/* 패턴 */
$(".user_cate_btn_60_1").click(function() {
	if (a == 3){
		if (c == 1){
			if(b>0){
				if(d>0){
					 $(".threeD2").attr("src", "./resources/3d_html/mat_check_black.html");
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_check_black.html");
				}
			}
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			
		}
	}
	   $(".user_cate_btn_60_1 img").attr("src", "./resources/img/produc_info/selected/컬러_패턴01.png");
	   $(".user_cate_btn_60_2 img").attr("src", "./resources/img/produc_info/컬러_패턴02.png");
	});
$(".user_cate_btn_60_2").click(function() {
	if (a == 3){
		if (c == 1){
			if(b>0){
				if(d>0){
					 $(".threeD1").attr("src", "./resources/3d_html/pillow_check_yellow.html");
				}
			}
		}else if(c == 2){
		}else if(c == 3){
		}else if(c == 4){
		}else if(c == 5){
			
		}
	}
	   $(".user_cate_btn_60_1 img").attr("src", "./resources/img/produc_info/컬러_패턴01.png");
	   $(".user_cate_btn_60_2 img").attr("src", "./resources/img/produc_info/selected/컬러_패턴02.png");
	});
	

	
</script>

</html>