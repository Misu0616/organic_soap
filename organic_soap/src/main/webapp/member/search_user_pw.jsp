<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>아이디 · 비밀번호 찾기</title>
        <link rel="stylesheet" href="../css/search_user_pw.css">
    </head>
    <body>
        <div id="container">
            <div class="logo" st>
                <h2><a href="../index.jsp">Organic SOAPS</a></h2>
            </div>
            <div id="search_user_pw_box">
                <div id="search_user_pw_m_text_box">
                    <b>비밀번호 찾기</b>
                </div>
                <div class="link_close">
                    <button type="button" onclick="location.href='../index.jsp'" class="close_button"></button>
                </div>
                <div id="middle_line"></div>
                <div id="pw_dummy_button"></div>
                <div id="link_search_id">
                    <button type="button" onclick="location.href='search_user_id.jsp'" class="link_search_id_button" >아이디 찾기</button>
                </div>
                <form method="get" onsubmit="return serch()">
                    <div class="input_user_data5">
                        <input type="email" id="input_email" placeholder="가입한 아이디" name="user_data_email" required>
                    </div>
                    <div id="search_user_pw_button_box">
                        <button type="submit" id="search_user_pw_button"><b id="search_user_pw_button_text">비밀번호 찾기</b></button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>