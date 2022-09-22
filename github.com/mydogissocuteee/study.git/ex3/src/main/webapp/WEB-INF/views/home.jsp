<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	비비엔다 배송조회
</h1>

        <form action="http://info.sweettracker.co.kr/tracking/5" method="post">
            <div class="form-group">
              <label for="t_key">API key</label>
              <input type="text" class="form-control" id="t_key" name="t_key" placeholder="제공받은 APIKEY">
            </div>
            <div class="form-group">
              <label for="t_code">택배사 코드</label>
              <input type="text" class="form-control" name="t_code" id="t_code" placeholder="택배사 코드">
            </div>
            <div class="form-group">
              <label for="t_invoice">운송장 번호</label>
              <input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호">
            </div>
            <button type="submit" class="btn btn-default">조회하기</button>
        </form>
        
        <!-- xml 가져오기 -->
        <div><h1>영화데이터 가져오기</h1>

    <button onclick="getData()">정보가져오기</button>

    <script>
        function getData(){
            $.ajax({
                // 1. 어디랑 통신 할건지 url
                url:"https://info.sweettracker.co.kr/api/v1/trackingInfo?t_key=RYGUeWCvAxYjySIJEkk22A&t_code=04&t_invoice=650951690445",
                		
                // 2. 성공시 실행할 로직
                success : function(data){
                    // 성공시 받아온 데이터는 매개변수에 자동으로 담긴다

                    // ajax는 통신하는 과정이 보이지 않기 때문에
                    // 꼭 alert 넣어서 확인 해준다!!
                    alert("통신 성공")
                    console.log(data)

                },

                // 3. 실패시 실행할 로직
                error:function(){
                    alert("통신 실패")
                }
            })
        }

    </script>
    </div>
</body>
</html>
