<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>아이디 · 비밀번호 찾기</title>
        <link rel="stylesheet" href="../css/search_user_id.css">
    </head>
    <body>
        <div id="container">
            <div class="logo">
                <h2><a href="../index.jsp">Organic SOAPS</a></h2>
            </div>
            <div id="search_user_id_box">
                <div id="search_user_id_m_text_box">
                   아이디 찾기
                </div>
                <div class="link_close">
                    <button type="button" onclick="location.href='../index.jsp'" class="close_button"></button>
                </div>
                <div id="middle_line"></div>
                <div id="id_dummy_button"></div>
                <div id="link_search_pw">
                    <button type="button" onclick="location.href='search_user_pw.jsp'" class="link_search_pw_button" >비밀번호 찾기</button>
                </div>
                <form method="get" onsubmit="return serch()">
                    <div class="input_user_data4">
                        <input type="text" id="input_name" placeholder="이름" name="user_data_name" required>
                    </div>
                    <div id="search_user_id_button_box">
                        <button type="submit" id="search_user_id_button"><b id="search_user_id_button_text">아이디 찾기</b></button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>