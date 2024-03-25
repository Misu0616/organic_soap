<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	  request.setCharacterEncoding("UTF-8");
	  String email_se = (String)session.getAttribute("emailKey");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="../css/login.css?after">
</head>
<body>
    <div id="container">
        <div class="logo">
            <h2><a href="../index.html">Organic SOAPS</a></h3>
        </div>
        <div id="login_box">
            <div class="login_m_text">
                <h2>로그인</h2>
            </div>
            <form name="loginform" method="post" action="loginProc.jsp">
                <div class="input_user_data1">
                    <input type="email" id="input_email" placeholder="이메일" name="mem_email" required>
                </div>
                <div class="input_user_data2">
                    <input type="password" id="input_pw" placeholder="비밀번호" name="mem_pw" required>
                </div>
                <div class="login_check_box">
                    <input type="checkbox" id="input_checkbox" name="login_dr">
                    <label for="input_checkbox"><b id="checkbox_text">로그인상태유지</b></label>
                </div>
                <div class="input_user_data3">
                    <button type="submit" id="login_button_submit"><b id="login_button_text">로그인</b></button>
                </div>
                <div class="link_register_box">
                    <a id="link_register" href="../register/agree_terms.html">회원가입</a>
                </div>
                <div class="link_search_box">
                    <a id="link_search" href="search_user_id.html">아이디 · 비밀번호 찾기</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>