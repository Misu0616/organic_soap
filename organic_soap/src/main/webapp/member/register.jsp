<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <link rel="stylesheet" href="../css/register.css?after">
    </head>
    <body>
        <div id="container">
            <div id="register_box">
                <div id="logo"><a href="../index.jsp"><p>Organic SOAPS</p></a></div>
            <form id="register_input" method="post" onsubmit="return register_submit()" action="registerProc.jsp">
                <div id="user_profile_img">
                </div>
                <div class="register_input_user_data1">
                    <input type="email" id="register_input_email" placeholder="이메일" name="mem_email" required>
                </div>
                <div class="register_input_user_data2">
                    <input type="password" id="register_input_pw" placeholder="비밀번호" name="mem_pw" required>
                </div>
                <div class="register_input_user_data3">
                    <input type="password" id="register_input_pw2" placeholder="비밀번호 확인" name="pwcheck" required>
                </div>
                
                <div id="pw_mismatch">※비밀번호가 일치하지 않습니다.</div>
                
                <div class="register_input_user_data6">
                    <input type="tel" id="register_input_tel" placeholder="전화번호" name="mem_tel" required>
                </div>
                <div id="register_user_name_text">
                    이름
                <div id="register_dot"></div></div>
                <div class="register_input_user_data4">
                <input type="text" id="register_input_name" placeholder="이름을(를) 입력하세요" name="mem_name" required>
                </div>
                <div class="register_input_user_data7">
                    <input type="text" id="register_input_address1" placeholder="주소" name="mem_address1" required>
                    <input type="text" id="register_input_zip" placeholder="우편번호" name="mem_postal_code" oninput="this.value = this.value.replace(/[^0-9]/g, '')" maxlength= "5" required>
                </div>
                <div class="register_input_user_data8">
                <input type="text" id="register_input_address2" placeholder="상세주소" name="mem_address2" required>
                </div>
                <div class="input_user_data5">
                    <button type="submit" id="register_button_submit"><b id="register_button_text">가입하기</b></button>
                </div>
        </form>
        </div>
            <!-- 푸터 시작 -->
            <div class="footer">
                <p>Social Media : <a href="https://www.instagram.com/donggubat_story/"><span>INSTAGRAM</span></a> / <a href="https://mysterious-cloche-461.notion.site/eb68d5534ad4471ba51edb6b755b409a"><span>NOTION</span></a></p>

                <p><a href="../privacy.html"><span>개인정보처리방침</span></a> ｜ <a href="../terms.html"><span>이용약관</span></a></p>
            </div>
        <!-- 푸터 끝 -->
        </div>
        <script>
        
        	function register_submit() {
        		
            	var register_form = document.getElementById('register_input');
            	var register_pw = document.getElementById('register_input_pw').value;
            	var register_pw2 = document.getElementById('register_input_pw2').value;
            	var pw_mismatch = document.getElementById('pw_mismatch');
            	var tel_box = document.getElementById('register_input_tel');

           		if(register_pw != register_pw2) {
                	pw_mismatch.style.display = "block";
                	tel_box.style.borderTop = "0.3px solid lightgrey";
                	return false;
            }
            	return true;
        	}
        	
        	function email_check() {
        		var email = document.getElementById('register_input_email').value;
        		var pw = document.getElementById('register_input_pw').value;
     			
        	}
        </script>
    </body>
</html>