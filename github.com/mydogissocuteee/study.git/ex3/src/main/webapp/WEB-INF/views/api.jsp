<?xml version='1.0' encoding='utf-8'?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><button onclick="loadData()">api 가져오기</button></h1>
<script>

function loadData(){
	 $.ajax({
	        url:'api.do',
	        type : 'get',
	        success :  function(data){
	            var tracker = data;
	            if (tracker>=3) {
	            alert(tracker);

	            } else if(tracker>=2) {

	            }else if(tracker>=1) {

	            } else {

	            }
	        },
	        error: function(){
	        	alert("안돼여..");
	    	}
	    })	
	
}

</script>
</body>
</html>