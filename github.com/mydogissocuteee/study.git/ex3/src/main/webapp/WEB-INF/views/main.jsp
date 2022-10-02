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
    <link rel="icon" href="./resources/img/trend_analysis/그림3.png">
    <link rel="stylesheet" href="./resources/css/main.css" type="text/css">
            <!-- 모달 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
       <!--  chart.js-->
	<script type="text/javascript" charset="utf-8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
 	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<script>
    /* 메인페이지 모달 팝업창 */
    function user_btn(){
        $(".user_input_modal_window").fadeIn();
    }

    function main_btnclose_X(){
        $(".user_input_modal_window").fadeOut();
    }
</script>
<body>
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
        <div class = "header_01">
            <button class="user_btn" id="user_btn" onclick="user_btn()">
                <img src="./resources/img/mainpage/사용자.png">
            </button>
             <c:choose>
					<c:when test="${customer.sortation eq 'user'}"><a href="profilejsp.do">${customer.name }님, 안녕하세요</a></c:when>
					<c:when test="${customer.sortation eq 'admin'}"><a href="product_managejsp.do">${customer.name }님, 안녕하세요</a></c:when>
			 </c:choose>
        </div>
        <div class = "header_02">
            <img src="./resources/img/mainpage/그림2.png">
        </div>
        <div class = "header_03">
            <input type="text">
            <button><img src="./resources/img/mainpage/검색.png"></button>
        </div>
    </header>
    <div class="main">
    <c:if test="${customer.sortation eq 'user'}">
        <div class="slide">
            <div class="left">
                <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
            </div>
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <img src="./resources/img/mainpage/front_01.jpg" style="width:100%">
                </div>
                <div class="mySlides fade">
                    <img src="./resources/img/mainpage/front_02.jpg" style="width:100%">
                </div>
                <div class="mySlides fade">
                    <img src="./resources/img/mainpage/front_03.jpg" style="width:100%">
                </div>
                <div class="mySlides fade">
                    <img src="./resources/img/mainpage/front_04.jpg" style="width:100%">
                </div>
                <div class="mySlides fade">
                    <img src="./resources/img/mainpage/front_05.jpg" style="width:100%">
                </div>
                <div class="dot_collec" style="text-align:center">
                    <span class="dot" onclick="currentSlide(0)"></span>
                    <span class="dot" onclick="currentSlide(1)"></span>
                    <span class="dot" onclick="currentSlide(2)"></span>
                    <span class="dot" onclick="currentSlide(3)"></span>
                    <span class="dot" onclick="currentSlide(4)"></span>
                </div>
            </div>
            <div class="right">
                <a class="next" onclick="moveSlides(1)">&#10095;</a>
            </div>
        </div>
        </c:if>
        <div class="product_cate">
            <div class="product_cate_txt">
                <a>상품 카테고리</a>
            </div>
            <div class="product_cate_btn">
                <button onclick="location.href='product_infojsp.do?product=베개'" class="cate_pillow_btn">
                    <img src="./resources/img/mainpage/cate_베개.png">
                </button>
                <button onclick="location.href='product_infojsp.do?product=매트'" class="cate_mat_btn">
                    <img src="./resources/img/mainpage/cate_매트.png">
                </button>
                <button onclick="location.href='product_infojsp.do?product=블랭킷'" class="cate_blanket_btn">
                    <img src="./resources/img/mainpage/cate_블랭킷.png">
                </button>
                <button onclick="location.href='product_infojsp.do?product=범퍼침대'" class="cate_bed_btn">
                    <img src="./resources/img/mainpage/cate_범퍼침대.png">
                </button>
                <button onclick="location.href='product_infojsp.do?product=신생아용품'" class="cate_etc_btn">
                    <img src="./resources/img/mainpage/cate_신생아용품.png">
                </button>
            </div>
        </div>
        <div class="product_best">
            <div class="product_best_txt">
                <a>현재 인기 상품</a>
            </div>
            <button class="product_best_analysis" onclick="location.href='trend_analysisjsp.do'">
                <img src="./resources/img/mainpage/트렌드분석.png">
            </button>
            <div class="product_best_btn">
                <button class="product_best01_btn">
                    <img src="./resources/img/mainpage/best_01.png">
                </button>
                <button class="product_best02_btn">
                    <img src="./resources/img/mainpage/best_02.png">
                </button>
                <button class="product_best03_btn">
                    <img src="./resources/img/mainpage/best_03.png">
                </button>
                <button class="product_best04_btn">
                    <img src="./resources/img/mainpage/best_04.png">
                </button>
                <button class="product_best05_btn">
                    <img src="./resources/img/mainpage/best_05.png">
                </button>
            </div>
        </div>
        <div class="company_best">
            <div class="company_best_txt">
                <a>실시간 제조사 순위</a>
            </div>
            <button class="company_best_detail_Btn" onclick="location.href='manufacturer_rankjsp.do'">
                  <img src="./resources/img/mainpage/company_detail_best.png">
            </button>
           <div class="company_best_btn">
                <button class="company_best01_btn"  type="button" data-toggle="modal" href="#customerInfo_Modal">
                    <img src="./resources/img/mainpage/비비엔다.png">
                </button>
                <button class="company_best02_btn">
                    <img src="./resources/img/mainpage/포그니.png">
                </button>
                <button class="company_best03_btn">
                    <img src="./resources/img/mainpage/그룹순위3.png">
                </button>
                <button class="company_best04_btn">
                    <img src="./resources/img/mainpage/그룹순위4.png">
                </button>
                <button class="company_best05_btn">
                    <img src="./resources/img/mainpage/그룹순위5.png">
                </button>
            </div>
        </div>
        <footer class="bb_information">
            <table class="bb_information_tb">
                <caption>(주)비비엔다</caption>
                <tr>
                    <th>OWNER</th>
                    <td>민남희</td>
                    <th>CUSTOMER CENTER</th>
                    <td>AM 10:00~ PM 04:30</td>
                </tr>
                <tr>
                    <th>TEL</th>
                    <td>070-8656-8900</td>
                    <th></th>
                    <td>주일/공휴일 휴무</td>
                </tr>
                <tr>
                    <th>ADDRESS</th>
                    <td>광주광역시 북구 어매마을길 31-1(매곡동)(우:61059)</td>
                    <th>BANKKING</th>
                    <td>기업 298-100741-01-015</td>
                </tr>
                <tr>
                    <th>E-MAIL</th>
                    <td>qlql0049@naver.com</td>
                    <th></th>
                    <td>예금주 (주)비비엔다</td>
                </tr>
            </table>
        </footer>
        <div class="modal" id="customerInfo_Modal" style="display:none">
    <div class="modal_body">
     <button type="button" class="close" data-dismiss="modal">X</button>
		<div><h3 class="modal_head">제조사 정보</h3></div>
		<div class="modal_content">
		<div class="modal_produc">
		</div>
        <table class="customerInfo_tb">
        <tr>
        		<td rowspan="2" style="border:none"><div><img src="resources/img/customer_info/비비엔다.png" class="비비엔다"   ></div></td>
        		<th>제조사명</th>
        		<td>(주)비비엔다</td>
        	</tr>
        	<tr>
        		<th>고객센터</th>
        		<td>070-8656-8900</td>
        	</tr>
        	<tr>
        		<th>주소</th>
        		<td colspan="2">광주광역시 북구 어매마을길 31-1(매곡동) (우:61059)</td>
        	</tr>
        	<tr>
        		<th>이메일</th>
        		<td colspan="2">qlql0049@naver.com</td>
        	</tr>
        	<tr>
        		<th>홈페이지</th>
        		<td colspan="2"><div class="add_1">www.vivienda.co.kr</div> <div class="add_2"><img class="go_btn" src="resources/img/customer_info/바로가기.png" alt="바로가기"></div></td>
        	</tr>
        </table>
        
        <div style="margin-top: 1vh;">
        <img class="customer_head" src="resources/img/customer_info/실시간고객매칭.png" alt="실시간 고객 매칭">
        <div class="customer_div">
	      	<table class="customer_tb">
		       	<tr>
		       		<td>
		       		<div class="customerImg_div">
      		     		<div><img class="user_Img" src="resources/img/customer_info/modal_사용자.png" alt="실시간 고객 매칭"></div>
      		     		<div><img class="vip_text" src="resources/img/customer_info/VIP.png" alt="VIP"></div>
      		     		<div><a class="customer_name">김민지</a></div>
      		     	</div>
      		     	</td>
      		     	<td>
      		     		<div class="customerImg_div">
	      		     		<div><img class="user_Img"  src="resources/img/customer_info/modal_사용자.png" alt="실시간 고객 매칭"></div>
	      		     		<div><img class="new_text" src="resources/img/customer_info/NEW.png" alt="NEW"></div>
	      		     		<div><a class="customer_name">황광희</a></div>
      		     		</div>
      		     	</td>
      		     	<td>
      		     		<div class="customerImg_div">
	      		     		<div><img class="user_Img"  src="resources/img/customer_info/modal_사용자.png" alt="실시간 고객 매칭"></div>
	      		     		<div><img class="normal_text" src="resources/img/customer_info/일반.png" alt="일반"></div>
	      		     		<div><a class="customer_name">유재석</a></div>
      		     		</div>
      		     	</td>
      		     	<td>
      		     		<div class="customerImg_div">
	      		     		<div><img class="user_Img" src="resources/img/customer_info/modal_사용자.png" alt="실시간 고객 매칭"></div>
	      		     		<div><img class="normal_text" src="resources/img/customer_info/일반.png" alt="일반"></div>
	      		     		<div><a class="customer_name">이효리</a></div>
      		     		</div>
      		     	</td>
      		     	<td>
      		     		<div class="customerImg_div">
	      		     		<div><img class="user_Img" src="resources/img/customer_info/modal_사용자.png" alt="실시간 고객 매칭"></div>
	      		     		<div><img class="normal_text" src="resources/img/customer_info/일반.png" alt="일반"></div>
	      		     		<div><a class="customer_name">이상순</a></div>
      		     		</div>
      		     	</td>
      		     	<td>
      		     		<div class="customerImg_div">
	      		     		<div><img class="user_Img" src="resources/img/customer_info/modal_사용자.png" alt="실시간 고객 매칭"></div>
	      		     		<div><img class="normal_text" src="resources/img/customer_info/일반.png" alt="일반"></div>
	      		     		<div><a class="customer_name">박명수</a></div>
      		     		</div>
      		     	</td>
                       <td>
                        <div class="customerImg_div">
                            <div><img class="user_Img" src="resources/img/customer_info/modal_사용자.png" alt="실시간 고객 매칭"></div>
                            <div><img class="normal_text" src="resources/img/customer_info/일반.png" alt="일반"></div>
                            <div><a class="customer_name">정준하</a></div>
                        </div>
                    </td>
                    <td>
                        <div class="customerImg_div">
                            <div><img class="user_Img" src="resources/img/customer_info/modal_사용자.png" alt="실시간 고객 매칭"></div>
                            <div><img class="normal_text" src="resources/img/customer_info/일반.png" alt="일반"></div>
                            <div><a class="customer_name">하동훈</a></div>
                        </div>
                        <td>
                            <div class="customerImg_div">
                                <div><img class="user_Img" src="resources/img/customer_info/modal_사용자.png" alt="실시간 고객 매칭"></div>
                                <div><img class="normal_text" src="resources/img/customer_info/일반.png" alt="일반"></div>
                                <div><a class="customer_name">정형돈</a></div>
                            </div>
                        </td>
                    </td>
		       	</tr>
	       </table>
        </div>
       </div>
         <div class="review_div">
        <img class="review_head" src="resources/img/customer_info/리뷰만족도1.png" alt="리뷰/만족도">
        <table class="review_tb">
        	<tr>
        		<th colspan="2">평점</th>
        		<th>전체 리뷰수</th>
        		<th>매칭률</th>
        	</tr>
        	<tr>
        		<td class="review_td1">
	        		<span class="star1">★★★★★
						<span class="star_total">★★★★★</span>
					</span>
        		</td>
        		<td>4.7	</td>
        		<td  class="review_td">2,037</td>
        		<td  class="review_td">매칭률</td>
        	</tr>
        	<tr><th colspan="4">평점 비율</th></tr>
        	<tr>
        		<td rowspan="6" colspan="3"  class="review_td">	
       				<div>
						<canvas id="scope-chart"></canvas>
					</div>
				</td>
        		<td  class="review_td">디자인</td>
        	</tr>
        	<tr>
        		<td  class="review_td">
        		<span class="star">★★★★★
        		<span class="star_design">★★★★★</span>
        		</span>
        	</tr>
        	<tr>
        		<td  class="review_td">사이즈</td>
        	</tr>
        	<tr>
        		<td  class="review_td">
	        		<span class="star">★★★★★
						<span class="star_size">★★★★★</span>
					</span>
				</td>
        	</tr>
        	<tr>
        		<td  class="review_td" >재질</td>
        	</tr>
        	<tr>
        		<td  class="review_td">
        			<span class="star">★★★★★
						<span class="star_texture">★★★★★</span>
					</span>
				</td>
        	</tr>
        </table>
        
    </div>
    </div>
