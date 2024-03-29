<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/036f0eb301.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./resources/css/mes.css?v=3" type="text/css">
    <title>MES</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://d3js.org/d3.v3.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/036f0eb301.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="./resources/js/m0926.js?ver=1436233245"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script> 
    <script type="text/javascript" src="./resources/js/m0926.js?ver=1436233245"></script>
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>

<body>
    <!-- 기준정보 -> 사용자 관리 : 추가 버튼 모달창-->
    <div class="user_input_modal_window">
        <div class="user_input_modal">
            <div class="user_input_modal_top">
                확인
            </div>
            <div class="user_input_modal_mid">
                사용자가 추가되었습니다.
            </div>
            <div class="user_input_modal_bot">
                <button class="user_input_modal_bt" onclick="user_input_modal_bt()">
                    <img src="./resources/img/팝업창_확인.png">
                </button>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 사용자 관리 : 사용자그룹 PLUS 모달창-->
    <div class="group_popup_back">
        <div class="group_popup_window">
            <div class="group_popup_main">
                <div class="group_popup_title">
                    그룹만들기
                </div>
                <div class="group_popup_search">
                    <input autocomplete='off' class="g_p_s_input" type="text" placeholder="그룹명을 입력해주세요" id="group_popup_search_input">
                </div>
                <div class="group_popup_main_bot">
                    <button class="group_popup_main_bot_bt" id="group_popup_main_bot_bt" onclick="userGroupInsert()">
                        <img src="./resources/img/팝업창_확인.png">
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 사용자 관리 : 사용자그룹 저장 모달창 -->
    <div class="user_group_input_modal_window">
        <div class="user_group_input_modal">
            <div class="user_group_input_modal_top">
                확인
            </div>
            <div class="user_group_input_modal_mid">
                사용자 그룹이 저장되었습니다.
            </div>
            <div class="user_group_input_modal_bot">
                <button class="user_group_input_modal_bt" onclick="user_group_input_modal_bt()">
                    <img src="./resources/img/팝업창_확인.png">
                </button>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 설정관리 : 신규상세코드추가 모달창 -->
    <div class="m2_r_bot_bottom_modal_window">
        <div class="m2_r_bot_bottom_modal">
            <div class="m2_r_bot_bottom_modal_top">
                신규 상세코드 추가
            </div>
            <div class="m2_r_bot_bottom_modal_mid">
                <input type="text" autocomplete='off' id="m2_r_bot_bottom_modal_mid_input01" placeholder="코드명">
                <input type="text" autocomplete='off' id="m2_r_bot_bottom_modal_mid_input02" placeholder="코드설명">
            </div>
            <div class="m2_r_bot_bottom_modal_bot">
                <button class="m2_r_bot_bottom_modal_bot_bt" onclick="m2_r_bot_bottom_modal_bot_bt()">
                    <img src="./resources/img/팝업창_확인.png">
                </button>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 공정관리 : 검토자 버튼 모달창 -->
    <div class="userModal" id="userSearchModal">
        <div class="userSearchModal_body">
            <div class="userSearchModal_head">사용자 검색<button type="button" class="userModalClose"
                    onclick="userModalClose()">X</button></div>
            <div class="userSearch_content_01">
                <div class="userSearch_content_01_01"><input autocomplete='off' class="userModal_search_input"
                        type="text"><button class="userSearchModal_btn01"><img src="./resources/img/공정관리/검색.png"
                            class="userModal_search_btn_img"></button></div>
            </div>
            <div class="userSearch_content_02">
                <table class="userSearch_content_tb" id="userSearch_content_tb">
                    <thead>
                        <tr>
                            <th></th>
                            <th>번호</th>
                            <th>사용자 명</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>000000000000000000018</td>
                            <td>123465</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>000000000000000000019</td>
                            <td>123466</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>000000000000000000020</td>
                            <td>123467</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>000000000000000000021</td>
                            <td>123468</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>000000000000000000022</td>
                            <td>123469</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>000000000000000000023</td>
                            <td>123470</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>000000000000000000024</td>
                            <td>123471</td>
                        </tr>
                    </tbody>

                </table>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 공정관리 : 승인자 버튼 모달창 -->
    <div class="userModal02" id="userSearchModal02" style="display:none">
        <div class="userSearchModal02_body">
            <div class="userSearchModal02_head">사용자 검색
                <button type="button" class="userModal02Close" onclick="userModal02Close()">X</button>
            </div>
            <div class="userSearch_content02_01">
                <div class="userSearch_content02_01_01">
                    <input autocomplete='off' class="userModal02_search_input" type="text">
                    <button class="userSearchModal02_btn01">
                        <img src="./resources/img/공정관리/검색.png" class="userModal02_search_btn_img">
                    </button>
                </div>
            </div>
            <div class="userSearch_content02_02">
                <table class="userSearch_content02_tb">
                    <thead>
                        <tr>
                            <th></th>
                            <th>번호</th>
                            <th>사용자 명</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>000000000000000000018</td>
                            <td>123465</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>000000000000000000019</td>
                            <td>123466</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>000000000000000000020</td>
                            <td>123467</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>000000000000000000021</td>
                            <td>123468</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>000000000000000000022</td>
                            <td>123469</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>000000000000000000023</td>
                            <td>123470</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>000000000000000000024</td>
                            <td>123471</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 공정관리 : 라우팅 모달창 -->
    <div class="routing_modal_window" id="routing_modal_window">
        <div class="routing_modal_main">
            <div class="routing_modal_head">라우팅
                <button type="button" class="routing_modal_close" onclick="routing_modal_close()">X</button>
            </div>
            <div class="routing_modal_body">
                <div class="routing_modal_body_top">
                    <div class="routing_modal_body_top_name">
                        라우팅 명
                    </div>
                    <div class="routing_modal_body_top_input">
                        <input autocomplete="off" type="text" id="prr_name">
                    </div>
                    <div class="routing_modal_body_top_save">
                        <button class="routing_modal_body_top_save_btn">
                            <img src="./resources/img/save.png">
                        </button>
                    </div>

                </div>
                <div class="routing_modal_body_bottom">
                    <div class="routing_modal_body_bottom_l">
                        <table class="routing_modal_body_bottom_l_table" id="routing_modal_body_bottom_l_table">
                            <thead>
                                <tr>
                                    <th colspan="2">
                                        등록된 공정목록
                                    </th>
                                </tr>
                                <tr>
                                    <th>
                                        공정번호
                                    </th>
                                    <th>
                                        공정명
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="routing_modal_body_bottom_l_table_tbody">
                                <tr>
                                    <td>
                                        0001
                                    </td>
                                    <td>
                                        조립
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        0002
                                    </td>
                                    <td>
                                        사출조립
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        0003
                                    </td>
                                    <td>
                                        결합
                                    </td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                    <div class="routing_modal_body_bottom_r">
                        <table class="routing_modal_body_bottom_r_table" id="routing_modal_body_bottom_r_table">
                            <thead>
                                <tr>
                                    <th colspan="2">
                                        라우팅에 구성된 공정목록 공정목록
                                    </th>
                                </tr>
                                <tr>
                                    <th>
                                        공정번호
                                    </th>
                                    <th>
                                        공정명
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="routing_modal_body_bottom_r_table_tbody">
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- 기준정보 -> 공정관리 : 상단 저장 모달창 -->
    <div class="process_input_modal_window">
        <div class="process_input_modal">
            <div class="process_input_modal_top">
                확인
            </div>
            <div class="process_input_modal_mid">
                저장되었습니다.
            </div>
            <div class="process_input_modal_bot">
                <button class="process_input_modal_bt" onclick="process_input_modal_bt()">
                    <img src="./resources/img/팝업창_확인.png">
                </button>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 공정관리 : 새검사항목추가 모달창 -->
    <div class="m5_newtest_window">
        <div class="m5_newtest_window_body">
            <div class="m5_newtest_window_head">
                새 검사 항목
                <button type="button" class="m5_newtest_window_close" onclick="m5_newtest_window_close()">X</button>
            </div>
            <div class="m5_newtest_window_main">
                <table>
                    <tbody>
                        <tr>
                            <td colspan="2">
                                <div style="justify-content: end;display: flex; width: 89%; margin: 0 auto;">
                                    <button class="m5_newtest_window_modal_save_btn" id="m5_newtest_window_modal_save_btn" onclick="m5_newtest_window_modal_save_btn_click">
                                        <img src="./resources/img/gray_save.png">
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                대분류
                            </td>
                            <td>
                                <div class="m5_newtest_window_main_div one">
                                    <div class="m5_newtest_window_main_div_select one">
                                        <div class="m5_newtest_window_main_txt one" id="in_code_a">

                                        </div>
                                        <div class="m5_newtest_window_main_btn one">
                                            <button class="m5_newtest_window_main_bnt_cls one" onclick="m5_newtest_window_main_bnt_cls_one()">
                                                <img src="./resources/img/제품관리/엑스.png">
                                            </button>
                                        </div>
                                        <ul id="m5_newtest_window_main_btn_list">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                소분류
                            </td>
                            <td>
                                <div class="m5_newtest_window_main_div two">
                                    <div class="m5_newtest_window_main_div_select two">
                                        <div class="m5_newtest_window_main_txt two" id="in_code_c">
                                        
                                        </div>
                                        <div class="m5_newtest_window_main_btn two">
                                            <button class="m5_newtest_window_main_bnt_cls two" onclick="m5_newtest_window_main_bnt_cls_two()">
                                                <img src="./resources/img/제품관리/엑스.png">
                                            </button>
                                        </div>
                                        <ul id="m5_newtest_window_main_btn_list2">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                검사항목
                            </td>
                            <td>
                                <input type="text" autocomplete="off" id="in_goods">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                입력값 구분
                            </td>
                            <td>
                                <div class="m5_newtest_window_main_div three">
                                    <div class="m5_newtest_window_main_div_select three">
                                        <div class="m5_newtest_window_main_txt three" id="in_inputValue">

                                        </div>
                                        <div class="m5_newtest_window_main_btn three">
                                            <button class="m5_newtest_window_main_bnt_cls three" onclick="m5_newtest_window_main_bnt_cls_three()">
                                                <img src="./resources/img/제품관리/엑스.png">
                                            </button>
                                        </div>
                                        <ul id="m5_newtest_window_main_btn_list3">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                검사기준
                            </td>
                            <td>
                                <input type="text" autocomplete="off" id="in_standard" id="in_standard">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                검사방법
                            </td>
                            <td>
                                <div class="m5_newtest_window_main_div four">
                                    <div class="m5_newtest_window_main_div_select four">
                                        <div class="m5_newtest_window_main_txt four" id="in_how">

                                        </div>
                                        <div class="m5_newtest_window_main_btn four">
                                            <button class="m5_newtest_window_main_bnt_cls four" onclick="m5_newtest_window_main_bnt_cls_four()">
                                                <img src="./resources/img/제품관리/엑스.png">
                                            </button>
                                        </div>
                                        <ul id="m5_newtest_window_main_txt_list4">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                최대값
                            </td>
                            <td>
                                <input type="text" autocomplete="off" id="in_max">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                최소값
                            </td>
                            <td>
                                <input type="text" autocomplete="off" id="in_min">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                입력단위
                            </td>
                            <td>
                                <div class="m5_newtest_window_main_div five">
                                    <div class="m5_newtest_window_main_div_select five">
                                        <div class="m5_newtest_window_main_txt five" id="in_unit">

                                        </div>
                                        <div class="m5_newtest_window_main_btn five">
                                            <button class="m5_newtest_window_main_bnt_cls five" onclick="m5_newtest_window_main_bnt_cls_five()">
                                                <img src="./resources/img/제품관리/엑스.png">
                                            </button>
                                        </div>
                                        <ul id="m5_newtest_window_main_btn_list5">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                시료수
                            </td>
                            <td>
                                <input type="text" autocomplete="off" id="in_sample">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                정렬수
                            </td>
                            <td>
                                <input type="text" autocomplete="off" id="in_sort">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                자주검사
                            </td>
                            <td>
                                <div class="m5_newtest_window_main_div six">
                                    <input autocomplete='off' type="checkbox" id="in_self">
                                    <label for="m5_newtest_window_modal_check"></label>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>

    </div>
    
    <!-- 검사 항목 입력 -->
    <script>
	document.querySelector("#m5_newtest_window_modal_save_btn").addEventListener("click", m5_newtest_window_modal_save_btn_click);




		
			

    </script>
    

    <!-- 기준정보 -> 공정관리 : 하단 저장 모달창 -->
    <div class="process_02_input_modal_window">
        <div class="process_02_input_modal">
            <div class="process_02_input_modal_top">
                확인
            </div>
            <div class="process_02_input_modal_mid">
                추가된 검사 항목이 저장되었습니다.
            </div>
            <div class="process_02_input_modal_bot">
                <button class="process_02_input_modal_bt" onclick="process_02_input_modal_bt()">
                    <img src="./resources/img/팝업창_확인.png">
                </button>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 거래처관리 : 저장 모달창 -->
    <div class="customer_input_modal_window">
        <div class="customer_input_modal">
            <div class="customer_input_modal_top">
                확인
            </div>
            <div class="customer_input_modal_mid">
                저장되었습니다.
            </div>
            <div class="customer_input_modal_bot">
                <button class="customer_input_modal_bt" onclick="customer_input_modal_bt()">
                    <img src="./resources/img/팝업창_확인.png">
                </button>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 로케이션 : 로케이션 추가 모달창 -->
    <div class="m08_locationModal" id="m08_locationSearchModal" style="display:none">
        <div class="m08_location_modal_body">
            <div class="m08_locationModal_head">로케이션 추가 
                <button type="button" class="m08_locationClose"onclick="m08_locationClose()">X</button>
            </div>
            <div class="m08_localtion_content_01">
                <div class="m08_localtion_content_01_01">
                    <button class="m08_localtion_content_01_01_btn" id="m08_localtion_content_01_01_btn_01"><img src="./resources/img/save.png"></button>
                </div>
                <div class="m08_localtion_content_01_02">
                    <div class="m08_localtion_content_01_02_01">
                        <div class="m08_localtion_content_01_02_01_01">
                            <span class="m08_loca_text">상위 로케이션 :</span>
                            <span class="m08_loca_text_01" id="m08_loca_text_01"></span>
                        </div>
                        <div class="m08_localtion_content_01_02_01_02">
                            <span class="m08_loca_text">&nbsp;로케이션 명&nbsp;&nbsp; :</span>
                            <input class="m08_location_input_text" type="text" id="lc_name">
                        </div>
                        <div class="m08_localtion_content_01_02_01_03">
                            <span class="m08_loca_text">로케이션 번호 :</span>
                            <input class="m08_location_input_text" type="text" id="lc_num">
                        </div>
                        <div class="m08_localtion_content_01_02_01_04">
                            <span class="m08_loca_text">로케이션 유형 :</span>
                            <div class="m08_location_select">
                                <div class="m08_location_selected">
                                    <div class="m08_location_select_txt" id="lc_type"></div>
                                    <div class="m08_location_select_btn">
                                        <button class="m08_location_select_btn_cls" onclick="m08_location_select_btn_cls()">
                                            <img src="./resources/img/제품관리/엑스.png">
                                        </button>
                                    </div>
                                    <ul id="m08_location_select_txt_list">
                                        <li class="option">1</li>
                                        <li class="option">2</li>
                                        <li class="option">3</li>
                                        <li class="option">4</li>
                                        <li class="option">5</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="m08_localtion_content_01_02_02">
                        <div class="m08_localtion_content_01_02_02_01">
                            <div class="m08_localtion_content_01_02_02_01_zip">
                                <span class="m08_loca_text_02">&nbsp;장&nbsp;&nbsp; :</span>
                                <input class="m08_location_input_text_01" type="text" id="lc_jang">
                            </div>
                            <div class="m08_localtion_content_01_02_02_01_zip">
                                <span class="m08_loca_text_02">&nbsp;열&nbsp;&nbsp; :</span>
                                <input class="m08_location_input_text_01" type="text" id="lc_yeol">
                            </div>
                        </div>
                        <div class="m08_localtion_content_01_02_02_02">
                            <div class="m08_localtion_content_01_02_02_02_zip">
                                <span class="m08_loca_text_02">&nbsp;폭&nbsp;&nbsp; :</span>
                                <input class="m08_location_input_text_01" type="text" id="lc_pok">
                            </div>
                            <div class="m08_localtion_content_01_02_02_02_zip">
                                <span class="m08_loca_text_02">&nbsp;연&nbsp;&nbsp; :</span>
                                <input class="m08_location_input_text_01" type="text" id="lc_yeon">
                            </div>
                        </div>
                        <div class="m08_localtion_content_01_02_02_03">
                            <div class="m08_localtion_content_01_02_02_03_zip">
                                <span class="m08_loca_text_02">&nbsp;고&nbsp;&nbsp; :</span>
                                <input class="m08_location_input_text_01" type="text" id="lc_go">
                            </div>
                            <div class="m08_localtion_content_01_02_02_03_zip">
                                <span class="m08_loca_text_02">&nbsp;단&nbsp;&nbsp; :</span>
                                <input class="m08_location_input_text_01" type="text" id="lc_dan">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 로케이션 : 로케이션 수정 모달창 -->
    <div class="m08_corr_locationModal" id="m08_corr_locationSearchModal" style="display:none">
        <div class="m08_corr_location_modal_body">
            <div class="m08_corr_locationModal_head">로케이션 수정 
                <button type="button" class="m08_corr_locationClose"onclick="m08_corr_locationClose()">X</button>
            </div>
            <div class="m08_corr_localtion_content_01">
                <div class="m08_corr_localtion_content_01_01">
                    <button class="m08_corr_localtion_content_01_01_btn"><img src="./resources/img/save.png"></button>
                </div>
                <div class="m08_corr_localtion_content_01_02">
                    <div class="m08_corr_localtion_content_01_02_01">
                        <div class="m08_corr_localtion_content_01_02_01_01">
                            <span class="m08_corr_loca_text">상위 로케이션 :</span>
                            <span class="m08_corr_loca_text_01">fssfd</span>
                        </div>
                        <div class="m08_corr_localtion_content_01_02_01_02">
                            <span class="m08_corr_loca_text">&nbsp;로케이션 명&nbsp;&nbsp; :</span>
                            <input class="m08_corr_location_input_text" type="text">
                        </div>
                        <div class="m08_corr_localtion_content_01_02_01_03">
                            <span class="m08_corr_loca_text">로케이션 번호 :</span>
                            <input class="m08_corr_location_input_text" type="text">
                        </div>
                        <div class="m08_corr_localtion_content_01_02_01_04">
                            <span class="m08_corr_loca_text">로케이션 유형 :</span>
                            <div class="m08_corr_location_select">
                                <div class="m08_corr_location_selected">
                                    <div class="m08_corr_location_select_txt"></div>
                                    <div class="m08_corr_location_select_btn">
                                        <button class="m08_corr_location_select_btn_cls" onclick="m08_corr_location_select_btn_cls()">
                                            <img src="./resources/img/제품관리/엑스.png">
                                        </button>
                                    </div>
                                    <ul id="m08_corr_location_select_txt">
                                        <li class="option">1</li>
                                        <li class="option">2</li>
                                        <li class="option">3</li>
                                        <li class="option">4</li>
                                        <li class="option">5</li>
                                    </ul>
                                </div>
                            </div>
     
                        </div>
                    </div>
                    <div class="m08_corr_localtion_content_01_02_02">
                        <div class="m08_corr_localtion_content_01_02_02_01">
                            <div class="m08_corr_localtion_content_01_02_02_01_zip">
                                <span class="m08_corr_loca_text_02">&nbsp;장&nbsp;&nbsp; :</span>
                                <input class="m08_corr_location_input_text_01" type="text">
                            </div>
                            <div class="m08_corr_localtion_content_01_02_02_01_zip">
                                <span class="m08_corr_loca_text_02">&nbsp;열&nbsp;&nbsp; :</span>
                                <input class="m08_corr_location_input_text_01" type="text">
                            </div>
                        </div>
                        <div class="m08_corr_localtion_content_01_02_02_02">
                            <div class="m08_corr_localtion_content_01_02_02_02_zip">
                                <span class="m08_corr_loca_text_02">&nbsp;폭&nbsp;&nbsp; :</span>
                                <input class="m08_corr_location_input_text_01" type="text">
                            </div>
                            <div class="m08_corr_localtion_content_01_02_02_02_zip">
                                <span class="m08_corr_loca_text_02">&nbsp;연&nbsp;&nbsp; :</span>
                                <input class="m08_corr_location_input_text_01" type="text">
                            </div>
                        </div>
                        <div class="m08_corr_localtion_content_01_02_02_03">
                            <div class="m08_corr_localtion_content_01_02_02_03_zip">
                                <span class="m08_corr_loca_text_02">&nbsp;고&nbsp;&nbsp; :</span>
                                <input class="m08_corr_location_input_text_01" type="text">
                            </div>
                            <div class="m08_corr_localtion_content_01_02_02_03_zip">
                                <span class="m08_corr_loca_text_02">&nbsp;단&nbsp;&nbsp; :</span>
                                <input class="m08_corr_location_input_text_01" type="text">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 제품관리 : 거래처 검색 모달창 -->
    <div class="customerModal" id="customerSearchModal" style="display:none">
        <div class="customer_modal_body">
            <div class="customerModal_head">제품관리 거래처 검색
                <button type="button" class="customerClose" onclick="customerClose()">X</button>
            </div>
            <div class="customer_content_01">
                <div class="customer_content_01_01"><input autocomplete='off' class="customerModal_search_input"
                        type="text">
                    <button class="customerModal_search_btn01">
                        <img src="./resources/img/제품관리/선택.png" class="customerModal_search_btn_02">
                    </button>
                </div>
            </div>
            <div class="customer_content_02">
                <table class="customerSearch_tb">
                    <thead>
                        <tr class="customer_tr">
                            <th class="customerSearch_td_01"></th>
                            <th class="customerSearch_td_02">번호</th>
                            <th class="customerSearch_td_02">거래처 명</th>
                            <th class="customerSearch_td_02">구분</th>
                        </tr>
                    </thead>
                    <tbody id="customer_tbody">
                        <tr>
                            <td class="customerSearch_td_00">1</td>
                            <td class="customerSearch_td_00">00000005</td>
                            <td class="customerSearch_td_00">543214</td>
                            <td class="customerSearch_td_00">매입처</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 제품관리 : 로케이션 검색모달창 -->
    <div class="m03_product_locationModal" id="m03_product_locationSearchModal" style="display:none">
        <div class="m03_product_location_modal_body">
            <div class="m03_product_locationModal_head">제품 로케이션 검색 
                <button type="button" class="m03_product_locationClose"onclick="m03_product_locationClose()">X</button>
            </div>
            <div class="m03_product_localtion_content_01">
                <span class="m03_product_loca_text">로케이션 분류 :</span>
                <div class="m03_product_location_select">
                    <div class="m03_product_location_selected">
                        <div class="m03_product_location_select_txt">
                            1
                        </div>
                        <div class="m03_product_location_select_btn">
                            <button class="m03_product_location_select_btn_cls" onclick="m03_product_location_select_btn_cls()">
                                <img src="./resources/img/제품관리/엑스.png">
                            </button>
                        </div>
                        <ul>
                            <li class="option">1</li>
                            <li class="option">2</li>
                            <li class="option">3</li>
                            <li class="option">4</li>
                            <li class="option">5</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="m03_product_localtion_content_02">
                <table class="m03_product_localtion_tb">
                    <thead>
                        <tr class="m03_product_localtion_tr">
                            <th class="m03_product_localtion_td_01">로케이션명</th>
                            <th class="m03_product_localtion_td_02">로케이션 번호</th>
                            <th class="m03_product_localtion_td_03">유형</th>
                        </tr>
                    </thead>
                    <tbody class="m03_product_localtion_tbody">
                        <tr class="m03_product_localtion_tr">
                            <td class="m03_product_localtion_td_01">fdasf</td>
                            <td class="m03_product_localtion_td_02">131321</td>
                            <td class="m04_goods_localtion_td_03"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <!-- 기준정보 -> 제품관리 : 저장 모달창 -->
    <div class="product_input_modal_window">
        <div class="product_input_modal">
            <div class="product_input_modal_top">
                확인
            </div>
            <div class="product_input_modal_mid">
                저장되었습니다.
            </div>
            <div class="product_input_modal_bot">
                <button class="product_input_modal_bt" onclick="product_input_modal_bt()">
                    <img src="./resources/img/팝업창_확인.png">
                </button>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 자재관리 : 거래처 검색 모달창 -->
    <div class="goods_customer_num_Modal" id="goods_customer_num_SearchModal" style="display:none">
        <div class="goods_customer_num_modal_body">
            <div class="goods_customer_num_Modal_head">자재관리 거래처 검색
                <button type="button" class="goods_customer_num_Close" onclick="goods_customer_num_Close()">X</button>
            </div>
            <div class="goods_customer_num_content_01">
                <div class="goods_customer_num_content_01_01"><input autocomplete='off' class="goods_customer_num_Modal_search_input"
                        type="text">
                    <button class="goods_customer_num_Modal_search_btn01">
                        <img src="./resources/img/제품관리/선택.png" class="goods_customer_num_Modal_search_btn_02">
                    </button>
                </div>
            </div>
            <div class="goods_customer_num_content_02">
                <table class="goods_customer_num_Search_tb">
                    <thead>
                        <tr class="goods_customer_num_tr">
                            <th class="goods_customer_num_Search_td_01"></th>
                            <th class="goods_customer_num_Search_td_02">번호</th>
                            <th class="goods_customer_num_Search_td_02">거래처 명</th>
                            <th class="goods_customer_num_Search_td_02">구분</th>
                        </tr>
                    </thead>
                    <tbody id="goods_customer_num_tbody">
                        <tr>
                            <td class="goods_customer_num_Search_td_00">1</td>
                            <td class="goods_customer_num_Search_td_00">00000005</td>
                            <td class="goods_customer_num_Search_td_00">543214</td>
                            <td class="goods_customer_num_Search_td_00">매입처</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 자재관리 : 로케이션 검색모달창 -->
    <div class="m04_goods_locationModal" id="m04_goods_locationSearchModal" style="display:none">
        <div class="m04_goods_location_modal_body">
            <div class="m04_goods_locationModal_head">자재 로케이션 검색 
                <button type="button" class="m04_goods_locationClose" onclick="m04_goods_locationClose()">X</button>
            </div>
            <div class="m04_goods_localtion_content_01">
                <span class="m04_goods_loca_text">로케이션 분류 :</span>
                <div class="m04_goods_location_select">
                    <div class="m04_goods_location_selected">
                        <div class="m04_goods_location_select_txt">
                            &nbsp
                        </div>
                        <div class="m04_goods_location_select_btn">
                            <button class="m04_goods_location_select_btn_cls" onclick="m04_goods_location_select_btn_cls()">
                                <img src="./resources/img/제품관리/엑스.png">
                            </button>
                        </div>
                        <ul>
                            <li class="option">1</li>
                            <li class="option">2</li>
                            <li class="option">3</li>
                            <li class="option">4</li>
                            <li class="option">5</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="m04_goods_localtion_content_02">
                <table class="m04_goods_localtion_tb">
                    <thead>
                        <tr class="m04_goods_localtion_tr">
                            <th class="m04_goods_localtion_td_01">로케이션명</th>
                            <th class="m04_goods_localtion_td_02">로케이션 번호</th>
                            <th class="m04_goods_localtion_td_03">유형</th>
                        </tr>
                    </thead>
                    <tbody class="m04_goods_localtion_tbody">
                        <tr class="m04_goods_localtion_tr">
                            <td class="m04_goods_localtion_td_01">fdasf</td>
                            <td class="m04_goods_localtion_td_02">131321</td>
                            <td class="m04_goods_localtion_td_03"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> 자재관리 : 저장 모달창 -->
    <div class="goods_input_modal_window">
        <div class="goods_input_modal">
            <div class="goods_input_modal_top">
                확인
            </div>
            <div class="goods_input_modal_mid">
                저장되었습니다.
            </div>
            <div class="goods_input_modal_bot">
                <button class="goods_input_modal_bt" onclick="goods_input_modal_bt()">
                    <img src="./resources/img/팝업창_확인.png">
                </button>
            </div>
        </div>
    </div>

    <!-- 기준정보 -> BOM관리 : 부품 추가 모달창 -->
    <div class="m07_bom_locationModal" id="m07_bom_locationSearchModal" style="display:none">
        <div class="m07_bom_location_modal_body">
            <div class="m07_bom_locationModal_head">반제품 / 부품 조회
                <button type="button" class="m07_bom_locationClose" onclick="m07_bom_locationClose()">X</button>
            </div>
            <div class="m07_bom_localtion_content_01">
                <div class="m07_bom_localtion_content_01_01">
                    <input class="m07_bom_location_select_01" type="text">
                    <div class="m07_bom_location_select_01_01">
                        <button class="m07_bom_location_select_01_01_btn"><img src="./resources/img/gray_save.png"></button>
                    </div>
                </div>
                <div class="m07_bom_localtion_content_01_02">
                    <input class="m07_bom_location_select_02" type="text">
                    <div class="m07_bom_location_select_02_01">
                        <button class="m07_bom_location_select_02_01_btn"><img src="./resources/img/gray_save.png"></button>
                    </div>
                </div>
            </div>
            <div class="m07_bom_localtion_content_02">
                <table class="m07_bom_localtion_tb">
                    <thead>
                        <tr class="m07_bom_localtion_tr">
                            <th class="m07_bom_localtion_td_01"></th>
                            <th class="m07_bom_localtion_td_02">품목번호</th>
                            <th class="m07_bom_localtion_td_03">품목명</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="m07_bom_localtion_tr">
                            <td class="m07_bom_localtion_td_01">
                                <div style="width: 100%; height:100%">
                                    <input autocomplete='off' type="checkbox" id="m07_bom_localtion_td_01_checkbox">
                                    <label for="m07_bom_localtion_td_01_checkbox"></label>
                                </div>
                            </td>
                            <td class="m07_bom_localtion_td_02">131321</td>
                            <td class="m07_bom_localtion_td_03">321321</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- *1002 주문관리 -> 주문관리 : 거래처 선택 모달창-->
    <div class="m51_Order_customer_num_Modal" id="m51_Order_customer_num_SearchModal" style="display:none">
        <div class="m51_Order_customer_num_modal_body">
            <div class="m51_Order_customer_num_Modal_head">주문관리 거래처 검색
                <button type="button" class="m51_Order_customer_num_Close" onclick="m51_Order_customer_num_Close()">X</button>
            </div>
            <div class="m51_Order_customer_num_content_01">
                <div class="m51_Order_customer_num_content_01_01"><input autocomplete='off' class="m51_Order_customer_num_Modal_search_input"
                        type="text">
                </div>
            </div>
            <div class="m51_Order_customer_num_content_02">
                <table class="m51_Order_customer_num_Search_tb">
                    <thead>
                        <tr class="m51_Order_customer_num_tr">
                            <th class="m51_Order_customer_num_Search_td_01"></th>
                            <th>번호</th>
                            <th>거래처 명</th>
                            <th>구분</th>
                        </tr>
                    </thead>
                    <tbody id="m51_Order_customer_num_tbody">
                        <tr>
                            <td class="m51_Order_customer_num_Search_td_00">1</td>
                            <td class="m51_Order_customer_num_Search_td_00"></td>
                            <td class="m51_Order_customer_num_Search_td_00"></td>
                            <td class="m51_Order_customer_num_Search_td_00"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <!-- *1002 주문관리 -> 주문관리 : 품목추가 모달창-->
    <div class="m51_product_choice_Modal" id="m51_product_choice_SearchModal">
        <div class="m51_product_choice_modal_body">
            <div class="m51_product_choice_Modal_head">품목 선택
                <button type="button" class="m51_product_choice_Close_btn" onclick="m51_product_choice_Close()">X</button>
            </div>
            <div class="m051_product_choice_content_01">
                <div class="m51_product_choice_content_01_01">
                    <input type="text">
                </div>
            </div>
            <div class="m051_product_choice_content_02">
                <table class="m051_product_choice_tb">
                    <thead>
                        <tr class="m051_product_choice_tr">
                            <th class="m051_product_choice_td_01"></th>
                            <th class="m051_product_choice_td_02">번호</th>
                            <th class="m051_product_choice_td_03">명</th>
                        </tr>
                    </thead>
                    <tbody class="m051_product_choice_tbody">
                        <tr class="m051_product_choice_tr">
                            <td class="m051_product_choice_td_01">1</td>
                            <td class="m051_product_choice_td_01">5421231</td>
                            <td class="m051_product_choice_td_02">adjdh</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- *1002 생산관리 -> 생산계획 : 제품명 선택 모달창 -->
    <div class="m12_plan_productModal" id="m12_plan_productSearchModal">
        <div class="m12_plan_productSearchModal_body">
          <div class="m12_plan_productSearchModal_head">제품명 검색<button type="button" class="m12_plan_productModalClose"
              onclick="m12_plan_productModalClose()">X</button></div>
          <div class="m12_plan_productSearch_content_01">
            <div class="m12_plan_productSearch_content_01_01"><input class="m12_plan_productModal_search_input" type="text"></div>
          </div>
          <div class="m12_plan_productSearch_content_02">
            <table class="m12_plan_productSearch_content_tb">
              <tr>
                <th></th>
                <th>제품명</th>
                <th>제품번호</th>
              </tr>
              <tbody class="m12_plan_productSearch_content_tbody">
              <tr>
                <td>1</td>
                <td></td>
                <td></td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

    <!-- *1002 생산관리 -> 작업 지시 : 작업지시 생성 모달창 -->
    <div class="m11_workOrder_modal_window" id="m11_workOrder_modal_window">
        <div class="m11_workOrder_modal_main">
            <div class="m11_workOrder_modal_head">작업 지시 생성
                <div class="m11_produc_plus_Modal_head_select">
                    <div class="m11_produc_plus_Modal_head_select_01">
                        <input type="radio" name="m11_workOrder" value = "m11_workOrder01">주문 생성
                        <input type="radio" name="m11_workOrder" value = "m11_workOrder02">생산계획 생성
                    </div>
                </div>
                <button type="button" class="m11_workOrder_modal_close" onclick="m11_workOrder_modal_close()">X</button>
            </div>
            <div class="m11_workOrder_modal_body01">
                <div class="m11_work_order_plus_content_01">
                    <div class="m11_work_order_plus_content_01_01">
                        <input autocomplete='off' class="m11_work_order_plus_Modal_search_input_01"type="date">&nbsp;~&nbsp;
                        <input autocomplete='off' class="m11_work_order_plus_Modal_search_input_01"type="date">
                    </div>
                </div>
                <div class="m11_work_order_plus_content_02">
                    <table class="m11_work_order_plus_Search_tb">
                        <thead>
                            <tr class="m11_work_order_plus_tr">
                                <th class="m11_work_order_plus_Search_td_01">생산계획일</th>
                                <th class="m11_work_order_plus_Search_td_01">품목번호</th>
                                <th class="m11_work_order_plus_Search_td_01">품목명</th>
                                <th class="m11_work_order_plus_Search_td_01">주문번호</th>
                                <th class="m11_work_order_plus_Search_td_01">생산계획수량</th>
                            </tr>
                        </thead>
                        <tbody>
                             <tr>
                                <td class="m11_work_order_plus_Search_td_00"></td>
                                <td class="m11_work_order_plus_Search_td_00"></td>
                                <td class="m11_work_order_plus_Search_td_00"></td>
                                <td class="m11_work_order_plus_Search_td_00"></td>
                                <td class="m11_work_order_plus_Search_td_00"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="m11_workOrder_modal_body02">
                <div class="m11_work_orderPlan_plus_content_01">
                    <div class="m11_work_orderPlan_plus_content_02_01">
                    <input autocomplete='off' class="m11_work_orderPlan_plus_Modal_search_input"type="text">

                    </div>
                </div>
                <div class="m11_work_orderPlan_plus_content_02">
                    <table class="m11_work_orderPlan_plus_Search_tb">
                        <thead>
                            <tr class="m11_work_orderPlan_plus_tr">
                                <th class="m11_work_orderPlan_plus_Search_td_01">주문번호</th>
                                <th class="m11_work_orderPlan_plus_Search_td_02">고객명</th>
                                <th class="m11_work_orderPlan_plus_Search_td_02">품목번호</th>
                                <th class="m11_work_orderPlan_plus_Search_td_02">품목명</th>
                                <th class="m11_work_orderPlan_plus_Search_td_02">주문수량</th>
                            </tr>
                        </thead>
                        <tbody>
                             <tr>
                                <td class="m11_work_orderPlan_plus_Search_td_00"></td>
                                <td class="m11_work_orderPlan_plus_Search_td_00"></td>
                                <td class="m11_work_orderPlan_plus_Search_td_00"></td>
                                <th class="m11_work_orderPlan_plus_Search_td_02"></th>
                                <th class="m11_work_orderPlan_plus_Search_td_02"></th>
                                </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- *1002 생산관리 -> 작업지시 : 생산품목 추가 모달창 -->
    <div class="m11_produc_plus_Modal" id="m11_produc_plus_Modal" style="display:none">
        <div class="m11_produc_plus_modal_body">
            <div class="m11_produc_plus_Modal_head">작업지시 - 생산품목 추가
                <button type="button" class="m11_produc_plus_Close"onclick="m11_produc_plus_Close()">X</button>
            </div>
            <div class="m11_produc_plus_content_01">
                <table class="m11_produc_plus_content_01_table">
                    <tbody>
                        <colgroup>
                            <col style="width:15%">
                            <col style="width:33%">
                            <col style="width:8%">
                            <col style="width:7%">
                            <col style="width:9.5%">
                            <col style="width:7%">
                            <col style="width:16.5%">
                        </colgroup>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <div style="width: 91%;justify-content:end;height: 100%;display: flex;align-items: end;">
                                    <button class="m11_produc_plus_content_01_table_btn">
                                        <img src="./resources/img/gray_save.png">
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                작업지시번호:
                            </td>
                            <td class="m06_num" style="text-align: center; color:#999999;">자동으로 부여됩니다.</td>
                            <td colspan="5">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                생산일자:
                            </td>
                            <td>
                                <input type="date" style="width: 95%;" id="pi_date">
                            </td>
                            <td colspan="5">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                공정:
                            </td>
                            <td>
                                <div class="m11_produc_plus_content_01_table_div02">
                                    <div class="m11_produc_plus_content_01_table_div02_select">
                                        <div class="m11_produc_plus_content_01_table_div02_txt">&nbsp;</div>
                            
                                        <div class="m11_produc_plus_content_01_table_div02_btn" onclick="m11_produc_plus_content_01_table_div02_btn()">
                                            <img src="./resources/img/제품관리/엑스.png">
                                        </div>
                                        <ul id="m11_produc_plus_content_01_table_div02_list">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                            <td colspan="2">
                                공정 유형:
                            </td>
                            <td colspan="3">
                                <div class="m11_produc_plus_content_01_table_div02_1">
                                    &nbsp;
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                협력업체:
                            </td>
                            <td colspan="6">
                                <div class="m11_produc_plus_content_01_table_div03" style="width: 98% !important;">
                                    <div class="m11_produc_plus_content_01_table_div03_select">
                                        <div class="m11_produc_plus_content_01_table_div03_txt">&nbsp;</div>
                                        <div class="m11_produc_plus_content_01_table_div03_btn" onclick="m11_produc_plus_content_01_table_div03_btn()">
                                            <img src="./resources/img/제품관리/엑스.png">
                                        </div>
                                        <ul id="m11_produc_plus_content_01_table_div03_list">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                품목:
                            </td>
                            <td>
                                <div class="m11_produc_plus_content_01_table_div04">
                                    <div class="m11_produc_plus_content_01_table_div04_select">
                                        <div class="m11_produc_plus_content_01_table_div04_txt">&nbsp;</div>
                                        <div class="m11_produc_plus_content_01_table_div04_btn" onclick="m11_produc_plus_content_01_table_div04_btn()">
                                            <img src="./resources/img/제품관리/엑스.png">
                                        </div>
                                        <ul id="m11_produc_plus_content_01_table_div04_list">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                            <td colspan="1">
                                수량:
                            </td>
                            <td colspan="2">
                                <input type="text" autocomplete="off" id="pi_material_count">
                            </td>
                            <td>
                                단위:
                            </td>
                            <td>
                                <div class="m11_produc_plus_content_01_table_div0_1" style="width: 90%;">&nbsp;
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                지시 내용:
                            </td>
                            <td colspan="6">
                                <input type="text" autocomplete="off" style ="width: 98% !important;" id="pi_content">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                시작 요청일:
                            </td>
                            <td>
                                <input type="date" style="width: 95%;" id="pi_start_date">
                            </td>
                            <td colspan="2">
                                완료 요청일:
                            </td>
                            <td colspan="3">
                                <input type="date" style="width: 95%;" id="pi_end_date">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                이동 위치:
                            </td>
                            <td>
                                <div class="m11_produc_plus_content_01_table_div06">
                                    <div class="m11_produc_plus_content_01_table_div06_select">
                                        <div class="m11_produc_plus_content_01_table_div06_txt">&nbsp;</div>
                                        <div class="m11_produc_plus_content_01_table_div06_btn" onclick="m11_produc_plus_content_01_table_div06_btn()">
                                            <img src="./resources/img/제품관리/엑스.png">
                                        </div>
                                        <ul id="m11_produc_plus_content_01_table_div06_list">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                            <td colspan="2">
                                위치명:
                            </td>
                            <td colspan="3">
                                <div class="m11_produc_plus_content_01_table_div02_1">&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               위치주소:
                            </td>
                            <td colspan="6">
                                <input type="text" autocomplete="off" style ="width: 98% !important;" id="pi_move_address">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                기타 사항:
                            </td>
                            <td colspan="6">
                                <input type="text" autocomplete="off" style ="width: 98% !important;" id="pi_memo">
                            </td>
                        </tr>
                    </tbody>

                </table>
            </div>
        </div>
    </div>
    
    <!-- *1002 생산관리 -> 생산일보 : 공정 선택 모달창 -->
    <div class="m12_productModal" id="m12_productSearchModal">
        <div class="m12_productSearchModal_body">
          <div class="m12_productSearchModal_head">공정 검색<button type="button" class="m12_productModalClose"
              onclick="m12_productModalClose()">X</button></div>
          <div class="m12_productSearch_content_01">
            <div class="m12_productSearch_content_01_01"><input class="m12_productModal_search_input" type="text"><button
                class="m12_productSearchModal_btn01"><img src="/img/생산관리/선택.png" class="m12_productModal_search_btn_img"></button></div>
          </div>
          <div class="m12_productSearch_content_02">
            <table class="m12_productSearch_content_tb">
              <tr>
                <th></th>
                <th>번호</th>
                <th>공정명</th>
              </tr>
              <tr>
                <td>1</td>
                <td></td>
                <td></td>
              </tr>
            </table>
          </div>
        </div>
      </div>

    <!-- *1002 생산관리 -> 생산일보 : 설비 선택 모달창 -->
    <div class="m12_equipModal" id="m12_equipSearchModal">
        <div class="m12_equipSearchModal_body">
          <div class="m12_equipSearchModal_head">설비 검색<button type="button" class="m12_equipModalClose"
              onclick="m12_equipModalClose()">X</button></div>
          <div class="m12_equipSearch_content_01">
            <div class="m12_equipSearch_content_01_01"><input class="m12_equipModal_search_input" type="text"><button
                class="m12_equipSearchModal_btn01"><img src="./resources/img/생산관리/선택.png" class="m12_equipModal_search_btn_img"></button></div>
          </div>
          <div class="m12_equipSearch_content_02">
            <table class="m12_equipSearch_content_tb">
              <tr>
                <th></th>
                <th>번호</th>
                <th>설비명</th>
              </tr>
              <tr>
                <td>1</td>
                <td></td>
                <td></td>
              </tr>
            </table>
          </div>
        </div>
      </div>

    <!-- 생산관리 ->  생산일보 : 작업 추가 모달창 -->
    <div class="m13_work_plus_Modal" id="m13_work_plus_SearchModal" style="display:none">
        <div class="m13_work_plus_modal_body">
            <div class="m13_work_plus_Modal_head">작업자 추가
                <button type="button" class="m13_work_plus_Close" onclick="m13_work_plus_Close()">X</button>
            </div>
            <div class="m13_work_plus_content_01">
                <div class="m13_work_plus_content_01_01">
                <input autocomplete='off' class="m13_work_plus_Modal_search_input"type="text">
                    <button class="m13_work_plus_Modal_search_btn01">
                        <img src="./resources/img/제품관리/선택.png" class="m13_work_plus_Modal_search_btn_02">
                    </button>
                </div>
            </div>
            <div class="m13_work_plus_content_02">
                <table class="m13_work_plus_Search_tb">
                    <thead>
                        <tr class="m13_work_plus_tr">
                            <th class="m13_work_plus_Search_td_01"></th>
                            <th class="m13_work_plus_Search_td_02">번호</th>
                            <th class="m13_work_plus_Search_td_02">명</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="m13_work_plus_Search_td_00">1</td>
                            <td class="m13_work_plus_Search_td_00">00000005</td>
                            <td class="m13_work_plus_Search_td_00">543214</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 생산관리 ->  생산일보 : 품목 추가 모달창 -->
    <div class="m13_product_plus_Modal" id="m13_product_plus_SearchModal" style="display:none">
        <div class="m13_product_plus_modal_body">
            <div class="m13_product_plus_Modal_head">품목 추가
                <button type="button" class="m13_product_plus_Close" onclick="m13_product_plus_Close()">X</button>
            </div>
            <div class="m13_product_plus_content_01">
                <div class="m13_product_plus_content_01_01">
                <input autocomplete='off' class="m13_product_plus_Modal_search_input"type="text">
                    <button class="m13_product_plus_Modal_search_btn01">
                        <img src="./resources/img/제품관리/선택.png" class="m13_product_plus_Modal_search_btn_02">
                    </button>
                </div>
            </div>
            <div class="m13_product_plus_content_02">
                <table class="m13_product_plus_Search_tb">
                    <thead>
                        <tr class="m13_product_plus_tr">
                            <th class="m13_product_plus_Search_td_01"></th>
                            <th class="m13_product_plus_Search_td_02">번호</th>
                            <th class="m13_product_plus_Search_td_02">명</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="m13_product_plus_Search_td_00">1</td>
                            <td class="m13_product_plus_Search_td_00">00000005</td>
                            <td class="m13_product_plus_Search_td_00">543214</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 생산관리 ->  생산일보 : 작업 지시 추가 모달창 -->
    <div class="m13_work_order_plus_Modal" id="m13_work_order_plus_SearchModal" style="display:none">
        <div class="m13_work_order_plus_modal_body">
            <div class="m13_work_order_plus_Modal_head">작업 지시 추가
                <button type="button" class="m13_work_order_plus_Close" onclick="m13_work_order_plus_Close()">X</button>
            </div>
            <div class="m13_work_order_plus_content_01">
                <div class="m13_work_order_plus_content_01_01">
                    <span>생산지시일:&nbsp;&nbsp;</span>
                    <input autocomplete='off' class="m13_work_order_plus_Modal_search_input_01"type="date">&nbsp;~&nbsp;
                    <input autocomplete='off' class="m13_work_order_plus_Modal_search_input_01"type="date">
                </div>
                <div class="m13_work_order_plus_content_02_01">
                <input autocomplete='off' class="m13_work_order_plus_Modal_search_input"type="text">
                    <button class="m13_work_order_plus_Modal_search_btn01">
                        <img src="./resources/img/제품관리/선택.png" class="m13_work_order_plus_Modal_search_btn_02">
                    </button>
                </div>
            </div>
            <div class="m13_work_order_plus_content_02">
                <table class="m13_work_order_plus_Search_tb">
                    <thead>
                        <tr class="m13_work_order_plus_tr">
                            <th class="m13_work_order_plus_Search_td_01"></th>
                            <th class="m13_work_order_plus_Search_td_02">작업지시번호</th>
                            <th class="m13_work_order_plus_Search_td_02">작업지시일</th>
                            <th class="m13_work_order_plus_Search_td_02">품목</th>
                            <th class="m13_work_order_plus_Search_td_02">지시수량</th>
                        </tr>
                    </thead>
                    <tbody>
                         <tr>
                            <td class="m13_work_order_plus_Search_td_00">1</td>
                            <td class="m13_work_order_plus_Search_td_00">00000005</td>
                            <td class="m13_work_order_plus_Search_td_00">543214</td>
                            <th class="m13_work_order_plus_Search_td_02">명</th>
                            <th class="m13_work_order_plus_Search_td_02">명</th>
                            </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 생산관리 ->  생산일보 : 투입자재 및 반제품 저장창 -->
    <div class="m13_work_order_btn_08_modal_window">
        <div class="m13_work_order_btn_08_modal">
            <div class="m13_work_order_btn_08_modal_top">
                확인
            </div>
            <div class="m13_work_order_btn_08_modal_mid">
                투입자재 및 반제품이 추가되었습니다.
            </div>
            <div class="m13_work_order_btn_08_modal_bot">
                <button class="m13_work_order_btn_08_modal_bt" onclick="m13_work_order_btn_08_modal_bt()">
                    <img src="./resources/img/팝업창_확인.png">
                </button>
            </div>
        </div>
    </div>


    <!-- *1004 자재관리 > 자재발주 : 업체명 선택 모달창 -->
    <div class="m21_customerModal" id="m21_customerSearchModal" style="display:none">
        <div class="m21_customer_modal_body">
            <div class="m21_customerModal_head">자재관리 업체명 검색
                <button type="button" class="m21_customerClose" onclick="m21_customerClose()">X</button>
            </div>
            <div class="m21_customer_content_01">
                <div class="m21_customer_content_01_01">
                    <input autocomplete='off' class="m21_customerModal_search_input"type="text">
                </div>
            </div>
            <div class="m21_customer_content_02">
                <table class="m21_customerSearch_tb">
                    <thead>
                        <tr>
                            <th></th>
                            <th>번호</th>
                            <th>거래처 명</th>
                            <th>구분</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="m21_customerSearch_td_00">1</td>
                            <td class="m21_customerSearch_td_00">00000005</td>
                            <td class="m21_customerSearch_td_00">543214</td>
                            <td class="m21_customerSearch_td_00">매입처</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- *1004 자재관리 > 자재발주 : 품목 추가 선택 모달창 -->
    <div class="m21_product_choice_Modal" id="m21_product_choice_SearchModal">
        <div class="m21_product_choice_modal_body">
            <div class="m21_product_choice_Modal_head">품목 선택
                <button type="button" class="m21_product_choice_Close_btn" onclick="m21_product_choice_Close()">X</button>
            </div>
            <div class="m021_product_choice_content_01">
                <div class="product_choice_content_01_01">
                    <input type="text">
                </div>
            </div>
            <div class="m021_product_choice_content_02">
                <table class="m021_product_choice_tb">
                    <thead>
                        <tr>
                            <th>품목번호</th>
                            <th>품목명</th>
                            <th>사양</th>
                            <th>규격</th>
                            <th>단위</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>156</td>
                            <td>ASJHD</td>
                            <td>adjdh</td>
                            <td>1</td>
                            <td>5421231</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- *1004 자재관리 -> 자재입고현황 : 로케이션 검색모달창 -->
    <div class="m23_goods_locationModal" id="m23_goods_locationSearchModal" style="display:none">
        <div class="m23_goods_location_modal_body">
            <div class="m23_goods_locationModal_head">자재 로케이션 검색 
                <button type="button" class="m23_goods_locationClose" onclick="m23_goods_locationClose()">X</button>
            </div>
            <div class="m23_goods_localtion_content_01">
                <span class="m23_goods_loca_text">로케이션 분류 :</span>
                <div class="m23_goods_location_select">
                    <div class="m23_goods_location_selected">
                        <div class="m23_goods_location_select_txt">
                            &nbsp
                        </div>
                        <div class="m23_goods_location_select_btn">
                            <button class="m23_goods_location_select_btn_cls" onclick="m23_goods_location_select_btn_cls()">
                                <img src="./resources/img/제품관리/엑스.png">
                            </button>
                        </div>
                        <ul>
                            <li class="option">1</li>
                            <li class="option">2</li>
                            <li class="option">3</li>
                            <li class="option">4</li>
                            <li class="option">5</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="m23_goods_localtion_content_02">
                <table class="m23_goods_localtion_tb">
                    <thead>
                        <tr>
                            <th>로케이션명</th>
                            <th>로케이션 번호</th>
                            <th>유형</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>fdasf</td>
                            <td>131321</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- *1004 자재관리 > 자재입고현황 : 새 입고 추가 모달창 -->
    <div class="m23_material_order_productModal" id="m23_material_order_productAddModal" style="display:none">
        <div class="m23_material_order_product_modal_body">
            <div class="m23_material_order_productModal_head"><div id="m23_material_order_productModal_head_name">새 항목 추가</div>
                <button type="button" class="m023_materialOrder_productClose" onclick="m23_material_order_productClose()">X</button>
            </div>
            <div class="m023_material_order_product_content_02">
                <div class="m023_material_order_product_content_02_01">
                    <label>
                        <input type="radio" name="새입고추가" value="new_item_add2">
                        <span>새 항목 추가</span>
                    </label>
                </div>
                <div class="m023_material_order_product_content_02_02">
                    <label>
                        <input type="radio" name="새입고추가"  value="raw_material_add2">
                        <span>발주에서 추가</span>
                    </label>
                </div>
                <div class="m023_material_order_product_content_02_03">
                    <label>
                        <input type="radio"name="새입고추가" value="external_processing_addd">
                        <span>출고에서 추가</span>
                    </label>
                </div>
            </div>
            <div class="m023_material_order_product_content_01">
                <div class="m023_material_order_product_t">
                  <div class="m023_material_order_product_t_01"><input type="text" placeholder="품목 또는 사양, 규격을 검색하세요"></div>
                  <div class="m023_material_order_product_t_02">
                      <button class="m023_material_order_product_btn_01" >
                          <img src="./resources/img/자재관리/검색.png">
                      </button>
                  </div>
                </div>
              </div>
            <div class="m023_material_order_product_content_03">
                <div class="m23_product_plus_content_01">
                    <div class="m23_product_plus_content_01_01">
                        <input autocomplete='off' class="m23_product_plus_Modal_search_input"type="text" placeholder="검색어를 입력하세요">
                    </div>
                </div>
                <div class="m23_product_plus_content_02">
                    <table class="m23_product_plus_Search_tb">
                        <thead>
                            <tr>
                                <th>품목번호</th>
                                <th>품목명</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>00000005</td>
                                <td>543214</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="m023_material_order_product_content_04">
                <table class="m023_material_order_product_tb">
                    <thead>
                        <tr>
                            <th>발주번호</th>
                            <th>거래처명</th>
                            <th>품목번호</th>
                            <th>품목명</th>
                            <th>발주수량</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>51351</td>
                            <td>db</td>
                            <td>1호</td>
                            <td>gvdrfws</td>
                            <td>개</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="m023_order_choice_product_content_05">
                <table class="m023_order_choice_product_tb">
                    <thead>
                        <tr>
                            <th>출고번호</th>
                            <th>거래처명</th>
                            <th>품목번호</th>
                            <th>품목명</th>
                            <th>출고수량</th>
                            <th>입고수량</th>
                            <th>미입고수량</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>124641246412464</td>
                            <td>유니컴퍼니</td>
                            <td>13876</td>
                            <td>에코클린매트03</td>
                            <td>개</td>
                            <td><input type="text" autocomplete="off"></td>
                            <td><input type="text" autocomplete="off"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!-- *1005 물류 관리 -> 출고 : 거래처 검색 모달창 -->
    <div class="m31_customerModal" id="m31_customerSearchModal" style="display:none">
        <div class="m31_customer_modal_body">
            <div class="m31_customerModal_head">물류관리 거래처 검색
                <button type="button" class="m31_customerClose" onclick="m31_customerClose()">X</button>
            </div>
            <div class="m31_customer_content_01">
                <div class="m31_customer_content_01_01">
                    <input autocomplete='off' class="m31_customerModal_search_input"type="text">
                </div>
            </div>
            <div class="m31_customer_content_02">
                <table class="m31_customerSearch_tb">
                    <thead>
                        <tr>
                            <th>거래처번호</th>
                            <th>거래처명</th>
                            <th>구분</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>00000005</td>
                            <td>543214</td>
                            <td>매입처</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- *1005 물류 관리 -> 출고 : 제품명 선택 모달창 -->
    <div class="m31_plan_productModal" id="m31_plan_productSearchModal">
        <div class="m31_plan_productSearchModal_body">
          <div class="m31_plan_productSearchModal_head">제품명 검색<button type="button" class="m31_plan_productModalClose"
              onclick="m31_plan_productModalClose()">X</button></div>
          <div class="m31_plan_productSearch_content_01">
            <div class="m31_plan_productSearch_content_01_01"><input class="m31_plan_productModal_search_input" type="text"></div>
          </div>
          <div class="m31_plan_productSearch_content_02">
            <table class="m31_plan_productSearch_content_tb">
                <thead>
                    <tr>
                        <th>제품번호</th>
                        <th>제품명</th>
                      </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>fgh</td>
                        <td>sfdg</td>
                      </tr>
                </tbody>
            </table>
          </div>
        </div>
      </div>
    
        <!-- *1006 품질 관리 > 품질 검사 내역 입력 : 공정 검색 모달창 -->
    <div class="m41_productModal" id="m41_productSearchModal">
        <div class="m41_productSearchModal_body">
          <div class="m41_productSearchModal_head">공정 검색<button type="button" class="m41_productModalClose"
              onclick="m41_productModalClose()">X</button></div>
          <div class="m41_productSearch_content_01">
            <div class="m41_productSearch_content_01_01">
                <input class="m41_productModal_search_input" type="text">
            </div>
          </div>
          <div class="m41_productSearch_content_02">
            <table class="m41_productSearch_content_tb">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>공정명</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1500285233421</td>
                        <td>사출조립공정</td>
                    </tr>
                    <tr>
                        <td>52</td>
                        <td>사출조립공정</td>
                    </tr>
                </tbody>
            </table>
          </div>
        </div>
    </div>

    <!--*1006 품질 관리 > 품질 검사 내역 입력 : 검사 기준 모달창-->
    <div class="m41_Modal" id="m41_Modal">
        <div class="m41_Modal_body">
          <div class="m41_Modal_head">품질 검사 기준<button type="button" class="m41_ModalClose"
              onclick="m41_ModalClose()">X</button></div>
          <div class="m41_content_01">
            <div class="m41_content_01_01">
                <input class="m41_Modal_search_input" type="text" placeholder="제품명을 검색하세요.">
            </div>
          </div>
          <div class="m41_content_02">
            <div class="m41_content_02_btn_zip">
                <div class="m41_content_02_btn">
                    <button><img src="./resources/img/생산관리/엑셀.png"></button>
                </div>
            </div>
            <table class="m41_content_tb">
                <thead>
                    <tr>
                        <th>품목번호</th>
                        <th>품목명</th>                        
                        <th>제품군</th>
                        <th>라우팅</th>
                        <th>대분류</th>
                        <th>소분류</th>
                        <th>단위</th>
                        <th>규격</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1500285233421</td>
                        <td>사출조립공정</td>
                        <td>1500285233421</td>
                        <td>사출조립공정</td>
                        <td>1500285233421</td>
                        <td>사출조립공정</td>
                        <td>kg</td>
                        <td>사출조립공정</td>
                    </tr>
                    <tr>
                        <td>52</td>
                        <td>사출조립공정</td>
                        <td>52</td>
                        <td>사출조립공정</td>
                        <td>52</td>
                        <td>사출조립공정</td>
                        <td>52</td>
                        <td>사출조립공정</td>
                    </tr>
                </tbody>
            </table>
          </div>
          <div class="m41_content_03">
            <div class="m41_content_03_zip">
                <div class="m41_content_03_01">
                    <button class="m41_content_03_01_btn" onclick="m41_content_03_01_btn()"><img src="./resources/img/자재관리/새항목추가.png"></button>
                </div>
                <div class="m41_content_03_02">
                    <button onclick="m41_content_03_02_btn()"><img src="./resources/img/생산관리/저장.png"></button>
                </div>
                <div class="m41_content_03_03">
                    <button><img src="./resources/img/생산관리/엑셀.png"></button>
                </div>
                <div class="m41_content_03_04">
                    <button><img src="./resources/img/생산관리/삭제.png"></button>
                </div>
            </div>
            <table class="m41_content_tb_1" id="m41_content_tb_1">
                <thead>
                    <tr>
                        <th>공정</th>
                        <th>대분류</th>                        
                        <th>중분류</th>
                        <th>소분류</th>
                        <th>검사항목명</th>
                        <th>입력값구분</th>
                        <th>검사기준</th>
                        <th>검사방법</th>
                        <th>최댓값</th>
                        <th>최솟값</th>
                        <th>입력단위</th>
                        <th>시료수</th>
                        <th>정렬순서</th>
                        <th>자주검사</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" value="조립"></td>
                        <td><input type="text" value="차량"></td>
                        <td><input type="text" value="품검면제"></td>
                        <td><input type="text" value="수출"></td>
                        <td><input type="text" value="모듈검사"></td>
                        <td><input type="text" value="수치입력"></td>
                        <td><input type="text" value="36.5"></td>
                        <td><input type="text" value="관능검사"></td>
                        <td><input type="text" value="65.5"></td>
                        <td><input type="text" value="15.5"></td>
                        <td><input type="text" value="kg"></td>
                        <td><input type="text" value="3"></td>
                        <td><input type="text" value="1"></td>
                        <td><input type="checkbox"></td>
                    </tr>
                </tbody>
            </table>
          </div>
        </div>
    </div>

    <!-- *1006 품질 관리 > 품질 검사 내역 입력 : 품목 정보 검색 모달창 -->
    <div class="m41_product_choice_Modal" id="m41_product_choice_SearchModal">
        <div class="m41_product_choice_modal_body">
            <div class="m41_product_choice_Modal_head">품목 선택
                <button type="button" class="m41_product_choice_Close_btn" onclick="m41_product_choice_Close()">X</button>
            </div>
            <div class="m041_product_choice_content_01">
                <div class="m041_product_choice_content_01_01">
                    <input type="text">
                </div>
            </div>
            <div class="m041_product_choice_content_02">
                <table class="m041_product_choice_tb">
                    <thead>
                        <tr>
                            <th>품목번호</th>
                            <th>품목명</th>
                            <th>품목구분</th>
                            <th>제품군</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>15457835886</td>
                            <td>ASJHD</td>
                            <td>완제품</td>
                            <td>MD</td>
                        </tr>
                        <tr>
                            <td>18386</td>
                            <td>dsfae</td>
                            <td>반제품</td>
                            <td>MD</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- *1006 품질 관리 > 품질 검사 내역 조회 : 승인 확인 모달창 -->
    <div class="m42_input_modal_window">
        <div class="m42_input_modal">
            <div class="m42_input_modal_top">
                확인
            </div>
            <div class="m42_input_modal_mid">
                승인되었습니다.
            </div>
            <div class="m42_input_modal_bot">
                <button class="m42_input_modal_bt" onclick="m42_input_modal_bt()">
                    <img src="./resources/img/팝업창_확인.png">
                </button>
            </div>
        </div>
    </div>

    <!-- *1006 X-R 관리도 : 품목 검색 모달창 -->
    <div class="m61_product_search_Modal" id="m61_product_choice_SearchModal">
        <div class="m61_product_search_modal_body">
            <div class="m61_product_search_Modal_head">품목 검색
                <button type="button" class="m61_product_search_Close_btn" onclick="m61_product_search_Close()">X</button>
            </div>
            <div class="m61_product_search_content_01">
                <div class="m61_product_search_content_01_01">
                    <input type="text">
                </div>
            </div>
            <div class="m61_product_search_content_02">
                <table class="m61_product_search_tb">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>품목명</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>13564</td>
                            <td>wnklef</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 메인 탑 네비게이션 바 -->
    <div class="mainbar">
        <div class="mainbar_logo" style="color:white;">${company }</div>
        <div class="solution_logo">
            <img src="./resources/img/mes_logo.png">

        </div>
        <ul class="user_box">
            <a class="typing-txt">${username }님, 환영합니다</a>
            <button class="logout" onclick="location.href='logout.do'">
                <img src="./resources/img/logout.png">
            </button>

        </ul>
    </div>

    <!-- 메인 바디 -->
    <div class="mes_body">

        <!-- 메인 바디 -> 왼쪽 사이드바 -->
        <div class="side_bar_back">
            <div class="side_bar">
                <ul class="side_bar_all">
                    <li class="active">
                        <a href="#" class="one-btn"><i class="fa-regular fa-circle-user"></i>기준 정보
                            <div class="fa-solid fa-angle-down first"></div>
                        </a>
                        <ul class="one-show" name="one_show">
                            <li><a href="#" id="user_li">사용자 관리</a></li>
                            <li><a href="#" id="set_li">설정 관리</a></li>
                            <li><a href="#" id="location_li">로케이션</a></li>
                            <li><a href="#" id="process_li">공정 관리</a></li>
                            <li><a href="#" id="customer_li">거래처 관리</a></li>
                            <li><a href="#" id="finProduct_li">제품 관리</a></li>
                            <li><a href="#" id="goods_li">자재 관리</a></li>
                            <li><a href="#" id="bom_li">BOM 관리</a></li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="#" class="six-btn"><i class="fa-solid fa-basket-shopping"></i>주문 관리
                            <div class="fa-solid fa-angle-down sixth"></div>
                        </a>
                        <ul class="six-show" name="six_show">
                            <li><a href="#" id="orderAdmin_li">주문 관리</a></li>
                            <li><a href="#" id="proOrder_li">주문 내역 조회</a></li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="#" class="two-btn"><i class="fa-solid fa-file-pen"></i>생산 관리
                            <div class="fa-solid fa-angle-down second"></div>
                        </a>
                        <ul class="two-show" name="two_show">
                            <li><a href="#" id="producPlan_li">생산 계획</a></li>
                            <li><a href="#" id="order_li">작업 지시</a></li>
                            <li><a href="#" id="produc_daliy">생산 일보</a></li>               
                            <li><a href="#" id="orderView_li">작업 지시 조회</a></li>
                            <li><a href="#" id="productView_li">생산 실적 조회</a></li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="#" class="three-btn"><i class="fa-solid fa-cart-arrow-down"></i>자재 관리
                            <div class="fa-solid fa-angle-down third"></div>
                        </a>
                        <ul class="three-show" name="three_show">
                            <li><a href="#" id="material_li">자재 발주</a></li>
                            <li><a href="#" id="materialView_li">자재 발주 조회</a></li>
                            <li><a href="#" id="materialArrival_li">자재 입고 현황</a></li>
                            <li><a href="#" id="inventoryList_li">자재 재고 조회</a></li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="#" class="five-btn"><i class="fa-solid fa-screwdriver-wrench"></i>품질 관리
                            <div class="fa-solid fa-angle-down fifth"></div>
                        </a>
                        <ul class="five-show" name="five_show">
                            <li><a href="#" id="produFaulty_li">품질 검사 내역 입력</a></li>
                            <li><a href="#" id="qualityInspection_li">품질 검사 내역 조회</a></li>
                            <li><a href="#" id="processDefect_li">공정 불량 현황</a></li>
                            <li><a href="#" id="faultyList_li">불량률 조회</a></li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="#" class="four-btn"><i class="fa-solid fa-truck"></i>물류 관리
                            <div class="fa-solid fa-angle-down forth"></div>
                        </a>
                        <ul class="four-show" name="four_show">
                            <li><a href="#" id="outOrder_li">출고</a></li>
                            <li><a href="#" id="release_li">출고 조회</a></li>
                            <li><a href="#" id="productlist_li">제품 재고 현황</a></li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="#" class="eight-btn"><i class="fa-solid fa-basket-shopping"></i>LOT 추적
                            <div class="fa-solid fa-angle-down eight"></div>
                        </a>
                        <ul class="eight-show" name="eight_show">
                            <li><a href="#" id="LOT_tracking_li">LOT 추적</a></li>
                            <li><a href="#" id="LOT_check_li">LOT 정보 조회</a></li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="#" class="seve-btn" id="xrAdmin_li"><i class="fa-solid fa-chart-line"></i>X-R 관리도
                        </a>
                    </li>

                </ul>
            </div>
        </div>

        <!-- 메인 바디 -> 오른쪽 화면 -->
        <div class="main_01">

            <!-- 메인 바디 -> 오른쪽 화면 -> 상태바 -->
            <div class="main_top_bar">
                <span class="top_bar_name" id="main_title">기준정보&nbsp; > &nbsp;</span>
            </div>

            <!-- 메인 바디 -> 오른쪽 화면 -> 기본 화면 -->
            <!-- *1006 메인페이지 -->
            <div class="mainbody_00">
                <div class="mainbody_00_graph">
                    <div class="main_graph_00_1">
                        <div class="main_graph_00_1_zip">
                            <div class="main_graph_00_1_head">
                                <div class="main_1_head_txt1">금월 생산 및 불량수</div>
                                <div class="main_1_head_txt2">Total : 111,222개</div>
                            </div>
                            <div class="main_graph_00_1_body">
                                <div class="main_graph_00_1_body_1">
                                    <div id="m00_month_product"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_graph_00_2">
                        <div class="main_graph_00_2_zip">
                            <div class="main_graph_00_2_head">
                                <div class="main_2_head_txt1">주문대비 납기율</div>
                                <div class="main_2_head_txt2">Total :</div>
                            </div>
                            <div class="main_graph_00_2_body">
                                <div class="main_graph_00_2_body_1">
                                    <div id="m00_day_product"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="main_graph_00_3">
                        <div class="main_graph_00_3_zip">
                            <div class="main_graph_00_3_head">
                                <div class="main_3_head_txt1">금일 생산 및 불량수</div>
                                <div class="main_3_head_txt2">Total : 100%</div>
                            </div>
                            <div class="main_graph_00_3_body">
                                <div id="m00_order"></div>
                            </div>
                        </div>
                    </div>
                    <div class="main_graph_00_4">
                        <div class="main_graph_00_4_zip">
                            <div class="main_graph_00_4_head">
                                <div class="main_4_head_txt1">불량률 현황</div>
                                <div class="main_4_head_txt2">Total : 5%</div>
                            </div>
                            <div class="main_graph_00_4_body">
                                <div id="m00_Defective"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <!-- 기준정보 > 사용자관리 -->
            <div class="mainbody_01" id="mainbody_01">
                <div class="mainbody_01_1">
                    <div class="a01_01_left">
                        <div class="user_input">
                            <table class="user_input_table">
                                <tr>
                                    <td class="u_t_id">사용자ID</td>
                                    <td><input autocomplete='off' id="u_input_id" type="text" value=""></td>
                                </tr>
                                <tr>
                                    <td class="u_t_name">사용자명</td>
                                    <td><input autocomplete='off' id="u_input_name" type="text"></td>
                                </tr>
                                <tr>
                                    <td class="u_t_pw">비밀번호</td>
                                    <td><input autocomplete='off' id="u_input_pw" type="text"></td>
                                </tr>
                                <tr>
                                    <td class="u_t_main">주 공정</td>
                                    <td>
                                        <div class="m1_user_input_table_04">
                                            <div class="m1_user_input_table_04_select">
                                                <div class="m1_user_input_table_04_select_txt"
                                                    id="m1_user_input_table_04_select_txt">
                                                    &nbsp;
                                                </div>
                                                <div class="m1_user_input_table_04_select_txt2">
                                                    <button class="m1_user_input_table_04_select_txt2_bt"
                                                        onclick="m1_user_input_table_04_select_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m1_user_input_table_04_ul">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="u_t_author">권한</td>
                                    <td>
                                        <div class="m1_user_input_table_05">
                                            <div class="m1_user_input_table_05_select">
                                                <div class="m1_user_input_table_05_select_txt"
                                                    id="m1_user_input_table_05_select_txt">
                                                    &nbsp;
                                                </div>
                                                <div class="m1_user_input_table_05_select_txt2">
                                                    <button class="m1_user_input_table_05_select_txt2_bt"
                                                        onclick="m1_user_input_table_05_select_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m1_user_input_table_05_select_txt_list">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>부서명</td>
                                    <td>
                                        <div class="m1_user_input_table_06">
                                            <div class="m1_user_input_table_06_select">
                                                <div class="m1_user_input_table_06_select_txt"
                                                    id="m1_user_input_table_06_select_txt">
                                                    &nbsp;
                                                </div>
                                                <div class="m1_user_input_table_06_select_txt2">
                                                    <button class="m1_user_input_table_06_select_txt2_bt"
                                                        onclick="m1_user_input_table_06_select_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="user_input_department">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>연락처</td>
                                    <td><input autocomplete='off' id="u_input_phonenum" type="text" value=" "></td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td><input autocomplete='off' id="u_input_email" type="text" value=" "></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <button class="u_r_t_btn01" onclick="u_r_t_btn01_click()"><img
                                                src="./resources/img/cancel.png"></button>
                                        <button class="u_r_t_btn02" onclick="u_r_t_btn02_click()"><img
                                                src="./resources/img/okay.png"></button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="user_group_select">
                            <div class="user_group_sel_title">사용자 그룹
                                <div class="m01_btn_group">
                                    <div class="user_plus">
                                        <button class="user_plus_btn" id="user_plus_btn"><img
                                                src="./resources/img/plus.png"></button>
                                    </div>
                                    <div class="user_minus">
                                        <button class="user_minus_btn" id="user_minus_btn" onclick="user_minus_btn_click()"><img
                                                src="./resources/img/minus.png"></button>
                                    </div>
                                    <div class="user_gray_save">
                                        <button class="user_gray_save_btn" id="user_gray_save_btn" onclick="user_gray_save_btn()"><img
                                                src="./resources/img/gray_save.png"></button>
                                    </div>
                                </div>
                            </div>
                            <div class="user_group_body" id="user_group_body">
                                <div class="user_author" id="user_author">
                                    <div class="author_num">
                                        <input autocomplete='off' type="checkbox" id="author_num_checkbox">
                                        <label for="author_num_checkbox"></label>
                                    </div>
                                    <div class="author_name">시스템 사용자</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="a01_01_right">
                        <div class="user_search">
                            <div class="user_search_l">
                                <input autocomplete='off' class="u_s_input" id="u_s_input" type="text" placeholder="검색어를 입력하세요" onkeyup="enterkey()">
                            </div>
                            <div class="user_search_r">
                                <button class="user_search_r_bt" onclick="userDelete()">
                                    <img src="./resources/img/삭제.png">
                                </button>
                            </div>
                        </div>
                        <div class="user_looklist">
                            <div class="list_Title">
                                <div class="list_t_1"> </div>
                                <div class="list_t_2">사용자ID</div>
                                <div class="list_t_3">사용자명</div>
                                <div class="list_t_4">주 공정</div>
                                <div class="list_t_5">권한</div>
                                <div class="list_t_6">부서명</div>
                                <div class="list_t_7">연락처</div>
                                <div class="list_t_8">이메일</div>
                            </div>
                            <div class="list_Data" id="list_Data">
                                <div class="list_bundle_data">
                                    <div class="list_d_1"><input autocomplete='off' type="checkbox"
                                            id="list_bundle_data_checkbox01"><label
                                            for="list_bundle_data_checkbox01"></label>
                                    </div>
                                    <div class="list_d_2">asdf</div>
                                    <div class="list_d_3">asdf</div>
                                    <div class="list_d_4">asdf</div>
                                    <div class="list_d_5">gfdsg</div>
                                    <div class="list_d_6">sdfg</div>
                                    <div class="list_d_7">sfdg</div>
                                    <div class="list_d_8">FDSAFDSA</div>
                                </div>
                            </div>
                        </div>

                        <div class="user_group_list">
                            <div class="user_gro_li_title">
                                <div class="user_gro_li_title01">메뉴</div>
                                <div class="user_gro_li_title02">메뉴ID</div>
                                <div class="user_gro_li_title03">사용권한</div>
                            </div>
                            <div class="author_list">
                                <div class="author_list_wrapp" id="author_list_wrapp">
                                    <table class="author_list_wrapp_table" id="author_list_wrapp_table">

                                        <!--카테고리 메인 01-->
                                        <tr id="cate_main_name_10">
                                            <td id="cate_main_name_click10" style="padding-left: 1%;">&#183;&nbsp;기준 정보
                                            </td>
                                            <td id="cate_main_name_click10">&#183;&nbsp;MN_L1_0000001</td>
                                            <td id="cate_main_name_13"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox11"><label
                                                    for="m2_l_bot_bottom_table_checkbox11"></label></td>
                                        </tr>
                                        <!--카테고리 서브-->
                                        <tr id="cate_sub_name_11">
                                            <td id="cate_sub_name_11_1" style="padding-left: 3%;">└ 사용자 관리</td>
                                            <td id="cate_sub_name_12_2" style="padding-left: 3%;">└ sub_MN_L1_0000001</td>
                                            <td id="cate_sub_name_13_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox12" name="ugr_name" value="사용자 관리"><label
                                                    for="m2_l_bot_bottom_table_checkbox12"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_12">
                                            <td id="cate_sub_name_12_1" style="padding-left: 3%;">└ 설정 관리</td>
                                            <td id="cate_sub_name_12_2" style="padding-left: 3%;">└ sub_MN_L1_0000002</td>
                                            <td id="cate_sub_name_12_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox13" name="ugr_name" value="설정 관리"><label
                                                    for="m2_l_bot_bottom_table_checkbox13"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_13">
                                            <td id="cate_sub_name_13_1" style="padding-left: 3%;">└ 로케이션</td>
                                            <td id="cate_sub_name_13_2" style="padding-left: 3%;">└ sub_MN_L1_0000003</td>
                                            <td id="cate_sub_name_13_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox14" name="ugr_name" value="로케이션"><label
                                                    for="m2_l_bot_bottom_table_checkbox14"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_14">
                                            <td id="cate_sub_name_14_1" style="padding-left: 3%;">└ 공정 관리</td>
                                            <td id="cate_sub_name_14_2" style="padding-left: 3%;">└ sub_MN_L1_0000004</td>
                                            <td id="cate_sub_name_14_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox15" name="ugr_name" value="공정 관리"><label
                                                    for="m2_l_bot_bottom_table_checkbox15"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_15">
                                            <td id="cate_sub_name_15_1" style="padding-left: 3%;">└ 거래처 관리</td>
                                            <td id="cate_sub_name_15_2" style="padding-left: 3%;">└ sub_MN_L1_0000005</td>
                                            <td id="cate_sub_name_15_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox16" name="ugr_name" value="거래처 관리"><label
                                                    for="m2_l_bot_bottom_table_checkbox16"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_16">
                                            <td id="cate_sub_name_16_1" style="padding-left: 3%;">└ 제품 관리</td>
                                            <td id="cate_sub_name_16_2" style="padding-left: 3%;">└ sub_MN_L1_0000006</td>
                                            <td id="cate_sub_name_16_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox17" name="ugr_name" value="제품 관리"><label
                                                    for="m2_l_bot_bottom_table_checkbox17"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_17">
                                            <td id="cate_sub_name_17_1" style="padding-left: 3%;">└ 자재 관리</td>
                                            <td id="cate_sub_name_17_2" style="padding-left: 3%;">└ sub_MN_L1_0000007</td>
                                            <td id="cate_sub_name_17_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox18" name="ugr_name" value="자재 관리"><label
                                                    for="m2_l_bot_bottom_table_checkbox18"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_18">
                                            <td id="cate_sub_name_18_1" style="padding-left: 3%;">└ BOM 관리</td>
                                            <td id="cate_sub_name_18_2" style="padding-left: 3%;">└ sub_MN_L1_0000008</td>
                                            <td id="cate_sub_name_18_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox19" name="ugr_name" value="BOM 관리"><label
                                                    for="m2_l_bot_bottom_table_checkbox19"></label></td>
                                        </tr>
                                        <!--카테고리 메인 06-->
                                        <tr id="cate_main_name_60">
                                            <td id="cate_main_name_click60" style="padding-left: 1%">&#183;&nbsp;주문 관리
                                            </td>
                                            <td id="cate_main_name_click60">&#183;&nbsp;MN_L2_0000001</td>
                                            <td><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox61"><label
                                                    for="m2_l_bot_bottom_table_checkbox61"></label></td>
                                        </tr>
                                        <!--카테고리 서브-->
                                        <tr id="cate_sub_name_61">
                                            <td id="cate_sub_name_61_1" style="padding-left: 3%;">└ 주문 관리</td>
                                            <td id="cate_sub_name_61_2" style="padding-left: 3%;">└ sub_MN_L2_0000001</td>
                                            <td id="cate_sub_name_61_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox62" name="ugr_name" value="오더 관리"><label
                                                    for="m2_l_bot_bottom_table_checkbox62"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_62">
                                            <td id="cate_sub_name_62_1" style="padding-left: 3%;">└ 주문 내역 조회</td>
                                            <td id="cate_sub_name_62_2" style="padding-left: 3%;">└ sub_MN_L2_0000002</td>
                                            <td id="cate_sub_name_62_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox63" name="ugr_name" value="주문 내역 조회"><label
                                                    for="m2_l_bot_bottom_table_checkbox63"></label></td>
                                        </tr>
                                        
                                        <!--카테고리 메인 02-->
                                        <tr id="cate_main_name_20">
                                            <td id="cate_main_name_click20" style="padding-left: 1%">&#183;&nbsp;생산 관리
                                            </td>
                                            <td id="cate_main_name_click20">&#183;&nbsp;MN_L3_0000001</td>
                                            <td><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox21"><label
                                                    for="m2_l_bot_bottom_table_checkbox21"></label></td>
                                        </tr>
                                        <!--카테고리 서브-->
                                        <tr id="cate_sub_name_21">
                                            <td id="cate_sub_name_21_1" style="padding-left: 3%;">└ 생산 계획</td>
                                            <td id="cate_sub_name_21_2" style="padding-left: 3%;">└ sub_MN_L3_0000001</td>
                                            <td id="cate_sub_name_21_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox22" name="ugr_name" value="생산 계획"><label
                                                    for="m2_l_bot_bottom_table_checkbox22"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_22">
                                            <td id="cate_sub_name_22_1" style="padding-left: 3%;">└ 작업 지시</td>
                                            <td id="cate_sub_name_22_2" style="padding-left: 3%;">└ sub_MN_L3_0000002</td>
                                            <td id="cate_sub_name_23_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox23" name="ugr_name" value="작업 지시"><label
                                                    for="m2_l_bot_bottom_table_checkbox23"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_23">
                                            <td id="cate_sub_name_23_1" style="padding-left: 3%;">└ 생산 일보</td>
                                            <td id="cate_sub_name_23_2" style="padding-left: 3%;">└ sub_MN_L3_0000003</td>
                                            <td id="cate_sub_name_23_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox24" name="ugr_name" value="생산 일보"><label
                                                    for="m2_l_bot_bottom_table_checkbox24"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_24">
                                            <td id="cate_sub_name_24_1" style="padding-left: 3%;">└ 작업 지시 조회</td>
                                            <td id="cate_sub_name_24_2" style="padding-left: 3%;">└ sub_MN_L3_0000004</td>
                                            <td id="cate_sub_name_24_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox25" name="ugr_name" value="작업 지시 조회"><label
                                                    for="m2_l_bot_bottom_table_checkbox25"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_25">
                                            <td id="cate_sub_name_25_1" style="padding-left: 3%;">└ 생산 실적 조회</td>
                                            <td id="cate_sub_name_25_2" style="padding-left: 3%;">└ sub_MN_L3_0000005</td>
                                            <td id="cate_sub_name_25_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox26" name="ugr_name" value="생산 실적 조회"><label
                                                    for="m2_l_bot_bottom_table_checkbox26"></label></td>
                                        </tr>
                                        <!--카테고리 메인 03-->
                                        <tr id="cate_main_name_30">
                                            <td id="cate_main_name_click30" style="padding-left: 1%">&#183;&nbsp;자재 관리
                                            </td>
                                            <td id="cate_main_name_click30">&#183;&nbsp;MN_L4_0000001</td>
                                            <td><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox31"><label
                                                    for="m2_l_bot_bottom_table_checkbox31"></label></td>
                                        </tr>
                                        <!--카테고리 서브-->
                                        <tr id="cate_sub_name_31">
                                            <td id="cate_sub_name_31_1" style="padding-left: 3%;">└ 자재 발주</td>
                                            <td id="cate_sub_name_32_2" style="padding-left: 3%;">└ sub_MN_L4_0000001</td>
                                            <td id="cate_sub_name_33_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox32" name="ugr_name" value="자재 발주"><label
                                                    for="m2_l_bot_bottom_table_checkbox32"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_32">
                                            <td id="cate_sub_name_32_1" style="padding-left: 3%;">└ 자재 발주 조회</td>
                                            <td id="cate_sub_name_32_2" style="padding-left: 3%;">└ sub_MN_L4_0000002</td>
                                            <td id="cate_sub_name_33_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox33" name="ugr_name" value="자재 발주 조회"><label
                                                    for="m2_l_bot_bottom_table_checkbox33"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_33">
                                            <td id="cate_sub_name_33_1" style="padding-left: 3%;">└ 자재 입고 현황</td>
                                            <td id="cate_sub_name_33_2" style="padding-left: 3%;">└ sub_MN_L4_0000003</td>
                                            <td id="cate_sub_name_33_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox34" name="ugr_name" value="자재 입고 현황"><label
                                                    for="m2_l_bot_bottom_table_checkbox34"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_34">
                                            <td id="cate_sub_name_34_1" style="padding-left: 3%;">└ 자재 재고 조회</td>
                                            <td id="cate_sub_name_34_2" style="padding-left: 3%;">└ sub_MN_L4_0000004</td>
                                            <td id="cate_sub_name_34_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox35" name="ugr_name" value="자재 재고 현황"><label
                                                    for="m2_l_bot_bottom_table_checkbox35"></label></td>
                                        </tr>
                                        <!--카테고리 메인 05-->
                                        <tr id="cate_main_name_50">
                                            <td id="cate_main_name_click50" style="padding-left: 1%">&#183;&nbsp;품질 관리
                                            </td>
                                            <td id="cate_main_name_click50">&#183;&nbsp;MN_L5_0000001</td>
                                            <td><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox50"><label
                                                    for="m2_l_bot_bottom_table_checkbox50"></label></td>
                                        </tr>
                                        <!--카테고리 서브-->
                                        <tr id="cate_sub_name_51">
                                            <td id="cate_sub_name_51_1" style="padding-left: 3%;">└ 품질 검사 내역 입력</td>
                                            <td id="cate_sub_name_51_2" style="padding-left: 3%;">└ sub_MN_L5_0000001</td>
                                            <td id="cate_sub_name_51_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox51" name="ugr_name" value="불량 수량 입력"><label
                                                    for="m2_l_bot_bottom_table_checkbox51"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_52">
                                            <td id="cate_sub_name_52_1" style="padding-left: 3%;">└ 품질 검사 내역 조회</td>
                                            <td id="cate_sub_name_52_2" style="padding-left: 3%;">└ sub_MN_L5_0000002</td>
                                            <td id="cate_sub_name_52_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox52" name="ugr_name" value="불량 검사 내역 조회"><label
                                                    for="m2_l_bot_bottom_table_checkbox52"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_53">
                                            <td id="cate_sub_name_53_1" style="padding-left: 3%;">└ 공정 불량 현황</td>
                                            <td id="cate_sub_name_53_2" style="padding-left: 3%;">└ sub_MN_L5_0000003</td>
                                            <td id="cate_sub_name_53_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox53" name="ugr_name" value="공정 불량 현황"><label
                                                    for="m2_l_bot_bottom_table_checkbox53"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_54">
                                            <td id="cate_sub_name_54_1" style="padding-left: 3%;">└ 불량률 조회</td>
                                            <td id="cate_sub_name_54_2" style="padding-left: 3%;">└ sub_MN_L5_0000004</td>
                                            <td id="cate_sub_name_54_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox54" name="ugr_name" value="불량률 조회"><label
                                                    for="m2_l_bot_bottom_table_checkbox54"></label></td>
                                        </tr>
                                        <!--카테고리 메인 04-->
                                        <tr id="cate_main_name_40">
                                            <td id="cate_main_name_click40" style="padding-left: 1%">&#183;&nbsp;물류 관리
                                            </td>
                                            <td id="cate_main_name_click40">&#183;&nbsp;MN_L6_0000001</td>
                                            <td><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox41"><label
                                                    for="m2_l_bot_bottom_table_checkbox41"></label></td>
                                        </tr>
                                        <!--카테고리 서브-->
                                        <tr id="cate_sub_name_41">
                                            <td id="cate_sub_name_41_1" style="padding-left: 3%;">└ 출고</td>
                                            <td id="cate_sub_name_41_2" style="padding-left: 3%;">└ sub_MN_L6_0000001</td>
                                            <td id="cate_sub_name_41_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox42" name="ugr_name" value="출고 지시"><label
                                                    for="m2_l_bot_bottom_table_checkbox42"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_42">
                                            <td id="cate_sub_name_42_1" style="padding-left: 3%;">└ 출고 조회</td>
                                            <td id="cate_sub_name_42_2" style="padding-left: 3%;">└ sub_MN_L6_0000002</td>
                                            <td id="cate_sub_name_42_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox43" name="ugr_name" value="출고 조회"><label
                                                    for="m2_l_bot_bottom_table_checkbox43"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_43">
                                            <td id="cate_sub_name_43_1" style="padding-left: 3%;">└ 제품 재고 현황</td>
                                            <td id="cate_sub_name_43_2" style="padding-left: 3%;">└ sub_MN_L6_0000003</td>
                                            <td id="cate_sub_name_43_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox44" name="ugr_name" value="제품 재고 현황"><label
                                                    for="m2_l_bot_bottom_table_checkbox44"></label></td>
                                        </tr>

                                        <!--카테고리 메인 08-->
                                        <tr id="cate_main_name_80">
                                            <td id="cate_main_name_click80" style="padding-left: 1%">&#183;&nbsp;LOT 추적
                                            </td>
                                            <td id="cate_main_name_click80">&#183;&nbsp;MN_L7_0000001</td>
                                            <td><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox61"><label
                                                    for="m2_l_bot_bottom_table_checkbox61"></label></td>
                                        </tr>
                                        <!--카테고리 서브-->
                                        <tr id="cate_sub_name_81">
                                            <td id="cate_sub_name_81_1" style="padding-left: 3%;">└ LOT 추적</td>
                                            <td id="cate_sub_name_81_2" style="padding-left: 3%;">└ sub_MN_L7_0000001</td>
                                            <td id="cate_sub_name_81_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox62" name="ugr_name" value="LOT 추적"><label
                                                    for="m2_l_bot_bottom_table_checkbox62"></label></td>
                                        </tr>
                                        <tr id="cate_sub_name_82">
                                            <td id="cate_sub_name_82_1" style="padding-left: 3%;">└ LOT 정보 조회</td>
                                            <td id="cate_sub_name_82_2" style="padding-left: 3%;">└ sub_MN_L7_0000002</td>
                                            <td id="cate_sub_name_82_3"><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox63" name="ugr_name" value="LOT 정보 조회"><label
                                                    for="m2_l_bot_bottom_table_checkbox63"></label></td>
                                        </tr>
                                        <!--카테고리 메인 07-->
                                        <tr id="cate_main_name_70">
                                            <td id="cate_main_name_click70" style="padding-left: 1%">&#183;&nbsp;X-R 관리도
                                            </td>
                                            <td>&#183;&nbsp;MN_L8_0000001</td>
                                            <td><input autocomplete='off' type="checkbox"
                                                    id="m2_l_bot_bottom_table_checkbox71" name="ugr_name" value="X-R 관리도"><label
                                                    for="m2_l_bot_bottom_table_checkbox71"></label></td>
                                        </tr>
                                        
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 기준정보 > 설정관리 -->
            <div class="mainbody_02">
                <div class="mainbody_02_02">
                    <div class="m02_left">
                        <div class="m02_l_bot">
                            <div class="m2_l_bot_bottom">
                                <table class="m2_l_bot_bottom_table" id="m2_l_bot_bottom_table">
                                    <thead>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                                분류코드
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                1
                                            </td>
                                            <td>
                                                부서
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                2
                                            </td>
                                            <td>
                                                품목 대분류
                                            </td>

                                        </tr>
                                        <td>
                                            3
                                        </td>
                                        <td>
                                            품목 소분류
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                4
                                            </td>
                                            <td>
                                                제품군
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                5
                                            </td>
                                            <td>
                                                검사항목 입력단위
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                6
                                            </td>
                                            <td>
                                                시프트
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                7
                                            </td>
                                            <td>
                                                검사기준 대분류
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                8
                                            </td>
                                            <td>
                                                검사기준 중분류
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                9
                                            </td>
                                            <td>
                                                검사기준 소분류
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                10
                                            </td>
                                            <td>
                                                검사방법
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                11
                                            </td>
                                            <td>
                                                품목 단위
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                12
                                            </td>
                                            <td>
                                                작업구분
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                13
                                            </td>
                                            <td>
                                                작업코드
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                14
                                            </td>
                                            <td>
                                                재고 로케이션 분류
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                15
                                            </td>
                                            <td>
                                                재고 로케이션 유형
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                16
                                            </td>
                                            <td>
                                                결제조건
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                17
                                            </td>
                                            <td>
                                                공지사항(현황판)
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                18
                                            </td>
                                            <td>
                                                계약유형
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                19
                                            </td>
                                            <td>
                                                이행보증
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                20
                                            </td>
                                            <td>
                                                하자보증
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                21
                                            </td>
                                            <td>
                                                자체상금 요율
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                22
                                            </td>
                                            <td>
                                                지역개발공채 요율
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                23
                                            </td>
                                            <td>
                                                프로젝트 중요도
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                24
                                            </td>
                                            <td>
                                                프로젝트 작업상태
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                25
                                            </td>
                                            <td>
                                                비용청구상태
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                26
                                            </td>
                                            <td>
                                                프로젝트 비행 진행상태
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                27
                                            </td>
                                            <td>
                                                프로젝트 이슈구분
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                28
                                            </td>
                                            <td>
                                                프로젝트 이슈 처리상태
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                29
                                            </td>
                                            <td>
                                                프로젝트 산출물구분
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                30
                                            </td>
                                            <td>
                                                불량코드
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                31
                                            </td>
                                            <td>
                                                금형등급
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                32
                                            </td>
                                            <td>
                                                금형 로케이션
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                33
                                            </td>
                                            <td>
                                                금형 사용위치
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                34
                                            </td>
                                            <td>
                                                부품 입출고
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                35
                                            </td>
                                            <td>
                                                금형 입고사유
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                36
                                            </td>
                                            <td>
                                                금형 출고사유
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                37
                                            </td>
                                            <td>
                                                금형구분
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                38
                                            </td>
                                            <td>
                                                설비
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    <div class="m02_right">
                        <div class="m02_r_top">
                            <button class="m02_r_top_bt1" onclick="r_bottom_addrow()">
                                <img src="./resources/img/설정bt2.png">
                            </button>
                        </div>
                        <div class="m02_r_bot">
                            <div class="m2_r_bot_bottom">
                                <table class="m2_r_bot_bottom_table" id="m2_r_bot_bottom_table">
                                    <thead>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                                시스템 코드값
                                            </td>
                                            <td>
                                                코드명
                                            </td>
                                            <td>
                                                코드설명
                                            </td>
                                            <td>
                                                삭제
                                            </td>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 기준정보 > 제품관리 -->
            <div class="mainbody_03">
                <div class="mainbody_03_total">
                    <div class="mainbody_03_01">
                        <div class="mainbody_03_01_01">
                            <div class="mainbody_03_01_01_btn1">
                                <button class="mainbody_03_01_btn1" onclick="mainbody_03_01_btn1()">
                                    <img src="./resources/img/제품관리/초기화.png" alt="초기화" class="mainbody_03_01_btn1_img1">
                                </button>
                            </div>
                            <div style="width: 47.1%;">

                            </div>
                            <div class="mainbody_03_01_01_btn2">
                                <button class="mainbody_03_01_btn2">
                                    <img src="./resources/img/제품관리/엑셀.png" alt="엑셀" class="mainbody_03_01_btn1_img2">
                                </button>
                            </div>
                            <div class="mainbody_03_01_01_btn3">
                                <button class="mainbody_03_01_btn3">
                                    <img src="./resources/img/제품관리/저장.png" alt="저장" class="mainbody_03_01_btn1_img3">
                                </button>
                            </div>
                        </div>
                        <div class="mainbody_03_01_02">
                            <table class="product_admin_tb_01">
                                <tr>
                                    <td class="product_admin_green">품목번호</td>
                                    <td class="product_admin_td_02" colspan="2"><input autocomplete='off'
                                            class="product_admin_in" id="m3_l_itemnum_input" name="item_num"></td>

                                </tr>
                                <tr>
                                    <td class="product_admin_green">품목명</td>
                                    <td class="product_admin_td_02" colspan="2"><input id="m3_l_itemname_input"
                                            autocomplete='off' class="product_admin_in"></td>
                                </tr>
                                <tr>
                                    <td class="product_admin_green">품목구분</td>
                                    <td class="product_admin_td_02">
                                        <div class="product_admin_td_02_00">
                                            <div class="product_admin_td_03_select">
                                                <div class="product_admin_td_03_select_txt"
                                                    id="product_admin_td_03_select_txt">
                                                </div>
                                                <div class="product_admin_td_03_select_txt2">
                                                    <button class="product_admin_td_03_select_btn"
                                                        onclick="product_admin_td_03_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="">
                                                <li class="option">완제품</li>
                                                <li class="option">반제품</li>
                                                <li class="option">외주가공품</li>
                                                <li class="option">원자재</li>
                                                <li class="option">부자재</li>
                                            </ul>
                                        </div>
                                    </td>


                                </tr>
                                <tr>
                                    <td class="product_admin_green">단위</td>
                                    <td class="product_admin_td_02">
                                        <div class="m03_product_admin_td04_div">
                                            <div class="m03_product_admin_td04_select">
                                                <div class="m03_product_admin_td04_select_txt"
                                                    id="m03_product_admin_td04_select_txt">
                                                </div>
                                                <div class="m03_product_admin_td04_select_txt2">
                                                    <button class="m03_product_admin_td04_select_btn"
                                                        onclick="m03_product_admin_td04_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m03_product_admin_td04_select_txt_list">
                                                <li class="option">완제품</li>
                                                <li class="option">반제품</li>
                                                <li class="option">외주가공품</li>
                                                <li class="option">원자재</li>
                                                <li class="option">부자재</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="product_admin_td_01">제품군</td>
                                    <td class="product_admin_td_02">
                                        <div class="m03_product_admin_td05_div">
                                            <div class="m03_product_admin_td05_select">
                                                <div class="m03_product_admin_td05_select_txt"
                                                    id="m03_product_admin_td05_select_txt">
                                                </div>
                                                <div class="m03_product_admin_td05_select_txt2">
                                                    <button class="m03_product_admin_td05_select_btn"
                                                        onclick="m03_product_admin_td05_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m03_product_admin_td05_select_txt_list">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="product_admin_td_01">라우팅</td>
                                    <td class="product_admin_td_02">
                                        <div class="m03_product_admin_td06_div">
                                            <div class="m03_product_admin_td06_select">
                                                <div class="m03_product_admin_td06_select_txt"
                                                    id="m03_product_admin_td06_select_txt">
                                                </div>
                                                <div class="m03_product_admin_td06_select_txt2">
                                                    <button class="m03_product_admin_td06_select_btn"
                                                        onclick="m03_product_admin_td06_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul>
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="product_admin_td_01">대분류</td>
                                    <td class="product_admin_td_02">
                                        <div class="m03_product_admin_td07_div">
                                            <div class="m03_product_admin_td07_select">
                                                <div class="m03_product_admin_td07_select_txt"
                                                    id="m03_product_admin_td07_select_txt">
                                                </div>
                                                <div class="m03_product_admin_td07_select_txt2">
                                                    <button class="m03_product_admin_td07_select_btn"
                                                        onclick="m03_product_admin_td07_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m03_product_admin_td07_select_txt_list">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="product_admin_td_01">소분류</td>
                                    <td class="product_admin_td_02">
                                        <div class="m03_product_admin_td08_div">
                                            <div class="m03_product_admin_td08_select">
                                                <div class="m03_product_admin_td08_select_txt"
                                                    id="m03_product_admin_td08_select_txt">
                                                </div>
                                                <div class="m03_product_admin_td08_select_txt2">
                                                    <button class="m03_product_admin_td08_select_btn"
                                                        onclick="m03_product_admin_td08_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m03_product_admin_td08_select_txt_list">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="product_admin_td_01">규격</td>
                                    <td class="product_admin_td_02" colspan="2"><input id="m3_l_standard_input"
                                            autocomplete='off' class="product_admin_in"></td>
                                </tr>
                                <tr>
                                    <td class="product_admin_td_01">단가</td>
                                    <td class="product_admin_td_02" colspan="2"><input id="m3_l_money_input"
                                            autocomplete='off' class="product_admin_in"></td>
                                </tr>
                                <tr>
                                    <td class="product_admin_td_01">거래처</td>
                                    <td class="product_admin_td_02" colspan="2">
                                        <div class="product_admin_td_09_01_select">
                                            <div class="product_admin_td_09_01_select_01" id="product_admin_td_09_01_select_01">
                                            </div>
                                            <div class="product_admin_td_09_01_select_03">
                                                <button class="customerSearch_btn" onclick="customerOpen()">
                                                    <img src="./resources/img/제품관리/선택.png"
                                                        class="mainbody_03_01_choice_01">
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="product_admin_td_01"></td>
                                    <td class="product_admin_td_02" colspan="2">
                                        <div class="product_admin_td_09_02_select">
                                            <div class="product_admin_td_09_02_select_01">

                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="product_admin_td_01">포장단위</td>
                                    <td class="product_admin_td_02">
                                        <div class="m03_product_admin_td09_div">
                                            <div class="m03_product_admin_td09_select">
                                                <div class="m03_product_admin_td09_select_txt"
                                                    id="m03_product_admin_td09_select_txt">
                                                </div>
                                                <div class="m03_product_admin_td09_select_txt2">
                                                    <button class="m03_product_admin_td09_select_btn"
                                                        onclick="m03_product_admin_td09_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m03_product_admin_td09_select_txt_list">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="product_admin_td_01">포장단위수량</td>
                                    <td class="product_admin_td_02" colspan="2"><input id="m3_l_packcount_input"
                                            autocomplete='off' class="product_admin_in"></td>
                                </tr>
                                <tr>
                                    <td class="product_admin_td_01">안전재고수량</td>
                                    <td class="product_admin_td_02" colspan="2"><input id="m3_l_savecount_input"
                                            autocomplete='off' class="product_admin_in"></td>
                                </tr>
                                <tr>
                                    <td class="product_admin_td_01">기본 로케이션</td>
                                    <td class="product_admin_td_02" colspan="2">
                                        <div class="product_admin_td_13_select">
                                            <div class="product_admin_td_13_select_01" id="product_admin_td_13_select_01">

                                            </div>
                                            <div class="product_admin_td_13_select_02">
                                                <button class="mainbody_03_01_btn5" onclick="m03_product_locationOpen()"><img
                                                        src="./resources/img/제품관리/선택.png"
                                                        class="mainbody_03_01_choice_02"></button>
                                            </div>

                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="mainbody_03_02">
                        <div class="mainbody_03_02_01">
                            <div class="mainbody_03_02_01_search">
                                <input autocomplete='off' class="product_admin_searchInput" placeholder="검색어를 입력하세요" onkeyup="enterkey4()">
                            </div>
                            <div class="mainbody_03_02_01_del">
                                <button class="mainbody_03_02_01_del_bt">
                                    <img src="./resources/img/삭제.png">
                                </button>
                            </div>
                        </div>
                        <div class="mainbody_03_02_02">
                            <table class="product_admin_tb_02" id="product_admin_tb_02">
                                <thead>
                                    <tr>
                                        <td></td>
                                        <td>품목번호</td>
                                        <td>품목명</td>
                                        <td>제품군</td>
                                        <td>라우팅</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="product_admin_tb_line">
                                        <td class="product_admin_tb_line_01"><input autocomplete='off' type="checkbox"
                                                name="xxx" value="yyy" class="productAdmin_check"></td>
                                        <td class="product_admin_tb_line">010101</td>
                                        <td class="product_admin_tb_line">퓨미</td>
                                        <td class="product_admin_tb_line">ㄹㅇㄴㅁㄹㅇㄴ</td>
                                        <td class="product_admin_tb_line">ㄹㅇㄴㅁㄹ</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


            <!-- 기준정보 > 자재관리 -->
            <div class="mainbody_04">
                <div class="mainbody_04_total">
                    <div class="mainbody_04_01">
                        <div class="mainbody_04_01_01">
                            <div class="mainbody_04_01_01_btn1">
                                <button class="mainbody_04_01_btn1" onclick="mainbody_04_01_btn1()">
                                    <img src="./resources/img/제품관리/초기화.png" alt="초기화" class="mainbody_04_01_btn1_img1">
                                </button>
                            </div>
                            <div style="width: 47.1%;">

                            </div>
                            <div class="mainbody_04_01_01_btn2">
                                <button class="mainbody_04_01_btn2">
                                    <img src="./resources/img/제품관리/엑셀.png" alt="엑셀" class="mainbody_04_01_btn1_img2">
                                </button>
                            </div>
                            <div class="mainbody_04_01_01_btn3">
                                <button class="mainbody_04_01_btn3">
                                    <img src="./resources/img/제품관리/저장.png" alt="저장" class="mainbody_04_01_btn1_img3">
                                </button>
                            </div>
                        </div>
                        <div class="mainbody_04_01_02">
                            <table class="m04_goods_admin_tb_01">
                                <tr>
                                    <td class="m04_goods_admin_green">품목번호</td>
                                    <td class="m04_goods_admin_td_02" colspan="2"><input autocomplete='off'
                                            class="m04_goods_admin_in" id="m4_l_itemnum_input" name="item_num"></td>

                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_green">품목명</td>
                                    <td class="m04_goods_admin_td_02" colspan="2"><input id="m4_l_itemname_input"
                                            autocomplete='off' class="m04_goods_admin_in"></td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_green">품목구분</td>
                                    <td class="m04_goods_admin_td_02">
                                        <div class="m04_goods_admin_td_02_00">
                                            <div class="m04_goods_admin_td_03_select">
                                                <div class="m04_goods_admin_td_03_select_txt"
                                                    id="m04_goods_admin_td_03_select_txt">
                                                </div>
                                                <div class="m04_goods_admin_td_03_select_txt2">
                                                    <button class="m04_goods_admin_td_03_select_btn"
                                                        onclick="product_admin_td_03_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul>
                                                <li class="option">완제품</li>
                                                <li class="option">반제품</li>
                                                <li class="option">외주가공품</li>
                                                <li class="option">원자재</li>
                                                <li class="option">부자재</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_green">단위</td>
                                    <td class="m04_goods_admin_td_02">
                                        <div class="m04_goods_admin_td04_02_00">
                                            <div class="m04_goods_admin_td04_03_select">
                                                <div class="m04_goods_admin_td04_03_select_txt"
                                                    id="m04_goods_admin_td04_03_select_txt">
                                                </div>
                                                <div class="m04_goods_admin_td04_03_select_txt2">
                                                    <button class="m04_goods_admin_td04_03_select_btn"
                                                        onclick="product_admin_td04_03_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m04_goods_admin_td04_03_select_txt_list">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01">제품군</td>
                                    <td class="m04_goods_admin_td_02">
                                        <div class="m04_goods_admin_td05_02_00">
                                            <div class="m04_goods_admin_td05_03_select">
                                                <div class="m04_goods_admin_td05_03_select_txt"
                                                    id="m04_goods_admin_td05_03_select_txt">
                                                </div>
                                                <div class="m04_goods_admin_td05_03_select_txt2">
                                                    <button class="m04_goods_admin_td05_03_select_btn"
                                                        onclick="product_admin_td05_03_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m04_goods_admin_td05_03_select_txt_list">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01">라우팅</td>
                                    <td class="m04_goods_admin_td_02">
                                        <div class="m04_goods_admin_td06_02_00">
                                            <div class="m04_goods_admin_td06_03_select">
                                                <div class="m04_goods_admin_td06_03_select_txt"
                                                    id="m04_goods_admin_td06_03_select_txt">
                                                </div>
                                                <div class="m04_goods_admin_td06_03_select_txt2">
                                                    <button class="m04_goods_admin_td06_03_select_btn"
                                                        onclick="product_admin_td06_03_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul>
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01">대분류</td>
                                    <td class="m04_goods_admin_td_02">
                                        <div class="m04_goods_admin_td07_02_00">
                                            <div class="m04_goods_admin_td07_03_select">
                                                <div class="m04_goods_admin_td07_03_select_txt"
                                                    id="m04_goods_admin_td07_03_select_txt">
                                                </div>
                                                <div class="m04_goods_admin_td07_03_select_txt2">
                                                    <button class="m04_goods_admin_td07_03_select_btn"
                                                        onclick="product_admin_td07_03_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m04_goods_admin_td07_03_select_txt_list">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01">소분류</td>
                                    <td class="m04_goods_admin_td_02">
                                        <div class="m04_goods_admin_td08_02_00">
                                            <div class="m04_goods_admin_td08_03_select">
                                                <div class="m04_goods_admin_td08_03_select_txt"
                                                    id="m04_goods_admin_td08_03_select_txt">
                                                </div>
                                                <div class="m04_goods_admin_td08_03_select_txt2">
                                                    <button class="m04_goods_admin_td08_03_select_btn"
                                                        onclick="product_admin_td08_03_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m04_goods_admin_td08_03_select_txt_list">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01">규격</td>
                                    <td class="m04_goods_admin_td_02" colspan="2"><input id="m4_l_standard_input"
                                            autocomplete='off' class="m04_goods_admin_in"></td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01">단가</td>
                                    <td class="m04_goods_admin_td_02" colspan="2"><input id="m4_l_money_input"
                                            autocomplete='off' class="m04_goods_admin_in"></td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01">거래처</td>
                                    <td class="m04_goods_admin_td_02" colspan="2">
                                        <div class="m04_goods_admin_td_09_01_select">
                                            <div class="m04_goods_admin_td_09_01_select_01"
                                            id="m04_goods_admin_td_09_01_select_01">
                                            </div>
                                            <div class="m04_goods_admin_td_09_01_select_03">
                                                <button class="m04_goods_customerSearch_btn"
                                                    onclick="m04_goods_customerOpen()">
                                                    <img src="./resources/img/제품관리/선택.png"
                                                        class="mainbody_04_01_choice_01">
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01"></td>
                                    <td class="m04_goods_admin_td_02" colspan="2">
                                        <div class="m04_goods_admin_td_09_02_select">
                                            <div class="m04_goods_admin_td_09_02_select_01">

                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01">포장단위</td>
                                    <td class="m04_goods_admin_td_02">
                                        <div class="m04_goods_admin_td09_02_00">
                                            <div class="m04_goods_admin_td09_03_select">
                                                <div class="m04_goods_admin_td09_03_select_txt"
                                                    id="m04_goods_admin_td09_03_select_txt">
                                                </div>
                                                <div class="m04_goods_admin_td09_03_select_txt2">
                                                    <button class="m04_goods_admin_td09_03_select_btn"
                                                        onclick="product_admin_td09_03_select_btn_click()">
                                                        <img src="./resources/img/제품관리/엑스.png">
                                                    </button>
                                                </div>
                                            </div>
                                            <ul id="m04_goods_admin_td09_03_select_txt_list">
                                                <li class="option">1</li>
                                                <li class="option">2</li>
                                                <li class="option">3</li>
                                                <li class="option">4</li>
                                                <li class="option">5</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01">포장단위수량</td>
                                    <td class="m04_goods_admin_td_02" colspan="2"><input id="m4_l_packcount_input"
                                            autocomplete='off' class="m04_goods_admin_in"></td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01">안전재고수량</td>
                                    <td class="m04_goods_admin_td_02" colspan="2"><input id="m4_l_savecount_input"
                                            autocomplete='off' class="m04_goods_admin_in"></td>
                                </tr>
                                <tr>
                                    <td class="m04_goods_admin_td_01">기본 로케이션</td>
                                    <td class="m04_goods_admin_td_02" colspan="2">
                                        <div class="m04_goods_admin_td_13_select">
                                            <div class="m04_goods_admin_td_13_select_01"
                                            id="m04_goods_admin_td_13_select_01">

                                            </div>
                                            <div class="m04_goods_admin_td_13_select_02">
                                                <button class="mainbody_04_01_btn5"
                                                    onclick="m04_goods_locationOpen()"><img
                                                        src="./resources/img/제품관리/선택.png"
                                                        class="mainbody_04_01_choice_02"></button>
                                            </div>

                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="mainbody_04_02">
                        <div class="mainbody_04_02_01">
                            <div class="mainbody_04_02_01_search">
                                <input autocomplete='off' class="m04_goods_admin_searchInput" placeholder="검색어를 입력하세요" onkeyup="enterkey5()">
                            </div>
                            <div class="mainbody_04_02_01_del">
                                <button class="mainbody_04_02_01_del_bt">
                                    <img src="./resources/img/삭제.png">
                                </button>
                            </div>
                        </div>
                        <div class="mainbody_04_02_02">
                            <table class="m04_goods_admin_tb_02" id="m04_goods_admin_tb_02">
                                <thead>
                                    <tr>
                                        <td></td>
                                        <td>품목번호</td>
                                        <td>품목명</td>
                                        <td>제품군</td>
                                        <td>라우팅</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="m04_goods_admin_tb_line" id="m04_goods_admin_tb_line">
                                        <td class="m04_goods_admin_tb_line_01"><input autocomplete='off' type="checkbox"
                                                name="xxx" value="yyy" class="goodsAdmin_check"></td>
                                        <td class="m04_goods_admin_tb_line">010101</td>
                                        <td class="m04_goods_admin_tb_line">퓨미</td>
                                        <td class="m04_goods_admin_tb_line">ㄹㅇㄴㅁㄹㅇㄴ</td>
                                        <td class="m04_goods_admin_tb_line">ㄹㅇㄴㅁㄹ</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 기준정보 > 공정관리 -->
            <div class="mainbody_05">
                <div class="mainbody_05_01">
                    <div class="mainbody_05_top">
                        <div class="mainbody_05_01_left">
                            <div class="mainbody_05_01_left_top">
                                <div class="mainbody_05_btn_body1">
                                    <button class="mainbody_05_btn1" onclick="mainbody_05_btn1()">
                                        <img src="./resources/img/공정관리/초기화.png" alt="초기화"
                                            class="processAdmin_btn_img_01">
                                    </button>
                                </div>
                                <div class="mainbody_05_btn_body2">

                                </div>
                                <div class="mainbody_05_btn_body3">
                                    <button class="mainbody_05_btn2">
                                        <img src="./resources/img/공정관리/엑셀.png" alt="엑셀" class="processAdmin_btn_img_02">
                                    </button>
                                </div>
                                <div class="mainbody_05_btn_body4">
                                    <button class="mainbody_05_btn3" onclick="processInsert()">
                                        <img src="./resources/img/공정관리/저장.png" alt="저장" class="processAdmin_btn_img_03">
                                    </button>
                                </div>
                            </div>
                            <div class="mainbody_05_01_left_bott">
                                <div class="mainbody_05_01_left_bott_tb">
                                    <table class="mainbody_05_01_left_bott_tb_table">
                                        <tbody>
                                            <tr>
                                                <td style="color: #5DBA8E;">
                                                    공정번호
                                                </td>
                                                <td>
                                                    <input autocomplete="off" type="text" id="processAdmin_tb_01_num">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="color: #5DBA8E;">
                                                    공정명
                                                </td>
                                                <td>
                    								<input autocomplete="off" type="text" id="processAdmin_tb_01_name">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="color: #5DBA8E;">
                                                    공정구분
                                                </td>
                                                <td>
                                                    <div class="mainbody_05_02_left_bott_tb_table_select">
                                                        <div class="mainbody_05_02_left_bott_tb_table_selected">
                                                            <div class="mainbody_05_02_left_bott_tb_table_txt" id="mainbody_05_02_left_bott_tb_table_txt">
                                                                &nbsp;
                                                            </div>
                                                            <div class="mainbody_05_02_left_bott_tb_table_btn">
                                                                <button class="mainbody_05_02_left_bott_tb_table_btn_cls" onclick="mainbody_05_02_left_bott_tb_table_btn_cls()">
                                                                    <img src="./resources/img/제품관리/엑스.png">
                                                                </button>
                                                            </div>
                                                            <ul id="mainbody_05_02_left_bott_tb_table_txt_list">
                                                                <li class="option">1</li>
                                                                <li class="option">2</li>
                                                                <li class="option">3</li>
                                                                <li class="option">4</li>
                                                                <li class="option">5</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    주 설비
                                                </td>
                                                <td>
                                                    <div class="mainbody_05_03_left_bott_tb_table_select">
                                                        <div class="mainbody_05_03_left_bott_tb_table_selected">
                                                            <div class="mainbody_05_03_left_bott_tb_table_txt" id="processAdmin_tb_01_system">
                                                                &nbsp;
                                                            </div>
                                                            <div class="mainbody_05_03_left_bott_tb_table_btn">
                                                                <button class="mainbody_05_03_left_bott_tb_table_btn_cls" onclick="mainbody_05_03_left_bott_tb_table_btn_cls()">
                                                                    <img src="./resources/img/제품관리/엑스.png">
                                                                </button>
                                                            </div>
                                                            <ul id="processAdmin_tb_01_system_list">
                                                                <li class="option">1</li>
                                                                <li class="option">2</li>
                                                                <li class="option">3</li>
                                                                <li class="option">4</li>
                                                                <li class="option">5</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    검토자
                                                </td>
                                                <td>
                                                    <div class="mainbody_05_04_left_bott_tb_table_select">
                                                        <div class="mainbody_05_04_left_bott_tb_table_select_txt"
                                                         id="processAdmin_tb_01_wrapp_01_01">
                                                            &nbsp;
                                                        </div>
                                                        <button class="mainbody_05_04_left_bott_tb_table_select_bt02" onclick="mainbody_05_03_left_bott_tb_table_select_bt02()">
                                                            <img src="./resources/img/제품관리/선택.png">
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    승인자
                                                </td>
                                                <td>
                                                    <div class="mainbody_05_05_left_bott_tb_table_select">
                                                        <div class="mainbody_05_05_left_bott_tb_table_select_txt" id="processAdmin_tb_01_wrapp_02_01">
                                                            &nbsp;
                                                        </div>
                                                        <button class="mainbody_05_05_left_bott_tb_table_select_bt03" onclick="mainbody_05_03_left_bott_tb_table_select_bt03()">
                                                            <img src="./resources/img/제품관리/선택.png">
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    메모
                                                </td>
                                                <td>
                                                    <input autocomplete="off" type="text" id="processAdmin_tb_01_memo">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                        <div class="mainbody_05_01_right">
                            <div class="mainbody_05_01_right_top">
                                <div class="mainbody_05_01_right_top_01">
                                    <input autocomplete='off' placeholder="검색어를 입력하세요" class="processAdmin_search" onkeyup="enterkey2()">
                                </div>
                                <div class="mainbody_05_01_right_top_01_bt4">
                                    <div class="mainbody_05_01_right_top_01_bt4_l">
                                        <button class="mainbody_05_btn4_2" onclick="mainbody_05_btn4_2()">
                                            <img src="./resources/img/라우팅.png">
                                        </button>
                                    </div>
                                    <div class="mainbody_05_01_right_top_01_bt4_r">
                                        <button class="mainbody_05_btn4" onclick="processDelete()">
                                            <img src="./resources/img/삭제.png" alt="삭제" class="processAdmin_btn_img_04">
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="mainbody_05_01_right_bott">
                                <table class="processAdmin_tb_02">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>공정번호</th>
                                            <th>공정명</th>
                                            <th>공정구분</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <input autocomplete='off' type="checkbox"
                                                    id="processAdmin_tb_02_checkbox">
                                                <label for="processAdmin_tb_02_checkbox"></label>
                                            </td>
                                            <td>02020230230</td>
                                            <td>공ㄹㅇㄴㅁㄹㅇㄴㅁ</td>
                                            <td>공정구분ㄹㅇㄴㅁㄻㄴㅇ</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="mainbody_05_bott">
                        <div class="mainbody_05_bott_01">
                            <div class="mainbody_05_bott_01_left">
                                <button class="mainbody_05_btn5" onclick="mainbody_05_btn5()">
                                    <img src="./resources/img/공정관리/새검사항목추가.png" class="processAdmin_btn_img_05">
                                </button>
                            </div>
                            <div class="mainbody_05_bott_01_right">
                                <div class="mainbody_05_bott_01_right_01">
                                    <button class="mainbody_05_btn6">
                                        <img src="./resources/img/공정관리/엑셀.png" class="processAdmin_btn_img_06">
                                    </button>
                                </div>
                                <div class="mainbody_05_bott_01_right_02">
                                    <button class="mainbody_05_btn7" onclick="mainbody_05_btn7()">
                                        <img src="./resources/img/공정관리/저장.png" class="processAdmin_btn_img_07">
                                    </button>
                                </div>
                                <div class="mainbody_05_bott_01_right_03">
                                    <button class="mainbody_05_btn8">
                                        <img src="./resources/img/삭제.png" class="processAdmin_btn_img_08">
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="mainbody_05_bott_02">
                            <table class="processAdmin_tb_03" id="processAdmin_tb_03">
                                <thead>
                                    <tr>
                                        <th>
                                        </th>
                                        <th>대분류</th>
                                        <th>소분류</th>
                                        <th>검사항목명</th>
                                        <th>입력값 구분</th>
                                        <th>검사기준</th>
                                        <th>검사방법</th>
                                        <th>최댓값</th>
                                        <th>최소값</th>
                                        <th>입력단위</th>
                                        <th>시료수</th>
                                        <th>정렬순서</th>
                                        <th>자주검사</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input autocomplete='off' type="checkbox" id="processAdmin_tb_03_checkbox">
                                            <label for="processAdmin_tb_03_checkbox"></label>
                                        </td>
                                        <td>fdsa</td>
                                        <td>gfdsgf</td>
                                        <td>gfdsgfds</td>
                                        <td>gfdsgfds</td>
                                        <td>gfdsgfd</td>
                                        <td>gfds</td>
                                        <td>gfds</td>
                                        <td>gfds</td>
                                        <td>gfsd</td>
                                        <td>gfds</td>
                                        <td>gfds</td>
                                        <td>gfds</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 기준정보 > 거래처관리 -->
            <div class="mainbody_06">
                <div class="mainbody_06_01">
                    <div class="mainbody_06_01_left">
                        <div class="mainbody_06_01_left_top">
                            <div class="mainbody_06_btn_body1">
                                <button class="mainbody_06_btn1" onclick="mainbody_06_btn1()">
                                    <img src="./resources/img/공정관리/초기화.png" alt="초기화"
                                        class="m06_processAdmin_btn_img_01">
                                </button>
                            </div>
                            <div class="mainbody_06_btn_body2">

                            </div>
                            <div class="mainbody_06_btn_body3">
                                <button class="mainbody_06_btn2">
                                    <img src="./resources/img/공정관리/엑셀.png" alt="엑셀" class="m06_processAdmin_btn_img_02">
                                </button>
                            </div>
                            <div class="mainbody_06_btn_body4">
                                <button class="mainbody_06_btn3">
                                    <img src="./resources/img/공정관리/저장.png" alt="저장" class="m06_processAdmin_btn_img_03">
                                </button>
                            </div>
                        </div>
                        <div class="m06_le_bottom_table_zip">
                            <div class="m06_le_bottom_table">
                                <table>
                                    <tr>
                                        <td class="m06_title01">거래처번호&nbsp;:</td>
                                        <td class="m06_num" style="text-align: center; color:#999999;">자동으로 부여됩니다.</td>
                                    </tr>
                                    <tr>
                                        <td class="m06_title02">상호</td>
                                        <td class="m06_num"><input id="m06_l_mutual_input" autocomplete='off'
                                                type="text"></td>
                                    </tr>
                                    <tr>
                                        <td class="m06_title02">거래처구분</td>
                                        <td class="m06_num01">
                                            <input class="m06_radio" type="radio" name="account" value="매출처" id="매출처"
                                                style="width: 0.9vw;">매출처
                                            <input class="m06_radio" type="radio" name="account" value="매입처" id="매입처"
                                                style="width: 0.9vw;">매입처
                                            <input class="m06_radio" type="radio" name="account" value="외주처" id="외주처"
                                                style="width: 0.9vw;">외주처
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m06_title02">대표자명</td>
                                        <td class="m06_num"><input id="m06_l_name_input" autocomplete='off' type="text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m06_title02">사업자번호</td>
                                        <td class="m06_num"><input id="m06_l_bsnum_input" autocomplete='off'
                                                type="text"></td>
                                    </tr>
                                    <tr>
                                        <td class="m06_title02">담당자명</td>
                                        <td class="m06_num"><input id="m06_l_person_name_input" autocomplete='off'
                                                type="text"></td>
                                    </tr>
                                    <tr>
                                        <td>우편번호</td>
                                        <td class="m06_num"><input id="m06_l_post_input" autocomplete='off' type="text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>주소</td>
                                        <td class="m06_num"><input id="m06_l_address_input" autocomplete='off'
                                                type="text"></td>
                                    </tr>
                                    <tr>
                                        <td>업태</td>
                                        <td class="m06_num"><input id="m06_l_bs01_input" autocomplete='off' type="text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>업종</td>
                                        <td class="m06_num"><input id="m06_l_bs02_input" autocomplete='off' type="text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>연락처</td>
                                        <td class="m06_num"><input id="m06_l_phone_input" autocomplete='off'
                                                type="text"></td>
                                    </tr>
                                    <tr>
                                        <td>FAX</td>
                                        <td class="m06_num"><input id="m06_l_fax_input" autocomplete='off' type="text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>e-mail</td>
                                        <td class="m06_num"><input id="m06_l_email_input" autocomplete='off'
                                                type="text"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="mainbody_06_01_right">
                        <div class="mainbody_06_01_r_top">
                            <div class="m06_customer_search">
                                <input autocomplete='off' class="m06_c_s_input" type="text" placeholder="검색어를 입력하세요" onkeyup="enterkey3()">
                            </div>
                            <div class="m06_customer_delete">
                                <button class="m06_customer_delete_btn">
                                    <img src="./resources/img/삭제.png">
                                </button>
                            </div>
                        </div>
                        <div class="mainbody_06_01_r_bottom">
                            <div class="m06_cus_list">
                                <table class="m06_cus_list_table">
                                    <thead class="m06_cus_list_thead">
                                        <tr>
                                            <td></td>
                                            <td>거래처명</td>
                                            <td>거래처번호</td>
                                            <td>사업자번호</td>
                                            <td>대표자명</td>
                                        </tr>
                                    </thead>
                                    <tbody class="m06_cus_list_tbody">
                                        <tr>
                                            <td>
                                                <input autocomplete='off' type="checkbox" id="m06_cus_list_tbody_check">
                                                <label for="m06_cus_list_tbody_check"></label>
                                            </td>
                                            <td>주식회사 유니컴퍼니</td>
                                            <td>000-0000-0000</td>
                                            <td>sfdg</td>
                                            <td>sdfg</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 기준정보 > BOM관리 -->
            <div class="mainbody_07">
                <div class="mainbody_07_01">
                    <div class="mainbody_07_02_right">
                        <div class="mainbody_07_02_r_top">
                            <div class="m07_bom_search">
                                <input autocomplete='off' class="m07_b_s_input" type="text" placeholder="검색어를 입력하세요" onkeyup="enterkey6()">
                            </div>
                        </div>
                        <div class="mainbody_07_02_r_bottom">
                            <div class="m07_bom_list">
                                <table class="m07_bom_list_table">
                                    <thead class="m07_bom_list_thead">
                                        <tr>
                                            <td>품목번호</td>
                                            <td>품목명</td>
                                            <td>제품군</td>
                                            <td>라우팅</td>
                                            <td>삭제</td>
                                        </tr>
                                    </thead>
                                    <tbody class="m07_bom_list_tbody">
                                        <tr class="m07_bom_list_tbody_tr">
                                            <td>000000000000</td>
                                            <td>에코클린매트</td>
                                            <td>클린매트</td>
                                            <td>포장공정</td>
                                            <td>
                                                <div class="m07_bom_list_tbody_btn_01_01">
                                                    <button class="m07_bom_list_tbody_btn_01_02">
                                                        <img src="./resources/img/BOM/휴지통.png">
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="m07_bom_list_tbody_tr">
                                            <td>000000000000</td>
                                            <td>에코클린매트</td>
                                            <td>클린매트</td>
                                            <td>포장공정</td>
                                            <td>
                                                <div class="m07_bom_list_tbody_btn_01_01">
                                                    <button class="m07_bom_list_tbody_btn_01_02">
                                                        <img src="./resources/img/BOM/휴지통.png">
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="mainbody_07_01_left">
                        <div class="m07_le_top_allbtn_zip">
                            <div class="m07_allbtn_zip_left">
                                <button class="m07_allbtn_zip_left_btn">
                                    <img src="./resources/img/BOM/전체엑셀.png"></button>
                            </div>
                            <div class="m07_allbtn_zip_right">
                                <button class="m07_allbtn_zip_right_btn">
                                    <img src="./resources/img/BOM/엑셀.png"></button>
                            </div>
                        </div>
                        <div class="m07_le_bottom_table_zip">
                            <div class="m07_le_bottom_table_title">
                                <div class="m07_le_bottom_table_title_a">부품 구성 BOM</div>
                            </div>
                            <div class="m07_le_bottom_table">
                                <table class="m07_le_bom_list_table">
                                    <thead class="m07_le_bom_list_thead">
                                        <tr>
                                            <td>[구분] 부품명</td>
                                            <td>품목번호</td>
                                            <td>소요량</td>
                                            <td>규격</td>
                                            <td>단위</td>
                                            <td>추가</td>
                                            <td>삭제</td>
                                        </tr>
                                    </thead>
                                    <tbody class="m07_le_bom_list_tbody">
                                        <!--bom table 메인-->
                                        <tr class="m07_cate_name_10 main">
                                        </tr>
                                        <!--bom table 반제품 영역-->
                                        <tr class="m07_cate_name_10 mid">

                                        </tr>
                                        <!--bom table 부품 영역-->
                                        <tr class="m07_cate_name_10 sub">
                                            <td class="m07_cate_sub_name_10_01">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└ [부품]에코클린매트</td>
                                            <td class="m07_cate_sub_name_10_02">310000</td>
                                            <td class="m07_cate_sub_name_10_03">100</td>
                                            <td class="m07_cate_sub_name_10_04">50*50</td>
                                            <td class="m07_cate_sub_name_10_05">kg</td>
                                            <td class="m07_cate_sub_name_10_06">
                                                <div class="m07_bom_list_tbody_btn_02_01">
                                                    <button class="m07_bom_list_tbody_btn_02_02">
                                                        <img src="./resources/img/BOM/부품추가.png">
                                                    </button>
                                                </div>
                                            </td>
                                            <td class="m07_cate_sub_name_10_07">
                                                <div class="m07_bom_list_tbody_btn_03_01">
                                                    <button class="m07_bom_list_tbody_btn_03_02">
                                                        <img src="./resources/img/BOM/네이비_휴지통.png">
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- 기준정보 > 로케이션 -->
            <div class="mainbody_08">
                <div class="mainbody_08_01">
                    <div class="mainbody_08_01_l">
                        <div class="mainbody_08_01_l_top">
                        </div>
                        <div class="mainbody_08_01_l_bottom">
                            <table class="mainbody_08_01_l_bottom_table">
                                <thead>
                                    <tr>
                                        <th>
                                        </th>
                                        <th>
                                            로케이션 분류
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="locationList">
                                    <tr>
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            본사
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            2
                                        </td>
                                        <td>
                                            지사
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            3
                                        </td>
                                        <td>
                                            고객
                                        </td>
                                    </tr>
                                </tbody>

                            </table>

                        </div>
                    </div>
                    <div class="mainbody_08_01_r">
                        <div class="mainbody_08_01_r_top">
                            <div class="mainbody_08_01_r_top_bt_group">
                                <div class="mainbody_08_01_r_top_bt_group_01">
                                    <button class="mainbody_08_01_r_top_bt_group_01_bt" onclick="mainbody_08_01_r_top_bt_group_01_bt()">
                                        <img src="./resources/img/로케이션_추가.png">
                                    </button>
                                </div>
                                <div class="mainbody_08_01_r_top_bt_group_02">
                                    <button class="mainbody_08_01_r_top_bt_group_02_bt" onclick="mainbody_08_01_r_top_bt_group_02_bt()">
                                        <img src="./resources/img/로케이션_수정.png">
                                    </button>
                                </div>
                            </div>
                            <div class="mainbody_08_01_r_top_02">
                                <button class="mainbody_08_01_r_top_02_btn">
                                    <img src="./resources/img/삭제.png">
                                </button>
                            </div>
                        </div>
                        <div class="mainbody_08_01_r_bottom">
                            <table class="mainbody_08_01_r_bottom_table">
                                <thead>
                                    <tr>
                                        <th>

                                        </th>
                                        <th>
                                            로케이션 명
                                        </th>
                                        <th>
                                            로케이션 번호
                                        </th>
                                        <th>
                                            유형
                                        </th>
                                        <th>
                                            장
                                        </th>
                                        <th>
                                            폭
                                        </th>
                                        <th>
                                            고
                                        </th>
                                        <th>
                                            열
                                        </th>
                                        <th>
                                            연
                                        </th>
                                        <th>
                                            단
                                        </th>
                                        <th>
                                            비고
                                        </th>
                                    </tr>
                                </thead>
                                <tbody id="mainbody_08_01_r_bottom_table_body">
                                    <tr>
                                        <td>
                                            <input autocomplete='off' type="checkbox" id="m08_r_bottom_table_checkbox">
                                            <label for="m08_r_bottom_table_checkbox"></label>
                                        </td>
                                        <td>└ 로케이션 명</td>
                                        <td>
                                            153153153135
                                        </td>
                                        <td>
                                            로케이션 유형
                                        </td>
                                        <td>
                                            1535
                                        </td>
                                        <td>
                                            1551
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            153
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input autocomplete='off' type="checkbox" id="m08_r_bottom_table_checkbox">
                                            <label for="m08_r_bottom_table_checkbox"></label>
                                        </td>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;└ 로케이션 명의 하위
                                        </td>
                                        <td>
                                            153153153135
                                        </td>
                                        <td>
                                            로케이션 유형
                                        </td>
                                        <td>
                                            1535
                                        </td>
                                        <td>
                                            1551
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            153
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input autocomplete='off' type="checkbox" id="m08_r_bottom_table_checkbox">
                                            <label for="m08_r_bottom_table_checkbox"></label>
                                        </td>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└ 로케이션 명의 하위의 하위
                                        </td>
                                        <td>
                                            153153153135
                                        </td>
                                        <td>
                                            로케이션 유형
                                        </td>
                                        <td>
                                            1535
                                        </td>
                                        <td>
                                            1551
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            153
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input autocomplete='off' type="checkbox" id="m08_r_bottom_table_checkbox">
                                            <label for="m08_r_bottom_table_checkbox"></label>
                                        </td>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└ 로케이션 명의 하위의 하위의 하위
                                        </td>
                                        <td>
                                            153153153135
                                        </td>
                                        <td>
                                            로케이션 유형
                                        </td>
                                        <td>
                                            1535
                                        </td>
                                        <td>
                                            1551
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            153
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input autocomplete='off' type="checkbox" id="m08_r_bottom_table_checkbox">
                                            <label for="m08_r_bottom_table_checkbox"></label>
                                        </td>
                                        <td>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└ 로케이션 명의 하위의
                                            하위의 하위의 하위최종
                                        </td>
                                        <td>
                                            153153153135
                                        </td>
                                        <td>
                                            로케이션 유형
                                        </td>
                                        <td>
                                            1535
                                        </td>
                                        <td>
                                            1551
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                        <td>
                                            153
                                        </td>
                                        <td>
                                            1531
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>

            </div>


            <!-- 생산관리 > 생산계획 -->
            <div class="mainbody_12">
                <div class="mainbody_12_01">
                  <div class="mainbody_12_left">
                    <div class="mainbody_12_left_top">
                      <table class="produce_plan_tb_01">
                        <tr>
                          <td>계획년월</td>
                          <td><input type="date" id="pp_date"></td>
                        </tr>
                        <tr>
                          <td>제품명</td>
                          <td style="position:relative;">
                            <div class="produce_plan_tb_01_div_01">
                                <div class="produce_plan_tb_01_div_01_txt" id="pp_goods_name">
                                    &nbsp;
                                </div>
                            </div>
                            <button class="produce_plan_tb_01_div_01_btn" onclick="produce_plan_tb_01_div_01_btn()">
                                <img src="./resources/img/생산관리/선택.png">
                            </button>
                        </td>
                        </tr>
                        <tr>
                          <td>주문번호</td>
                          <td><input type="text" id="pp_performance_quantity"></td>
                        </tr>
                        <tr>
                          <td>제품번호</td>
                          <td><div class="produce_plan_tb_01_div_02" id="pp_goods_num">&nbsp;</div></td>
                        </tr>
                        <tr>
                          <td>생산일자</td>
                          <td><input type="date" id="pp_product_date"></td>
                        </tr>
                        <tr>
                          <td>계획수량</td>
                          <td><input type="text" id="pp_quantity"></td>
                        </tr>
                        <tr>
                          <td colspan="2">
                            <div class="process_plan_btn_00">
                            <div class="process_plan_btn_l">
                            <button class="process_plan_btn_01">
                              <img src="./resources/img/cancel.png">
                            </button>
                          </div>
                          <div class="process_plan_btn_r">
                            <button  class="process_plan_btn_02">
                              <img src="./resources/img/okay.png">
                            </button>
                          </div>
                        </div>
                          </td>
                        </tr>
                      </table>
                    </div>
            
                    <div class="mainbody_12_left_bottom">
                      <div class="sec_cal">
                        <div class="cal_nav">
                          <a href="javascript:;" class="nav-btn go-prev">prev</a>
                          <div class="year-month">월 들어가기</div>
                          <a href="javascript:;" class="nav-btn go-next">next</a>
                        </div>
                        <div class="cal_wrap">
                          <div class="days">
                            <div class="day">MON</div>
                            <div class="day">TUE</div>
                            <div class="day">WED</div>
                            <div class="day">THU</div>
                            <div class="day">FRI</div>
                            <div class="day">SAT</div>
                            <div class="day">SUN</div>
                          </div>
                          <div class="dates"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                    <div class="mainbody_12_right">
                      <div class="mainbody_12_right_top">
                        <div class="mainbody_12_right_top_btn">
                          <button  class="process_plan_btn_01">
                            <img src="./resources/img/생산관리/삭제.png">
                          </button>
                        </div>
                        </div>
                      <div class="mainbody_12_right_bottom">
                        <table class="produce_plan_tb_02">
                          <thead>
                            <tr>
                              <td></td>
                              <td>제품명</td>
                              <td>제품번호</td>
                              <td>생산일자</td>
                              <td>계획수량</td>
                              <td>주문번호</td>
                            </tr>
                          </thead>
                          <tbody id="produce_plan_tb_02_tbody">
                            <tr>
                              <td><input type="checkbox"></td>
                              <td>에코클린매트</td>
                              <td>1234562487</td>
                              <td>2022-09-19</td>
                              <td>0</td>
                              <td>1,234,842</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                </div>
              </div>

            <!-- 생산관리 > 작업지시 -->
            <div class="mainbody_11">
                <div class="mainbody_11_00">
                  <div class="mainbody_11_01">
                    <div class="mainbody_11_01_top">
                      <div class="mainbody_11_01_top_l">
                        <div class="mainbody_11_01_top_01">작업지시번호:</div>
                        <div class="mainbody_11_01_top_01_00"></div>
                        <div class="mainbody_11_01_top_02_00">
                          <div class="mainbody_11_01_top_02">
                            <button class="mainbody_11_01_top_btn_01" onclick="openCloseToc()">
                              <img src="./resources/img/생산관리/작업지시생성.png"> 
                            </button>
                          </div>
                          <div class="mainbody_11_01_top_03">
                            <button class="mainbody_11_01_top_btn_02">
                              <img src="./resources/img/생산관리/저장.png"> 
                            </button>
                          </div>
                        </div>
                  </div>
                    <div class="mainbody_11_01_top_c">
                      <div class="mainbody_11_01_top_04">생산계획:</div>
                      <div class="mainbody_11_01_top_04_01"></div>
                    </div>
                    <div class="mainbody_11_01_top_r">
                      <div class="mainbody_11_01_top_05">주문:</div>
                      <div class="mainbody_11_01_top_05_01"></div>
                    </div>
                  </div>
                    <div class="mainbody_11_01_bott">
                      <table class="work_order_tb_01">
                        <thead>
                          <tr>
                            <td colspan="8">
                              <div class="work_order_tb_01_th">주문(생산계획)정보</div>
                            </td>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>주문번호:</td>
                            <td id="wo_go_num"></td>
                            <td>고객:</td>
                            <td id="wo_go_client"></td>
                            <td>납기일자:</td>
                            <td id="wo_go_dueDate"></td>
                            <td>고객발주번호:</td>
                            <td id="wo_go_place"></td>
                          </tr>
                          <tr>
                            <td>품목번호:</td>
                            <td id="wo_go_goods_seq"></td>
                            <td>품목명:</td>
                            <td id="wo_go_goods_name"></td>
                            <td>단위:</td>
                            <td></td>
                            <td>수량:</td>
                            <td id="wo_pp_performance_quantity"></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <div class="mainbody_11_02">
                    <div class="mainbody_11_02_top">
                      <div class="mainbody_11_02_top_00">파일첨부</div>
                    </div>
                    <div class="mainbody_11_02_bott">
                      <div class="mainbody_11_02_bott_01">
                        <div class="mainbody_11_02_bott_01_00">
                          <div class="mainbody_11_02_bott_wrapp_01">
                            <input class="upload-name" value="첨부파일" placeholder="첨부파일" type="text">
                          </div>
                          <div  class="mainbody_11_02_bott_wrapp_02">
                          <label for="file">
                            <img src="./resources/img/생산관리/선택.png">
                          </label> 
                          </div>
                          <input type="file" id="file">
                        </div>
                      </div>
                      <div class="mainbody_11_02_bott_02">
                        <button class="mainbody_11_02_bott_btn_02">
                          <img src="./resources/img/생산관리/초기화.png">
                        </button>
                      </div>
                      <div class="mainbody_11_02_bott_03">
                        <input type="text">
                      </div>
                      <div class="mainbody_11_02_bott_04">
                        <button class="mainbody_11_02_bott_btn_03">
                          <img src="./resources/img/생산관리/다운로드.png">
                        </button>
                      </div>
                      <div class="mainbody_11_02_bott_05">
                        <button class="mainbody_11_02_bott_btn_04">
                          <img src="./resources/img/생산관리/첨부파일저장.png">
                        </button>
                      </div>
                    </div>
                  </div>
                  <div class="mainbody_11_03">
                    <div class="mainbody_11_03_top">
                        <div class="mainbody_11_03_top_l">
                            <div class="mainbody_11_03_top_l_01">
                              <button class="mainbody_11_03_top_l_01_btn" onclick="mainbody_11_03_top_l_01_btn()">
                                <img src="./resources/img/생산관리/순서위로.png">
                              </button>
                            </div>
                            <div class="mainbody_11_03_top_l_02">
                              <button  class="mainbody_11_03_top_l_02_btn">
                                <img src="./resources/img/생산관리/순서아래로.png">
                              </button>
                            </div>
                          </div>
                      <div class="mainbody_11_03_top_r">
                        <div class="mainbody_11_03_top_04">
                          <button class="mainbody_11_03_top_btn_04" onclick="mainbody_11_03_top_btn_04()">
                            <img src="./resources/img/생산관리/생산품목추가.png">
                          </button>
                        </div>
                        <div class="mainbody_11_03_top_05">
                          <button  class="mainbody_11_03_top_btn_05">
                            <img src="./resources/img/생산관리/삭제.png">
                          </button>
                        </div>
                      </div>
                    </div>
                        <div class="mainbody_11_03_bott">
                      <table class="work_order_tb_02">
                        <thead>
                          <tr>
                            <td></td>
                            <td>생산일자</td>
                            <td>지시번호</td>
                            <td>공정명</td>
                            <td>공정구분</td>
                            <td>품목</td>
                            <td>단위</td>
                            <td>수량</td>
                            <td>시작요청일</td>
                            <td>완료요청일</td>
                            <td>진행상태</td>
                          </tr>
                        </thead>
                        <tbody>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>

            <!-- 생산관리 > 작업 지시 조회 -->
            <div class="mainbody_14">
                <div class="mainbody_14_00">
                  <div class="mainbody_14_01">
                    <div class="mainbody_14_01_top">
                      <div class="mainbody_14_01_top_l">
                        <div class="mainbody_14_01_top_l_01">생산지시일</div>
                        <div class="mainbody_14_01_top_l_02"><input type="date">&nbsp~&nbsp</div>
                        <div class="mainbody_14_01_top_l_03"><input type="date"></div>
                        <div class="mainbody_14_01_top_l_05">
                          <button class="mainbody_14_01_top_btn_01">
                            <img src="./resources/img/생산관리/검색.png">
                          </button>
                        </div>
                     </div>
        
                     <div class="mainbody_14_01_top_r">
                      <div class="mainbody_14_01_top_l_04"><input type="text" placeholder="검색어를 입력하세요"></div>
                      <div class="mainbody_14_01_top_r_01">
                        <button class="mainbody_14_01_top_btn_02">
                          <img src="./resources/img/생산관리/엑셀.png">
                        </button>
                      </div>
                      <div class="mainbody_14_01_top_r_02">
                        <button class="mainbody_14_01_top_btn_03">
                          <img src="./resources/img/생산관리/삭제.png">
                        </button>
                      </div>
                    </div>
                  </div>
        
                    <div class="mainbody_14_01_bott">
                      <table class="process_order_view_tb">
                        <thead>
                          <tr>
                            <td></td>
                            <td>작업지시번호</td>
                            <td>공정</td>
                            <td>공정종류</td>
                            <td>품목번호</td>
                            <td>품목명</td>
                            <td>사양명</td>
                            <td>수량</td>
                            <td>고객</td>
                            <td>납기일</td>
                            <td>시작일시</td>
                            <td>종료일시</td>
                            <td>처리상태</td>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td><input type="checkbox"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>

            <!-- 생산관리 > 생산 실적 조회 -->
            <div class="mainbody_15">
                <div class="mainbody_15_00">
                  <div class="mainbody_15_01">
                    <div class="mainbody_15_01_top">
                      <div class="mainbody_15_01_top_l">
                        <div class="mainbody_15_01_top_l_01">실적작성일</div>
                        <div class="mainbody_15_01_top_l_02"><input type="date">&nbsp~&nbsp</div>
                        <div class="mainbody_15_01_top_l_03"><input type="date"></div>
                        <div class="mainbody_15_01_top_l_05">
                          <button class="mainbody_15_01_top_btn_01">
                            <img src="./resources/img/생산관리/검색.png">
                          </button>
                        </div>
                     </div>
        
                     <div class="mainbody_15_01_top_r">
                      <div class="mainbody_15_01_top_l_04"><input type="text" placeholder="검색어를 입력하세요"></div>
                      <div class="mainbody_15_01_top_r_01">
                        <button class="mainbody_15_01_top_btn_02">
                          <img src="./resources/img/생산관리/엑셀.png">
                        </button>
                      </div>
                      <div class="mainbody_15_01_top_r_02">
                        <button class="mainbody_15_01_top_btn_03">
                          <img src="./resources/img/생산관리/삭제.png">
                        </button>
                      </div>
                    </div>
                  </div>
        
                    <div class="mainbody_15_01_bott">
                      <table class="output_view_tb">
                        <thead>
                          <tr>
                            <td></td>
                            <td>생산일</td>
                            <td>시프트</td>
                            <td>공정명</td>
                            <td>설비명</td>
                            <td>품목번호</td>
                            <td>LOT번호</td>
                            <td>실적수량</td>
                            <td>양품수량</td>
                            <td>불량수량</td>
                            <td>부서</td>
                            <td>작성자</td>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td><input type="checkbox"></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                          </tr>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            
            <!-- 생산관리 > 생산일보 -->
            <div class="mainbody_13">
                <div class="mainbody_13_body">
                  <div class="mainbody_13_01">
                    <div class="mainbody_13_01_top">
                      <div class="mainbody_13_01_top_btn_01">
                      <button class="work_order_btn_01">
                        <img src="./resources/img/생산관리/저장.png" class="mainbody_13_btn_img_01">
                      </button>
                    </div>
                  </div>
                    <div class="mainbody_13_01_bott">
                      <table class="produce_date_tb">
                        <tr>
                          <th colspan="2"><i class="fa-solid fa-calendar"></i>&nbsp생산일자 및 시프트</th>
                        </tr>
                        <tr> 
                          <td>생산일자</td>
                          <td><input type="date" id="da_date"></td>
                        </tr>
                        <tr>
                          <td>시프트</td>
                          <td>
                            <div class="produce_date_tb_01_shift">
                                <div class="produce_date_tb_01_shift_select">
                                    <div class="produce_date_tb_01_shift_txt">
                                        &nbsp;
                                    </div>
                                    <div class="produce_date_tb_01_shift_btn">
                                        <button class="produce_date_tb_01_shift_btn_cls" onclick="produce_date_tb_01_shift_btn_cls()">
                                            <img src="./resources/img/제품관리/엑스.png">
                                        </button>
                                    </div>
                                    <ul id="produce_date_tb_01_ul">
                                        <li class="option">
                                            1
                                        </li>
                                        <li class="option">
                                            2
                                        </li>
                                        <li class="option">
                                            3
                                        </li>
                                        <li class="option">
                                            4
                                        </li>
                                        <li class="option">
                                            5
                                        </li>
                                    </ul>
                                </div>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>입력시간</td>
                          <td>
                            <input type="time" id="da_input_time">
                          </td>
                        </tr>
                      </table>
                      <table class="process_tb">
                        <tr>
                          <th colspan="4"><i class="fa-solid fa-gear"></i>&nbsp공정 및 설비</th>
                        </tr>
                        <tr>
                          <td>공정</td>
                          <td>
                            <div class="process_tb_plus_btn_01">
                              <button class="processModal_btn_01" onclick="process_search_Open()">
                                <img src="./resources/img/생산관리/plus.png" class="mainbody_12_btn_img_04">
                              </button>
                            </div>
                          </td>
                          <td id="dailyProcessName"></td>
                          <td id="dailyProcessNum"></td>
                        </tr>
                        <tr>
                          <td>설비</td>
                          <td>
                            <div class="process_tb_plus_btn_02">
                              <button class="processModal_btn_02" onclick="processModal_btn_02()">
                                <img src="./resources/img/생산관리/plus.png" class="mainbody_12_btn_img_05">
                              </button>
                            </div>
                          </td>
                          <td id="dailyFacilitiesName"></td>
                          <td id="dailyFacilitiesNum"></td>
                        </tr>
                      </table>
                      <table class="worker_tb">
                        <tr>
                          <th colspan="2"><i class="fa-solid fa-user-large"></i>&nbsp작업자</th>
                        </tr>
                        <tr>
                          <td>부서명:</td>
                          <td id="userdepartment">관리부</td>
                        </tr>
                        <tr>
                          <td>작성자 명:</td>
                          <td id="usercompany">유니컴퍼니1</td>
                        </tr>
                      </table>
                    </div>
                  </div>
                  <div class="mainbody_13_02">
                    <div class="mainbody_13_02_top">
                      <div class="mainbody_13_02_top_01">
                        <button class="mainbody_13_02_top_01_01" onclick="mainbody_13_02_top_01_01()"><img src="./resources/img/생산관리/품목추가.png"></button>
                      </div>
                      <div class="mainbody_13_02_top_02">
                        <button class="mainbody_13_02_top_02_01" onclick="mainbody_13_02_top_02_01()"><img src="./resources/img/생산관리/작업지시추가.png"></button>
                      </div>
                      <div class="mainbody_13_02_top_03">
                        <button class="mainbody_13_02_top_03_01"><img src="./resources/img/생산관리/삭제.png"></button>
                      </div>
                    </div>
                    <div class="mainbody_13_02_bott">
                      <table class="process_order_tb_01">
                        <thead>
                            <tr>
                              <td></td>
                              <td>작업지시번호(상세번호)</td>
                              <td>품목번호</td>
                              <td>품목명</td>
                              <td>규격</td>
                              <td>생산LOT번호</td>
                              <td>계획수량</td>
                              <td>실적수량</td>
                              <td>양품수량</td>
                              <td>불량수량</td>
                              <td>불량코드</td>
                              <td>불량율</td>
                            </tr>
                          </thead>
                          <tbody>
                          <tr>
                            <td><input type="checkbox"></td>
                            <td>001234</td>
                            <td>123165468</td>
                            <td>에코클린매트</td>
                            <td>갯수</td>
                            <td><input type="text" autocomplete="off"></td>
                            <td><input type="text" autocomplete="off"></td>
                            <td><input type="text" autocomplete="off"></td>
                            <td><input type="text" autocomplete="off"></td>
                            <td><input type="text" autocomplete="off"></td>
                            <td>
                                <div class="process_order_tb_01_td_div">
                                    <div class="process_order_tb_01_td_div_select">
                                        <div class="process_order_tb_01_td_div_txt">&nbsp;</div>
                                        <ul>
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                            <td><input type="text" autocomplete="off"></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                    <div class="mainbody_13_03">
                      <div class="mainbody_13_03_left">
                        <div class="mainbody_13_03_left_top">
                          <div class="mainbody_13_03_left_top_l">
                          </div>
                          <div class="mainbody_13_03_left_top_r">
                            <button class="work_order_btn_04">
                                <img src="./resources/img/생산관리/삭제.png" class="mainbody_13_btn_img_09">
                               </button>
                            <button class="work_order_btn_08" onclick="work_order_btn_08()">
                              <img src="./resources/img/생산관리/투입자재저장.png" class="mainbody_13_btn_img_10">
                            </button>
                          </div>
                        </div>
                        <div class="mainbody_13_03_left_bottom">
                          <table class="process_order_tb_02">
                            <thead>
                            <tr>
                              <td></td>
                              <td>품목구분</td>
                              <td>품목번호</td>
                              <td>품목명</td>
                              <td>투입LOT번호</td>
                              <td>소요량</td>
                              <td>투입량</td>  
                            </tr>    
                            </thead>
                            <tbody>
                              <tr>
                                <td><input type="checkbox"></td>
                                <td></td>
                                <td>00000000</td>
                                <td></td>
                                <td>(자동 부여)</td>
                                <td><input type="text" autocomplete="off"></td>
                                <td><input type="text" autocomplete="off"></td> 
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                      <div class="mainbody_13_03_right">
                        <div class="mainbody_13_03_right_top">
                          <div class="mainbody_13_03_right_top_l">
                        </div>
                        <div class="mainbody_13_03_right_top_r">
                            <button class="work_order_btn_09">
                                <img src="./resources/img/생산관리/삭제.png" class="mainbody_13_btn_img_11">
                              </button>
                          <button class="work_order_btn_07" onclick="worker_search_ModalOpen()">
                            <img src="./resources/img/생산관리/작업추가.png" class="mainbody_13_btn_img_12">
                          </button>
                        </div>
                      </div>
                        <div class="mainbody_13_03_right_bottom">
                          <table class="process_order_tb_03">
                            <thead>
                            <tr>
                              <td></td>
                              <td>작업자</td>
                              <td>작업구분</td>
                              <td>작업코드</td>
                              <td>작업지시번호</td>
                              <td>시작시간</td>
                              <td>종료시간</td>
                            </tr>
                          </thead>
                        <tbody>
                            <tr>
                              <td><input type="checkbox"></td>
                              <td class="process_order_tb_03_01"></td>
                              <td>
                                <div class="process_order_tb_03_div01">
                                    <div class="process_order_tb_03_div01_select">
                                        <div class="process_order_tb_03_div01_txt">&nbsp;</div>
                                        <ul class="process_order_tb_03_div01_ul_01">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                              </td>
                              <td>
                                <div class="process_order_tb_03_div02">
                                    <div class="process_order_tb_03_div02_select">
                                        <div class="process_order_tb_03_div02_txt">&nbsp;</div>
                                        <ul class="process_order_tb_03_div01_ul_02">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                              </td>
                              <td>
                                <div class="process_order_tb_03_div03">
                                    <div class="process_order_tb_03_div03_select">
                                        <div class="process_order_tb_03_div03_txt">&nbsp;</div>
                                        <ul class="process_order_tb_03_div01_ul_03">
                                            <li class="option">
                                                1
                                            </li>
                                            <li class="option">
                                                2
                                            </li>
                                            <li class="option">
                                                3
                                            </li>
                                            <li class="option">
                                                4
                                            </li>
                                            <li class="option">
                                                5
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                              </td>
                              <td>
                                <input type="time">
                              </td>
                              <td>
                                <input type="time">
                              </td>
                            </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>


            <!-- *1004 자재관리 > 자재발주 -->
            <div class="mainbody_21">
                <div class="mainbody_21_00">
                    <div class="mainbody_21_top">
                        <div class="mainbody_21_top_l"><input class="mainbody_21_top_l_in" type="text" placeholder="발주번호 검색"></div>
                        <div class="mainbody_21_top_r">
                            <div class="mainbody_21_top_r_01">
                                <button class="mainbody_21_top_btn_01">
                                    <img src="./resources/img/자재관리/초기화.png">
                                </button>
                            </div>
                            <div class="mainbody_21_top_r_02">
                                <button class="mainbody_21_top_btn_02">
                                    <img src="./resources/img/save.png">
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="mainbody_21_mid">
                        <div class="mainbody_21_mid_table">
                        <table class="material_order_tb_01">
                            <tbody>
                                <tr>
                                    <td>발주번호</td>
                                    <td id="mo_num">자동으로 부여됩니다.</td>
                                    <td>업체명</td>
                                    <td>
                                        <div class="m21_admin_td_09_01_select">
                                            <div class="m21_admin_td_09_01_select_01" id="m21_admin_td_09_01_select_01">&nbsp;</div>
                                            <div class="m21_admin_td_09_01_select_03">
                                                <button class="m21_customerSearch_btn"onclick="m21_customerOpen()">
                                                    <img src="./resources/img/제품관리/선택.png"class="mainbody_21_01_choice_01">
                                                </button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>발주일자</td>
                                    <td><input type="date" id="mo_orderDate"></td>
                                    <td>납기일자</td>
                                    <td><input type="date" id="mo_dueDate"></td>
                                </tr>    
                                <tr>
                                    <td>납품장소</td>
                                    <td><input type="text" id="mo_place"></td>
                                    <td>유효일자</td>
                                    <td><input type="date" id="mo_effectivedate"></td>
                                </tr>
                                <tr>
                                    <td>결제조건</td>
                                    <td><input type="text" id="mo_conditions"></td>
                                    <td>주소</td>
                                    <td><input type="text" id="mo_address"></td>
                                </tr>
                                <tr>
                                    <td>담당자</td>
                                    <td><input type="text" id="mo_charger"></td>
                                    <td>연락처</td>
                                    <td><input type="text" id="mo_contact"></td>
                                </tr>
                                <tr>
                                    <td>휴대전화번호</td>
                                    <td><input type="text" id="mo_contact_phone"></td>
                                    <td>비고</td>
                                    <td><input type="text" id="mo_memo"></td>
                                </tr>
                                <tr>
                                    <td>요청사항</td>
                                    <td><input type="text" id="mo_request"></td>
                                    <td>총금액</td>
                                    <td><input type="text" id="mo_amount"></td>
                                </tr>         
                            </tbody>
                        </table>
                    </div>
                    </div>
                    <div class="mainbody_21_bott_t">
                        <div class="mainbody_21_bott_t_01">
                            <button  class="mainbody_21_bott_btn_01" onclick="m21_product_choice_Open()">
                                <img src="./resources/img/생산관리/품목추가.png">
                            </button>
                        </div>
                        <div class="mainbody_21_bott_t_02">
                            <button class="mainbody_21_bott_btn_02">
                                <img src="./resources/img/삭제.png">
                            </button>
                        </div>
                    </div>
                    <div class="mainbody_21_bott_b">
                        <div class="mainbody_21_bott_b_table">
                        <table class="material_order_tb_02">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>품목번호</th>
                                    <th>품목명</th>
                                    <th>규격</th>
                                    <th>사양</th>
                                    <th>단위</th>
                                    <th>단가</th>
                                    <th>발주수량</th>
                                    <th>할인율</th>
                                    <th>부가세</th>
                                    <th>공급가액</th>
                                    <th>합계</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>12345468</td>
                                    <td>skfl</td>
                                    <td>skfl</td>
                                    <td>skfl</td>
                                    <td>갯수</td>
                                    <td><input type="text" autocomplete="off"></td>
                                    <td><input type="text" autocomplete="off"></td>
                                    <td><input type="text" autocomplete="off"></td>
                                    <td><input type="text" autocomplete="off"></td>
                                    <td>0</td>
                                    <td>0</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>
                </div>
            </div>

            <!-- *1004 자재관리 > 자재 발주 조회 -->
            <div class="mainbody_22">
                <div class="mainbody_22_00">
                    <div class="mainbody_22_01">
                        <div class="mainbody_22_01_top">
                            <div class="mainbody_22_01_top_l">
                              <div class="mainbody_22_01_top_l_01">발주일</div>
                              <div class="mainbody_22_01_top_l_02"><input type="date">&nbsp~&nbsp</div>
                              <div class="mainbody_22_01_top_l_03"><input type="date"></div>
                              <div class="mainbody_22_01_top_l_05">
                                <button class="mainbody_22_01_top_btn_01">
                                  <img src="./resources/img/생산관리/검색.png">
                                </button>
                              </div>
                           </div>
              
                           <div class="mainbody_22_01_top_r">
                            <div class="mainbody_22_01_top_l_04"><input type="text" placeholder="검색어를 입력하세요"></div>
                            <div class="mainbody_22_01_top_r_01">
                              <button class="mainbody_22_01_top_btn_02">
                                <img src="./resources/img/생산관리/엑셀.png">
                              </button>
                            </div>
                            <div class="mainbody_22_01_top_r_02">
                              <button class="mainbody_22_01_top_btn_03">
                                <img src="./resources/img/생산관리/삭제.png">
                              </button>
                            </div>
                          </div>
                        </div>
                    <div class="mainbody_22_bot">
                        <div class="mainbody_22_bot_00">
                            <table class="material_order_view_tb">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>발주번호</th>
                                        <th>발주일</th>
                                        <th>납품일</th>
                                        <th>발주업체</th>
                                        <th>총 금액</th>
                                        <th>대표품목</th>
                                        <th>발주수량</th>
                                        <th>상세조회</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>gfdh</td>
                                        <td>fgh</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>dfgh</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            </div>

            <!-- *1004 자재관리 > 자재입고현황 -->
            <div class="mainbody_23">
                <div class="mainbody_23_00">
                    <div class="mainbody_23_01">
                        <div class="mainbody_23_top">
                            <div class="mainbody_23_top_l">
                                <div class="mainbody_23_top_l_01_01">
                                    <div class="mainbody_23_top_l_01_01_01">
                                        <div class="mainbody_23_top_l_04">
                                            <div class="mainbody_23_top_l_04_01"><input type="radio" name="" value="전체" checked><span>전체</span></div>
                                            <div class="mainbody_23_top_l_04_02"><input type="radio" name="" value="원부자재"><span>원부자재</span></div>
                                            <div class="mainbody_23_top_l_04_03"><input type="radio" name="" value="외주가공품"><span>외주가공품</span></div>
                                            <div class="mainbody_23_top_l_04_04"><input type="radio" name="" value="상품"><span>상품</span></div>
                                            <div class="mainbody_23_top_l_04_05"><input type="radio" name="" value="생산"><span>생산</span></div>
                                        </div>
                                    </div>
                                    <div class="mainbody_23_top_l_01_01_02">
                                        <div class="mainbody_23_top_l_01">입고처리일</div>
                                        <div class="mainbody_23_top_l_02"><input type="date">&nbsp;~&nbsp;</div>
                                        <div class="mainbody_23_top_l_03"><input type="date"></div>
                                        <div  class="mainbody_23_top_l_05">
                                            <button class="mainbody_23_top_l_btn_01">
                                                <img src="./resources/img/생산관리/검색.png">
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mainbody_23_top_r">
                                <div class="mainbody_23_top_r_01">
                                    <button class="mainbody_23_top_r_btn_01">
                                        <img src="./resources/img/자재관리/엑셀.png">
                                    </button>
                                </div>
                                <div class="mainbody_23_top_r_02">
                                    <button class="mainbody_23_top_r_btn_02" onclick="m23_material_order_productOpen()">
                                        <img src="./resources/img/자재관리/새입고추가.png">
                                    </button>
                                </div>
                                <div class="mainbody_23_top_r_03">
                                    <button class="mainbody_23_top_r_btn_03">
                                        <img src="./resources/img/save.png">
                                    </button>
                                </div>
                                <div class="mainbody_23_top_r_04">
                                    <button class="mainbody_23_top_r_btn_04">
                                        <img src="./resources/img/삭제.png">
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="mainbody_23_bot">
                            <div class="mainbody_23_bot_tb">
                                <table class="receiving_goods_tb">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>입고 일자</th>
                                            <th>재고이동 유형</th>
                                            <th>LOT번호</th>
                                            <th>발주번호</th>
                                            <th>품목명</th>
                                            <th>품목번호</th>
                                            <th>수량</th>
                                            <th>단위</th>
                                            <th>포장단위수량</th>
                                            <th>포장단위</th>
                                            <th>로케이션</th>
                                        </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td><input type="date"></td>
                                        <td>원부자재입고</td>
                                        <td><input type="text" autocomplete="off"></td>
                                        <td><input type="text" autocomplete="off"></td>
                                        <td>sdfsdjf</td>
                                        <td>001</td>
                                        <td><input type="text" autocomplete="off"></td>
                                        <td>갯수</td>
                                        <td><input type="text" autocomplete="off"></td>
                                        <td>박스</td>
                                        <td>
                                            <div class="mainbody_23_bot_02">
                                                <button  class="mainbody_23_bot_btn_02" onclick="m23_product_locationOpen()">
                                                    <img src="./resources/img/자재관리/돋보기.png">
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- *1004 자재관리 > 자재재고현황 -->
            <div class="mainbody_24">
                <div class="mainbody_24_00">
                    <div class="mainbody_24_01">
                        <div class="mainbody_24_01_top">
                            <div class="mainbody_24_01_top_l">
                              <div class="mainbody_24_01_top_l_01">자재발주일</div>
                              <div class="mainbody_24_01_top_l_02"><input type="date">&nbsp~&nbsp</div>
                              <div class="mainbody_24_01_top_l_03"><input type="date"></div>
                              <div class="mainbody_24_01_top_l_05">
                                <button class="mainbody_24_01_top_btn_01">
                                  <img src="./resources/img/생산관리/검색.png">
                                </button>
                              </div>
                           </div>
              
                           <div class="mainbody_24_01_top_r">
                            <div class="mainbody_24_01_top_l_04"><input type="text" placeholder="검색어를 입력하세요"></div>
                            <div class="mainbody_24_01_top_r_01">
                              <button class="mainbody_24_01_top_btn_02">
                                <img src="./resources/img/생산관리/엑셀.png">
                              </button>
                            </div>
                            <div class="mainbody_24_01_top_r_02">
                              <button class="mainbody_24_01_top_btn_03">
                                <img src="./resources/img/생산관리/삭제.png">
                              </button>
                            </div>
                          </div>
                        </div>
                        <div class="mainbody_24_bott">
                            <div class="mainbody_24_bott_tb_wrapp">
                                <table class="mainbody_24_bott_tb">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>품목코드</th>
                                            <th>품명</th>
                                            <th>LOT번호</th>
                                            <th>규격</th>
                                            <th>단위</th>
                                            <th>판매단가</th>
                                            <th>구매단가</th>
                                            <th>로케이션</th>
                                            <th>현 재고</th>
                                            <th>재고상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>21354</td>
                                            <td>dfvgs</td>
                                            <td>12135</td>
                                            <td>1호</td>
                                            <td>갯수</td>
                                            <td>200</td>
                                            <td>100</td>
                                            <td>ajdhkljh</td>
                                            <td>354351</td>
                                            <td>부족</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- *1005 물류 관리 > 출고 -->
            <div class="mainbody_31">
                <div class="m31_main">
                  <div class="m31_left">
                    <div class="mainbody_31_01_01">
                        <div class="mainbody_31_01_01_btn1">
                            <button class="mainbody_31_01_btn1" onclick="mainbody_03_01_btn1()">
                                <img src="./resources/img/제품관리/초기화.png" alt="초기화">
                            </button>
                        </div>
                        <div style="width: 47.1%;">
                        </div>
                        <div class="mainbody_31_01_01_btn2">
                            <button class="mainbody_31_01_btn2">
                                <img src="./resources/img/제품관리/엑셀.png" alt="엑셀" class="mainbody_31_01_btn1_img2">
                            </button>
                        </div>
                        <div class="mainbody_31_01_01_btn3">
                            <button class="mainbody_31_01_btn3" onclick="productSave()">
                                <img src="./resources/img/제품관리/저장.png" alt="저장" class="mainbody_31_01_btn1_img3">
                            </button>
                        </div>
                    </div>
                    <div class="m31_left_bot">
                      <div class="m31_left_bot_body">
                        <table>
                          <tbody>
                            <tr>
                              <td>주문번호</td>
                              <td>
                                <div style="border: 0 !important;">
                                  자동으로 부여됩니다.
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td style="color: #5dba8e;">거래처</td>
                              <td>
                                <div class="m31_left_bot_body_div01">
                                  <div class="m31_left_bot_body_left">
                                    &nbsp;
                                  </div>
                                  <button class="m31_left_bot_body_right_btn" onclick="m31_left_bot_body_right_btn()">
                                    <img src="./resources/img/제품관리/선택.png">
                                  </button>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>제품명</td>
                              <td>
                                <div class="m31_left_bot_body_div02">
                                  <div class="m31_left_bot_body_div02_left">
                                    &nbsp;
                                  </div>
                                  <button class="m31_left_bot_body_div02_right_btn" onclick="m31_left_bot_body_div02_right_btn()">
                                    <img src="./resources/img/제품관리/선택.png">
                                  </button>
                                </div>
                              </td>
                            </tr>
                            <tr>
                              <td>출고예정일</td>
                              <td><input type="date"></td>
                            </tr>
                            <tr>
                              <td>배송지</td>
                              <td>
                                <div>&nbsp;</div>
                              </td>
                            </tr>
                            <tr>
                              <td>출고일자</td>
                              <td><input type="date"id="m31_date"></td>
                            </tr>
                            <tr>
                              <td>담당자</td>
                              <td>
                                <input type="text" autocomplete="off">
                              </td>
                            </tr>
                            <tr>
                              <td>연락처</td>
                              <td>
                                <input type="text" autocomplete="off">
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                  <div class="m31_right">
                    <div class="m31_right_top">
                        <div class="mainbody_31_02_01_search">
                            <input autocomplete='off' class="mainbody_31_02_01_searchInput" placeholder="검색어를 입력하세요">
                        </div>
                        <div class="mainbody_31_02_01_del">
                            <button class="mainbody_31_02_01_del_bt">
                                <img src="./resources/img/삭제.png">
                            </button>
                        </div>
                    </div>
                    <div class="m31_right_bot">
                      <table>
                        <thead>
                          <tr>
                            <th></th>
                            <th>주문상세번호</th>
                            <th>품목번호</th>
                            <th>품목명</th>
                            <th>수량</th>
                            <th>생산LOT번호</th>
                            <th>비고</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td><input type="checkbox"></td>
                            <td>00000000</td>
                            <td>00000000</td>
                            <td>품목명1</td>
                            <td>15200</td>
                            <td>00000000</td>
                            <td>비고1</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
            </div>
        
            <!-- *1005 물류 관리 > 출고 조회 -->
            <div class="mainbody_32">
                <div class="mainbody_32_00">
                  <div class="mainbody_32_01">
                    <div class="mainbody_32_01_top">
                      <div class="mainbody_32_01_top_l">
                        <div class="mainbody_32_01_top_l_01">출고일</div>
                        <div class="mainbody_32_01_top_l_02"><input type="date">&nbsp~&nbsp</div>
                        <div class="mainbody_32_01_top_l_03"><input type="date"></div>
                        <div class="mainbody_32_01_top_l_05">
                          <button class="mainbody_32_01_top_btn_01">
                            <img src="./resources/img/생산관리/검색.png">
                          </button>
                        </div>
                     </div>
        
                     <div class="mainbody_32_01_top_r">
                      <div class="mainbody_32_01_top_l_04"><input type="text" placeholder="검색어를 입력하세요"></div>
                      <div class="mainbody_32_01_top_r_01">
                        <button class="mainbody_32_01_top_btn_02">
                          <img src="./resources/img/공정관리/엑셀.png">
                        </button>
                      </div>
        
                    </div>
                  </div>
        
                    <div class="mainbody_32_01_bott">
                      <table class="mainbody_32_01_bott_table">
                        <thead>
                          <tr>
                            <td></td>
                            <td>출고번호</td>
                            <td>거래처</td>
                            <td>품목번호</td>
                            <td>품목명</td>
                            <td>출고수량</td>
                            <td>출고일</td>
                            <td>처리상태</td>
                            <td>상세조회</td>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td><input type="checkbox" autocomplete="off"></td>
                            <td>2209290001</td>
                            <td>유니컴퍼니</td>
                            <td>15151425</td>
                            <td>애코클린매트</td>
                            <td>12,769</td>
                            <td>22.09.29</td>
                            <td>출고완료</td>
                            <td></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
            </div>
            
            <!-- *1005 물류관리 > 제품 재고 현황 -->
            <div class="mainbody_33">
                <div class="mainbody_33_00">
                    <div class="mainbody_33_01">
                        <div class="mainbody_33_01_top">
                            <div class="mainbody_33_01_top_l">
                              <div class="mainbody_33_01_top_l_01">제품일</div>
                              <div class="mainbody_33_01_top_l_02"><input type="date">&nbsp~&nbsp</div>
                              <div class="mainbody_33_01_top_l_03"><input type="date"></div>
                              <div class="mainbody_33_01_top_l_05">
                                <button class="mainbody_33_01_top_btn_01">
                                  <img src="./resources/img/생산관리/검색.png">
                                </button>
                              </div>
                           </div>
              
                           <div class="mainbody_33_01_top_r">
                            <div class="mainbody_33_01_top_l_04"><input type="text" placeholder="검색어를 입력하세요"></div>
                            <div class="mainbody_33_01_top_r_01">
                              <button class="mainbody_33_01_top_btn_02">
                                <img src="./resources/img/생산관리/엑셀.png">
                              </button>
                            </div>
                            <div class="mainbody_33_01_top_r_02">
                              <button class="mainbody_33_01_top_btn_03">
                                <img src="./resources/img/생산관리/삭제.png">
                              </button>
                            </div>
                          </div>
                        </div>
                        <div class="mainbody_33_bott">
                            <div class="mainbody_33_bott_tb_wrapp">
                                <table class="mainbody_33_bott_tb">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>제품코드</th>
                                            <th>제품명</th>
                                            <th>LOT번호</th>
                                            <th>규격</th>
                                            <th>단위</th>
                                            <th>판매단가</th>
                                            <th>로케이션</th>
                                            <th>현 재고</th>
                                            <th>입고상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>21354</td>
                                            <td>dfvgs</td>
                                            <td>12135</td>
                                            <td>1호</td>
                                            <td>갯수</td>
                                            <td>200</td>
                                            <td>ajdhkljh</td>
                                            <td>354351</td>
                                            <td>asdljnh</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <!-- *1006 품질 관리 > 품질 검사 내역 입력 -->
            <div class="mainbody_41">
                <div class="mainbody_41_00">
                    <div class="mainbody_41_wrapp">
                        <div class="mainbody_41_01">
                            <div class="mainbody_41_01_l">
                                <div class="mainbody_41_01_l_01">
                                    <div class="mainbody_41_01_l_01_1">
                                        <input type="radio" name="mainbody_41_test"> 샘플링검사
                                    </div>
                                    <div class="mainbody_41_01_l_01_2">
                                        <input type="radio" name="mainbody_41_test"> 전수검사
                                    </div>
                                    <div class="mainbody_41_01_l_01_3">
                                        <input type="number" placeholder="수량입력">
                                    </div>
                                </div>
                            </div>
                            <div class="mainbody_41_01_r">
                                <div class="mainbody_41_01_r_04">
                                    <button class="mainbody_41_01_r_btn_04" onclick="mainbody_41_01_r_btn_04()">
                                        <img src="./resources/img/품질관리/검사기준.png">
                                    </button>
                                </div>
                                <div class="mainbody_41_01_r_01">
                                    <button class="mainbody_41_01_r_btn_01" onclick="mainbody_41_01_r_btn_01()">
                                        <img src="./resources/img/공정관리/저장.png">
                                    </button>
                                </div>
                                <div class="mainbody_41_01_r_02">
                                    <button class="mainbody_41_01_r_btn_02">
                                        <img src="./resources/img/생산관리/엑셀.png">
                                    </button>
                                </div>
                                <div class="mainbody_41_01_r_03">
                                    <button class="mainbody_41_01_r_btn_03">
                                        <img src="./resources/img/생산관리/삭제.png">
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="mainbody_41_02">
                            <div class="mainbody_41_02_01">
                                <div class="mainbody_41_02_01_head">
                                    <div class="mainbody_41_02_01_text">&nbsp;생산일자 및 시프트</div>
                                </div>
                                <div class="mainbody_41_02_01_content">
                                    <table class="mainbody_41_02_01_content_tb">
                                        <tbody>
                                            <tr>
                                                <td>검사일자</td>
                                                <td><input type="date"></td>
                                            </tr>
                                            <tr>
                                                <td>시프트</td>
                                                <td>
                                                    <input type="text">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="mainbody_41_02_02">
                                <div class="mainbody_41_02_02_head">
                                    <div class="mainbody_41_02_02_text">&nbsp;공정
                                        <div class="mainbody_41_02_02_search_btn">
                                            <button onclick="mainbody_41_process_btnOpen()"><img src="./resources/img/품질관리/돋보기.png"></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="mainbody_41_02_02_content">
                                    <table class="mainbody_41_02_02_content_tb">
                                        <tbody>
                                            <tr>
                                                <td>공정 :</td>
                                                <td>
                                                    <div class="mainbody_41_02_02_process_div">
                                                        <div class="mainbody_41_02_02_content_tb_btn1"></div>
                                                        <div class="mainbody_41_02_02_content_tb_btn2"></div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="mainbody_41_02_03">
                                <div class="mainbody_41_02_03_head">
                                    <div class="mainbody_41_02_03_text">&nbsp;작업자</div>
                                </div>
                                <div class="mainbody_41_02_03_content">
                                    <table class="mainbody_41_02_03_content_tb">
                                        <tbody>
                                            <tr>
                                                <td>부서명 :</td>
                                                <td>ㅎ롱</td>
                                            </tr>
                                            <tr>
                                                <td>작성자명 :</td>
                                                <td>ㅇㄹ호</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="mainbody_41_02_04">
                                <div class="mainbody_41_02_04_head">
                                    <div class="mainbody_41_02_04_text">&nbsp;결재</div>
                                </div>
                                <div class="mainbody_41_02_04_content">
                                    <div class="mainbody_41_02_04_content_text">fdg<!--결제자 불러오기--></div>
                                </div>
                            </div>
                        </div>
                        <div class="mainbody_41_03">
                            <div class="mainbody_41_03_l">
                                <div class="mainbody_41_03_l_head">
                                    <div class="mainbody_41_03_l_text">&nbsp;품목정보
                                        <div class="mainbody_41_03_l_search_btn">
                                            <button onclick="mainbody_41_product_plus_btn()"><img src="./resources/img/품질관리/돋보기.png"></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="mainbody_41_03_01_content">
                                    <table class="mainbody_41_03_01_content_tb">
                                        <tbody>
                                            <tr class="m41_product_information_1">
                                                <td>품목 번호 :</td>
                                                <td class="m41_product_information_1_1"></td>
                                                <td>품목명 :</td>
                                                <td class="m41_product_information_1_2"></td>
                                            </tr>
                                            <tr class="m41_product_information_2">
                                                <td>품목구분 :</td>
                                                <td class="m41_product_information_2_1"></td>
                                                <td>제품군 :</td>
                                                <td class="m41_product_information_2_2"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="mainbody_41_03_r">
                                <div class="mainbody_41_03_r_head">
                                    <div class="mainbody_41_03_r_text">&nbsp;물류정보</div>
                                </div>
                                <div class="mainbody_41_03_02_content">
                                    <table class="mainbody_41_03_02_content_tb">
                                        <tbody>
                                            <tr>
                                                <td>생산 LOT번호 :</td>
                                                <td>156843158432132</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="mainbody_41_04">
                            <div class="mainbody_41_04_r">
                                <button class="mainbody_41_04_r_btn_01">
                                    <img src="./resources/img/생산관리/삭제.png">
                                </button>
                            </div>
                        </div>
                        <div class="mainbody_41_05">
                                <table class="mainbody_41_05_tb">
                                    <thead>
                                        <tr class="mainbody_41_05_tb_tr1">
                                            <th rowspan="2"></th>
                                            <th colspan="3">검사 항목 분류</th>
                                            <th rowspan="2">검사 항목명</th>
                                            <th rowspan="2">검사기준</th>
                                            <th rowspan="2">검사방법</th>
                                            <th rowspan="2">시료</th>
                                            <th rowspan="2">결과</th>
                                            <th rowspan="2">판정</th>
                                        </tr>
                                        <tr class="mainbody_41_05_tb_tr2">
                                            <th>대분류</th>
                                            <th>중분류</th>
                                            <th>소분류</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
            </div>

            <!-- *1006 품질 관리 > 품질 검사 내역 조회 -->
            <div class="mainbody_42">
                <div class="mainbody_42_00">
                    <div class="mainbody_42_01">
                        <div class="mainbody_42_01_top">
                            <div class="mainbody_24_01_top_l">
                              <div class="mainbody_42_01_top_l_01">체크시트 작성일</div>
                              <div class="mainbody_42_01_top_l_02"><input type="date">&nbsp~&nbsp</div>
                              <div class="mainbody_42_01_top_l_03"><input type="date"></div>
                              <div class="mainbody_42_01_top_l_05">
                                <button class="mainbody_42_01_top_btn_01">
                                  <img src="./resources/img/생산관리/검색.png">
                                </button>
                              </div>
                           </div>
              
                           <div class="mainbody_42_01_top_r">
                            <div class="mainbody_42_01_top_l_04"><input type="text" placeholder="검색어를 입력하세요"></div>
                            <div class="mainbody_42_01_top_r_03">
                                <button class="mainbody_42_01_top_btn_04" onclick="mainbody_42_01_top_btn_04()">
                                  <img src="./resources/img/품질관리/승인.png">
                                </button>
                              </div>
                            <div class="mainbody_42_01_top_r_01">
                              <button class="mainbody_42_01_top_btn_02">
                                <img src="./resources/img/생산관리/엑셀.png">
                              </button>
                            </div>
                            <div class="mainbody_42_01_top_r_02">
                              <button class="mainbody_42_01_top_btn_03">
                                <img src="./resources/img/생산관리/삭제.png">
                              </button>
                            </div>
                          </div>
                        </div>
                    <div class="mainbody_42_bott">
                        <table class="quality_inspection_tb">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>검사일</th>
                                    <th>시프트</th>
                                    <th>공정명</th>
                                    <th>품목번호</th>
                                    <th>품목명</th>
                                    <th>제품 LOT번호</th>
                                    <th>부서</th>
                                    <th>판정</th>
                                    <th>작성자</th>
                                    <th>승인자</th>
                                    <th>조회</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td>22.08.02</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td> <!--조회버튼 클릭 시 품질 검사 내역 입력페이지로 이동-->
                                        <div class="quality_inspection_tb_btn">
                                            <button><img src="./resources/img/자재관리/돋보기.png"></button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            </div>
            <!-- *1006 품질 관리 > 공정 불량 현황 -->
            <div class="mainbody_43">
                <div class="mainbody_43_00">
                    <div class="mainbody_43_01">
                        <div class="mainbody_42_01_top">
                            <div class="mainbody_43_01_top_l">
                              <div class="mainbody_43_01_top_l_01">체크시트 작성일</div>
                              <div class="mainbody_43_01_top_l_02"><input type="date">&nbsp~&nbsp</div>
                              <div class="mainbody_43_01_top_l_03"><input type="date"></div>
                              <div class="mainbody_43_01_top_l_05">
                                <button class="mainbody_42_01_top_btn_01">
                                  <img src="./resources/img/생산관리/검색.png">
                                </button>
                              </div>
                           </div>
              
                           <div class="mainbody_43_01_top_r">
                            <div class="mainbody_43_01_top_l_04"><input type="text" placeholder="검색어를 입력하세요"></div>
                            <div class="mainbody_43_01_top_r_03">
                                <button class="mainbody_43_01_top_btn_04" onclick="mainbody_43_01_top_btn_04()">
                                  <img src="./resources/img/생산관리/저장.png">
                                </button>
                              </div>
                            <div class="mainbody_43_01_top_r_01">
                              <button class="mainbody_43_01_top_btn_02">
                                <img src="./resources/img/생산관리/엑셀.png">
                              </button>
                            </div>
                            <div class="mainbody_43_01_top_r_02">
                              <button class="mainbody_43_01_top_btn_03">
                                <img src="./resources/img/생산관리/삭제.png">
                              </button>
                            </div>
                          </div>
                        </div>
                        <div class="mainbody_43_bott">
                            <table class="process_defect_status_tb">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>검사일</th>
                                        <th>시프트</th>
                                        <th>공정명</th>
                                        <th>품목번호</th>
                                        <th>품목명</th>
                                        <th>제품 LOT번호</th>
                                        <th>부서</th>
                                        <th>작성자</th>
                                        <th>조회</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td> <!--조회버튼 클릭 시 품질 검사 내역 입력페이지로 이동-->     
                                            <div class="process_defect_status_tb_btn">
                                                <button><img src="./resources/img/자재관리/돋보기.png"></button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- *1006 품질 관리 > 불량률 조회 -->
            <div class="mainbody_44">
                <div class="mainbody_44_00">
                    <div class="mainbody_44_01">
                        <div class="mainbody_44_01_top">
                            <div class="mainbody_44_01_top_l">
                              <div class="mainbody_44_01_top_l_01">품질 검사일</div>
                              <div class="mainbody_44_01_top_l_02"><input type="date">&nbsp~&nbsp</div>
                              <div class="mainbody_44_01_top_l_03"><input type="date"></div>
                              <div class="mainbody_44_01_top_l_05">
                                <button class="mainbody_44_01_top_btn_01">
                                  <img src="./resources/img/생산관리/검색.png">
                                </button>
                              </div>
                           </div>
                        </div>
                        <div class="mainbody_44_mid">
                            <div class="mainbody_44_mid_l">
                                <div class="mainbody_44_mid_r_head">
                                    <div class="mainbody_44_mid_l_head_text">라인별 불량현황</div>
                                </div>
                            <div class="mainbody_44_mid_l_wrapp">
                                <table id="tblBackground" cellspacing="0">
                                    <tr>
                                        <td>
                                            <div id="divHeadScroll">
                                                <table id="tblHead" border="0" >
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col style="width:10%;" />
                                                        <col style="width:15%;" />
                                                        <col style="width:10%;" />
                                                        <col style="width:10%;" />
                                                        <col style="width:10%;" />
                                                        <col style="width:10%;" />
                                                        <col style="width:10%;" />
                                                        <col style="width:10%;" />
                                                        <col style="width:10%;" />
                                                        <col style="width:10%;" />
                                                    </colgroup>
                                                    <tr>
                                                        <td class="m44_title_sticky">공정라인</td>
                                                        <td class="m44_title">불량수량</td>
                                                        <td class="m44_title">불량점유</td>
                                                        <td class="m44_title">양품수량</td>
                                                        <td class="m44_title">불량률</td>
                                                        <td class="m44_title">불량 1</td>
                                                        <td class="m44_title">불량 2</td>
                                                        <td class="m44_title">불량 3</td>
                                                        <td class="m44_title">불량 4</td>
                                                        <td class="m44_title">불량 5</td>
                                                        <td class="m44_title">불량 6</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div id="divBodyScroll">
                                                <table id="tblBody" border="0">
                                                    <colgroup>
                                                        <col style="width:15%;" class="right_border" />
                                                        <col style="width:10%;" class="right_border" />
                                                        <col style="width:15%;" class="right_border" />
                                                        <col style="width:10%;" class="right_border" />
                                                        <col style="width:10%;" class="right_border" />
                                                        <col style="width:10%;" class="right_border" />
                                                        <col style="width:10%;" class="right_border" />
                                                        <col style="width:10%;" class="right_border" />
                                                        <col style="width:10%;" class="right_border" />
                                                        <col style="width:10%;" class="right_border" />
                                                        <col style="width:10%;" class="right_border" />
                                                    </colgroup>
                                                    <tr>
                                                        <td class="m44_content_sticky right_border" >A 000001</td>
                                                        <td class="m44_content right_border" >320</td>
                                                        <td class="m44_content right_border" >0.00%</td>
                                                        <td class="m44_content right_border" >150개</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="m44_content_sticky right_border" >A 000001</td>
                                                        <td class="m44_content right_border" >320</td>
                                                        <td class="m44_content right_border" >0.00%</td>
                                                        <td class="m44_content right_border" >150개</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="m44_content_sticky right_border" >A 000001</td>
                                                        <td class="m44_content right_border" >320</td>
                                                        <td class="m44_content right_border" >0.00%</td>
                                                        <td class="m44_content right_border" >150개</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="m44_content_sticky right_border" >A 000001</td>
                                                        <td class="m44_content right_border" >320</td>
                                                        <td class="m44_content right_border" >0.00%</td>
                                                        <td class="m44_content right_border" >150개</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="m44_content_sticky right_border" >A 000001</td>
                                                        <td class="m44_content right_border" >320</td>
                                                        <td class="m44_content right_border" >0.00%</td>
                                                        <td class="m44_content right_border" >150개</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="m44_content_sticky right_border" >A 000001</td>
                                                        <td class="m44_content right_border" >320</td>
                                                        <td class="m44_content right_border" >0.00%</td>
                                                        <td class="m44_content right_border" >150개</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="m44_content_sticky right_border" >A 000001</td>
                                                        <td class="m44_content right_border" >320</td>
                                                        <td class="m44_content right_border" >0.00%</td>
                                                        <td class="m44_content right_border" >150개</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="m44_content_sticky right_border" >A 000001</td>
                                                        <td class="m44_content right_border" >320</td>
                                                        <td class="m44_content right_border" >0.00%</td>
                                                        <td class="m44_content right_border" >150개</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="m44_content_sticky right_border" >A 000001</td>
                                                        <td class="m44_content right_border" >320</td>
                                                        <td class="m44_content right_border" >0.00%</td>
                                                        <td class="m44_content right_border" >150개</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                        <td class="m44_content right_border" >0</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="mainbody_44_mid_r">
                                <div class="mainbody_44_mid_r_head">
                                    <div class="mainbody_44_mid_l_head_text">일(Day)별 불량현황</div>
                                </div>
                                <div class="mainbody_44_mid_r_wrapp">
                                    <table class="mainbody_44_mid_r_tbl">
                                      <tbody><tr>
                                          <td>
                                              <div class="mainbody_44_mid_tb_head">
                                                  <table class="daily_faulty_tb_01">
                                                      <thead>
                                                          <tr>
                                                              <th>공정라인</th>
                                                              <th>합계</th>
                                                              <th>1</th>
                                                              <th>2</th>
                                                              <th>3</th>
                                                              <th>4</th>
                                                              <th>5</th>
                                                              <th>6</th>
                                                              <th>7</th>
                                                          </tr>
                                                          </thead>
                                                  </table>
                                              </div>
                                              <div class="mainbody_44_mid_tb_body_01">
                                                  <table class="daily_faulty_tb_02">
                                                      <tbody>
                                                          <tr>
                                                              <td>A 000001</td>
                                                              <td>50%</td>
                                                              <td>50</td>
                                                              <td>50</td>
                                                              <td>50</td>
                                                              <td>50</td>
                                                              <td>50</td>
                                                              <td>50</td>
                                                              <td>50</td>
                                                          </tr>
                                                          <tr>
                                                            <td>A 000001</td>
                                                            <td>100</td>
                                                            <td>100</td>
                                                            <td>100</td>
                                                            <td>100</td>
                                                            <td>100</td>
                                                            <td>100</td>
                                                            <td>100</td>
                                                            <td>100</td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>A 000001</td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                  </tbody>
                                                  </table>
                                              </div>
                                          </td>
                                      </tr>
                                    </tbody></table>
                                  </div>
                        </div>
                    </div>
                        <div class="mainbody_44_bott">
                                <div class="mainbody_44_bott_l">
                                    <div class="mainbody_44_bott_l_head">
                                        <div class="mainbody_44_bott_l_head_text">라인별 불량현황 그래프</div>
                                    </div>
                                    <div class="mainbody_44_bott_l_content">
                                        <div class="mainbody_44_bott_l_content_graph_01">
                                            <div id="canvas"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mainbody_44_bott_r">
                                    <div class="mainbody_44_bott_r_head">
                                        <div class="mainbody_44_bott_r_head_text">월(Month)별 불량현황 그래프</div>
                                    </div>
                                    <div class="mainbody_44_bott_r_content">
                                            <div class="mainbody_44_bott_r_content_graph_02">
                                                <div id="monthGraph"></div>
                                            </div>
                                    </div>
                                </div>
                        </div>
                </div>
            </div>
            </div>

            <!-- 주문관리 > 주문관리 -->
            <div class="mainbody_51">
                <div class="mainbody_51_1">
                  <div class="mainbody_51_1_top">
                    <div class="mainbody_51_1_title">
                      <div class="mainbody_51_1_title_name">주문 등록</div>
                    </div>
                    <div class="mainbody_51_1_list">
                      <table>
                        <tr>
                          <td>주문번호</td>
                          <td><span id="go_num">자동으로 부여됩니다.</span></td>
                          <td>거래처</td>
                          <td class="m51_product_admin_td_02">
                            <div class="m51_product_admin_td_09_01_select">
                                <div class="m51_product_admin_td_09_01_select_01" id="m51_product_admin_td_09_01_select_01">&nbsp;</div>
                                <div class="m51_product_admin_td_09_01_select_03">
                                    <button class="m51_customerSearch_btn" onclick="m51_customerOpen()">
                                        <img src="./resources/img/제품관리/선택.png"class="m51_mainbody_03_01_choice_01">
                                    </button>
                                </div>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>접수일자</td>
                          <td>
                            <input type="date" id="go_orderDate">
                          </td>
                          <td>납기일자</td>
                          <td>
                            <input type="date" id="go_dueDate">
                          </td>
                        </tr>
                        <tr>
                          <td>고객발주번호</td>
                          <td>
                            <input type="text" id="go_place">
                          </td>
                          <td>배송지</td>
                          <td>
                            <input type="text" id="go_address">
                          </td>
                        </tr>
                        <tr>
                          <td>공급가액</td>
                          <td>
                            <input type="text" id="go_price">
                          </td>
                          <td>합계금액</td>
                          <td>
                            <input type="text" id="go_amount">
                          </td>
                        </tr>
                        <tr>
                            <td>과세형태</td>
                            <td>
                                <div class="mainbody_51_1_list_radio">
                                    <div class="mainbody_51_1_list_radio01">
                                        <input type="radio"  class="go_taxation" name="taxation" value="과세">과세
                                    </div>
                                    <div class="mainbody_51_1_list_radio02">
                                        <input type="radio"  class="go_taxation" name="taxation" value="영세">영세
                                    </div>
                                    <div class="mainbody_51_1_list_radio03">
                                        <input type="radio"  class="go_taxation" name="taxation" value="면세">면세
                                    </div>
                                </div>
                            </td>
                            <td></td>
                            <td> 	
                            <div class="mainbody_51_1_top_btn_zip_01_01">
                            	<div class="mainbody_51_1_top_btn_zip_02">
                            		<button class="mainbody_51_1_top_btn_02"><img src="./resources/img/gray_save.png"></button>
                            	</div>                  
                                <div class="mainbody_51_1_top_btn_zip_01">
                                    <button class="mainbody_51_1_top_btn_01"><img src="./resources/img/주문관리/초기화.png"></button>
                                </div>
                            </div>
                            </td>
                          </tr>
                      </table>
        
                    </div>
                  </div>
                  <div class="mainbody_51_2_bottom">
                    <div class="mainbody_51_2_bottom_btn">
                      <div class="mainbody_51_2_bottom_btn_zip">
                        <div class="mainbody_51_2_bottom_btn_1">
                          <button class="mainbody_51_2_bottom_btn_1_01" onclick="mainbody_51_2_bottom_btn_1_01()"><img src="./resources/img/주문관리/인쇄.png"></button>
                        </div>
                       <div class="mainbody_51_2_bottom_btn_zip_02">
                            <div class="mainbody_51_2_bottom_btn_3">
                                <button class="mainbody_51_2_bottom_btn_2_02" onclick="mainbody_51_2_bottom_btn_2_02()"><img src="./resources/img/생산관리/품목추가.png"></button>
                            </div>
                            <div class="mainbody_51_2_bottom_btn_2">
                                <button class="mainbody_51_2_bottom_btn_2_01"><img src="./resources/img/삭제.png"></button>
                            </div>
                        </div>
                      </div>
                    </div>
                    <div class="mainbody_51_2_bottom_02">
                      <div class="mainbody_51_2_bottom_02_left">
                        <div class="mainbody_51_2_bottom_02_print">
                          <img src="./resources/img/주문관리/상품주문서.png">
                        </div>
                      </div>
                      <div class="mainbody_51_2_bottom_02_right">
                        <table class="mainbody_51_2_table">
                          <thead>
                            <tr>
                              <td></td>
                              <td>품목명</td>
                              <td>규격</td>
                              <td>단위</td>
                              <td>단가</td>
                              <td>주문수량</td>
                              <td>할인율</td>
                              <td>금액</td>
                            </tr>
                          </thead>
                          <tbody id="mainbody_51_2_table_tbody">
                            <tr>
                              <td>
                                <input type="checkbox">
                              </td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td><input type="text" autocomplete="off"></td>
                              <td><input type="text" autocomplete="off"></td>
                              <td><input type="text" autocomplete="off"></td>
                              <td></td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
        
              <!-- 주문관리 > 주문내역조회 -->
              <div class="mainbody_52">
                <div class="mainbody_52_00">
                  <div class="mainbody_52_01">
                    <div class="mainbody_52_01_top">
                      <div class="mainbody_52_01_top_l">
                        <div class="mainbody_52_01_top_l_01">주문서 등록일</div>
                        <div class="mainbody_52_01_top_l_02"><input type="date">&nbsp;~&nbsp;</div>
                        <div class="mainbody_52_01_top_l_03"><input type="date"></div>
                        <div class="mainbody_52_01_top_l_05">
                          <button class="mainbody_52_01_top_btn_01">
                            <img src="./resources/img/주문관리/검색.png">
                          </button>
                        </div>
                     </div>
        
                     <div class="mainbody_52_01_top_r">
                      <div class="mainbody_52_01_top_l_04"><input class="mainbody_52_01_top_l_04_search_enter" type="text" placeholder="주문번호 또는 거래처를 입력하세요" onkeyup="enterkey7()"></div>
                      <div class="mainbody_52_01_top_r_01">
                        <button class="mainbody_52_01_top_btn_02">
                          <img src="./resources/img/주문관리/인쇄.png">
                        </button>
                      </div>
                      <div class="mainbody_52_01_top_r_02">
                        <button class="mainbody_52_01_top_btn_03">
                          <img src="./resources/img/삭제.png">
                        </button>
                      </div>
                    </div>
                  </div>
        
                    <div class="mainbody_52_01_bott">
                      <table class="m52_output_view_tb">
                        <thead>
                          <tr>
                            <td></td>
                            <td>주문일시</td>
                            <td>주문번호</td>
                            <td>거래처</td>
                            <td>품목번호</td>
                            <td>품목명</td>
                            <td>주문수량</td>
                            <td>주문총액</td>
                            <td>납기일</td>
                            <td>처리상태</td>
                          </tr>
                        </thead>
                        <tbody id="m52_output_view_tb_tbody">
                          <tr>
                            <td><input type="checkbox"></td>
                            <td>20.22.15</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>555,000</td>
                            <td></td>
                            <td></td>
                          </tr>
                      </table>
                    </div>
                  </div>
                </div>
              </div>


            <!-- *1006 X-R 관리도 -->
            <div class="mainbody_61">
                <div class="mainbody_61_wrapp">
                    <div class="mainbody_61_00">
                        <div class="mainbody_61_01">
                            <div class="mainbody_61_01_00">
                                <div class="mainbody_61_01_01">검사일</div>
                                <div class="mainbody_61_01_02"><input type="date"><a class="mainbody_61_01_a">&nbsp;~&nbsp;</a></div>
                                <div class="mainbody_61_01_03"><input type="date"></div>
                                <div class="mainbody_61_01_04">
                                    <div><input type="radio">&nbsp;자주검사</div>
                                </div>
                            </div>
                        </div>
                        <div class="mainbody_61_02">
                            <div class="mainbody_61_02_00">
                                <div class="mainbody_61_02_00_l">
                                    <div class="mainbody_61_02_03">
                                        <button class="mainbody_61_02_btn" onclick="m61_product_search_Open()">
                                            <img src="./resources/img/생산관리/품목추가.png">
                                        </button>
                                    </div>
                                    <div class="mainbody_61_02_02">
                                        <div class="mainbody_61_02_02_select_01"><input type="text" id="m61_seleted_product_value" placeholder="품목을 선택하세요"></div>
                                    </div>
                            </div>
                            <div class="mainbody_61_02_00_r">
                            <div class="mainbody_61_02_r_01">검사기준(수치):&nbsp;</div>
                            <div class="mainbody_61_02_r_02">
                                <div class="mainbody_61_02_04_search"><input type="text" placeholder="품목을 먼저 선택하세요"></div>
                            </div>
                            <div class="mainbody_61_02_r_03">
                                <button class="mainbody_61_02_05_btn" >
                                    <img src="./resources/img/생산관리/검색.png">
                                </button>
                            </div>
                        </div>
                    </div>
                        </div>
                        <div class="mainbody_61_03">
                            <div class="mainbody_61_03_l">
                                <div class="mainbody_61_03_l_head">
                                    <div class="mainbody_61_03_l_text">X bar 관리도</div>
                                </div>
                                <div class="mainbody_61_03_l_content">
                                    <div id="xbaradmin_graph" style="width: 90%;"></div>
                                </div>
                            </div>
                            <div class="mainbody_61_03_r">
                                <div class="mainbody_61_03_r_head">
                                    <div class="mainbody_61_03_r_text">히스토그램</div>
                                </div>
                                <div class="mainbody_61_03_r_content">
                                    <div id="histogram_graph" style="width: 90%;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="mainbody_61_04">
                            <div class="mainbody_61_04_l">
                                <div class="mainbody_61_04_l_head">
                                    <div class="mainbody_61_04_l_text">R 관리도</div>
                                </div>
                                <div class="mainbody_61_04_l_content">
                                    <div class="mainbody_61_04_l_content_top">
                                        <div id="radmin_graph" style="width: 90%;"></div>
                                    </div>
                                    <div class="mainbody_61_04_l_content_bott">
                                        <table class="rAdmin_tb">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>검사일자</th>
                                                    <th>군 평균(X)</th>
                                                    <th>범위(R)</th>
                                                    <th>샘플</th>
                                                    <th>값</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>2022-05-25</td>
                                                    <td>36.545</td>
                                                    <td>0.10</td>
                                                    <td>1</td>
                                                    <td>36,500</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>2022-06-10</td>
                                                    <td>24.65</td>
                                                    <td>0.05</td>
                                                    <td>1</td>
                                                    <td>25,500</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="mainbody_61_04_r">
                                <div class="mainbody_61_04_r_01">
                                <div class="mainbody_61_04_r_head_01">
                                    <div class="mainbody_61_04_r_text">X bar/R</div>
                                </div>
                                <div class="mainbody_61_04_r_content_01">
                                    <table class="Xbar_r_tb"> 
                                        <tbody>
                                            <tr>
                                                <th></th>
                                                <th>--X bar--</th>
                                                <th>--R--</th>
                                            </tr>
                                            <tr>
                                                <th>평균:</th>
                                                <td>95%</td>
                                                <td>90%</td>
                                            </tr>
                                            <tr>
                                                <th>UCL:</th>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th>CL:</th>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th>LCL:</th>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th>관리한계이탈수:</th>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th>최대 런 길이:</th>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                </div>
                            </div>
                            <div class="mainbody_61_04_r_02">
                                <div class="mainbody_61_04_r_head_02">
                                    <div class="mainbody_61_04_r_text">통계/공정지수(cpk)</div>
                                </div>
                                <div class="mainbody_61_04_r_content_02">
                                    <table class="statistics_tb">
                                        <tbody>
                                            <tr>
                                                <th>규격 상한:</th>
                                                <td>55,500</td>
                                            </tr>
                                            <tr>
                                                <th>규격 하한:</th>
                                                <td>35,500</td>
                                            </tr>
                                            <tr>
                                                <th>총 시료수(n):</th>
                                                <td>56</td>
                                            </tr>
                                            <tr>
                                                <th>표준편차:</th>
                                                <td>19,815</td>
                                            </tr>
                                            <tr>
                                                <th>최대 값:</th>
                                                <td>46,000</td>
                                            </tr>
                                            <tr>
                                                <th>최소 값:</th>
                                                <td>-16,000</td>
                                            </tr>
                                            <tr>
                                                <th>공정능력(Cp):</th>
                                                <td>0.017</td>
                                            </tr>
                                            <tr>
                                                <th>치우침(k):</th>
                                                <td>9.189</td>
                                            </tr>
                                            <tr>
                                                <th>공정능력지수:</th>
                                                <td>0.000</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            
           <!-- LOT > LOT 추적 -->
            <div class="mainbody_71">
                <div class="mainbody_71_00">
                    <div  class="mainbody_71_01">
                        <div  class="mainbody_71_top">
                            <div class="mainbody_71_top_l">
                                <div class="mainbody_71_top_l_01">
                                   <input type="text" class="m77_lot_tracking_lotnum" placeholder="LOT 번호를 입력하세요">
                                </div>
                                <div class="mainbody_71_top_l_02">
                                    <div class="mainbody_71_top_l_02_01">
                                        <input type="radio" name="전개">정전개
                                    </div>
                                    <div class="mainbody_71_top_l_02_02">
                                        <input type="radio" name="전개">역전개
                                    </div>
                                 </div>
                                <div class="mainbody_71_top_l_03">
                                    <button class="mainbody_71_top_l_btn_01">
                                        <img src="./resources/img/생산관리/검색.png">
                                    </button>
                                </div>
                            </div>
                            <div class="mainbody_71_top_r">
                                <div class="mainbody_71_top_r_01">
                                    <button class="mainbody_71_top_r_btn_01">
                                        <img src="./resources/img/생산관리/엑셀.png">
                                    </button>
                                </div>
                                <div class="mainbody_71_top_r_02">
                                    <button class="mainbody_71_top_r_btn_02">
                                        <img src="./resources/img/삭제.png">
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div  class="mainbody_71_bot">
                            <div class="mainbody_71_bot_00">
                                <table class="lot_tracking_tb">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>LOT번호</th>
                                            <th>재고이동유형</th>
                                            <th>발생일자</th>
                                            <th>품목구분</th>
                                            <th>품목번호</th>
                                            <th>품목명</th>
                                            <th>수량</th>
                                            <th>가격</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="checkbox"></td>
                                            <td>fhjdg</td>
                                            <td>sdfg</td>
                                            <td>sdfg</td>
                                            <td>sdfg</td>
                                            <td>sdfg</td>
                                            <td>sdfg</td>
                                            <td>sdfg</td>
                                            <td>sdfg</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- LOT > LOT 정보조회 -->
            <div class="mainbody_72">
                <div class="mainbody_72_00">
                        <div class="mainbody_72_01">
                            <div class="mainbody_72_01_00">
                            <div class="mainbody_72_01_02">
                                <input type="text" class="lot_info_view_search" placeholder="LOT 번호를 입력하세요">
                            </div>
                            <div class="mainbody_72_01_03">
                                <button class="mainbody_72_01_btn_01">
                                    <img src="./resources/img/생산관리/검색.png">
                                </button>
                            </div>
                        </div>
                        </div>
                        <div class="mainbody_72_02">
                            <div class="mainbody_72_02_01">
                                <div class="mainbody_72_02_head">
                                    <div class="mainbody_72_02_head_text">출고</div>
                                </div>
                                <div class="mainbody_72_02_00">
                                    <div class="mainbody_72_02_l">
                                        <table class="m72_release_tb">
                                            <tbody>
                                                <tr>
                                                    <th>품목번호:</th>
                                                    <td></td>
                                                    <th>품목명:</th>
                                                    <td></td>
                                                    <th>규격:</th>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <th>출고일자:</th>
                                                    <td>
                                                        <input type="date">
                                                    </td>
                                                    <th>출고수량:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                    <th>작업자:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>거래처:</th>
                                                    <td>
                                                        <input type="date">
                                                    </td>
                                                    <th>연락처:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                    <th>배송처:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mainbody_72_03">
                            <div class="mainbody_72_03_01">
                                <div class="mainbody_72_03_head">
                                    <div class="mainbody_72_03_head_text">생산</div>
                                </div>
                                <div class="mainbody_72_03_00">
                                    <div class="mainbody_72_03_l">
                                        <table class="m72_production_tb_01">
                                            <tbody>
                                                <tr>
                                                    <th>품목번호:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                    <th>품목명:</th>
                                                    <th>
                                                        <div></div>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>생산LOT번호:</th>
                                                    <td colspan="3">
                                                        <div></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>생산수량:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                    <th>작업자:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>생산일자:</th>
                                                    <td>
                                                        <input type="date">
                                                    </td>
                                                    <th>시프트:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>공정명:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                    <th>설비명:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                
                                    <div class="mainbody_72_03_r">
                                        <div class="mainbody_72_03_r_00">
                                            <table class="m72_production_tb_02">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>작업자</th>
                                                        <th>작업구분</th>
                                                        <th>시작시간</th>
                                                        <th>종료시간</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>akdls</td>
                                                        <td>gnk</td>
                                                        <td>9:00</td>
                                                        <td>10:00</td>
                                                    </tr>
                                                    <tr>
                                                        <td>2</td>
                                                        <td>akjdkj</td>
                                                        <td>dsjhoa</td>
                                                        <td>10:00</td>
                                                        <td>11:00</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="mainbody_72_04">
                            <div class="mainbody_72_04_01">
                                <div class="mainbody_72_04_head">
                                    <div class="mainbody_72_04_head_text">품질</div>
                                </div>
                                <div class="mainbody_72_04_00">
                                    <div class="mainbody_72_04_l">
                                        <table class="m72_quality_tb_01">
                                            <tbody>
                                                <tr>
                                                    <th>검사일자:</th>
                                                    <td>
                                                        <input type="date">
                                                    </td>
                                                    <th>시프트:</th>
                                                    <th>
                                                        <div></div>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>공정명:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                    <th>설비명:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>작업자:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                    <th>승인자:</th>
                                                    <td>
                                                        <div></div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="mainbody_72_04_r">
                                        <div class="mainbody_72_04_r_00">
                                            <table class="m72_quality_tb_02">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>검사항목</th>
                                                        <th>검사기준</th>
                                                        <th>시료</th>
                                                        <th>결과</th>
                                                        <th>판정</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>dsc</td>
                                                        <td>akdls</td>
                                                        <td>gnk</td>
                                                        <td>skcm</td>
                                                        <td>akasdl</td>
                                                    </tr>
                                                    <tr>
                                                        <td>2</td>
                                                        <td>jaskdk</td>
                                                        <td>kdj</td>
                                                        <td>woje</td>
                                                        <td>nlkn</td>
                                                        <td>dsanlj</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mainbody_72_05">
                            <div class="mainbody_72_05_01">
                                <div class="mainbody_72_05_head">
                                    <div class="mainbody_72_05_head_text">자재</div>
                                </div>
                                <div class="mainbody_72_05_00">
                                    <table class="m72_material_tb">
                                        <thead>
                                            <tr>
                                                <th>자재 LOT번호</th>
                                                <th>자재번호</th>
                                                <th>자재명</th>
                                                <th>투입일자</th>
                                                <th>투입수량</th>
                                                <th>입고일자</th>
                                                <th>입고수량</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1573201</td>
                                                <td>1573201</td>
                                                <td>asldj</td>
                                                <td>2022-09-19</td>
                                                <td>2233469</td>
                                                <td>2022-09-19</td>
                                                <td>1354</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>   
        </div>
    </div>
</body>

<!-- 메인 바디 -> 왼쪽 사이드바 -> 하위 네비게이션 스크립트 -->
<script>
    $(".one-btn").click(function () {
        $("div ul .one-show").toggleClass("show");
        $("div ul .first").toggleClass("rotate");
        if ($('[name="two_show"]').attr('class') === "two-show show2") {
            $('div ul .two-show').toggleClass("show2");
            $('div ul .second').toggleClass("rotate");
        }
        if ($('[name="three_show"]').attr('class') === "three-show show3") {
            $('div ul .three-show').toggleClass("show3");
            $('div ul .third').toggleClass("rotate");
        }
        if ($('[name="four_show"]').attr('class') === "four-show show4") {
            $('div ul .four-show').toggleClass("show4");
            $('div ul .forth').toggleClass("rotate");
        }
        if ($('[name="five_show"]').attr('class') === "five-show show5") {
            $('div ul .five-show').toggleClass("show5");
            $('div ul .fifth').toggleClass("rotate");
        }
        if ($('[name="six_show"]').attr('class') === "six-show show6") {
            $('div ul .six-show').toggleClass("show6");
            $('div ul .sixth').toggleClass("rotate");
        }
        if ($('[name="eight_show"]').attr('class') === "eight-show show8") {
            $('div ul .eight-show').toggleClass("show8");
            $('div ul .eight').toggleClass("rotate");
        }
    });
    $('.two-btn').click(function () {
        $('div ul .two-show').toggleClass("show2");
        $('div ul .second').toggleClass("rotate");
        if ($('[name="one_show"]').attr('class') === "one-show show") {
            $('div ul .one-show').toggleClass("show");
            $('div ul .first').toggleClass("rotate");
        }
        if ($('[name="three_show"]').attr('class') === "three-show show3") {
            $('div ul .three-show').toggleClass("show3");
            $('div ul .third').toggleClass("rotate");
        }
        if ($('[name="four_show"]').attr('class') === "four-show show4") {
            $('div ul .four-show').toggleClass("show4");
            $('div ul .forth').toggleClass("rotate");
        }
        if ($('[name="five_show"]').attr('class') === "five-show show5") {
            $('div ul .five-show').toggleClass("show5");
            $('div ul .fifth').toggleClass("rotate");
        }
        if ($('[name="six_show"]').attr('class') === "six-show show6") {
            $('div ul .six-show').toggleClass("show6");
            $('div ul .sixth').toggleClass("rotate");
        }
        if ($('[name="eight_show"]').attr('class') === "eight-show show8") {
            $('div ul .eight-show').toggleClass("show8");
            $('div ul .eight').toggleClass("rotate");
        }
    });
    $('.three-btn').click(function () {
        $('div ul .three-show').toggleClass("show3");
        $('div ul .third').toggleClass("rotate");
        if ($('[name="one_show"]').attr('class') === "one-show show") {
            $('div ul .one-show').toggleClass("show");
            $('div ul .first').toggleClass("rotate");
        }
        if ($('[name="two_show"]').attr('class') === "two-show show2") {
            $('div ul .two-show').toggleClass("show2");
            $('div ul .second').toggleClass("rotate");
        }

        if ($('[name="four_show"]').attr('class') === "four-show show4") {
            $('div ul .four-show').toggleClass("show4");
            $('div ul .forth').toggleClass("rotate");
        }
        if ($('[name="five_show"]').attr('class') === "five-show show5") {
            $('div ul .five-show').toggleClass("show5");
            $('div ul .fifth').toggleClass("rotate");
        }
        if ($('[name="six_show"]').attr('class') === "six-show show6") {
            $('div ul .six-show').toggleClass("show6");
            $('div ul .sixth').toggleClass("rotate");
        }
        if ($('[name="eight_show"]').attr('class') === "eight-show show8") {
            $('div ul .eight-show').toggleClass("show8");
            $('div ul .eight').toggleClass("rotate");
        }
    });
    $('.four-btn').click(function () {
        $('div ul .four-show').toggleClass("show4");
        $('div ul .forth').toggleClass("rotate");
        if ($('[name="one_show"]').attr('class') === "one-show show") {
            $('div ul .one-show').toggleClass("show");
            $('div ul .first').toggleClass("rotate");
        }
        if ($('[name="two_show"]').attr('class') === "two-show show2") {
            $('div ul .two-show').toggleClass("show2");
            $('div ul .second').toggleClass("rotate");
        }
        if ($('[name="three_show"]').attr('class') === "three-show show3") {
            $('div ul .three-show').toggleClass("show3");
            $('div ul .third').toggleClass("rotate");
        }
        if ($('[name="five_show"]').attr('class') === "five-show show5") {
            $('div ul .five-show').toggleClass("show5");
            $('div ul .fifth').toggleClass("rotate");
        }
        if ($('[name="six_show"]').attr('class') === "six-show show6") {
            $('div ul .six-show').toggleClass("show6");
            $('div ul .sixth').toggleClass("rotate");
        }
        if ($('[name="eight_show"]').attr('class') === "eight-show show8") {
            $('div ul .eight-show').toggleClass("show8");
            $('div ul .eight').toggleClass("rotate");
        }
    });
    $('.five-btn').click(function () {
        $('div ul .five-show').toggleClass("show5");
        $('div ul .fifth').toggleClass("rotate");
        if ($('[name="one_show"]').attr('class') === "one-show show") {
            $('div ul .one-show').toggleClass("show");
            $('div ul .first').toggleClass("rotate");
        }
        if ($('[name="two_show"]').attr('class') === "two-show show2") {
            $('div ul .two-show').toggleClass("show2");
            $('div ul .second').toggleClass("rotate");
        }
        if ($('[name="three_show"]').attr('class') === "three-show show3") {
            $('div ul .three-show').toggleClass("show3");
            $('div ul .third').toggleClass("rotate");
        }
        if ($('[name="four_show"]').attr('class') === "four-show show4") {
            $('div ul .four-show').toggleClass("show4");
            $('div ul .forth').toggleClass("rotate");
        }

        if ($('[name="six_show"]').attr('class') === "six-show show6") {
            $('div ul .six-show').toggleClass("show6");
            $('div ul .sixth').toggleClass("rotate");
        }
        if ($('[name="eight_show"]').attr('class') === "eight-show show8") {
            $('div ul .eight-show').toggleClass("show8");
            $('div ul .eight').toggleClass("rotate");
        }
    });
    $('.six-btn').click(function () {
        $('div ul .six-show').toggleClass("show6");
        $('div ul .sixth').toggleClass("rotate");
        if ($('[name="one_show"]').attr('class') === "one-show show") {
            $('div ul .one-show').toggleClass("show");
            $('div ul .first').toggleClass("rotate");
        }
        if ($('[name="two_show"]').attr('class') === "two-show show2") {
            $('div ul .two-show').toggleClass("show2");
            $('div ul .second').toggleClass("rotate");
        }
        if ($('[name="three_show"]').attr('class') === "three-show show3") {
            $('div ul .three-show').toggleClass("show3");
            $('div ul .third').toggleClass("rotate");
        }
        if ($('[name="four_show"]').attr('class') === "four-show show4") {
            $('div ul .four-show').toggleClass("show4");
            $('div ul .forth').toggleClass("rotate");
        }
        if ($('[name="five_show"]').attr('class') === "five-show show5") {
            $('div ul .five-show').toggleClass("show5");
            $('div ul .fifth').toggleClass("rotate");
        }
        if ($('[name="eight_show"]').attr('class') === "eight-show show8") {
            $('div ul .eight-show').toggleClass("show8");
            $('div ul .eight').toggleClass("rotate");
        }
    });
    $('.seve-btn').click(function () {
        if ($('[name="one_show"]').attr('class') === "one-show show") {
            $('div ul .one-show').toggleClass("show");
            $('div ul .first').toggleClass("rotate");
        }
        if ($('[name="two_show"]').attr('class') === "two-show show2") {
            $('div ul .two-show').toggleClass("show2");
            $('div ul .second').toggleClass("rotate");
        }
        if ($('[name="three_show"]').attr('class') === "three-show show3") {
            $('div ul .three-show').toggleClass("show3");
            $('div ul .third').toggleClass("rotate");
        }
        if ($('[name="four_show"]').attr('class') === "four-show show4") {
            $('div ul .four-show').toggleClass("show4");
            $('div ul .forth').toggleClass("rotate");
        }
        if ($('[name="five_show"]').attr('class') === "five-show show5") {
            $('div ul .five-show').toggleClass("show5");
            $('div ul .fifth').toggleClass("rotate");
        }
        if ($('[name="six_show"]').attr('class') === "six-show show6") {
            $('div ul .six-show').toggleClass("show6");
            $('div ul .sixth').toggleClass("rotate");
        }
        if ($('[name="eight_show"]').attr('class') === "eight-show show8") {
            $('div ul .eight-show').toggleClass("show8");
            $('div ul .eight').toggleClass("rotate");
        }
    });
    $('.eight-btn').click(function () {
        $('div ul .eight-show').toggleClass("show8");
        $('div ul .eight').toggleClass("rotate");
        if ($('[name="one_show"]').attr('class') === "one-show show") {
            $('div ul .one-show').toggleClass("show");
            $('div ul .first').toggleClass("rotate");
        }
        if ($('[name="two_show"]').attr('class') === "two-show show2") {
            $('div ul .two-show').toggleClass("show2");
            $('div ul .second').toggleClass("rotate");
        }
        if ($('[name="three_show"]').attr('class') === "three-show show3") {
            $('div ul .three-show').toggleClass("show3");
            $('div ul .third').toggleClass("rotate");
        }
        if ($('[name="four_show"]').attr('class') === "four-show show4") {
            $('div ul .four-show').toggleClass("show4");
            $('div ul .forth').toggleClass("rotate");
        }
        if ($('[name="five_show"]').attr('class') === "five-show show5") {
            $('div ul .five-show').toggleClass("show5");
            $('div ul .fifth').toggleClass("rotate");
        }
        if ($('[name="six_show"]').attr('class') === "six-show show6") {
            $('div ul .six-show').toggleClass("show6");
            $('div ul .six').toggleClass("rotate");
        }
    });
</script>

<!-- 사이드바 화면 변경 스크립트 -->
<script>
$(function() {
	company = $(".mainbar_logo").text();
	console.log(company)
})
    // 기준정보 -> 사용자 관리
    $('#user_li').click(function () {
    	show_user();
    	show_department();
    	show_user_group();
    	show_process();
        document.getElementById("main_title").innerHTML = "기준정보&nbsp; > &nbsp;사용자 관리"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_01").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_10").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        
    })

    var usernum = "";
    $(document).on('click', '.list_bundle_data', function(e){
    e.preventDefault();  
    usernum = $(this).attr("name");
  		console.log(usernum);
  		$('.list_bundle_data').css("background-color","");
  		$('.list_bundle_data').css("color","black");
  		$(this).css("background-color","#999999");
  		$(this).css("color","white");
  
		$.ajax({
		  		url:"userSelect.do",
		  		type:"get",
		  		async: false,
		  		success:userInputHtml,
		  		error:function(data){ 
		  			let str = JSON.stringify(data);
		  			console.log(str);
		  		}
		  	});
		function userInputHtml(data){
			var view="";
		  $.each(data,function(index, obj){	//반복문
		     if(obj.num==usernum){
		    	 $('#u_input_id').val(obj.userid);
		    	 $('#u_input_name').val(obj.username);
		    	 $('#u_input_pw').val(obj.userpw);
		    	 $('#m1_user_input_table_04_select_txt').text(obj.mainProcess);
		    	 $('#m1_user_input_table_05_select_txt').text(obj.userRight);
		    	 $('#m1_user_input_table_06_select_txt').text(obj.department);
		    	 $('#u_input_phonenum').val(obj.contact);
		    	 $('#u_input_email').val(obj.email);
		    	 console.log(obj.username);
		     }
		})
		}
	var u_r_t_btn02 = document.getElementsByClassName('u_r_t_btn02');
	u_r_t_btn02 = u_r_t_btn02.item(0);
	u_r_t_btn02.setAttribute("onClick", "u_r_t_btn02_update()");
	 
  
})

	var group_name = "";
	$(document).on('click', '.author_name', function(e){
  		$('.author_name').parent().css("background-color","");
  		$('.author_name').css("color","black");
  		$(this).parent().css("background-color","#999999");
  		$(this).css("color","white");
	group_name = $(this).text();
	var userGroupRightVO = {
			group_name : group_name
	};
		$.ajax({
	  		url:"userGroupRightSelect.do",
	  		type:"get",
	  		async: false,
			data:{'group_name' : group_name},
	  		success:userGroupRightHtml,

	  		error:function(data){ 
	  			//let str = JSON.stringify(data);
	  			//console.log(str);
	  		}
	  	});
	});
	
	function user_minus_btn_click() {
		var len = $("input[name='userGroupNum']:checked").length;
	var checkArr = [];
	if(len = 1){
		var value = $("input[name='userGroupNum']:checked").val();
		$.ajax({
			url : "userGroupDelete.do",
			type : "GET",
			async:false,
			data : {"ugr_id":value,
			group_name:group_name,
			company : company},
			// dataType : "json",
			success : function(){
				console.log(" 삭제 success");},
			error : function(request, status, error){
			    console.log("삭제 error");}
		});
		}
	if(len > 1){ //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
	    $("input[name='userGroupNum']:checked").each(function(e){
	        var value = $(this).val();
	        checkArr.push(value); 
			console.log(value);
		$.ajax({
			url : "userGroupDelete.do",
			type : "GET",
			async:false,
			data : {"ugr_id":value,
			group_name:group_name,
			company : company},
			// dataType : "json",
			success : function(){
				console.log(" 삭제 success");},
			error : function(request, status, error){
			    console.log("삭제 error");}
			});

	    })
	console.log(checkArr);
	}

	show_user_group();
	
}
    
    // 사용자 그룹 저장 모달창
    function user_gray_save_btn() {
    	var groupname = group_name;
    	console.log(group_name);
        $('.user_group_input_modal_window').fadeIn();
    	 
    	$("input[name='ugr_name']").each(function(e){ //반복문 돌기
    			
			console.log($(this).val()); 
			var ugr_name = $(this).val();
			var ugr_use = 0;
			if($(this).is(':checked')){ // 체크되어있을때
				ugr_use = 1;
			}
			console.log(groupname);
			console.log(ugr_name);
			console.log(ugr_use);
			userGroupRightVO = {
					group_name : groupname,
					ugr_name : ugr_name,
					ugr_use : ugr_use,
					company : company
			};
			$.ajax({
				url : "userGroupRightUpdate.do",
				type : "GET",
				async:false,
				data : {
					group_name : groupname,
					ugr_name : ugr_name,
					ugr_use : ugr_use,
					company : company
			},
				success : function(){
					console.log("사용자 그룹 저장 success");},
				error : function(request, status, error){
				    console.log("사용자 그룹 저장 error");}
			});
			
		})
        	
    }
	
    function userGroupRightHtml(data){
    	$.each(data,function(index, obj){	//반복문
			if(obj.ugr_use==1){
				$("input[name='ugr_name']").each(function(e){
					if ($(this).val()===obj.ugr_name){
						console.log($(this));
						$(this).prop("checked", true);  
					}
				})
			}else{
				$("input[name='ugr_name']").each(function(e){
					if ($(this).val()===obj.ugr_name){
						console.log($(this));
						$(this).prop("checked", false);  
					}
				})
			}
		})
	}
    
    // 기준정보 -> 설정 관리
    $('#set_li').click(function () {
        document.getElementById("main_title").innerHTML = "기준정보&nbsp; > &nbsp;설정 관리"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_02").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_10").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
    })

    // 기준정보 -> 제품 관리
    $('#finProduct_li').click(function () {
    	show_m03_product_admin_td04_select_txt_list();
    	show_goods();
    	show_client();
    	show_process_routing();
        document.getElementById("main_title").innerHTML = "기준정보&nbsp; > &nbsp;제품 관리"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_03").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_10").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");

    })

    // 기준정보 -> 자재 관리
    $('#goods_li').click(function () {
    	show_material();
    	show_client();
    	show_process_routing();
        document.getElementById("main_title").innerHTML = "기준정보&nbsp; > &nbsp;자재 관리"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_04").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_10").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");

    })

    // 기준정보 -> 공정 관리
    
    // 1002 신규 추가 스크립트
    // 기준정보 > 공정관리 > 검토자 선택 텍스트 inpu
    $(document).on("click", ".userSearch_content_tb tbody tr", function(){

        var name = $(this).children().eq(2).text();
        console.log(name);
        $('.userModal').fadeOut();
        $(".mainbody_05_04_left_bott_tb_table_select_txt").text(name);


    });

    // 기준정보 > 공정관리 > 검토자 선택 텍스트 inpu
    $(document).on("click", ".userSearch_content02_tb tbody tr", function(){

    var name = $(this).children().eq(2).text();
    console.log(name);
    $('.userModal02').fadeOut();
    $(".mainbody_05_05_left_bott_tb_table_select_txt").text(name);


    });
    // 끝
    
    

    ////////
    
        $(document).on("dblclick", ".processAdmin_tb_03 tbody tr", function(){
        $('.m5_newtest_window').fadeIn();
        $("#in_code_a").text($(this).children().eq(1).text());
        $("#in_code_c").text($(this).children().eq(2).text());
        $("#in_goods").val($(this).children().eq(3).text());
        $("#in_inputValue").text($(this).children().eq(4).text());
        $("#in_standard").val($(this).children().eq(5).text());
        $("#in_how").text($(this).children().eq(6).text());
        $("#in_max").val($(this).children().eq(7).text());
        $("#in_min").val($(this).children().eq(8).text());
        $("#in_unit").text($(this).children().eq(9).text());
        $("#in_sample").val($(this).children().eq(10).text());
        $("#in_sort").val($(this).children().eq(11).text());
        
        if ($(this).children().eq(12).text()==="O"){
            console.log("O");
            $("#in_self").prop('checked', true);
        }else{
            $("#in_self").prop('checked', false);
        }
    });
    //끝
    
    $('#process_li').click(function () {
    	show_m03_product_admin_td04_select_txt_list(); //공정구분, 주설비
    	show_user(); //검토자,승인자
        document.getElementById("main_title").innerHTML = "기준정보&nbsp; > &nbsp;공정 관리"
        show_process();
        show_inspection();
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_05").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_10").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");

    })

    // 기준정보 -> 거래처 관리
    $('#customer_li').click(function () {
    	show_client();
        document.getElementById("main_title").innerHTML = "기준정보&nbsp; > &nbsp;거래처 관리"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_06").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_10").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");

    })

    // 기준정보 -> BOM 관리
    $('#bom_li').click(function () {
    	show_goods();
    	show_material();
        document.getElementById("main_title").innerHTML = "기준정보&nbsp; > &nbsp;BOM 관리"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_07").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_10").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_33").css("display", "none");

    })

    // 기준정보 -> 로케이션
    $('#location_li').click(function () {
    	show_m03_product_admin_td04_select_txt_list();
        document.getElementById("main_title").innerHTML = "기준정보&nbsp; > &nbsp;로케이션"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_08").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_10").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_33").css("display", "none");

    })

    // 생산관리 -> 생산 계획
    $('#producPlan_li').click(function () {
    	show_goods();
    	show_product_plan();
        document.getElementById("main_title").innerHTML = "생산 관리&nbsp; > &nbsp;생산 계획"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_12").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_33").css("display", "none");

    })

    // 생산관리 -> 작업 지시
    $('#order_li').click(function () {
    	show_goodsOrder();
    	show_product_plan();
    	show_process();
    	show_client();
    	show_goods();
        document.getElementById("main_title").innerHTML = "생산 관리&nbsp; > &nbsp;작업 지시"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_11").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_33").css("display", "none");

    })

    // 생산관리 -> 작업 지시 조회
    $('#orderView_li').click(function () {
    	show_work_order();
        document.getElementById("main_title").innerHTML = "생산 관리&nbsp; > &nbsp;작업 지시 조회"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_14").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_33").css("display", "none");

    })

    // 생산관리 -> 생산 실적 조회
    $('#productView_li').click(function () {
        document.getElementById("main_title").innerHTML = "생산 관리&nbsp; > &nbsp;생산 실적 조회"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_15").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_33").css("display", "none");

    })
    
    // 생산관리 -> 생산 일보
    $('#produc_daliy').click(function () {
    	show_m03_product_admin_td04_select_txt_list();
    	show_process();
    	show_user();
    	show_work_order();
    	show_goods();
    	document.getElementById("main_title").innerHTML = "생산 관리&nbsp; > &nbsp;생산 일보"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_13").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_08").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_14").css("display", "none");

    })

    // 자재관리 -> 자재 발주
    $('#material_li').click(function () {
        show_material();
        show_client();
    	document.getElementById("main_title").innerHTML = "자재 관리&nbsp; > &nbsp;자재 발주"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_21").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_33").css("display", "none");

    })

    // 자재관리 -> 자재 발주 조회
    $('#materialView_li').click(function () {
    	show_material_order();
    	document.getElementById("main_title").innerHTML = "자재 관리&nbsp; > &nbsp;자재 발주 조회"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_22").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_15").css("display", "none");
        $(".mainbody_33").css("display", "none");

    })

    // 자재관리 -> 자재 입고 현황
    $('#materialArrival_li').click(function () {
    	show_material_order();
    	show_material()
        document.getElementById("main_title").innerHTML = "자재 관리&nbsp; > &nbsp;자재 입고 현황"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_23").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");

    })

    // 자재관리 -> 자재 재고 조회
    $('#inventoryList_li').click(function () {
        document.getElementById("main_title").innerHTML = "자재 관리&nbsp; > &nbsp;자재 재고 조회"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_24").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");

    })

    // 물류관리 -> 출고
    $('#outOrder_li').click(function () {
        document.getElementById("main_title").innerHTML = "물류 관리&nbsp; > &nbsp;출고"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_31").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");

    })

    // 물류관리 -> 출고 조회
    $('#release_li').click(function () {
        document.getElementById("main_title").innerHTML = "물류 관리&nbsp; > &nbsp;출고 조회"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_32").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");

    })
    
	// 물류관리 -> 제품 재고 현황
    $('#productlist_li').click(function () {
        document.getElementById("main_title").innerHTML = "물류 관리&nbsp; > &nbsp;제품 재고 현황"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_33").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_15").css("display", "none");

    })

    // 품질관리 -> 품질 검사 내역 입력
    $('#produFaulty_li').click(function () {
        document.getElementById("main_title").innerHTML = "품질 관리&nbsp; > &nbsp;품질 검사 내역 입력"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_41").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");


    })

    // 품질관리 -> 품질 검사 내역 조회
    $('#qualityInspection_li').click(function () {
        document.getElementById("main_title").innerHTML = "품질 관리&nbsp; > &nbsp;품질 검사 내역 조회"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_42").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");

    })

    // 품질관리 -> 공정 불량 현황
    $('#processDefect_li').click(function () {
        document.getElementById("main_title").innerHTML = "품질 관리&nbsp; > &nbsp;공정 불량 현황"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_43").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");

    })

    // 품질관리 -> 불량률 조회
    $('#faultyList_li').click(function () {
        document.getElementById("main_title").innerHTML = "품질 관리&nbsp; > &nbsp;불량률 조회"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_44").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");

    })

    // 주문관리 -> 주문 관리
    $('#orderAdmin_li').click(function () {
    	show_client();
    	show_goods();
        document.getElementById("main_title").innerHTML = "주문 관리&nbsp; > &nbsp;주문 관리"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_51").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");
    })

    // 주문관리 -> 주문 내역 조회
    $('#proOrder_li').click(function () {
    	show_goodsOrder();
    	show_goods();
        document.getElementById("main_title").innerHTML = "주문 관리&nbsp; > &nbsp;주문 내역 조회"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_52").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");
    })

    // X-R 관리도
    $('#xrAdmin_li').click(function () {
        document.getElementById("main_title").innerHTML = "X-R 관리도"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_61").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");
    })
    
     // LOT 추적 -> LOT 추적
    $('#LOT_tracking_li').click(function () {
        document.getElementById("main_title").innerHTML = "LOT 추적&nbsp; > &nbsp;LOT 추적"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_71").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_72").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");
    })
    
     // LOT 추적 -> LOT 정보 조회
    $('#LOT_check_li').click(function () {
        document.getElementById("main_title").innerHTML = "LOT 추적&nbsp; > &nbsp;LOT 정보 조회"
        $(".main_top_bar").css("display", "flex");
        $(".mainbody_72").css("display", "flex");
        $(".mainbody_00").css("display", "none");
        $(".mainbody_01").css("display", "none");
        $(".mainbody_02").css("display", "none");
        $(".mainbody_03").css("display", "none");
        $(".mainbody_04").css("display", "none");
        $(".mainbody_05").css("display", "none");
        $(".mainbody_06").css("display", "none");
        $(".mainbody_07").css("display", "none");
        $(".mainbody_11").css("display", "none");
        $(".mainbody_12").css("display", "none");
        $(".mainbody_13").css("display", "none");
        $(".mainbody_14").css("display", "none");
        $(".mainbody_21").css("display", "none");
        $(".mainbody_22").css("display", "none");
        $(".mainbody_23").css("display", "none");
        $(".mainbody_24").css("display", "none");
        $(".mainbody_31").css("display", "none");
        $(".mainbody_32").css("display", "none");
        $(".mainbody_41").css("display", "none");
        $(".mainbody_42").css("display", "none");
        $(".mainbody_43").css("display", "none");
        $(".mainbody_44").css("display", "none");
        $(".mainbody_51").css("display", "none");
        $(".mainbody_52").css("display", "none");
        $(".mainbody_61").css("display", "none");
        $(".mainbody_71").css("display", "none");
        $(".mainbody_33").css("display", "none");
        $(".mainbody_15").css("display", "none");
    })
</script>

<!--기준정보 -> 사용자 관리-->
<script>

    function m1_user_input_table_04_select_click() {
        $("#m1_user_input_table_04_select_txt").text('\u00A0');
    }

    function m1_user_input_table_04_select_click() {
        $("#m1_user_input_table_04_select_txt").text('\u00A0');
    }

    $('#cate_main_name_click10').click(function () {
        if ($('#cate_sub_name_11').css("display") !== "table-row") {
            $('#cate_sub_name_10').css("display", 'table-row');
            $('#cate_sub_name_11').css("display", 'table-row');
            $('#cate_sub_name_12').css("display", 'table-row');
            $('#cate_sub_name_13').css("display", 'table-row');
            $('#cate_sub_name_14').css("display", 'table-row');
            $('#cate_sub_name_15').css("display", 'table-row');
            $('#cate_sub_name_16').css("display", 'table-row');
            $('#cate_sub_name_17').css("display", 'table-row');
            $('#cate_sub_name_18').css("display", 'table-row');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
        } else if ($('#cate_sub_name_11').css("display") === "table-row") {
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
        }
    })
    $('#cate_main_name_click20').click(function () {
        if ($('#cate_sub_name_21').css("display") !== "table-row") {
            $('#cate_sub_name_21').css("display", 'table-row');
            $('#cate_sub_name_22').css("display", 'table-row');
            $('#cate_sub_name_23').css("display", 'table-row');
            $('#cate_sub_name_24').css("display", 'table-row');
            $('#cate_sub_name_25').css("display", 'table-row');
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
        } else {
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
        }
    })
    $('#cate_main_name_click30').click(function () {
        if ($('#cate_sub_name_31').css("display") !== "table-row") {
            $('#cate_sub_name_31').css("display", 'table-row');
            $('#cate_sub_name_32').css("display", 'table-row');
            $('#cate_sub_name_33').css("display", 'table-row');
            $('#cate_sub_name_34').css("display", 'table-row');
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
        } else {
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
        }
    })
    $('#cate_main_name_click40').click(function () {
        if ($('#cate_sub_name_41').css("display") !== "table-row") {
            $('#cate_sub_name_41').css("display", 'table-row');
            $('#cate_sub_name_42').css("display", 'table-row');
            $('#cate_sub_name_43').css("display", 'table-row');
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
        } else {
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
        }
    })
    $('#cate_main_name_click50').click(function () {
        if ($('#cate_sub_name_51').css("display") !== "table-row") {
            $('#cate_sub_name_51').css("display", 'table-row');
            $('#cate_sub_name_52').css("display", 'table-row');
            $('#cate_sub_name_53').css("display", 'table-row');
            $('#cate_sub_name_54').css("display", 'table-row');
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
            num5 = 1;
        } else {
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
            num1 = 0;
            num2 = 0;
            num3 = 0;
            num4 = 0;
            num5 = 0;
            num6 = 0;
            num7 = 0;
        }
    })
    $('#cate_main_name_click60').click(function () {
        if ($('#cate_sub_name_61').css("display") !== "table-row") {
            $('#cate_sub_name_61').css("display", 'table-row');
            $('#cate_sub_name_62').css("display", 'table-row');
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
        } else {
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
        }
    })
    $('#cate_main_name_click70').click(function () {
        $('#cate_sub_name_10').css("display", 'none');
        $('#cate_sub_name_11').css("display", 'none');
        $('#cate_sub_name_12').css("display", 'none');
        $('#cate_sub_name_13').css("display", 'none');
        $('#cate_sub_name_14').css("display", 'none');
        $('#cate_sub_name_15').css("display", 'none');
        $('#cate_sub_name_16').css("display", 'none');
        $('#cate_sub_name_17').css("display", 'none');
        $('#cate_sub_name_18').css("display", 'none');
        $('#cate_sub_name_21').css("display", 'none');
        $('#cate_sub_name_22').css("display", 'none');
        $('#cate_sub_name_23').css("display", 'none');
        $('#cate_sub_name_24').css("display", 'none');
        $('#cate_sub_name_25').css("display", 'none');
        $('#cate_sub_name_31').css("display", 'none');
        $('#cate_sub_name_32').css("display", 'none');
        $('#cate_sub_name_33').css("display", 'none');
        $('#cate_sub_name_34').css("display", 'none');
        $('#cate_sub_name_41').css("display", 'none');
        $('#cate_sub_name_42').css("display", 'none');
        $('#cate_sub_name_43').css("display", 'none');
        $('#cate_sub_name_51').css("display", 'none');
        $('#cate_sub_name_52').css("display", 'none');
        $('#cate_sub_name_53').css("display", 'none');
        $('#cate_sub_name_54').css("display", 'none');
        $('#cate_sub_name_61').css("display", 'none');
        $('#cate_sub_name_62').css("display", 'none');
        $('#cate_sub_name_81').css("display", 'none');
        $('#cate_sub_name_82').css("display", 'none');
    })
    $('#cate_main_name_click80').click(function () {
        if ($('#cate_sub_name_81').css("display") !== "table-row") {
            $('#cate_sub_name_81').css("display", 'table-row');
            $('#cate_sub_name_82').css("display", 'table-row');
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
        } else {
            $('#cate_sub_name_10').css("display", 'none');
            $('#cate_sub_name_11').css("display", 'none');
            $('#cate_sub_name_12').css("display", 'none');
            $('#cate_sub_name_13').css("display", 'none');
            $('#cate_sub_name_14').css("display", 'none');
            $('#cate_sub_name_15').css("display", 'none');
            $('#cate_sub_name_16').css("display", 'none');
            $('#cate_sub_name_17').css("display", 'none');
            $('#cate_sub_name_18').css("display", 'none');
            $('#cate_sub_name_21').css("display", 'none');
            $('#cate_sub_name_22').css("display", 'none');
            $('#cate_sub_name_23').css("display", 'none');
            $('#cate_sub_name_24').css("display", 'none');
            $('#cate_sub_name_25').css("display", 'none');
            $('#cate_sub_name_31').css("display", 'none');
            $('#cate_sub_name_32').css("display", 'none');
            $('#cate_sub_name_33').css("display", 'none');
            $('#cate_sub_name_34').css("display", 'none');
            $('#cate_sub_name_41').css("display", 'none');
            $('#cate_sub_name_42').css("display", 'none');
            $('#cate_sub_name_43').css("display", 'none');
            $('#cate_sub_name_51').css("display", 'none');
            $('#cate_sub_name_52').css("display", 'none');
            $('#cate_sub_name_53').css("display", 'none');
            $('#cate_sub_name_54').css("display", 'none');
            $('#cate_sub_name_61').css("display", 'none');
            $('#cate_sub_name_62').css("display", 'none');
            $('#cate_sub_name_81').css("display", 'none');
            $('#cate_sub_name_82').css("display", 'none');
        }
    })
    // 권한 팝업창
    function show01() {
        document.querySelector(".group_popup_back").className = "group_popup_back show01";
    }
    function close() {
        document.querySelector(".group_popup_back").className = "group_popup_back";
    }
    document.querySelector("#user_plus_btn").addEventListener("click", show01);
    document.querySelector("#group_popup_main_bot_bt").addEventListener("click", close);

    function u_r_t_btn01_click() {
        var input1 = document.getElementById('u_input_id');
        var input2 = document.getElementById('u_input_name');
        var input3 = document.getElementById('u_input_pw');
        $("#m1_user_input_table_04_select_txt").text('\u00A0');
        $("#m1_user_input_table_05_select_txt").text('\u00A0');
        $("#m1_user_input_table_06_select_txt").text('\u00A0');
        var input7 = document.getElementById('u_input_phonenum');
        var input8 = document.getElementById('u_input_email');

        input1.value = null;
        input2.value = null;
        input3.value = null;
        input7.value = null;
        input8.value = null;
    }



    // div select custom

    const m13_newtest01_selectBoxElements = document.querySelectorAll(".produce_date_tb_01_shift");

   function  m13_newtest01_toggleSelectBox(selectBox) {
   selectBox.classList.toggle("active");
   }

   function m13_newtest01_selectOption(optionElement) {
   const selectBox = optionElement.closest(".produce_date_tb_01_shift");
   const selectedElement = selectBox.querySelector(".produce_date_tb_01_shift_txt");
   selectedElement.textContent = optionElement.textContent;
   }

   m13_newtest01_selectBoxElements.forEach(selectBoxElement => {
   selectBoxElement.addEventListener("click", function (e) {
       const targetElement = e.target;
       const isOptionElement = targetElement.classList.contains("option");

       if (isOptionElement) {
           console.log("here");
           m13_newtest01_selectOption(targetElement);
       }

       m13_newtest01_toggleSelectBox(selectBoxElement);
   });
   });

   document.addEventListener("click", function (e) {
   const targetElement = e.target;
   const isSelect = targetElement.classList.contains(".produce_date_tb_01_shift") || targetElement.closest(".produce_date_tb_01_shift_txt");

   if (isSelect) {
       return;
   }

   const  m13_newtest01_allSelectBoxElements = document.querySelectorAll(".produce_date_tb_01_shift");

   m13_newtest01_allSelectBoxElements.forEach(boxElement => {
       boxElement.classList.remove("active");
   });
   });



   function produce_date_tb_01_shift_btn_cls() {
       $(".produce_date_tb_01_shift_txt").text('\u00A0');
   }
    const m1_04_selectBoxElements = document.querySelectorAll(".m1_user_input_table_04");

    function m1_04_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m1_04_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m1_user_input_table_04");
        const selectedElement = selectBox.querySelector(".m1_user_input_table_04_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m1_04_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (a) {
            const targetElement = a.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m1_04_selectOption(targetElement);
            }

            m1_04_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (a) {
        const targetElement = a.target;
        const isSelect = targetElement.classList.contains(".m1_user_input_table_04_select_txt") || targetElement.closest(".m1_user_input_table_04_select_txt");

        if (isSelect) {
            return;
        }

        const m1_04_allSelectBoxElements = document.querySelectorAll(".m1_user_input_table_04");

        m1_04_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    function m1_user_input_table_05_select_click() {
        $("#m1_user_input_table_05_select_txt").text('\u00A0');
    }

    // div select custom
    const m1_05_selectBoxElements = document.querySelectorAll(".m1_user_input_table_05");

    function m1_05_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m1_05_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m1_user_input_table_05");
        const selectedElement = selectBox.querySelector(".m1_user_input_table_05_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m1_05_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (a) {
            const targetElement = a.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m1_05_selectOption(targetElement);
            }

            m1_05_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (a) {
        const targetElement = a.target;
        const isSelect = targetElement.classList.contains(".m1_user_input_table_05_select_txt") || targetElement.closest(".m1_user_input_table_05_select_txt");

        if (isSelect) {
            return;
        }

        const m1_05_allSelectBoxElements = document.querySelectorAll(".m1_user_input_table_05");

        m1_05_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });


    function m1_user_input_table_06_select_click() {
        $("#m1_user_input_table_06_select_txt").text('\u00A0');
    }

    // div select custom
    const m1_06_selectBoxElements = document.querySelectorAll(".m1_user_input_table_06");

    function m1_06_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m1_06_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m1_user_input_table_06");
        const selectedElement = selectBox.querySelector(".m1_user_input_table_06_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m1_06_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (a) {
            const targetElement = a.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m1_06_selectOption(targetElement);
            }

            m1_06_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (a) {
        const targetElement = a.target;
        const isSelect = targetElement.classList.contains(".m1_user_input_table_06_select_txt") || targetElement.closest(".m1_user_input_table_06_select_txt");

        if (isSelect) {
            return;
        }

        const m1_06_allSelectBoxElements = document.querySelectorAll(".m1_user_input_table_06");

        m1_06_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });
    
    // input 비엇는지 체크
    function u_r_t_btn02_check(){
    var idValue = $('#u_input_id').val();
	var nameValue = $('#u_input_name').val();
	var pwValue = $('#u_input_pw').val();
	var processValue = $('#m1_user_input_table_04_select_txt').text();
	var authorValue = $('#m1_user_input_table_05_select_txt').text();
	console.log(processValue);
	if(idValue==""){
		console.log($(".user_input_modal_mid").text());
    	$(".user_input_modal_mid").text("사용자id를 입력해주세요");
	}else if(nameValue==""){
		console.log($(".user_input_modal_mid").text());
    	$(".user_input_modal_mid").text("사용자명을 입력해주세요");
	}else if(pwValue==""){
		console.log($(".user_input_modal_mid").text());
    	$(".user_input_modal_mid").text("비밀번호를 입력해주세요");
	}else if(processValue.indexOf(" ") !== -1){
		console.log($(".user_input_modal_mid").text());
    	$(".user_input_modal_mid").text("주 공정을 입력해주세요");
	}else if(authorValue.indexOf(" ") !== -1){
		console.log($(".user_input_modal_mid").text());
    	$(".user_input_modal_mid").text("권한을 입력해주세요");
	}else {
		$(".user_input_modal_mid").text("사용자가 추가되었습니다.");
	}
    }
    function u_r_t_btn02_click() {
    	
        $('.user_input_modal_window').fadeIn();
        u_r_t_btn02_check();
        userInsert();
        // 사용자 ID, 사용자 명, 비밀번호, 주 공정, 권한중 체크 안된 항목 명시 해주기
        // user_input_modal_mid에 TEXT 변경으로 명시
        u_r_t_btn01_click()
    }

    function u_r_t_btn02_update() {
    	$('.user_input_modal_window').fadeIn();
    	var idValue = $('#u_input_id').val();
    	var nameValue = $('#u_input_name').val();
    	var pwValue = $('#u_input_pw').val();
    	var processValue = $('#m1_user_input_table_04_select_txt').text();
    	var authorValue = $('#m1_user_input_table_05_select_txt').text();
    	console.log(processValue);
    	if(idValue==""){
    		console.log($(".user_input_modal_mid").text());
        	$(".user_input_modal_mid").text("사용자id를 입력해주세요");
    	}else if(nameValue==""){
    		console.log($(".user_input_modal_mid").text());
        	$(".user_input_modal_mid").text("사용자명을 입력해주세요");
    	}else if(pwValue==""){
    		console.log($(".user_input_modal_mid").text());
        	$(".user_input_modal_mid").text("비밀번호를 입력해주세요");
    	}else if(processValue.indexOf(" ") !== -1){
    		console.log($(".user_input_modal_mid").text());
        	$(".user_input_modal_mid").text("주 공정을 입력해주세요");
    	}else if(authorValue.indexOf(" ") !== -1){
    		console.log($(".user_input_modal_mid").text());
        	$(".user_input_modal_mid").text("권한을 입력해주세요");
    	}else {
    		$(".user_input_modal_mid").text("사용자의 정보가 수정되었습니다.");
	    	var MemberVO = {
	    			num : usernum,
	    			company : company,
	    			userid : $("#u_input_id").val(),
	    			username : $("#u_input_name").val(),
	    			userpw : $("#u_input_pw").val(),
	    			mainProcess : $("#m1_user_input_table_04_select_txt").text(),
	    			userRight : $("#m1_user_input_table_05_select_txt").text(),
	    			department : $("#m1_user_input_table_06_select_txt").text(),
	    			contact : $("#u_input_phonenum").val(),
	    			email : $("#u_input_email").val()
	    	};
	    	
	    		$.ajax({
	    			url : "userUpdate.do",
	    			type : "GET",
	    			async:false,
	    			data : MemberVO,
	    			// dataType : "json",
	    			success : function(){
	    				console.log("success");},
	    			error : function(request, status, error){
	    			    console.log("회원수정 error");
	    				}
	    		});
	    		var u_r_t_btn02 = document.getElementsByClassName('u_r_t_btn02');
	    		u_r_t_btn02 = u_r_t_btn02.item(0);
	    		u_r_t_btn02.setAttribute("onClick", "u_r_t_btn02_click()");
    	  	show_user();
    	  	u_r_t_btn01_click()
    	}
    }
    
    
    function user_input_modal_bt() {
        $('.user_input_modal_window').fadeOut();
        
        // user_input_modal_mid에 text가 사용자가 추가되었습니다. 면 DB에 저장
    }

    

    function enterkey() {
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
    		var input= document.getElementById('u_s_input').value;
    		console.log("사용자 관리 엔터");

	        var arr = $('.list_bundle_data').length;
	        for (i=0 ; i<arr ; i++){
	        	$('.list_bundle_data').eq(i+1).css('display','none');
	        }
	        //list_d_2 비교
	        var textArray1 = []
	        for (i=0 ; i<arr ; i++){
	            textArray1.push($('.list_d_2').eq(i).text());
	        }

	        let fromIndex1 = textArray1.indexOf(input);
	        while(fromIndex1 != -1)  {
	            $('.list_d_2').eq(fromIndex1).parent().css('display','flex');
	        fromIndex1 = textArray1.indexOf(input, fromIndex1+1);
	        }

	        //list_d_3 비교
	        var textArray2 = []
	        for (i=0 ; i<arr ; i++){
	            textArray2.push($('.list_d_3').eq(i).text());
	        }

	        let fromIndex2 = textArray2.indexOf(input);
	        while(fromIndex2 != -1)  {
	        	 $('.list_d_3').eq(fromIndex2).parent().css('display','flex');
	            fromIndex2 = textArray2.indexOf(input, fromIndex2+1);
	        }

	        //list_d_4 비교
	        var textArray4 = []
	        for (i=0 ; i<arr ; i++){
	            textArray4.push($('.list_d_4').eq(i).text());
	        }

	        let fromIndex4 = textArray2.indexOf(input);
	        while(fromIndex4 != -1)  {
	        	$('.list_d_4').eq(fromIndex4).parent().css('display','flex');
	            fromIndex4 = textArray4.indexOf(input, fromIndex4+1);
	        }

	        //list_d_5 비교
	        var textArray5 = []
	        for (i=0 ; i<arr ; i++){
	            textArray5.push($('.list_d_5').eq(i).text());
	        }

	        let fromIndex5 = textArray2.indexOf(input);
	        while(fromIndex5 != -1)  {
	        	$('.list_d_5').eq(fromIndex5).parent().css('display','flex');
	            fromIndex5 = textArray5.indexOf(input, fromIndex5+1);
	        }

	        //list_d_6 비교
	        var textArray6 = []
	        for (i=0 ; i<arr ; i++){
	            textArray6.push($('.list_d_6').eq(i).text());
	        }

	        let fromIndex6 = textArray2.indexOf(input);
	        while(fromIndex6 != -1)  {
	        	$('.list_d_6').eq(fromIndex6).parent().css('display','flex');
	            fromIndex6 = textArray6.indexOf(input, fromIndex6+1);
	        }

	        //list_d_7 비교
	        var textArray7 = []
	        for (i=0 ; i<arr ; i++){
	            textArray7.push($('.list_d_7').eq(i).text());
	        }

	        let fromIndex7 = textArray2.indexOf(input);
	        while(fromIndex7 != -1)  {
	        	$('.list_d_7').eq(fromIndex7).parent().css('display','flex');
	            fromIndex7 = textArray7.indexOf(input, fromIndex7+1);
	        }
	    	if(input==""){
		        var arr = $('.list_bundle_data').length;
		        for (i=0 ; i<arr ; i++){
		        	$('.list_bundle_data').eq(i+1).css('display','flex');
		        }
	    	}
    	}
	}
</script>

<!-- 기준정보 -> 설정관리 스크립트 -->
<script>
    // 신규상세코드추가 모달창 ON
    function r_bottom_addrow() {
        $('.m2_r_bot_bottom_modal_window').fadeIn();
        
    }

    //  모달창 내용 추가
    function m2_r_bot_bottom_modal_bot_bt() {
    	$('.m2_r_bot_bottom_modal_window').fadeOut();
        codeInsert();
        codeSelect();
        function codeInsert(){
        	var codeVO = {
    				company : company,
    				cc_class : userid,
    				cc_value : 001,
    				cc_use : 1,
    				cc_name : $("#m2_r_bot_bottom_modal_mid_input01").val(),
    				cc_expln : $("#m2_r_bot_bottom_modal_mid_input02").val()
       		};
        	console.log(userid);
        		$.ajax({
        				url : "codeInsert.do",
        				type : "GET",
        				async:false,
        				data : codeVO,
        				// dataType : "json",
        				success : function(){
        					console.log("코드 입력 success");},
        				error : function(request, status, error){
        				    console.log("코드 입력 error");
        				    console.log("code: " + request.status);
        				    console.log("message: " + request.responseText);
        				    console.log("error: " + error);}
        			});
        			
        	}
    }

    var userid = "";
    // 분류코드 클릭
    $("#m2_l_bot_bottom_table tbody tr").click(function codeDeleteClick() {
  		$('#m2_l_bot_bottom_table tbody tr').css("background-color","");
  		$('#m2_l_bot_bottom_table tbody tr').css("color","black");
  		$(this).css("background-color","#999999");
  		$(this).css("color","white");

        var str = ""
        var tdArr = new Array();

        var tr = $(this);
        var td = tr.children();

        td.each(function (i) {
            tdArr.push(td.eq(i).text());
        });

        var no = td.eq(0).text();
        userid = td.eq(1).text();
        console.log(userid);
		
        codeSelect();

    })
    function codeSelect() {
       	$.ajax({
   	  		url:"codeSelect.do",
   	  		type:"get",
   	  		async: false,
   			data : {"company":company,
   			"className":userid},
   	  		success:codeHtml,
   	  		error:function(data){ 
   	  			let str = JSON.stringify(data);
   	  			console.log(str);
   	  		}
   	  	});
    }
       	function codeHtml(data){
       		var num = 1;
       		var view='<table class="m2_r_bot_bottom_table">';
       	     	view+='<thead>';
       	     	view+='<tr>';
       	     	view+='<td></td>';
       	     	view+='<td>시스템 코드값</td>';
       	     	view+='<td>코드명</td>';
       	     	view+='<td>코드설명</td>';
       	     	view+='<td>삭제</td>';
       	     	view+='</tr>';
       			view+='</thead>';
       			view+='<tbody>';
       	  	$.each(data,function(index, obj){	//반복문
       			view+='<tr>';
       			view+='<td>'+num+'</td>';
       			view+='<td>'+String(num).padStart(4, '0');+'</td>';
       			view+='<td>'+obj.cc_name+'</td>';
       			view+='<td>'+obj.cc_expln+'</td>';
       			view+='<td><button class="m2_r_bot_bottom_table_del_bt" name="ugrDeleteNum" value="'+obj.cc_num+'"><img src="./resources/img/휴지통.png"></button></td>';
       			view+='</tr>';
       			num=num+1;
       		})
       			view+='</tbody>';
       			view+='</table>';
       	  $( '.m2_r_bot_bottom_table' ).html(view);
       	}

       	
        // 신규 상세코드 삭제 버튼
        // 클릭 함수
        $(document).on("click", ".m2_r_bot_bottom_table_del_bt", function(){

            var num = $(this).val();
            console.log(num);
            
            $.ajax({
    			url : "codeDelete.do",
    			type : "GET",
    			async:false,
    			data : {"cc_num":num},
    			// dataType : "json",
    			success : function(){
    				console.log(" 삭제 success");},
    			error : function(request, status, error){
    			    console.log("삭제 error");}
    		});
            codeSelect();
        });
    
</script>

<!--기준정보 -> 공정 관리-->
<script>

function enterkey2() {
	if (window.event.keyCode == 13) {
		console.log("공정 관리 엔터");

		var input= $('.processAdmin_search').val();
		
        var arr = $('.processAdmin_tb_02 tbody tr').length;
        
        for (i=0 ; i<arr ; i++){
        	$('.processAdmin_tb_02 tbody tr').eq(i).css('display','none');
        }
        
        var textArray1 = []
        for (i=0 ; i<arr ; i++){
            textArray1.push($('.processAdmin_tb_02 tbody tr td:nth-child(2)').eq(i).text());
        }

        let fromIndex1 = textArray1.indexOf(input);
        while(fromIndex1 != -1)  {
            $('.processAdmin_tb_02 tbody tr td:nth-child(2)').eq(fromIndex1).parent().css('display','table');
        fromIndex1 = textArray1.indexOf(input, fromIndex1+1);
        }
        
        var textArray2 = []
        for (i=0 ; i<arr ; i++){
            textArray2.push($('.processAdmin_tb_02 tbody tr td:nth-child(3)').eq(i).text());
        }

        let fromIndex2 = textArray2.indexOf(input);
        while(fromIndex2 != -1)  {
            $('.processAdmin_tb_02 tbody tr td:nth-child(3)').eq(fromIndex2).parent().css('display','table');
        fromIndex2 = textArray2.indexOf(input, fromIndex2+1);
        }
        
        var textArray3 = []
        for (i=0 ; i<arr ; i++){
            textArray3.push($('.processAdmin_tb_02 tbody tr td:nth-child(4)').eq(i).text());
        }

        let fromIndex3 = textArray3.indexOf(input);
        while(fromIndex3 != -1)  {
            $('.processAdmin_tb_02 tbody tr td:nth-child(4)').eq(fromIndex3).parent().css('display','table');
        fromIndex3 = textArray3.indexOf(input, fromIndex3+1);
        }

    	if(input==""){
            var arr2 = $('.processAdmin_tb_02 tbody tr').length;
            
            for (i=0 ; i<arr2 ; i++){
            	$('.processAdmin_tb_02 tbody tr').eq(i).css('display','table');
            }
    	}
        
	}
	
	
}
    // 검토자 선택
    function mainbody_05_03_left_bott_tb_table_select_bt02() {
        $('.userModal').fadeIn();
    }
    
    function user_group_input_modal_bt() {
        $('.user_group_input_modal_window').fadeOut();
    }

    function userModalClose() {
        $('.userModal').fadeOut();
    }

    // 승인자 선택 모달창
    function mainbody_05_03_left_bott_tb_table_select_bt03() {
        $('.userModal02').fadeIn();
    }

    function userModal02Close() {
        $('.userModal02').fadeOut();
    }

    // 라우팅 버튼 모달창
    function mainbody_05_btn4_2() {
        $('.routing_modal_window').fadeIn();
    }

    function routing_modal_close() {
        $('.routing_modal_window').fadeOut();
    }


    // 새검사 항목 추가 버튼 모달창
    function mainbody_05_btn5() {
        $('.m5_newtest_window').fadeIn();
    }

    function m5_newtest_window_close() {
        $('.m5_newtest_window').fadeOut();
    }

    // *설 공정관리 상단 저장 모달창


    function process_input_modal_bt() {
        $('.process_input_modal_window').fadeOut();
    }

    
    // *설 공정관리 하단 저장 모달창
    function mainbody_05_btn7() {
        $('.process_02_input_modal_window').fadeIn();

    }

    function process_02_input_modal_bt() {
        $('.process_02_input_modal_window').fadeOut();
    }


    // 공정 관리 -> 공정 구분 div select custom
    const m5_selectBoxElements = document.querySelectorAll(".processAdmin_tb_01_select");

    function m5_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m5_selectOption(optionElement) {
        const selectBox = optionElement.closest(".processAdmin_tb_01_select");
        const selectedElement = selectBox.querySelector(".processAdmin_tb_01_selected_value");
        selectedElement.textContent = optionElement.textContent;
    }

    m5_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (a) {
            const targetElement = a.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m5_selectOption(targetElement);
            }

            m5_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (a) {
        const targetElement = a.target;
        const isSelect = targetElement.classList.contains(".processAdmin_tb_01_selected_value") || targetElement.closest(".processAdmin_tb_01_selected_value");

        if (isSelect) {
            return;
        }

        const m5_allSelectBoxElements = document.querySelectorAll(".processAdmin_tb_01_select");

        m5_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    function processAdmin_tb_01_selected_cls_btn() {
        $("#processAdmin_tb_01_selected_value").text('\u00A0');
    }


    // 공정 관리 -> 주 설비 div select custom
    const m5_02_selectBoxElements = document.querySelectorAll(".m05_processAdmin_tb_01_select");

    function m5_02_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m5_02_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m05_processAdmin_tb_01_select");
        const selectedElement = selectBox.querySelector(".m05_processAdmin_tb_01_selected_value");
        selectedElement.textContent = optionElement.textContent;
    }

    m5_02_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (a) {
            const targetElement = a.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m5_02_selectOption(targetElement);
            }

            m5_02_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (a) {
        const targetElement = a.target;
        const isSelect = targetElement.classList.contains(".m05_processAdmin_tb_01_selected_value") || targetElement.closest(".m05_processAdmin_tb_01_selected_value");

        if (isSelect) {
            return;
        }

        const m5_02_allSelectBoxElements = document.querySelectorAll(".m05_processAdmin_tb_01_select");

        m5_02_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    function m05_processAdmin_tb_01_selected_cls_btn() {
        $("#m05_processAdmin_tb_01_selected_value").text('\u00A0');
    }

    // 공정관리 -> 초기화 버튼
    function mainbody_05_btn1() {
        $(".mainbody_05_01_left_bott_tb_table input[type=text]").val('\u00A0')
        $(".mainbody_05_01_left_bott_tb_table_txt").text('\u00A0');
        $(".mainbody_05_02_left_bott_tb_table_txt").text('\u00A0');
        $(".mainbody_05_03_left_bott_tb_table_select_txt").text('\u00A0');
        $(".mainbody_05_04_left_bott_tb_table_select_txt").text('\u00A0');
        $(".mainbody_05_05_left_bott_tb_table_select_txt").text('\u00A0');
        
    }

    // div select custom

    const mainbody_05_01_selectBoxElements = document.querySelectorAll(".mainbody_05_01_left_bott_tb_table_select");

    function mainbody_05_01_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function mainbody_05_01_selectOption(optionElement) {
    const selectBox = optionElement.closest(".mainbody_05_01_left_bott_tb_table_select");
    const selectedElement = selectBox.querySelector(".mainbody_05_01_left_bott_tb_table_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    mainbody_05_01_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            mainbody_05_01_selectOption(targetElement);
        }

        mainbody_05_01_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".mainbody_05_01_left_bott_tb_table_select") || targetElement.closest(".mainbody_05_01_left_bott_tb_table_txt");

    if (isSelect) {
        return;
    }

    const mainbody_05_01_allSelectBoxElements = document.querySelectorAll(".mainbody_05_01_left_bott_tb_table_select");

    mainbody_05_01_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });

    

    function mainbody_05_01_left_bott_tb_table_btn_cls() {
        $(".mainbody_05_01_left_bott_tb_table_txt").text('\u00A0');
    }


    // div select custom

    const mainbody_05_02_selectBoxElements = document.querySelectorAll(".mainbody_05_02_left_bott_tb_table_select");

    function mainbody_05_02_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function mainbody_05_02_selectOption(optionElement) {
    const selectBox = optionElement.closest(".mainbody_05_02_left_bott_tb_table_select");
    const selectedElement = selectBox.querySelector(".mainbody_05_02_left_bott_tb_table_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    mainbody_05_02_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            mainbody_05_02_selectOption(targetElement);
        }

        mainbody_05_02_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".mainbody_05_02_left_bott_tb_table_select") || targetElement.closest(".mainbody_05_02_left_bott_tb_table_txt");

    if (isSelect) {
        return;
    }

    const mainbody_05_02_allSelectBoxElements = document.querySelectorAll(".mainbody_05_02_left_bott_tb_table_select");

    mainbody_05_02_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });

    

    function mainbody_05_02_left_bott_tb_table_btn_cls() {
        $(".mainbody_05_02_left_bott_tb_table_txt").text('\u00A0');
    }


    // div select custom

    const mainbody_05_03_selectBoxElements = document.querySelectorAll(".mainbody_05_03_left_bott_tb_table_select");

    function mainbody_05_03_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function mainbody_05_03_selectOption(optionElement) {
    const selectBox = optionElement.closest(".mainbody_05_03_left_bott_tb_table_select");
    const selectedElement = selectBox.querySelector(".mainbody_05_03_left_bott_tb_table_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    mainbody_05_03_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            mainbody_05_03_selectOption(targetElement);
        }

        mainbody_05_03_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".mainbody_05_03_left_bott_tb_table_select") || targetElement.closest(".mainbody_05_03_left_bott_tb_table_txt");

    if (isSelect) {
        return;
    }

    const mainbody_05_03_allSelectBoxElements = document.querySelectorAll(".mainbody_05_03_left_bott_tb_table_select");

    mainbody_05_03_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });

    

    function mainbody_05_03_left_bott_tb_table_btn_cls() {
        $(".mainbody_05_03_left_bott_tb_table_txt").text('\u00A0');
    }


    // div select custom

    const m5_newtest01_selectBoxElements = document.querySelectorAll(".m5_newtest_window_main_div.one");

    function m5_newtest01_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m5_newtest01_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m5_newtest_window_main_div.one");
    const selectedElement = selectBox.querySelector(".m5_newtest_window_main_txt.one");
    selectedElement.textContent = optionElement.textContent;
    }

    m5_newtest01_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m5_newtest01_selectOption(targetElement);
        }

        m5_newtest01_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m5_newtest_window_main_div.one") || targetElement.closest(".m5_newtest_window_main_txt.one");

    if (isSelect) {
        return;
    }

    const m5_newtest01_allSelectBoxElements = document.querySelectorAll(".m5_newtest_window_main_div.one");

    m5_newtest01_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });

    

    function m5_newtest_window_main_bnt_cls_one() {
        $(".m5_newtest_window_main_txt.one").text('\u00A0');
    }

    // div select custom

    const m5_newtest02_selectBoxElements = document.querySelectorAll(".m5_newtest_window_main_div.two");

    function m5_newtest02_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m5_newtest02_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m5_newtest_window_main_div.two");
    const selectedElement = selectBox.querySelector(".m5_newtest_window_main_txt.two");
    selectedElement.textContent = optionElement.textContent;
    }

    m5_newtest02_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m5_newtest02_selectOption(targetElement);
        }

        m5_newtest02_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m5_newtest_window_main_div.two") || targetElement.closest(".m5_newtest_window_main_txt.two");

    if (isSelect) {
        return;
    }

    const m5_newtest02_allSelectBoxElements = document.querySelectorAll(".m5_newtest_window_main_div.two");

    m5_newtest02_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });

    function m5_newtest_window_main_bnt_cls_two() {
        $(".m5_newtest_window_main_txt.two").text('\u00A0');
    }

    // div select custom

    const m5_newtest03_selectBoxElements = document.querySelectorAll(".m5_newtest_window_main_div.three");

    function m5_newtest03_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m5_newtest03_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m5_newtest_window_main_div.three");
    const selectedElement = selectBox.querySelector(".m5_newtest_window_main_txt.three");
    selectedElement.textContent = optionElement.textContent;
    }

    m5_newtest03_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m5_newtest03_selectOption(targetElement);
        }

        m5_newtest03_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m5_newtest_window_main_div.three") || targetElement.closest(".m5_newtest_window_main_txt.three");

    if (isSelect) {
        return;
    }

    const m5_newtest03_allSelectBoxElements = document.querySelectorAll(".m5_newtest_window_main_div.three");

    m5_newtest03_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });

    function m5_newtest_window_main_bnt_cls_three() {
        $(".m5_newtest_window_main_txt.three").text('\u00A0');
    }

    // div select custom

    const m5_newtest04_selectBoxElements = document.querySelectorAll(".m5_newtest_window_main_div.four");

    function m5_newtest04_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m5_newtest04_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m5_newtest_window_main_div.four");
    const selectedElement = selectBox.querySelector(".m5_newtest_window_main_txt.four");
    selectedElement.textContent = optionElement.textContent;
    }

    m5_newtest04_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m5_newtest04_selectOption(targetElement);
        }

        m5_newtest04_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m5_newtest_window_main_div.four") || targetElement.closest(".m5_newtest_window_main_txt.four");

    if (isSelect) {
        return;
    }

    const m5_newtest04_allSelectBoxElements = document.querySelectorAll(".m5_newtest_window_main_div.four");

    m5_newtest04_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });

    function m5_newtest_window_main_bnt_cls_four() {
        $(".m5_newtest_window_main_txt.four").text('\u00A0');
    }

        // div select custom

        const m5_newtest05_selectBoxElements = document.querySelectorAll(".m5_newtest_window_main_div.five");

function m5_newtest05_toggleSelectBox(selectBox) {
selectBox.classList.toggle("active");
}

function m5_newtest05_selectOption(optionElement) {
const selectBox = optionElement.closest(".m5_newtest_window_main_div.five");
const selectedElement = selectBox.querySelector(".m5_newtest_window_main_txt.five");
selectedElement.textContent = optionElement.textContent;
}

m5_newtest05_selectBoxElements.forEach(selectBoxElement => {
selectBoxElement.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isOptionElement = targetElement.classList.contains("option");

    if (isOptionElement) {
        console.log("here");
        m5_newtest05_selectOption(targetElement);
    }

    m5_newtest05_toggleSelectBox(selectBoxElement);
});
});

document.addEventListener("click", function (e) {
const targetElement = e.target;
const isSelect = targetElement.classList.contains(".m5_newtest_window_main_div.five") || targetElement.closest(".m5_newtest_window_main_txt.five");

if (isSelect) {
    return;
}

const m5_newtest05_allSelectBoxElements = document.querySelectorAll(".m5_newtest_window_main_div.five");

m5_newtest05_allSelectBoxElements.forEach(boxElement => {
    boxElement.classList.remove("active");
});
});

function m5_newtest_window_main_bnt_cls_five() {
    $(".m5_newtest_window_main_txt.five").text('\u00A0');
}
</script>

<!--기준정보 -> 거래처 관리-->
<script>
	function enterkey3() {
		if (window.event.keyCode == 13) {
			console.log("거래처 관리 엔터");
	
			var input= $('.m06_c_s_input').val();
			
	        var arr = $('.m06_cus_list_table tbody tr').length;
	        
	        for (i=0 ; i<arr ; i++){
	        	$('.m06_cus_list_table tbody tr').eq(i).css('display','none');
	        }
	        
	        var textArray1 = []
	        for (i=0 ; i<arr ; i++){
	            textArray1.push($('.m06_cus_list_table tbody tr td:nth-child(2)').eq(i).text());
	        }
	
	        let fromIndex1 = textArray1.indexOf(input);
	        while(fromIndex1 != -1)  {
	            $('.m06_cus_list_table tbody tr td:nth-child(2)').eq(fromIndex1).parent().css('display','table');
	        fromIndex1 = textArray1.indexOf(input, fromIndex1+1);
	        }
	        
	        var textArray2 = []
	        for (i=0 ; i<arr ; i++){
	            textArray2.push($('.m06_cus_list_table tbody tr td:nth-child(3)').eq(i).text());
	        }
	
	        let fromIndex2 = textArray2.indexOf(input);
	        while(fromIndex2 != -1)  {
	            $('.m06_cus_list_table tbody tr td:nth-child(3)').eq(fromIndex2).parent().css('display','table');
	        fromIndex2 = textArray2.indexOf(input, fromIndex2+1);
	        }
	        
	        var textArray3 = []
	        for (i=0 ; i<arr ; i++){
	            textArray3.push($('.m06_cus_list_table tbody tr td:nth-child(4)').eq(i).text());
	        }
	
	        let fromIndex3 = textArray3.indexOf(input);
	        while(fromIndex3 != -1)  {
	            $('.m06_cus_list_table tbody tr td:nth-child(4)').eq(fromIndex3).parent().css('display','table');
	        fromIndex3 = textArray3.indexOf(input, fromIndex3+1);
	        }
	        
	        var textArray4 = []
	        for (i=0 ; i<arr ; i++){
	            textArray3.push($('.m06_cus_list_table tbody tr td:nth-child(5)').eq(i).text());
	        }
	
	        let fromIndex4 = textArray4.indexOf(input);
	        while(fromIndex4 != -1)  {
	            $('.m06_cus_list_table tbody tr td:nth-child(5)').eq(fromIndex4).parent().css('display','table');
	        fromIndex4 = textArray3.indexOf(input, fromIndex4+1);
	        }
	
	    	if(input==""){
		        var arr2 = $('.m06_cus_list_table tbody tr').length;
		        
		        for (i=0 ; i<arr2 ; i++){
		        	$('.m06_cus_list_table tbody tr').eq(i).css('display','table');
		        }
	    	}
		}
		
		
	}
    // *설 거래처관리 저장 모달창
    function clientInsert() {
        $('.customer_input_modal_window').fadeIn();
        
    }

    function customer_input_modal_bt() {
        $('.customer_input_modal_window').fadeOut();
    }

    // 거래처관리 -> 초기화 버튼
    function mainbody_06_btn1() {
        var input1 = document.getElementById('m06_l_mutual_input');
        var input2 = document.getElementById('m06_l_name_input');
        var input3 = document.getElementById('m06_l_bsnum_input');
        var input4 = document.getElementById('m06_l_person_name_input');
        var input5 = document.getElementById('m06_l_post_input');
        var input6 = document.getElementById('m06_l_bs01_input');
        var input7 = document.getElementById('m06_l_bs02_input');
        var input8 = document.getElementById('m06_l_phone_input');
        var input9 = document.getElementById('m06_l_fax_input');
        var input10 = document.getElementById('m06_l_email_input');
        var input11 = document.getElementById('m06_l_address_input');
        $(".m06_radio").prop('checked', false);

        input1.value = null;
        input2.value = null;
        input3.value = null;
        input4.value = null;
        input5.value = null;
        input6.value = null;
        input7.value = null;
        input8.value = null;
        input9.value = null;
        input10.value = null;
        input11.value = null;

    }
</script>

<!--기준정보 -> 로케이션-->
<script>
    // *설 로케이션 추가 모달창 스크립트
    function mainbody_08_01_r_top_bt_group_01_bt() {
        $('.m08_locationModal').fadeIn();
    }

    function m08_locationClose() {
        $('.m08_locationModal').fadeOut();
    }

    // *설 로케이션 수정 모달창 스크립트
    function mainbody_08_01_r_top_bt_group_02_bt() {
        $('.m08_corr_locationModal').fadeIn();
        locationInputHtml();
        
    }

    function m08_corr_locationClose() {
        $('.m08_corr_locationModal').fadeOut();
    }

    // div select custom

    const m8_newtest01_selectBoxElements = document.querySelectorAll(".m08_location_select");

    function m8_newtest01_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m8_newtest01_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m08_location_select");
    const selectedElement = selectBox.querySelector(".m08_location_select_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    m8_newtest01_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m8_newtest01_selectOption(targetElement);
        }

        m8_newtest01_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m08_location_select") || targetElement.closest(".m08_location_select_txt");

    if (isSelect) {
        return;
    }

    const m8_newtest01_allSelectBoxElements = document.querySelectorAll(".m08_location_select");

    m8_newtest01_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });

    

    function m08_location_select_btn_cls() {
        $(".m08_location_select_txt").text('\u00A0');
    }

    // div select custom

    const m8_newtest02_selectBoxElements = document.querySelectorAll(".m08_corr_location_select");

    function m8_newtest02_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m8_newtest02_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m08_corr_location_select");
    const selectedElement = selectBox.querySelector(".m08_corr_location_select_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    m8_newtest02_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m8_newtest02_selectOption(targetElement);
        }

        m8_newtest02_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m08_corr_location_select") || targetElement.closest(".m08_corr_location_select_txt");

    if (isSelect) {
        return;
    }

    const m8_newtest02_allSelectBoxElements = document.querySelectorAll(".m08_corr_location_select");

    m8_newtest02_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });



function m08_corr_location_select_btn_cls() {
    $(".m08_corr_location_select_txt").text('\u00A0');
}
</script>

<!--기준정보 -> 제품 관리-->
<script>

    // div select custom

    const mainbody_03_01_selectBoxElements = document.querySelectorAll(".m03_product_location_select");

    function mainbody_03_01_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function mainbody_03_01_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m03_product_location_select");
    const selectedElement = selectBox.querySelector(".m03_product_location_select_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    mainbody_03_01_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            mainbody_03_01_selectOption(targetElement);
        }

        mainbody_03_01_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m03_product_location_select") || targetElement.closest(".m03_product_location_select_txt");

    if (isSelect) {
        return;
    }

    const mainbody_03_01_allSelectBoxElements = document.querySelectorAll(".m03_product_location_select");

    mainbody_03_01_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });
    function m03_product_location_select_btn_cls() {
        $(".m03_product_location_select_txt").text('\u00A0');
    }

    // *설 제품관리 저장 모달창
    function productSave() {
        $('.product_input_modal_window').fadeIn();
        goodsInsert();
    }

    function product_input_modal_bt() {
        $('.product_input_modal_window').fadeOut();
    }

    // 기본 로케이션 선택 모달창 스크립트
    function m03_product_locationOpen() {
        $('.m03_product_locationModal').fadeIn();
    }

    function m03_product_locationClose() {
        $('.m03_product_locationModal').fadeOut();
    }



    // 거래처검색 모달창 스크립트

    function customerOpen() {
        $('.customerModal').fadeIn();
    }

    function customerClose() {
        $('.customerModal').fadeOut();
    }

    function product_admin_td_03_select_btn_click() {
        console.log("dd");
        $("#product_admin_td_03_select_txt").empty();
    }

    // div select custom
    const selectBoxElements = document.querySelectorAll(".product_admin_td_02_00");

    function toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function selectOption(optionElement) {
        const selectBox = optionElement.closest(".product_admin_td_02_00");
        const selectedElement = selectBox.querySelector(".product_admin_td_03_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (e) {
            const targetElement = e.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                selectOption(targetElement);
            }

            toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isSelect = targetElement.classList.contains(".product_admin_td_03_select_txt") || targetElement.closest(".product_admin_td_03_select_txt");

        if (isSelect) {
            return;
        }

        const allSelectBoxElements = document.querySelectorAll(".product_admin_td_02_00");

        allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });


    // 제품 관리 -> 단위 select custom
    function m03_product_admin_td04_select_btn_click() {
        console.log("dd");
        $("#m03_product_admin_td04_select_txt").empty();
    }

    const m03_td04_selectBoxElements = document.querySelectorAll(".m03_product_admin_td04_div");

    function m03_td04_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m03_td04_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m03_product_admin_td04_div");
        const selectedElement = selectBox.querySelector(".m03_product_admin_td04_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m03_td04_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (e) {
            const targetElement = e.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m03_td04_selectOption(targetElement);
            }

            m03_td04_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isSelect = targetElement.classList.contains(".m03_product_admin_td04_select_txt") || targetElement.closest(".m03_product_admin_td04_select_txt");

        if (isSelect) {
            return;
        }

        const m03_td04_allSelectBoxElements = document.querySelectorAll(".m03_product_admin_td04_div");

        m03_td04_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    // 제품 관리 -> 제품군 select custom
    function m03_product_admin_td05_select_btn_click() {
        console.log("dd");
        $("#m03_product_admin_td05_select_txt").empty();
    }

    const m03_td05_selectBoxElements = document.querySelectorAll(".m03_product_admin_td05_div");

    function m03_td05_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m03_td05_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m03_product_admin_td05_div");
        const selectedElement = selectBox.querySelector(".m03_product_admin_td05_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m03_td05_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (e) {
            const targetElement = e.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m03_td05_selectOption(targetElement);
            }

            m03_td05_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isSelect = targetElement.classList.contains(".m03_product_admin_td05_select_txt") || targetElement.closest(".m03_product_admin_td05_select_txt");

        if (isSelect) {
            return;
        }

        const m03_td05_allSelectBoxElements = document.querySelectorAll(".m03_product_admin_td05_div");

        m03_td05_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    // 제품 관리 -> 라우팅 select custom
    function m03_product_admin_td06_select_btn_click() {
        console.log("dd");
        $("#m03_product_admin_td06_select_txt").empty();
    }

    const m03_td06_selectBoxElements = document.querySelectorAll(".m03_product_admin_td06_div");

    function m03_td06_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m03_td06_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m03_product_admin_td06_div");
        const selectedElement = selectBox.querySelector(".m03_product_admin_td06_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m03_td06_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (e) {
            const targetElement = e.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m03_td06_selectOption(targetElement);
            }

            m03_td06_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isSelect = targetElement.classList.contains(".m03_product_admin_td06_select_txt") || targetElement.closest(".m03_product_admin_td06_select_txt");

        if (isSelect) {
            return;
        }

        const m03_td06_allSelectBoxElements = document.querySelectorAll(".m03_product_admin_td06_div");

        m03_td06_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    // 제품 관리 -> 대분류 select custom
    function m03_product_admin_td07_select_btn_click() {
        console.log("dd");
        $("#m03_product_admin_td07_select_txt").empty();
    }

    const m03_td07_selectBoxElements = document.querySelectorAll(".m03_product_admin_td07_div");

    function m03_td07_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m03_td07_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m03_product_admin_td07_div");
        const selectedElement = selectBox.querySelector(".m03_product_admin_td07_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m03_td07_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (e) {
            const targetElement = e.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m03_td07_selectOption(targetElement);
            }

            m03_td07_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isSelect = targetElement.classList.contains(".m03_product_admin_td07_select_txt") || targetElement.closest(".m03_product_admin_td07_select_txt");

        if (isSelect) {
            return;
        }

        const m03_td07_allSelectBoxElements = document.querySelectorAll(".m03_product_admin_td07_div");

        m03_td07_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    // 제품 관리 -> 소분류 select custom
    function m03_product_admin_td08_select_btn_click() {
        console.log("dd");
        $("#m03_product_admin_td08_select_txt").empty();
    }

    const m03_td08_selectBoxElements = document.querySelectorAll(".m03_product_admin_td08_div");

    function m03_td08_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m03_td08_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m03_product_admin_td08_div");
        const selectedElement = selectBox.querySelector(".m03_product_admin_td08_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m03_td08_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (e) {
            const targetElement = e.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m03_td08_selectOption(targetElement);
            }

            m03_td08_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isSelect = targetElement.classList.contains(".m03_product_admin_td08_select_txt") || targetElement.closest(".m03_product_admin_td08_select_txt");

        if (isSelect) {
            return;
        }

        const m03_td08_allSelectBoxElements = document.querySelectorAll(".m03_product_admin_td08_div");

        m03_td08_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    // 제품 관리 -> 포장단위 select custom
    function m03_product_admin_td09_select_btn_click() {
        console.log("dd");
        $("#m03_product_admin_td09_select_txt").empty();
    }

    const m03_td09_selectBoxElements = document.querySelectorAll(".m03_product_admin_td09_div");

    function m03_td09_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m03_td09_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m03_product_admin_td09_div");
        const selectedElement = selectBox.querySelector(".m03_product_admin_td09_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m03_td09_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (e) {
            const targetElement = e.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m03_td09_selectOption(targetElement);
            }

            m03_td09_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isSelect = targetElement.classList.contains(".m03_product_admin_td09_select_txt") || targetElement.closest(".m03_product_admin_td09_select_txt");

        if (isSelect) {
            return;
        }

        const m03_td09_allSelectBoxElements = document.querySelectorAll(".m03_product_admin_td09_div");

        m03_td09_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    // 제품관리 -> 초기화 버튼
    function mainbody_03_01_btn1() {
        var input1 = document.getElementById('m3_l_itemnum_input');
        var input2 = document.getElementById('m3_l_itemname_input');
        var input3 = document.getElementById('m3_l_standard_input');
        var input4 = document.getElementById('m3_l_money_input');
        var input5 = document.getElementById('m3_l_packcount_input');
        var input6 = document.getElementById('m3_l_savecount_input');
        $("#product_admin_td_03_select_txt").text('\u00A0');
        $("#m03_product_admin_td04_select_txt").text('\u00A0');
        $("#m03_product_admin_td05_select_txt").text('\u00A0');
        $("#m03_product_admin_td06_select_txt").text('\u00A0');
        $("#m03_product_admin_td07_select_txt").text('\u00A0');
        $("#m03_product_admin_td08_select_txt").text('\u00A0');
        $("#product_admin_td_09_01_select_01").text('\u00A0');
        $("#product_admin_td_09_02_select_01").text('\u00A0');
        $("#m03_product_admin_td09_select_txt").text('\u00A0');
        $("#product_admin_td_13_select_01").text('\u00A0');
        input1.value = null;
        input2.value = null;
        input3.value = null;
        input4.value = null;
        input5.value = null;
        input6.value = null;

    }

    function enterkey4() {
    	if (window.event.keyCode == 13) {
    		console.log("제품 관리 엔터");

    		var input= $('.product_admin_searchInput').val();
    		
            var arr = $('.product_admin_tb_02 tbody tr').length;
            
            for (i=0 ; i<arr ; i++){
            	$('.product_admin_tb_02 tbody tr').eq(i).css('display','none');
            }
            
            var textArray1 = []
            for (i=0 ; i<arr ; i++){
                textArray1.push($('.product_admin_tb_02 tbody tr td:nth-child(2)').eq(i).text());
            }

            let fromIndex1 = textArray1.indexOf(input);
            while(fromIndex1 != -1)  {
                $('.product_admin_tb_02 tbody tr td:nth-child(2)').eq(fromIndex1).parent().css('display','table-row');
            fromIndex1 = textArray1.indexOf(input, fromIndex1+1);
            }
            
            var textArray2 = []
            for (i=0 ; i<arr ; i++){
                textArray2.push($('.product_admin_tb_02 tbody tr td:nth-child(3)').eq(i).text());
            }

            let fromIndex2 = textArray2.indexOf(input);
            while(fromIndex2 != -1)  {
                $('.product_admin_tb_02 tbody tr td:nth-child(3)').eq(fromIndex2).parent().css('display','table-row');
            fromIndex2 = textArray2.indexOf(input, fromIndex2+1);
            }
            
            var textArray3 = []
            for (i=0 ; i<arr ; i++){
                textArray3.push($('.product_admin_tb_02 tbody tr td:nth-child(4)').eq(i).text());
            }

            let fromIndex3 = textArray3.indexOf(input);
            while(fromIndex3 != -1)  {
                $('.product_admin_tb_02 tbody tr td:nth-child(4)').eq(fromIndex3).parent().css('display','table-row');
            fromIndex3 = textArray3.indexOf(input, fromIndex3+1);
            }
            
            var textArray4 = []
            for (i=0 ; i<arr ; i++){
                textArray4.push($('.product_admin_tb_02 tbody tr td:nth-child(5)').eq(i).text());
            }

            let fromIndex4 = textArray4.indexOf(input);
            while(fromIndex4 != -1)  {
                $('.product_admin_tb_02 tbody tr td:nth-child(5)').eq(fromIndex4).parent().css('display','table-row');
            fromIndex4 = textArray4.indexOf(input, fromIndex4+1);
            }
            
	    	if(input==""){
	            var arr2 = $('.product_admin_tb_02 tbody tr').length;
	            
	            for (i=0 ; i<arr2 ; i++){
	            	$('.product_admin_tb_02 tbody tr').eq(i).css('display','table-row');
	            }
	            
	    	}
    	}
    }
</script>

<!--기준정보 -> 자재 관리-->
<script>

function enterkey5() {
	if (window.event.keyCode == 13) {
		console.log("자재 관리 엔터");

		var input= $('.m04_goods_admin_searchInput').val();
		
        var arr = $('.m04_goods_admin_tb_02 tbody tr').length;
        
        for (i=0 ; i<arr ; i++){
        	$('.m04_goods_admin_tb_02 tbody tr').eq(i).css('display','none');
        }
        
        var textArray1 = []
        for (i=0 ; i<arr ; i++){
            textArray1.push($('.m04_goods_admin_tb_02 tbody tr td:nth-child(2)').eq(i).text());
        }

        let fromIndex1 = textArray1.indexOf(input);
        while(fromIndex1 != -1)  {
            $('.m04_goods_admin_tb_02 tbody tr td:nth-child(2)').eq(fromIndex1).parent().css('display','table-row');
        fromIndex1 = textArray1.indexOf(input, fromIndex1+1);
        }
        
        var textArray2 = []
        for (i=0 ; i<arr ; i++){
            textArray2.push($('.m04_goods_admin_tb_02 tbody tr td:nth-child(3)').eq(i).text());
        }

        let fromIndex2 = textArray2.indexOf(input);
        while(fromIndex2 != -1)  {
            $('.m04_goods_admin_tb_02 tbody tr td:nth-child(3)').eq(fromIndex2).parent().css('display','table-row');
        fromIndex2 = textArray2.indexOf(input, fromIndex2+1);
        }
        
        var textArray3 = []
        for (i=0 ; i<arr ; i++){
            textArray3.push($('.m04_goods_admin_tb_02 tbody tr td:nth-child(4)').eq(i).text());
        }

        let fromIndex3 = textArray3.indexOf(input);
        while(fromIndex3 != -1)  {
            $('.m04_goods_admin_tb_02 tbody tr td:nth-child(4)').eq(fromIndex3).parent().css('display','table-row');
        fromIndex3 = textArray3.indexOf(input, fromIndex3+1);
        }
        
        var textArray4 = []
        for (i=0 ; i<arr ; i++){
            textArray4.push($('.m04_goods_admin_tb_02 tbody tr td:nth-child(5)').eq(i).text());
        }

        let fromIndex4 = textArray4.indexOf(input);
        while(fromIndex4 != -1)  {
            $('.m04_goods_admin_tb_02 tbody tr td:nth-child(5)').eq(fromIndex4).parent().css('display','table-row');
        fromIndex4 = textArray4.indexOf(input, fromIndex4+1);
        }
    	if(input==""){
            var arr2 = $('.m04_goods_admin_tb_02 tbody tr').length;
            
            for (i=0 ; i<arr2 ; i++){
            	$('.m04_goods_admin_tb_02 tbody tr').eq(i).css('display','table-row');
            }
    	}
	}
}

    
    // div select custom

    const mainbody_04_01_selectBoxElements = document.querySelectorAll(".m04_goods_location_select");

    function mainbody_04_01_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function mainbody_04_01_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m04_goods_location_select");
    const selectedElement = selectBox.querySelector(".m04_goods_location_select_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    mainbody_04_01_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            mainbody_04_01_selectOption(targetElement);
        }

        mainbody_04_01_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m04_goods_location_select") || targetElement.closest(".m04_goods_location_select_txt");

    if (isSelect) {
        return;
    }

    const mainbody_04_01_allSelectBoxElements = document.querySelectorAll(".m04_goods_location_select");

    mainbody_04_01_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });

    

    function m04_goods_location_select_btn_cls() {
        $(".m04_goods_location_select_txt").text('\u00A0');
    }

     // *설 자재관리 저장 모달창 삭제


    function goods_input_modal_bt() {
        $('.goods_input_modal_window').fadeOut();
    }

    // 기본 로케이션 선택 모달창 스크립트
    function m04_goods_locationOpen() {
        $('.m04_goods_locationModal').fadeIn();
    }

    function m04_goods_locationClose() {
        $('.m04_goods_locationModal').fadeOut();
    }


    // *설 거래처 검색 모달창 스크립트
    function m04_goods_customerOpen() {
        $('.goods_customer_num_Modal').fadeIn();
    }

    function goods_customer_num_Close() {
        $('.goods_customer_num_Modal').fadeOut();
    }

    /* 자재 관리 -> 품목단위 select div 커스텀*/
    function m04_goods_admin_td_03_select_btn_click() {
        console.log("dd");
        $("#m04_goods_admin_td_03_select_txt").empty();
    }

    // div select custom
    const selectBoxElements_m4 = document.querySelectorAll(".m04_goods_admin_td_02_00");

    function toggleSelectBox_m4(selectBox) {
        selectBox.classList.toggle("active");
    }

    function selectOption_m4(optionElement) {
        const selectBox = optionElement.closest(".m04_goods_admin_td_02_00");
        const selectedElement = selectBox.querySelector(".m04_goods_admin_td_03_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    selectBoxElements_m4.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (g) {
            const targetElement = g.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                selectOption_m4(targetElement);
            }

            toggleSelectBox_m4(selectBoxElement);
        });
    });

    document.addEventListener("click", function (g) {
        const targetElement = g.target;
        const isSelect = targetElement.classList.contains("m04_goods_admin_td_03_select_txt") || targetElement.closest(".m04_goods_admin_td_03_select_txt");

        if (isSelect) {
            return;
        }

        const allSelectBoxElements_m4 = document.querySelectorAll(".m04_goods_admin_td_02_00");

        allSelectBoxElements_m4.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    /* 자재 관리 -> 단위 select div 커스텀*/
    function m04_goods_admin_td04_03_select_btn_click() {
        console.log("dd");
        $("#m04_goods_admin_td04_03_select_txt").empty();
    }

    // div select custom
    const m04_td04_selectBoxElements = document.querySelectorAll(".m04_goods_admin_td04_02_00");

    function m04_td04_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m04_td04_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m04_goods_admin_td04_02_00");
        const selectedElement = selectBox.querySelector(".m04_goods_admin_td04_03_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m04_td04_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (g) {
            const targetElement = g.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m04_td04_selectOption(targetElement);
            }

            m04_td04_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (g) {
        const targetElement = g.target;
        const isSelect = targetElement.classList.contains("m04_goods_admin_td04_03_select_txt") || targetElement.closest(".m04_goods_admin_td04_03_select_txt");

        if (isSelect) {
            return;
        }

        const m04_td04_allSelectBoxElements = document.querySelectorAll(".m04_goods_admin_td04_02_00");

        m04_td04_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    /* 자재 관리 -> 제품군 select div 커스텀*/
    function m04_goods_admin_td05_03_select_btn_click() {
        console.log("dd");
        $("#m04_goods_admin_td05_03_select_txt").empty();
    }

    // div select custom
    const m04_td05_selectBoxElements = document.querySelectorAll(".m04_goods_admin_td05_02_00");

    function m04_td05_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m04_td05_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m04_goods_admin_td05_02_00");
        const selectedElement = selectBox.querySelector(".m04_goods_admin_td05_03_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m04_td05_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (g) {
            const targetElement = g.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m04_td05_selectOption(targetElement);
            }

            m04_td05_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (g) {
        const targetElement = g.target;
        const isSelect = targetElement.classList.contains("m04_goods_admin_td05_03_select_txt") || targetElement.closest(".m04_goods_admin_td05_03_select_txt");

        if (isSelect) {
            return;
        }

        const m04_td05_allSelectBoxElements = document.querySelectorAll(".m04_goods_admin_td05_02_00");

        m04_td05_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    /* 자재 관리 -> 라우팅 select div 커스텀*/
    function m04_goods_admin_td06_03_select_btn_click() {
        console.log("dd");
        $("#m04_goods_admin_td06_03_select_txt").empty();
    }

    // div select custom
    const m04_td06_selectBoxElements = document.querySelectorAll(".m04_goods_admin_td06_02_00");

    function m04_td06_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m04_td06_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m04_goods_admin_td06_02_00");
        const selectedElement = selectBox.querySelector(".m04_goods_admin_td06_03_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m04_td06_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (g) {
            const targetElement = g.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m04_td06_selectOption(targetElement);
            }

            m04_td06_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (g) {
        const targetElement = g.target;
        const isSelect = targetElement.classList.contains("m04_goods_admin_td06_03_select_txt") || targetElement.closest(".m04_goods_admin_td06_03_select_txt");

        if (isSelect) {
            return;
        }

        const m04_td06_allSelectBoxElements = document.querySelectorAll(".m04_goods_admin_td06_02_00");

        m04_td06_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    /* 자재 관리 -> 대분류 select div 커스텀*/
    function m04_goods_admin_td07_03_select_btn_click() {
        console.log("dd");
        $("#m04_goods_admin_td07_03_select_txt").empty();
    }

    // div select custom
    const m04_td07_selectBoxElements = document.querySelectorAll(".m04_goods_admin_td07_02_00");

    function m04_td07_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m04_td07_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m04_goods_admin_td07_02_00");
        const selectedElement = selectBox.querySelector(".m04_goods_admin_td07_03_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m04_td07_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (g) {
            const targetElement = g.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m04_td07_selectOption(targetElement);
            }

            m04_td07_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (g) {
        const targetElement = g.target;
        const isSelect = targetElement.classList.contains("m04_goods_admin_td07_03_select_txt") || targetElement.closest(".m04_goods_admin_td07_03_select_txt");

        if (isSelect) {
            return;
        }

        const m04_td07_allSelectBoxElements = document.querySelectorAll(".m04_goods_admin_td07_02_00");

        m04_td07_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    /* 자재 관리 -> 소분류 select div 커스텀*/
    function m04_goods_admin_td08_03_select_btn_click() {
        console.log("dd");
        $("#m04_goods_admin_td08_03_select_txt").empty();
    }

    // div select custom
    const m04_td08_selectBoxElements = document.querySelectorAll(".m04_goods_admin_td08_02_00");

    function m04_td08_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m04_td08_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m04_goods_admin_td08_02_00");
        const selectedElement = selectBox.querySelector(".m04_goods_admin_td08_03_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m04_td08_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (g) {
            const targetElement = g.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m04_td08_selectOption(targetElement);
            }

            m04_td08_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (g) {
        const targetElement = g.target;
        const isSelect = targetElement.classList.contains("m04_goods_admin_td08_03_select_txt") || targetElement.closest(".m04_goods_admin_td08_03_select_txt");

        if (isSelect) {
            return;
        }

        const m04_td08_allSelectBoxElements = document.querySelectorAll(".m04_goods_admin_td08_02_00");

        m04_td08_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    /* 자재 관리 -> 포장단위 select div 커스텀*/
    function m04_goods_admin_td09_03_select_btn_click() {
        console.log("dd");
        $("#m04_goods_admin_td09_03_select_txt").empty();
    }

    // div select custom
    const m04_td09_selectBoxElements = document.querySelectorAll(".m04_goods_admin_td09_02_00");

    function m04_td09_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m04_td09_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m04_goods_admin_td09_02_00");
        const selectedElement = selectBox.querySelector(".m04_goods_admin_td09_03_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m04_td09_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (g) {
            const targetElement = g.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m04_td09_selectOption(targetElement);
            }

            m04_td09_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (g) {
        const targetElement = g.target;
        const isSelect = targetElement.classList.contains("m04_goods_admin_td09_03_select_txt") || targetElement.closest(".m04_goods_admin_td09_03_select_txt");

        if (isSelect) {
            return;
        }

        const m04_td09_allSelectBoxElements = document.querySelectorAll(".m04_goods_admin_td09_02_00");

        m04_td09_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });


    //자재관리 초기화 버튼
    function mainbody_04_01_btn1() {
        var input1 = document.getElementById('m4_l_itemnum_input');
        var input2 = document.getElementById('m4_l_itemname_input');
        var input3 = document.getElementById('m4_l_standard_input');
        var input4 = document.getElementById('m4_l_money_input');
        var input5 = document.getElementById('m4_l_packcount_input');
        var input6 = document.getElementById('m4_l_savecount_input');
        $("#m04_goods_admin_td_03_select_txt").text('\u00A0');
        $("#m04_goods_admin_td04_03_select_txt").text('\u00A0');
        $("#m04_goods_admin_td05_03_select_txt").text('\u00A0');
        $("#m04_goods_admin_td06_03_select_txt").text('\u00A0');
        $("#m04_goods_admin_td07_03_select_txt").text('\u00A0');
        $("#m04_goods_admin_td08_03_select_txt").text('\u00A0');
        $(".product_admin_td_09_01_select_01").text('\u00A0');
        $(".product_admin_td_09_02_select_01").text('\u00A0');
        $("#m04_goods_admin_td09_03_select_txt").text('\u00A0');
        $(".product_admin_td_13_select_01").text('\u00A0');
        input1.value = null;
        input2.value = null;
        input3.value = null;
        input4.value = null;
        input5.value = null;
        input6.value = null;
    }

</script>

<!--기준정보 -> BOM 관리-->
<script>

function enterkey6() {
	if (window.event.keyCode == 13) {
		console.log("BOM 관리 엔터");

		var input= $('.m07_b_s_input').val();
		
        var arr = $('.m07_bom_list_table tbody tr').length;
        
        for (i=0 ; i<arr ; i++){
        	$('.m07_bom_list_table tbody tr').eq(i).css('display','none');
        }
        
        var textArray1 = []
        for (i=0 ; i<arr ; i++){
            textArray1.push($('.m07_bom_list_table tbody tr td:nth-child(1)').eq(i).text());
        }

        let fromIndex1 = textArray1.indexOf(input);
        while(fromIndex1 != -1)  {
            $('.m07_bom_list_table tbody tr td:nth-child(1)').eq(fromIndex1).parent().css('display','table-row');
        fromIndex1 = textArray1.indexOf(input, fromIndex1+1);
        }
        
        var textArray2 = []
        for (i=0 ; i<arr ; i++){
            textArray2.push($('.m07_bom_list_table tbody tr td:nth-child(2)').eq(i).text());
        }

        let fromIndex2 = textArray2.indexOf(input);
        while(fromIndex2 != -1)  {
            $('.m07_bom_list_table tbody tr td:nth-child(2)').eq(fromIndex2).parent().css('display','table-row');
        fromIndex2 = textArray2.indexOf(input, fromIndex2+1);
        }
        
        var textArray3 = []
        for (i=0 ; i<arr ; i++){
            textArray3.push($('.m07_bom_list_table tbody tr td:nth-child(3)').eq(i).text());
        }

        let fromIndex3 = textArray3.indexOf(input);
        while(fromIndex3 != -1)  {
            $('.m07_bom_list_table tbody tr td:nth-child(3)').eq(fromIndex3).parent().css('display','table-row');
        fromIndex3 = textArray3.indexOf(input, fromIndex3+1);
        }
        
        var textArray4 = []
        for (i=0 ; i<arr ; i++){
            textArray4.push($('.m07_bom_list_table tbody tr td:nth-child(4)').eq(i).text());
        }

        let fromIndex4 = textArray4.indexOf(input);
        while(fromIndex4 != -1)  {
            $('.m07_bom_list_table tbody tr td:nth-child(4)').eq(fromIndex4).parent().css('display','table-row');
        fromIndex4 = textArray4.indexOf(input, fromIndex4+1);
        }
        
    	if(input==""){
            var arr = $('.m07_bom_list_table tbody tr').length;
            
            for (i=0 ; i<arr ; i++){
            	$('.m07_bom_list_table tbody tr').eq(i).css('display','table-row');
            }
    	}
	}
}
    // 부품 메인 구성 클릭 재미용
    $(".m07_le_bom_list_tbody tr.main td:nth-child(1)").click(function () {
        var tr = $(this).attr('class');

        if (tr.includes('main')) {
            $(".m07_cate_name_10.mid").css('display', 'revert');
        }
    })

    // 부품 미드 구성 클릭 재미용
    $(".m07_le_bom_list_tbody tr.mid td:nth-child(1)").click(function () {
        var tr = $(this).attr('class');

        if (tr.includes('mid')) {
            $(".m07_cate_name_10.sub").css('display', 'revert');
        }
    })

    // .bom 부품 추가 모달창 스크립트
    function m07_bom_list_tbody_btn_02_02() {
        $('.m07_bom_locationModal').fadeIn();
    }

    function m07_bom_locationClose() {
        $('.m07_bom_locationModal').fadeOut();
    }
    

</script>
<!-- *1002 주문관리 -->

<script>
    // 주문관리 -> 주문관리

    // *거래처 검색 모달창 스크립트
    function m51_customerOpen() {
        $('.m51_Order_customer_num_Modal').fadeIn();
    }

    function m51_Order_customer_num_Close() {
        $('.m51_Order_customer_num_Modal').fadeOut();
    }

    // 주문관리 > 주문관리 : 품목추가 모달창 스크립트

    function mainbody_51_2_bottom_btn_2_02() {
        $('.m51_product_choice_Modal').fadeIn();
    }
    
    function m51_product_choice_Close() {
        $('.m51_product_choice_Modal').fadeOut();
    }
</script>


<!-- 생산관리  -->
<script>
        // div select custom
        const selectBoxElements_m13_03 = document.querySelectorAll(".process_order_tb_01_td_div");

    function toggleSelectBox_m13_03(selectBox) {
        selectBox.classList.toggle("active");
    }

    function selectOption_m13_03(optionElement) {
        const selectBox = optionElement.closest(".process_order_tb_01_td_div");
        const selectedElement = selectBox.querySelector(".process_order_tb_01_td_div_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    selectBoxElements_m13_03.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (g) {
            const targetElement = g.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                selectOption_m13_03(targetElement);
            }

            toggleSelectBox_m13_03(selectBoxElement);
        });
    });

    document.addEventListener("click", function (g) {
        const targetElement = g.target;
        const isSelect = targetElement.classList.contains("process_order_tb_01_td_div") || targetElement.closest(".process_order_tb_01_td_div_txt");

        if (isSelect) {
            return;
        }

        const allSelectBoxElements_m13_03 = document.querySelectorAll(".process_order_tb_01_td_div");

        allSelectBoxElements_m13_03.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    // div select custom
    const selectBoxElements_m13_03_01 = document.querySelectorAll(".process_order_tb_03_div01");

    function toggleSelectBox_m13_03_01(selectBox) {
        selectBox.classList.toggle("active");
    }

    function selectOption_m13_03_01(optionElement) {
        const selectBox = optionElement.closest(".process_order_tb_03_div01");
        const selectedElement = selectBox.querySelector(".process_order_tb_03_div01_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    selectBoxElements_m13_03_01.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (g) {
            const targetElement = g.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                selectOption_m13_03_01(targetElement);
            }

            toggleSelectBox_m13_03_01(selectBoxElement);
        });
    });

    document.addEventListener("click", function (g) {
        const targetElement = g.target;
        const isSelect = targetElement.classList.contains("process_order_tb_03_div01") || targetElement.closest(".process_order_tb_03_div01_txt");

        if (isSelect) {
            return;
        }

        const allSelectBoxElements_m13_03_01 = document.querySelectorAll(".process_order_tb_03_div01");

        allSelectBoxElements_m13_03_01.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });


        // div select custom
        const selectBoxElements_m13_03_02 = document.querySelectorAll(".process_order_tb_03_div02");

function toggleSelectBox_m13_03_02(selectBox) {
    selectBox.classList.toggle("active");
}

function selectOption_m13_03_02(optionElement) {
    const selectBox = optionElement.closest(".process_order_tb_03_div02");
    const selectedElement = selectBox.querySelector(".process_order_tb_03_div02_txt");
    selectedElement.textContent = optionElement.textContent;
}

selectBoxElements_m13_03_02.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (g) {
        const targetElement = g.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            selectOption_m13_03_02(targetElement);
        }

        toggleSelectBox_m13_03_02(selectBoxElement);
    });
});

document.addEventListener("click", function (g) {
    const targetElement = g.target;
    const isSelect = targetElement.classList.contains("process_order_tb_03_div02") || targetElement.closest(".process_order_tb_03_div02_txt");

    if (isSelect) {
        return;
    }

    const allSelectBoxElements_m13_03_02 = document.querySelectorAll(".process_order_tb_03_div02");

    allSelectBoxElements_m13_03_02.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
});


    // div select custom
    const selectBoxElements_m13_03_03 = document.querySelectorAll(".process_order_tb_03_div03");

    function toggleSelectBox_m13_03_03(selectBox) {
        selectBox.classList.toggle("active");
    }

    function selectOption_m13_03_03(optionElement) {
        const selectBox = optionElement.closest(".process_order_tb_03_div03");
        const selectedElement = selectBox.querySelector(".process_order_tb_03_div03_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    selectBoxElements_m13_03_03.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (g) {
            const targetElement = g.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                selectOption_m13_03_03(targetElement);
            }

            toggleSelectBox_m13_03_03(selectBoxElement);
        });
    });

    document.addEventListener("click", function (g) {
        const targetElement = g.target;
        const isSelect = targetElement.classList.contains("process_order_tb_03_div03") || targetElement.closest(".process_order_tb_03_div03_txt");

        if (isSelect) {
            return;
        }

        const allSelectBoxElements_m13_03_03 = document.querySelectorAll(".process_order_tb_03_div03");

        allSelectBoxElements_m13_03_03.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });



    // 1003 작업지시 누르면 tr 색 변경
    $(".work_order_tb_02 tbody tr").click(function codeDeleteClick() {
  		$('.work_order_tb_02 tbody tr').css("background-color","");
  		$('.work_order_tb_02 tbody tr').css("color","black");
  		$(this).css("background-color","#999999");
  		$(this).css("color","white");
    })
    $(document).on("dblclick", ".work_order_tb_02 tbody tr", function(){
        $('.m11_produc_plus_Modal').fadeIn();
    
    })
    
        function mainbody_11_03_top_l_01_btn(){
        for(i=0; i<$(".work_order_tb_02 tbody tr").length; i++){
            var num = i+1
            if($('.work_order_tb_02 tbody tr:nth-child('+num+')').css("background-color") == "rgb(153, 153, 153)"){
                console.log(num);
                $('.work_order_tb_02 tbody tr:nth-child('+num+')').prev().before($('.work_order_tb_02 tbody tr:nth-child('+num+')'));

                break;
            }
        }

    }

    function mainbody_11_03_top_l_02_btn(){
        for(i=0; i<$(".work_order_tb_02 tbody tr").length; i++){
            var num = i+1
            if($('.work_order_tb_02 tbody tr:nth-child('+num+')').css("background-color") == "rgb(153, 153, 153)"){
                console.log(num);
                console.log($('.work_order_tb_02 tbody tr:nth-child('+num+')').next());
                $('.work_order_tb_02 tbody tr:nth-child('+num+')').next().after($('.work_order_tb_02 tbody tr:nth-child('+num+')'));

                break;
            }
        }

    }

    
    $(document).ready(()=>{
    calendarInit()
  });
  function calendarInit() {
  
    $('.year-month').text("몇월?")
    
      // 날짜 정보 가져오기
      var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
      var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
      var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
      var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
    
      var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
      // 달력에서 표기하는 날짜 객체
    
      
      var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
      var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
      var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일
  
      // kst 기준 현재시간
      // console.log(thisMonth);
  
      // 캘린더 렌더링
      renderCalender(thisMonth);
  
      function renderCalender(thisMonth) {
  
          // 렌더링을 위한 데이터 정리
          currentYear = thisMonth.getFullYear();
          currentMonth = thisMonth.getMonth();
          currentDate = thisMonth.getDate();
  
          // 이전 달의 마지막 날 날짜와 요일 구하기
          var startDay = new Date(currentYear, currentMonth, 0);
          var prevDate = startDay.getDate();
          var prevDay = startDay.getDay();
  
          // 이번 달의 마지막날 날짜와 요일 구하기
          var endDay = new Date(currentYear, currentMonth + 1, 0);
          var nextDate = endDay.getDate();
          var nextDay = endDay.getDay();
  
          // console.log(prevDate, prevDay, nextDate, nextDay);
  
          // 현재 월 표기
          $('.year-month').text(currentYear + '.' + (currentMonth + 1));
  
          // 렌더링 html 요소 생성
          calendar = document.querySelector('.dates')
          calendar.innerHTML = '';
          
          // 지난달
          for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
              calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
          }
          // 이번달
          for (var i = 1; i <= nextDate; i++) {
              calendar.innerHTML = calendar.innerHTML + '<div class="day current" id="' +(currentYear + '.' + (currentMonth + 1)+'.'+i) + '">' + i + '</div>'
          }
          // 다음달
          for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
              calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
          }
  
          // 오늘 날짜 표기
          if (today.getMonth() == currentMonth) {
              todayDate = today.getDate();
              var currentMonthDate = document.querySelectorAll('.dates .current');
              currentMonthDate[todayDate -1].classList.add('today');
          }
      }
  
      // 이전달로 이동
      $('.go-prev').on('click', function() {
          thisMonth = new Date(currentYear, currentMonth - 1, 1);
          renderCalender(thisMonth);
      });
  
      // 다음달로 이동
      $('.go-next').on('click', function() {
          thisMonth = new Date(currentYear, currentMonth + 1, 1);
          renderCalender(thisMonth); 
      });
  }

     $("#file").on('change',function(){
     var fileName = $("#file").val();
     $(".upload-name").val(fileName);
   });
 
    // *1002 생산관리 -> 생산계획 -> 제품명 선택 모달창//
    function produce_plan_tb_01_div_01_btn() {
        $('.m12_plan_productModal').fadeIn();
    }

    function m12_plan_productModalClose() {
        $('.m12_plan_productModal').fadeOut();
    }

    // *1002 생산관리 > 작업지시 > 생산품목추가 모달창 스크립트
    function mainbody_11_03_top_btn_04() {
        $('.m11_produc_plus_Modal').fadeIn();
    }

    function m11_produc_plus_Close() {
        $('.m11_produc_plus_Modal').fadeOut();
    }

    // *1002 생산관리 -> 작업 지시 -> 작업지시 생성 모달창//
    function openCloseToc() {
        $('.m11_workOrder_modal_window').fadeIn();
    }
    
    $("input[name='m11_workOrder']:radio").change(function () {
        var serviceType = this.value; //라디오 버튼 값
        if(serviceType == "m11_workOrder01"){
            $(".m11_workOrder_modal_body01").css('display', 'none');
            $(".m11_workOrder_modal_body02").css('display', 'flex');
            
        }else if(serviceType == "m11_workOrder02"){
            $(".m11_workOrder_modal_body01").css('display', 'flex');
            $(".m11_workOrder_modal_body02").css('display', 'none');
        }
    });


    function m11_workOrder_modal_close() {
        $('.m11_workOrder_modal_window').fadeOut();
    }


    // *1002 생산관리 -> 생산일보 -> 공정 선택 모달창//
    function process_search_Open() {
        $('.m12_productModal').fadeIn();
    }

    function m12_productModalClose() {
        $('.m12_productModal').fadeOut();
    }

   // *1002 생산관리 -> 생산일보 -> 설비 선택 모달창//
   function processModal_btn_02() {
        $('.m12_equipModal').fadeIn();
    }

    function m12_equipModalClose() {
        $('.m12_equipModal').fadeOut();
    }

  // 생산관리 > 생산일보 > 작업추가 모달창 스크립트
    function worker_search_ModalOpen() {
        $('.m13_work_plus_Modal').fadeIn();
    }

    function m13_work_plus_Close() {
        $('.m13_work_plus_Modal').fadeOut();
    }

    // 생산관리 > 생산일보 > 품목 추가 모달창 스크립트
    function mainbody_13_02_top_01_01() {
        $('.m13_product_plus_Modal').fadeIn();
    }

    function m13_product_plus_Close() {
        $('.m13_product_plus_Modal').fadeOut();
    }

    //생산관리 > 생산일보 > 작업 지시 추가 모달창 스크립트
    function mainbody_13_02_top_02_01() {
        $('.m13_work_order_plus_Modal').fadeIn();
    }

    function m13_work_order_plus_Close() {
        $('.m13_work_order_plus_Modal').fadeOut();
    }

    //생산관리 > 생산일보 > 투입자재 및 반제품 저장
     $('.process_order_tb_01 tbody tr td:nth-child(2)').click(function () {
    	 if($(this)!=" "){
        	$(".mainbody_13_03_left").css("display", "flex");
    	 }
    })
    function work_order_btn_08() {
        $('.m13_work_order_btn_08_modal_window').fadeIn();
    }

    function m13_work_order_btn_08_modal_bt() {
        $('.m13_work_order_btn_08_modal_window').fadeOut();
        $('.mainbody_13_03_left').css("display", "none");
    }

 // 1002 작업지시 -> 생산품목 포달창 div select 커스텀

    // div01 select custom 

    const m11_proplus01_selectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div01");

    function m11_proplus01_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m11_proplus01_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m11_produc_plus_content_01_table_div01");
    const selectedElement = selectBox.querySelector(".m11_produc_plus_content_01_table_div01_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    m11_proplus01_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m11_proplus01_selectOption(targetElement);
        }

        m11_proplus01_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m11_produc_plus_content_01_table_div01") || targetElement.closest(".m11_produc_plus_content_01_table_div01_txt");

    if (isSelect) {
        return;
    }

    const m11_proplus01_allSelectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div01");

    m11_proplus01_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });



    function m11_produc_plus_content_01_table_div01_btn() {
        $(".m11_produc_plus_content_01_table_div01_txt").text('\u00A0');
    }

    
    // div select custom

    const m11_proplus02_selectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div02");

    function m11_proplus02_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m11_proplus02_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m11_produc_plus_content_01_table_div02");
    const selectedElement = selectBox.querySelector(".m11_produc_plus_content_01_table_div02_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    m11_proplus02_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m11_proplus02_selectOption(targetElement);
        }

        m11_proplus02_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m11_produc_plus_content_01_table_div02") || targetElement.closest(".m11_produc_plus_content_01_table_div02_txt");

    if (isSelect) {
        return;
    }

    const m11_proplus02_allSelectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div02");

    m11_proplus02_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });



    function m11_produc_plus_content_01_table_div02_btn() {
        $(".m11_produc_plus_content_01_table_div02_txt").text('\u00A0');
    }

    
    // div select custom

    const m11_proplus03_selectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div03");

    function m11_proplus03_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m11_proplus03_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m11_produc_plus_content_01_table_div03");
    const selectedElement = selectBox.querySelector(".m11_produc_plus_content_01_table_div03_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    m11_proplus03_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m11_proplus03_selectOption(targetElement);
        }

        m11_proplus03_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m11_produc_plus_content_01_table_div03") || targetElement.closest(".m11_produc_plus_content_01_table_div03_txt");

    if (isSelect) {
        return;
    }

    const m11_proplus03_allSelectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div03");

    m11_proplus03_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });



    function m11_produc_plus_content_01_table_div03_btn() {
        $(".m11_produc_plus_content_01_table_div03_txt").text('\u00A0');
    }

    
    // div select custom

    const m11_proplus04_selectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div04");

    function m11_proplus04_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m11_proplus04_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m11_produc_plus_content_01_table_div04");
    const selectedElement = selectBox.querySelector(".m11_produc_plus_content_01_table_div04_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    m11_proplus04_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m11_proplus04_selectOption(targetElement);
        }

        m11_proplus04_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m11_produc_plus_content_01_table_div04") || targetElement.closest(".m11_produc_plus_content_01_table_div04_txt");

    if (isSelect) {
        return;
    }

    const m11_proplus04_allSelectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div04");

    m11_proplus04_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });



    function m11_produc_plus_content_01_table_div04_btn() {
        $(".m11_produc_plus_content_01_table_div04_txt").text('\u00A0');
    }

    
    // div select custom

    const m11_proplus05_selectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div05");

    function m11_proplus05_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m11_proplus05_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m11_produc_plus_content_01_table_div05");
    const selectedElement = selectBox.querySelector(".m11_produc_plus_content_01_table_div05_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    m11_proplus05_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m11_proplus05_selectOption(targetElement);
        }

        m11_proplus05_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m11_produc_plus_content_01_table_div05") || targetElement.closest(".m11_produc_plus_content_01_table_div05_txt");

    if (isSelect) {
        return;
    }

    const m11_proplus05_allSelectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div05");

    m11_proplus05_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });



    function m11_produc_plus_content_01_table_div05_btn() {
        $(".m11_produc_plus_content_01_table_div05_txt").text('\u00A0');
    }

    
    // div select custom

    const m11_proplus06_selectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div06");

    function m11_proplus06_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function m11_proplus06_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m11_produc_plus_content_01_table_div06");
    const selectedElement = selectBox.querySelector(".m11_produc_plus_content_01_table_div06_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    m11_proplus06_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            m11_proplus06_selectOption(targetElement);
        }

        m11_proplus06_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m11_produc_plus_content_01_table_div06") || targetElement.closest(".m11_produc_plus_content_01_table_div06_txt");

    if (isSelect) {
        return;
    }

    const m11_proplus06_allSelectBoxElements = document.querySelectorAll(".m11_produc_plus_content_01_table_div06");

    m11_proplus06_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });



    function m11_produc_plus_content_01_table_div06_btn() {
        $(".m11_produc_plus_content_01_table_div06_txt").text('\u00A0');
    }


   
  </script>
    <!-- *1004 자재관리 -->
<script>


    $(document).on('click', '.m23_goods_localtion_tb tbody tr', function(e){ 
        console.log($(this).children().eq(0));
        $('.m23_goods_locationModal').fadeOut();
        $(".mainbody_23_bot_02").text($(this).children().eq(0).text()).val();

    });

    // 자재관리 > 자재발주 : 업체명 선택 모달창
   function m21_customerOpen() {
       $('.m21_customerModal').fadeIn();
   }
   
   function m21_customerClose() {
       $('.m21_customerModal').fadeOut();
   }

   // 자재관리 > 자재발주 : 품목 추가 선택 모달창
   function m21_product_choice_Open() {
       $('.m21_product_choice_Modal').fadeIn();
   }
   
   function m21_product_choice_Close() {
       $('.m21_product_choice_Modal').fadeOut();
   }

    // 자재관리 > 자재입고현황 : 새 입고 추가 모달창
   function m23_material_order_productOpen() {
       $('.m23_material_order_productModal').fadeIn();
       $(".m023_material_order_product_content_01").css('display', 'none');
       $(".m023_material_order_product_content_03").css('display', 'flex');
       $(".m023_material_order_product_content_04").css('display', 'none');
   $(".m023_order_choice_product_content_05").css('display', 'none');
       $("input[name='새입고추가']:radio").change(function () {
       var serviceType = this.value; //라디오 버튼 값
       if(serviceType == "new_item_add2"){
           $(".m023_materialOrder_productClose").css('display', 'block');
           document.getElementById("m23_material_order_productModal_head_name").innerHTML = "새 항목 추가"
           $(".m023_material_order_product_content_01").css('display', 'none');
           $(".m023_material_order_product_content_03").css('display', 'flex');
           $(".m023_material_order_product_content_04").css('display', 'none');
           $(".m023_order_choice_product_content_05").css('display', 'none');
           
       }else if(serviceType == "raw_material_add2"){
           document.getElementById("m23_material_order_productModal_head_name").innerHTML = "발주 선택"
           $(".m023_materialOrder_productClose").css('display', 'block');
           $(".m023_material_order_product_content_01").css('display', 'none');
           $(".m023_material_order_product_content_03").css('display', 'none');
           $(".m023_material_order_product_content_04").css('display', 'flex');
           $(".m023_order_choice_product_content_05").css('display', 'none');
       }else{
           document.getElementById("m23_material_order_productModal_head_name").innerHTML = "외주 임가공 출고 선택"
           $(".m023_materialOrder_productClose").css('display', 'block');
           $(".m023_material_order_product_content_01").css('display', 'none');
           $(".m023_material_order_product_content_03").css('display', 'none');
           $(".m023_material_order_product_content_04").css('display', 'none');
           $(".m023_order_choice_product_content_05").css('display', 'flex');
       }
   });
   }
   function m23_material_order_productClose() {
       $('.m23_material_order_productModal').fadeOut();
   }
   

    // 자재발주 > 자재입고현황 : 로케이션 검색 모달창
    function m23_product_locationOpen() {
        $('.m23_goods_locationModal').fadeIn();
    }

    function m23_goods_locationClose() {
        $('.m23_goods_locationModal').fadeOut();
    }

    const mainbody_23_01_selectBoxElements = document.querySelectorAll(".m23_goods_location_select");

    function mainbody_23_01_toggleSelectBox(selectBox) {
    selectBox.classList.toggle("active");
    }

    function mainbody_23_01_selectOption(optionElement) {
    const selectBox = optionElement.closest(".m23_goods_location_select");
    const selectedElement = selectBox.querySelector(".m23_goods_location_select_txt");
    selectedElement.textContent = optionElement.textContent;
    }

    mainbody_23_01_selectBoxElements.forEach(selectBoxElement => {
    selectBoxElement.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isOptionElement = targetElement.classList.contains("option");

        if (isOptionElement) {
            console.log("here");
            mainbody_23_01_selectOption(targetElement);
        }

        mainbody_23_01_toggleSelectBox(selectBoxElement);
    });
    });

    document.addEventListener("click", function (e) {
    const targetElement = e.target;
    const isSelect = targetElement.classList.contains(".m23_goods_location_select") || targetElement.closest(".m23_goods_location_select_txt");

    if (isSelect) {
        return;
    }

    const mainbody_23_01_allSelectBoxElements = document.querySelectorAll(".m23_goods_location_select");

    mainbody_23_01_allSelectBoxElements.forEach(boxElement => {
        boxElement.classList.remove("active");
    });
    });

    function m23_goods_location_select_btn_cls() {
        $(".m23_goods_location_select_txt").text('\u00A0');
    }

</script>

<!-- *1005 물류관리-->
<script>
    //물류 관리 -> 출고 -> 배송처 select custom
    function m31_product_admin_td06_select_btn_click() {
        console.log("dd");
        $("#m31_product_admin_td06_select_txt").empty();
    }

    const m31_td06_selectBoxElements = document.querySelectorAll(".m31_product_admin_td06_div");

    function m31_td06_toggleSelectBox(selectBox) {
        selectBox.classList.toggle("active");
    }

    function m31_td06_selectOption(optionElement) {
        const selectBox = optionElement.closest(".m31_product_admin_td06_div");
        const selectedElement = selectBox.querySelector(".m31_product_admin_td06_select_txt");
        selectedElement.textContent = optionElement.textContent;
    }

    m31_td06_selectBoxElements.forEach(selectBoxElement => {
        selectBoxElement.addEventListener("click", function (e) {
            const targetElement = e.target;
            const isOptionElement = targetElement.classList.contains("option");

            if (isOptionElement) {
                m31_td06_selectOption(targetElement);
            }

            m31_td06_toggleSelectBox(selectBoxElement);
        });
    });

    document.addEventListener("click", function (e) {
        const targetElement = e.target;
        const isSelect = targetElement.classList.contains(".m31_product_admin_td06_select_txt") || targetElement.closest(".m31_product_admin_td06_select_txt");

        if (isSelect) {
            return;
        }

        const m31_td06_allSelectBoxElements = document.querySelectorAll(".m31_product_admin_td06_div");

        m31_td06_allSelectBoxElements.forEach(boxElement => {
            boxElement.classList.remove("active");
        });
    });

    //물류 관리 -> 출고 -> 날짜
    // input type="date" 현재 날짜 기본값
    document.getElementById('m31_date').value = new Date().toISOString().substring(0, 10);


    //물류 관리 -> 출고 -> 거래처 검색 모달창
    function m31_left_bot_body_right_btn() {
        $('.m31_customerModal').fadeIn();
    }

    function m31_customerClose() {
        $('.m31_customerModal').fadeOut();
    }

    // 물류 관리 -> 출고 -> 제품명 선택 모달창//
    function m31_left_bot_body_div02_right_btn() {
        $('.m31_plan_productModal').fadeIn();
    }

    function m31_plan_productModalClose() {
        $('.m31_plan_productModal').fadeOut();
    }


</script>
    <script>
    ////////////  라인별 불량현황 그래프 /////////////
     var options = {
            colors: ['#5DBA8E', '#FFCB1C', '#FF9100','#3F8FD1'],
            series: [{
            name: "A Line",
            data: [45, 52, 38, 24,38,65,35,95]
            },
            {
            name: "B Line",
            data: [35, 41, 62, 42,35,86,52,38]
            },
            {
            name: 'C Line',
            data: [87, 57, 74, 99,45,35,68,42]
            },{
            name: 'D Line',
            data: [64, 52, 13, 35,5,87,35,25]
            }
        ],
            chart: {
            height: '95%',
            type: 'line',
            zoom: {
            enabled: false
            },
            toolbar: {
            show: false // 다운로드 툴바 없애기
            }
        },
        responsive: [{
            breakpoint: 550,
            options: {
                legend: {
                    position: 'bottom',
                    offsetX: -10,
                    offsetY: 0
                }}
        }],
        dataLabels: {
            enabled: false, // 데이터 값 보이게
        },
        stroke: {
            width: [2, 2, 2, 2],
            curve: 'straight',
        },
        xaxis: {
            labels: {
            show: false
            },
            axisTicks: {
            show: false
            },
            axisBorder: { // x 기본축 설정
                show: true,
                color: '#707070',
                height: '0.2%',
            }
        },
        yaxis: {
            labels: {
            show: false
            },
            axisBorder: {
                width: '0.2%',
                show: true,
                color: "#707070"
            }
        },
        grid: {
            xaxis: {
                lines: {
                    show: true,
                }},
            yaxis: {
                lines: {show: false}
                }}, 
            tooltip: { //  hover시, 데이터 값 안보이게
                intersect: true,
                shared: false,
            },
            legend:{
                position : 'bottom',
                offsetY: 5, // 범례 아래로 내리기
                // itemMargin: { horizontal: 5, vertical: 0 }, // 범례 간격
            }};
            var chart = new ApexCharts(document.querySelector("#canvas"), options);
            chart.render();

            ////////////  월별 불량현황 그래프 /////////////
            var option = {
              colors: ['#5DBA8E', '#FFCB1C', '#FF9100','#3F8FD1'],
              series: [{
                name: "불량1",
                data: [45, 52, 38, 24,63,54,24,57]
              },
              {
                name: "불량2",
                data: [35, 41, 62, 42,24,84,35,76]
              },
              {
                name: '불량3',
                data: [87, 57, 74, 99,42,95,13]
              },{
                name: '기타',
                data: [64, 52, 13, 35,66,31,49,65]
              }
            ],
              chart: {
              height: '95%',
              width:'100%',
              type: 'line',
              zoom: {
                enabled: false
              },
              toolbar: {
                show: false // 다운로드 툴바 없애기
              }
            },
            responsive: [{ 
              breakpoint: 550,
              options: {
                legend: {
                  position: 'bottom',
                  offsetX: -10,
                }
              }
            }],
            xaxis: {
        labels: {show: false },// x축 값 표시여부
        axisTicks: {show: false },// x축 눈금선 표시여부
        axisBorder: { // x 기본축 선
              show: true,
              color: '#707070',
              height: '0.2%',
        },
          lines: {
            show: false,
        }},
        yaxis: {
            labels: {
            show: false
            },
            lines: {
            show: false,
            },
            axisBorder: {
            width: '0.2%',
            show: true,
            color: "#707070"
            },
        },
        dataLabels: { enabled: false}, // 데이터 값 보이게
        stroke: {
            width: [2, 2, 2, 2],
            curve: 'straight',  //dashArray: [0, 0, 0,]  점선 간격
        },
        grid: {
            xaxis: {
                lines: {show: true}
                },
            yaxis: {
                lines: {show: false}
            }}, 
            tooltip: { //  hover시, 데이터 값 안보이게
                intersect: true,
                shared: false,
            },
            legend:{
                position : 'bottom',
                offsetY: 5, // 범례 아래로 내리기
                // itemMargin: { horizontal: 5, vertical: 0 }, // 범례 간격
            }};
            var chart2 = new ApexCharts(document.querySelector("#monthGraph"), option);
            chart2.render();

            $(function () {
    		$('.mainbody_44_mid_tb_body').scroll(function () {
    			var xPoint = $('.mainbody_44_mid_tb_body').scrollLeft();
    			$('.mainbody_44_mid_tb_head').scrollLeft(xPoint);
    		});
    		
    	});

        // *1006 품질 관리 -> 품질 검사 내역 입력 -> 공정 검색 모달창
        function mainbody_41_process_btnOpen() {
            $('.m41_productModal').fadeIn();
        }

        function m41_productModalClose() {
            $('.m41_productModal').fadeOut();
        }

        $(document).on('click', '.m41_productSearch_content_tb tbody tr', function(e){ 
            console.log($(this).children().eq(0));
            $('.m41_productModal').fadeOut();
            $(".mainbody_41_02_02_content_tb_btn1").text($(this).children().eq(0).text()).val();
            $(".mainbody_41_02_02_content_tb_btn2").text($(this).children().eq(1).text()).val();

        });

        // *1006 품질 관리 -> 품질 검사 내역 입력 -> 검사 기준 모달창 
        function mainbody_41_01_r_btn_04() {
            $('.m41_Modal').fadeIn();
        }
        function m41_ModalClose() {
            $('.m41_Modal').fadeOut();
        }

        // *1006 품질 관리 -> 품질 검사 내역 입력 -> 검사 기준 모달창 : 행추가
        function m41_content_03_01_btn() {
            var tableData = document.getElementById('m41_content_tb_1');
            var row = tableData.insertRow(tableData.rows.length);

            $(".m41_content_tb_1").append('<tr><td><input type="text"></td>'+'<td><input type="text"></td>'+'<td><input type="text"></td>'
                +'<td><input type="text"></td>'+'<td><input type="text"></td>'+'<td><input type="text"></td>'+'<td><input type="text"></td>'
                +'<td><input type="text"></td>'+'<td><input type="text"></td>'+'<td><input type="text"></td>'+'<td><input type="text"></td>'
                +'<td><input type="text"></td>'+'<td><input type="text"></td>'+'<td><input type="checkbox"></td></tr>');
        }

        // *1006 품질 관리 -> 품질 검사 내역 입력 -> 검사 기준 저장 알림창
        function m41_content_03_02_btn() {
            $('.product_input_modal_window').fadeIn();
            $('.product_input_modal_window').css('z-index','1005');
        }

        // *1006 품질 관리 -> 품질 검사 내역 입력 -> 저장 알림창
        function mainbody_41_01_r_btn_01() {
            $('.product_input_modal_window').fadeIn();
        }


        // *1006 품질 관리 -> 품질 검사 내역 입력 : 품목 정보 -> 품목 추가 모달창 
        function mainbody_41_product_plus_btn() {
            $('.m41_product_choice_Modal').fadeIn();
        }

        function m41_product_choice_Close() {
            $('.m41_product_choice_Modal').fadeOut();
        }

        $(document).on('click', '.m041_product_choice_tb tbody tr', function(e){ 
            console.log($(this).children().eq(0));
            $('.m41_product_choice_Modal').fadeOut();
            $('.mainbody_41_03_01_content_plus_btn').css("display", "none");
            $('.mainbody_41_03_01_content_tb').css("display", "inline-table");
            $(".m41_product_information_1_1").text($(this).children().eq(0).text()).val();
            $(".m41_product_information_1_2").text($(this).children().eq(1).text()).val();        
            $(".m41_product_information_2_1").text($(this).children().eq(2).text()).val();
            $(".m41_product_information_2_2").text($(this).children().eq(3).text()).val();

        });

        // *1006 품질 관리 -> 품질 검사 내역 조회 -> 승인 확인 모달창
        function mainbody_42_01_top_btn_04() {
            $('.m42_input_modal_window').fadeIn();
        }
        function m42_input_modal_bt() {
            $('.m42_input_modal_window').fadeOut();
        }

        // *1006 품질 관리 -> 공정 불량 현황 -> 저장 알림창
        function mainbody_43_01_top_btn_04() {
            $('.product_input_modal_window').fadeIn();
        }


    </script>



    <script>
                                         ////////////  *1006 X bar 관리도 /////////////
        var option_xbar = {
                colors: ['#5DBA8E', '#FFCB1C', '#FF9100','#3F8FD1'],
                series: [{
                        name: "X bar",
                        data: [0.0,0.3,-0.1,0.4,0.3]
                    },
                    {
                        name: "CL",
                        data:  [-0.2,-0.4,0.0,-0.15,0.4]
                    },
                    {
                        name: 'UCL',
                        data:  [0.0,-0.1,0.24,0.2,-0.1]
                    },
                    {
                        name: 'LCL',
                        data:  [0.1,-0.2,-0.2,0.3,0.1]
                    }
                ],
                chart: {
                    height: "100%", // *그래프 전체 높이
                    width: "100%",
                    offsetY: -5,
                    type: 'line',
                    zoom: {enabled: false},
                    toolbar: {
                    show: false // 다운로드 툴바 없애기
                    }
                },
        
                xaxis: {
                    axisBorder: { // x 기본축 선
                        show: true,
                        color: '#000000',
                        height: '0.2%',
                    },
                    labels: {
                            show: false
                    },
                    lines: {
                        show: false,
                    },
                    axisTicks: {
                        show: true,
                        color: '#707070',
                    },
                    },
                yaxis: {
                        axisTicks: {
                            show: true,
                            color: '#707070' 
                        },
                        lines: {
                            show: false,
                        },
                        axisBorder: {
                            width: '0.2%',
                            show: true,
                            color: "#000000"
                        },
                    },
                    responsive: [
                    { // 반응형 세로형일때 
                        breakpoint: 720, 
                        options: {            
                            chart:{
                                height:'90%',
                                },
                            legend: {
                                position: "bottom"
                                }
                            }
                    },{ // 반응형 가로형일때
                        breakpoint: 1000,
                        options: {
                            chart:{
                                height:'90%',
                                offsetY: -10
                            },
                            legend: {
                                position: "bottom"
                            }
                        }
                        }
                    ],
                stroke: { 
                    width: [2, 2, 2, 2], // 선 두께
                    curve: 'straight',  //dashArray: [0, 0, 0,]  점선 간격
                    },
                grid: {
                    xaxis: {
                        lines: {show: false}
                        },
                    yaxis: {
                        lines: {show: false}
                    }}, 
                    tooltip: { //  hover시, 데이터 값 안보이게
                        intersect: true,
                        shared: false,
                    },
                    legend:{
                        position : 'bottom',
                    }};
        
            var chart3 = new ApexCharts(document.querySelector("#xbaradmin_graph"), option_xbar);
            chart3.render();




        
                                         ////////////  R 관리도 /////////////
            var option_r = {
                colors: ['#5DBA8E', '#FFCB1C', '#FF9100','#3F8FD1'],
                series: [{
                    name: "R",
                    data: [0.2,0.3,0.1,0.2]
                    },
                    {
                    name: "CL",
                    data:  [0.1,-0.4,0.3,0.1]
                    },
                    {
                    name: 'UCL',
                    data:  [-0.2,0.1,-0.2,0.4]
                    },{
                    name: 'LCL',
                    data:  [0.1,-0.2,0.2,0.4]
                    }
                ],
                chart: {
                    height: "100%", // *그래프 전체 높이
                    width: "100%",
                    offsetY:-10,
                    type: 'line',
                    zoom: {enabled: false},
                    toolbar: {show: false} // 다운로드 툴바 없애기
                },
                responsive: [
                    {
                        breakpoint: 720,
                        options: {
                            chart:{
                                height:"90%", 
                            },
                            legend: {
                                position: "bottom"
                            }
                        }
                    },
                    {
                        breakpoint: 1000,
                        options: {
                        chart:{
                            height:"100%", // *반응형 그래프 전체 높이
                            offsetY: -10
                        },
                        legend: {
                            position: "bottom"
                        }
                        }
                    }
                    ],
                    xaxis: {
                        axisBorder: { // x 기본축 선
                                show: true,
                                color: '#000000',
                                height: '0.2%',
                            },
                            labels: {
                                    show: false
                                    },
                        lines: {
                                show: false,
                            },
                        axisTicks: {
                                    show: true,
                                    color: '#707070'
                                },
                        },
                        yaxis: {
                            axisTicks: {
                                show: true,
                                color: '#707070'
                                },
                            lines: {
                                show: false,
                            },
                            axisBorder: {
                                width: '0.2%',
                                show: true,
                                color: "#000000"
                            },
                        },
                        dataLabels: { enabled: false}, // 데이터 값 보이게
                        stroke: {
                                width: [2, 2, 2, 2], // 선 두께
                                curve: 'straight' 
                                },
                        grid: {
                            xaxis: {
                                lines: {show: false}
                                },
                            yaxis: {
                                lines: {show: false}
                            }}, 
                        tooltip: { //  hover시, 데이터 값 안보이게
                            intersect: true,
                            shared: false,
                        },
                        legend:{
                            position : 'bottom',
                            offsetY: -5
                        }};
                var chart4 = new ApexCharts(document.querySelector("#radmin_graph"), option_r);
                chart4.render();
            

                                     ////////////  히스토그램 /////////////

        var option_histogram = {
            colors: ['#FFE18E', '#3F8FD1'],
            series: [{
                name: 'Income',
                type: 'column',
                data: [1.4, 2, 3.5, 1, 2.5, 2, 5, 1.6]
                },  {
                name: 'Revenue',
                type: 'line',
                opposite: true,
                data: [2.6, 1.5, 0.6, 1.2, 1.9, 3.7, 4.2, 3.1],
                }],
            chart: {
                    height: "95%", // *그래프 전체 높이
                    offsetY: -1,
                    type: 'line',
                    zoom: {enabled: false},
                    toolbar: {show: false}, // 다운로드 툴바 없애기
                    },
            dataLabels: {enabled: false},
            stroke: {
                width: [1, 4] // 선의 굵기
            },
            xaxis: {
                categories: [2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016], // x축 라벨
                labels: {
                show: false
                },
                axisTicks: {
                    show: true,
                    color: '#707070'
                },
                axisBorder: {
                    show: true,
                    color: '#707070'
                },
            },
            yaxis: [
                {
                    axisTicks: {
                        show: true,
                        color: '#707070'
                    },
                    axisBorder: {
                        show: true,
                        color: '#707070'
                        },
                    tooltip: {enabled:false} // hover시, 툴팁 안나오게
                },
                {
                    seriesName: 'Income',
                    opposite: true,
                    axisTicks: {
                        show: true,
                        color: '#707070'
                    },
                    axisBorder: {
                        show: true,
                        color: '#707070'
                    },
                    dataLabels: {
                        enabled: false, // 데이터 값 보이게
                    },
                },
                
            ],
            responsive: [
                        {
                        breakpoint: 720,
                        options: {
                            chart:{
                                height:'100%',
                            },
                            legend: {
                                position: "bottom",
                            },
                            markers:{
                                size:3
                            },
                            stroke: {
                                width: [1, 2] // 선의 굵기
                            },
                            xaxis: {
                                    axisTicks: {
                                        show: false,
                                        color: '#707070'
                                    }}
                        }
                        }, 
                        { 
                        breakpoint: 900,
                        options: {
                            chart:{
                                height:'100%',
                                offsetY: -10
                            },
                            legend: {
                                position: "right",
                            },
                            markers:{size:4}
                            }
                        }],
            markers: {
                size: 5,
                shape: "circle",
                radius: 2,
            },
            dataLabels: {
            enabled: false, // 데이터 값 보이게
            },
            tooltip: { //  hover시, 데이터 값 안보이게
                enabled:false,
                intersect: false,
                shared: false,
            },
            grid: {
                xaxis: {
                    lines: {show: false}
                    },
                yaxis: {
                    lines: {show: false}
                    }
                },
            legend: {
                horizontalAlign: "center"
                },
            };
        var chart5 = new ApexCharts(document.querySelector("#histogram_graph"), option_histogram);
        chart5.render();
        


           // X-R 관리도 : 품목 검색 모달창
           function m61_product_search_Open() {
               $('.m61_product_search_Modal').fadeIn();
           }
           function m61_product_search_Close() {
               $('.m61_product_search_Modal').fadeOut();
           }
           $(function(){
                $(".m61_product_search_Modal table tr").click(function(){
                    var txt = $(this).find('td').eq(1).html();
                    $('#m61_seleted_product_value').val(txt);
                    $('.m61_product_search_Modal').fadeOut();
                    });
            });
        
        </script>
            <script type="text/javascript">
                $(function () {
                    // divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
                    $('#divBodyScroll').scroll(function () {
                        // divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
                        var xPoint = $('#divBodyScroll').scrollLeft();

                        // 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
                        $('#divHeadScroll').scrollLeft(xPoint);
                    });
                });
            </script>

    <script>
        // 메인페이지 금월 생산수량 및 불량수량 // 
        var month_product = {
                colors: ['#FFE18E', '#3F8FD1'], 
                series: [{
                    name: '생산수량',
                    type: 'column',
                    data: [14, 20, 35, 10, 25, 20, 15, 16]
                    },  {
                    name: '불량수량',
                    type: 'column',
                    opposite: true,
                    data: [26, 15, 6, 12, 19, 37, 4, 31],
                    }],
                chart: {
                        height: "95%", // *그래프 전체 높이
                        offsetY: -1,
                        type: 'line',
                        zoom: {enabled: false},
                        toolbar: {show: false}, // 다운로드 툴바 없애기
                        },
                dataLabels: {enabled: false},
                stroke: {
                    width: [1, 4] // 선의 굵기
                },
                xaxis: {
                    categories: ['제품명', '제품명', '제품명', '제품명', '제품명', '제품명', '제품명', '제품명'], // x축 라벨
                    labels: {
                    show: false
                    },
                    axisTicks: {
                        show: true,
                        color: '#707070'
                    },
                    axisBorder: {
                        show: true,
                        color: '#707070'
                    },
                },
                yaxis: [
                    {
                        axisTicks: {
                            show: true,
                            color: '#707070'
                        },
                        axisBorder: {
                            show: true,
                            color: '#707070'
                            },
                        tooltip: {enabled:false} // hover시, 툴팁 안나오게
                    },
                    {
                        seriesName: 'Income',
                        opposite: true,
                        axisTicks: {
                            show: true,
                            color: '#707070'
                        },
                        axisBorder: {
                            show: true,
                            color: '#707070'
                        },
                        dataLabels: {
                            enabled: true, // 데이터 값 보이게
                        },
                    },
                    
                ],
                responsive: [
                            {
                            breakpoint: 720,
                            options: {
                                chart:{
                                    height:'100%',
                                },
                                legend: {
                                    position: "bottom",
                                },
                                markers:{
                                    size:3
                                },
                                stroke: {
                                    width: [1, 2] // 선의 굵기
                                },
                                xaxis: {
                                        axisTicks: {
                                            show: false,
                                            color: '#707070'
                                        }}
                            }
                            }, 
                            { 
                            breakpoint: 900,
                            options: {
                                chart:{
                                    height:'100%',
                                    offsetY: -10
                                },
                                legend: {
                                    position: "right",
                                },
                                markers:{size:4}
                                }
                            }],
                markers: {
                    size: 5,
                    shape: "circle",
                    radius: 2,
                },
                dataLabels: {
                enabled: false, // 데이터 값 보이게
                },
                tooltip: { //  hover시, 데이터 값 안보이게
                    enabled:true,
                    intersect: false,
                    shared: false,
                },
                grid: {
                    xaxis: {
                        lines: {show: false}
                        },
                    yaxis: {
                        lines: {show: false}
                        }
                    },
                legend: {
                    horizontalAlign: "center"
                    },
                };
            var chart_m00_1 = new ApexCharts(document.querySelector("#m00_month_product"), month_product);
            chart_m00_1.render();    

    </script>

    <script>
    // 메인페이지 금일 생산수량 및 불량수량 // 
    var m00_order = {
                colors: ['#FFE18E', '#3F8FD1'],
                series: [{
                    name: '생산수량',
                    type: 'column',
                    data: [14, 2, 35, 1, 25, 2, 5, 16]
                    },  {
                    name: '불량수량',
                    type: 'column',
                    opposite: true,
                    data: [26, 15, 06, 12, 19, 37, 42, 31],
                    }],
                chart: {
                        height: "95%", // *그래프 전체 높이
                        offsetY: -1,
                        type: 'line',
                        zoom: {enabled: false},
                        toolbar: {show: false}, // 다운로드 툴바 없애기
                        },
                dataLabels: {enabled: false},
                stroke: {
                    width: [1, 4] // 선의 굵기
                },
                xaxis: {
                    categories: ['제품명', '제품명', '제품명', '제품명', '제품명', '제품명', '제품명', '제품명'], // x축 라벨
                    labels: {
                    show: false
                    },
                    axisTicks: {
                        show: true,
                        color: '#707070'
                    },
                    axisBorder: {
                        show: true,
                        color: '#707070'
                    },
                },
                yaxis: [
                    {
                        axisTicks: {
                            show: true,
                            color: '#707070'
                        },
                        axisBorder: {
                            show: true,
                            color: '#707070'
                            },
                        tooltip: {enabled:false} // hover시, 툴팁 안나오게
                    },
                    {
                        seriesName: 'Income',
                        opposite: true,
                        axisTicks: {
                            show: true,
                            color: '#707070'
                        },
                        axisBorder: {
                            show: true,
                            color: '#707070'
                        },
                        dataLabels: {
                            enabled: true, // 데이터 값 보이게
                        },
                    },
                    
                ],
                responsive: [
                            {
                            breakpoint: 720,
                            options: {
                                chart:{
                                    height:'100%',
                                },
                                legend: {
                                    position: "bottom",
                                },
                                markers:{
                                    size:3
                                },
                                stroke: {
                                    width: [1, 2] // 선의 굵기
                                },
                                xaxis: {
                                        axisTicks: {
                                            show: false,
                                            color: '#707070'
                                        }}
                            }
                            }, 
                            { 
                            breakpoint: 900,
                            options: {
                                chart:{
                                    height:'100%',
                                    offsetY: -10
                                },
                                legend: {
                                    position: "right",
                                },
                                markers:{size:4}
                                }
                            }],
                markers: {
                    size: 5,
                    shape: "circle",
                    radius: 2,
                },
                dataLabels: {
                enabled: false, // 데이터 값 보이게
                },
                tooltip: { //  hover시, 데이터 값 안보이게
                    enabled:true,
                    intersect: false,
                    shared: false,
                },
                grid: {
                    xaxis: {
                        lines: {show: false}
                        },
                    yaxis: {
                        lines: {show: false}
                        }
                    },
                legend: {
                    horizontalAlign: "center"
                    },
                };
      

            var chart_m00_3 = new ApexCharts(document.querySelector("#m00_order"), m00_order);
            chart_m00_3.render();  


    //  메인페이지 주문대비 납기율 //
        var day_product = {
                colors: ['#FFE18E', '#3F8FD1'],
                series: [{
                    name: '주문수량',
                    type: 'column',
                    data: [1.4, 2, 3.5, 1, 2.5, 2, 5, 1.6]
                    },  {
                    name: '납기율',
                    type: 'line',
                    opposite: true,
                    data: [2.6, 1.5, 0.6, 1.2, 1.9, 3.7, 4.2, 3.1],
                    }],
                chart: {
                        height: "95%", // *그래프 전체 높이
                        offsetY: -1,
                        type: 'line',
                        zoom: {enabled: false},
                        toolbar: {show: false}, // 다운로드 툴바 없애기
                        },
                dataLabels: {enabled: false},
                stroke: {
                    width: [1, 4] // 선의 굵기
                },
                xaxis: {
                    categories: [2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016], // x축 라벨
                    labels: {
                    show: false
                    },
                    axisTicks: {
                        show: true,
                        color: '#707070'
                    },
                    axisBorder: {
                        show: true,
                        color: '#707070'
                    },
                },
                yaxis: [
                    {
                        axisTicks: {
                            show: true,
                            color: '#707070'
                        },
                        axisBorder: {
                            show: true,
                            color: '#707070'
                            },
                        tooltip: {enabled:false} // hover시, 툴팁 안나오게
                    },
                    {
                        seriesName: 'Income',
                        opposite: true,
                        axisTicks: {
                            show: true,
                            color: '#707070'
                        },
                        axisBorder: {
                            show: true,
                            color: '#707070'
                        },
                        dataLabels: {
                            enabled: true, // 데이터 값 보이게
                        },
                    },
                    
                ],
                responsive: [
                            {
                            breakpoint: 720,
                            options: {
                                chart:{
                                    height:'100%',
                                },
                                legend: {
                                    position: "bottom",
                                },
                                markers:{
                                    size:3
                                },
                                stroke: {
                                    width: [1, 2] // 선의 굵기
                                },
                                xaxis: {
                                        axisTicks: {
                                            show: false,
                                            color: '#707070'
                                        }}
                            }
                            }, 
                            { 
                            breakpoint: 900,
                            options: {
                                chart:{
                                    height:'100%',
                                    offsetY: -10
                                },
                                legend: {
                                    position: "right",
                                },
                                markers:{size:4}
                                }
                            }],
                markers: {
                    size: 5,
                    shape: "circle",
                    radius: 2,
                },
                dataLabels: {
                enabled: false, // 데이터 값 보이게
                },
                tooltip: { //  hover시, 데이터 값 안보이게
                    enabled:true,
                    intersect: false,
                    shared: false,
                },
                grid: {
                    xaxis: {
                        lines: {show: false}
                        },
                    yaxis: {
                        lines: {show: false}
                        }
                    },
                legend: {
                    horizontalAlign: "center"
                    },
                };
            var chart_m00_2 = new ApexCharts(document.querySelector("#m00_day_product"), day_product);
            chart_m00_2.render();  


    //  메인페이지 불량률 현황 그래프  //
            var m00_Defective = {
                colors: ['#5DBA8E', '#FFCB1C', '#FF9100','#3F8FD1'],
                series: [{
                    name: "A공정라인",
                    data: [0.2,0.3,0.1,0.2]
                    },
                    {
                    name: "B공정라인",
                    data:  [0.1,-0.4,0.3,0.1]
                    },
                    {
                    name: 'C공정라인',
                    data:  [-0.2,0.1,-0.2,0.4]
                    },{
                    name: 'D공정라인',
                    data:  [0.1,-0.2,0.2,0.4]
                    }
                ],
                chart: {
                    height: "100%", // *그래프 전체 높이
                    width: "100%",
                    offsetY: -10,
                    type: 'line',
                    zoom: {enabled: true},
                    toolbar: {show: false} // 다운로드 툴바 없애기
                },
                responsive: [
                    {
                        breakpoint: 720,
                        options: {
                            chart:{
                                height:"90%", 
                            },
                            legend: {
                                position: "bottom"
                            }
                        }
                    },
                    {
                        breakpoint: 1000,
                        options: {
                        chart:{
                            height:"100%", // *반응형 그래프 전체 높이
                            offsetY: -10
                        },
                        legend: {
                            position: "bottom"
                        }
                        }
                    }
                    ],
                    xaxis: {
                        axisBorder: { // x 기본축 선
                                show: true,
                                color: '#000000',
                                height: '0.2%',
                            },
                            labels: {
                                    show: false
                                    },
                        lines: {
                                show: true,
                            },
                        axisTicks: {
                                    show: true,
                                    color: '#707070'
                                },
                        },
                        yaxis: {
                            axisTicks: {
                                show: true,
                                color: '#707070'
                                },
                            lines: {
                                show: false,
                            },
                            axisBorder: {
                                width: '0.2%',
                                show: true,
                                color: "#000000"
                            },
                        },
                        dataLabels: { enabled: false}, // 데이터 값 보이게
                        stroke: {
                                width: [2, 2, 2, 2], // 선 두께
                                curve: 'straight' 
                                },
                        grid: {
                            xaxis: {
                                lines: {show: false}
                                },
                            yaxis: {
                                lines: {show: false}
                            }}, 
                        tooltip: { //  hover시, 데이터 값 안보이게
                            intersect: true,
                            shared: false,
                        },
                        legend:{
                            position : 'bottom',
                            offsetY: -5
                        }};
                        
            var chart_m00_4 = new ApexCharts(document.querySelector("#m00_Defective"), m00_Defective);
            chart_m00_4.render();

            </script>

    
</script>
</html>
