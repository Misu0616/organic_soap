<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>
	<link rel="stylesheet" href="../css/mp_edit.css">
</head>
<body>
<div class="container">
<!-- 헤더 시작 -->
	<%@ include file="../include/headerLogin.jsp" %>
<!-- 헤더 끝 -->
<!-- 본문 시작 -->
	<div class="mypage">
		<nav id="sidebar">
			<ul>
				<li><a href="order.jsp">주문 조회</a></li>
				<li><a href="wish_list.jsp">위시리스트</a></li>
				<li><a href="cancel.jsp">취소/교환/반품</a></li>
				<li><a href="point.jsp">포인트</a></li>
				<li><a href="edit_profile.jsp">정보 수정</a></li>
				<li><a href="#none" onclick="withdrawal();return false;" onkeypress="this.onclick;">회원 탈퇴</a></li>
				<br>
			</ul>
		</nav>
		<div id="edit">
			<div><h2>정보 수정</h2></div>
			<div id="icon"><img src="../images/member_icon.png" width="100px" height="100px"></div>
			<br>
			<div>
				<form method="get" action="#">
					<input type="email" name="userid" id="userid" placeholder="userid" readonly>
					<br>
					<input type="password" name="pwd" id="userpwd" placeholder="기존 비밀번호 입력">
					<br>
					<input type="password" name="newpwd1" id="newpwd1" placeholder="비밀번호를 변경하는 경우 입력하세요">
					<br>
					<input type="password" name="newpwd2" id="newpwd2" placeholder="비밀번호 확인">
					<br>
					<p>이름 *</p>
					<input type="text" name="username" id="username" placeholder="이름을 입력하세요">
					<br>
					<p>전화번호</p>
					<input type="tel" name="phone" id="phone" placeholder="숫자만 입력하세요">
					<br>
					<p>주소</p>
					<div class="postal_code">
						<input type="text" name="zip_code" id="zip-code" placeholder="우편번호" style="width: 195px;">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" style="width: 100px;">
						<input type="text" name="addr1" id="address-1" placeholder="도로명주소">
						<input type="text" name="addr2" id="address-2" placeholder="상세주소">
					</div>
					<div id="event">
						<p>이벤트/혜택 수신 여부</p>
						<label><input type="checkbox" name="sms" value="smsY">SMS 수신 동의</label>
						<br>
						<label><input type="checkbox" name="email" value="emailY">E-Mail 수신 동의</label>
						<br>
					</div>
					<br>
					<br>
					<button type="submit" value="edit">확인</button>
				</form>
			</div>
		</div>
		<br>
		<br>
		<br>
	</div>
<!-- 본문 끝 -->
<!-- 푸터 시작 -->
	<%@ include file="../include/footer.jsp"  %>
<!-- 푸터 끝 -->
</div>
</body>
</html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function withdrawal() {
        var option='width=580,height=270,scrollbars=yes,top=300,left=700,resizable=yes';
        window.open('withdrawal.jsp','',option);
    }
    function execDaumPostcode() {
        new daum.Postcode( {
          oncomplete: function( data ) {
            document.getElementById( 'zip-code' ).value = data.zonecode;
            document.getElementById( 'address-1' ).value = data.address;
          }
        } ).open();
      }
</script>