</div>
</div>
    </div>
</body>
<script>
    // 메인페이지 슬라이드쇼 //
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

        var slides = document.getElementsByClassName("mySlides");
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

<!-- 모달창 javaScript -->
<script>
 	const ManufacturerInfoModal = document.querySelector('.customerInfo_Modal');
    const btnOpenPopup = document.querySelector('.info_btn');
    const btnClose = document.querySelector('.close');
    
    btnOpenPopup.addEventListener('click', () => {
    	deliveryModal.style.display = 'block';
    });

    btnClose.addEventListener('click', () => {
    	deliveryModal.style.display = 'none';
    }); 

</script>

  <!-- 리뷰/만족도 그래프 -->
	<script type="text/javascript">
	new Chart(document.getElementById("scope-chart"), {
	    type: 'bar',
	    data: {
	      labels: ["5", "4", "3", "2", "1"],
         
	      datasets: [
	        {
	          label: "연령통계",
	          backgroundColor: ["#FFA216", "#999999","#999999","#999999","#999999","#999999"],
	          data: [5000,4007,3200,784,200],
	        },
	      ]
	    },
	    options: {
	     plugins:{
		        	datalabels: {display:false}, // 데이터 값 숨기기
	     }
		        ,
	      legend: { display: false},
   
	      scales: {
		      xAxes: [{
		        gridLines: { 
		          display: false,
		          drawBorder: true,
		        },
		        ticks: {
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
	    }
	});
	</script>
    
    <!-- 별점 -->
    <script>
    	document.querySelector(`.star1 .star_total`).style.width = `${9.7 * 10}%`;
        document.querySelector(`.star .star_design`).style.width = `${9.5 * 10}%`;
        document.querySelector(`.star .star_size`).style.width = `${9.2 * 10}%`;
        document.querySelector(`.star .star_texture`).style.width = `${8.8 * 10}%`;
    </script>
</html>