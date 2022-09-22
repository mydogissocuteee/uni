<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>슬기로운 BB 플랫폼</title>
    <script src="https://kit.fontawesome.com/036f0eb301.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./resources/css/join.css" type="text/css">
</head>
<body>
    <div class="gongback"></div>
    <div class="join_box">
        <div class="join_box_title">
            WELCOME JOIN US
        </div>
        <table class= "join_table">
            <tr>
                <th>회원구분&nbsp;<i class="fa-solid fa-check"></i>
                </th>
                <td>
                    <button class="check_btn"><img src="./resources/img/joinpage/check_on.png"></button>
                    <a>구매회원</a>&nbsp;&nbsp;&nbsp;
                    <button class="check_btn"><img src="./resources/img/joinpage/check_off.png"></button>
                    <a>제조회사</a>
				</td>
            </tr>
            <tr>
                <th>아이디&nbsp;<i class="fa-solid fa-check"></i>
                </th>
                <td>
                    <input type="text" class="join_in" id="userId" placeholder="영문 소문자/숫자, 4~16자)">
				</td>
            </tr>
            <tr>
                <th>비밀번호&nbsp;<i class="fa-solid fa-check"></i>
                </th>
                <td>
                    <input type="text" class="join_in" id="userpw" placeholder="영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자">
                </td>
            </tr>
            <tr>
                <th>이름&nbsp;<i class="fa-solid fa-check"></i>
                </th>
                <td>
                    <input type="text" class="join_in"  id="username">
				</td>
            </tr>
            <tr>
                <th>주소&nbsp;<i class="fa-solid fa-check"></i>
                </th>
                <td colspan="2">
                    <input type="text" class="join_in" id="userzip">
                    <button class="post_btn"><img src="./resources/img/joinpage/우편번호.png"></button>
				</td>
            </tr>
            <tr>
				<th></th>
				<td colspan="2">
                    <input type="text" class="join_inn" placeholder="도로명주소">
                </td>
			</tr>
			<tr>
				<th></th>
				<td>
                    <input type="text" class="join_in" placeholder="상세주소">
                </td>
                <td>
                    <input type="text" class="join_in" placeholder="참고항목">
                </td>
			</tr>
            <tr>
                <th>일반전화
                </th>
                <td>
                    <input type="text" class="tell" name="tel1"> 
                    -
                    <input type="text" class="tell" name="tel2">
                    -
                    <input type="text" class="tell" name="tel3">
                </td>
            </tr>
            <tr>
                <th>휴대전화&nbsp;<i class="fa-solid fa-check"></i>
                </th>
                <td>
                    <input type="text" class="tell" name="tel1"> 
                    -
                    <input type="text" class="tell" name="tel2">
                    -
                    <input type="text" class="tell" name="tel3">
                </td>
            </tr>
            <tr>
                <th>이메일&nbsp;<i class="fa-solid fa-check"></i>
                </th>
                <td>
                    <input type="text" class="join_in"  id="username">
				</td>
            </tr>
            <tr>
                <th>이메일 수신여부
                </th>
                <td>
                    <button class="check_btn"><img src="./resources/img/joinpage/check_off.png"></button>
                    <a>동의</a>&nbsp;&nbsp;&nbsp;
                    <button class="check_btn"><img src="./resources/img/joinpage/check_on.png"></button>
                    <a>비동의</a>
				</td> 
            </tr>
            <tr>
                <th>생년월일
                </th>
                <td>
                    <input type="text" class="tell" name="tel1" placeholder="년">
                    <a>/</a>
                    <input type="text" class="tell" name="tel2" placeholder="월">
                    <a>/</a>
                    <input type="text" class="tell" name="tel3" placeholder="일">
				</td>
            </tr>
        </table>
        <div class="finish">
            <button class="fin_check"><img src="./resources/img/joinpage/확인.png"></button>
        </div>

    </div>
    
</body>
</html>