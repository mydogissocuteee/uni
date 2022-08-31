<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solution U MES</title>
    <link rel="icon" href="./resources/img/favicon.png">
    <script src="jquery-3.6.0.min.js"></script>
    <link rel='stylesheet' type="text/css" href='./resources/css/d.css'/>
</head>
<body>
    <section class="login-form">
        <img src="./resources/img/logo.png" width="100%" height="70px" style="margin-bottom: 50px;"/>
        <form action="loginMes.do" method="post">
            <div class="int-area">
                <input type="text" name="userid" id="userid" autocomplete="off" required>
                <label for="id">아이디를 입력해주세요</label>
            </div>
            <div class="int-area">
                <input type="password" name="userpw" id="userpw" autocomplete="off" required>
                <label for="pw">비밀번호를 입력해주세요</label>
            </div>
            <div class="btn-area">
                <button id="btn" type="submit">로그인</button>
            </div>
        </form>
        <div class="caption">
            <a href="">계정을 잊어버리셨나요?</a>
        </div>
    </section>    

    <script>
        let id=$('#id');
        let pw=$('#pw');
        let btn=$('#btn');

        $(btn).on('click', function() {
            if($(id).val() == "") {
                $(id).next('label').addClass('warning');
                setTimeout(function(){
                    $('label').removeClass('warning')
                },1500);
            }
            else if($(pw).val() == "") {
                $(pw).next('label').addClass('warning');
                setTimeout(function(){
                    $('label').removeClass('warning')
                },1500);
            }
        });
    </script>

</body>
</html>