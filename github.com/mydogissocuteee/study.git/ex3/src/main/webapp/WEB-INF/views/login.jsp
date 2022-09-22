<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>슬기로운 BB 플랫폼</title>
    <link rel="stylesheet" href="./resources/css/login.css" type="text/css">
</head>
<body>
    <div class="login_logo">
        <img src="./resources/img/loginpage/로그인_로고.png">

    </div>
    <form action="login.do">
    <div class="login_form">
        <div class="login_top">
            LOGIN
        </div>
        <input type="text" class="login" placeholder="아이디" name="id">
        <input type="text" class="password" placeholder="비밀번호" name="pw">
        <div class="detail">
            <input type="checkbox"><a class="id_save">아이디저장</a>
            <a class="id_pass_find">아이디/비밀번호 찾기</a>
            <a href="joinjsp.do" class="sign">회원가입</a>
        </div>
        <div><button class="login_button">
            <img src="./resources/img/loginpage/로그인_버튼.png">
        </button></div>

    </div>
</form>
</body>
</html>