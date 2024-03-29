<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>포인트</title>
	<link href="../css/mp_point.css" rel="stylesheet">
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
		<div id="profile">
			<div id="icon"><a href="edit_profile.jsp"><img src="../images/member_icon.png" width="100px" height="100px"></a></div>
			<div id="info"><p><span id="name"><%=  %> 님 안녕하세요.</span><br>누적 구매금액: <%=  %>원</p></div>
			<div id="point"><p>포인트</p><p id="num"><a href="point.jsp"><b><%=  %></b></a></p></div>
		</div>
		<br>
		<br>
		<div>
			<h3>포인트</h3>
		</div>
		<br>
		<div class="point">
			<p>포인트 적립 내역이 없습니다.</p>
		</div>
	</div>
<!-- 본문 끝 -->
<!-- 푸터 시작 -->
	<%@ include file="../include/footer.jsp"  %>
<!-- 푸터 끝 -->
</div>
</body>
</html>
<script>
    function withdrawal() {
        var option='width=580,height=270,scrollbars=yes,top=300,left=700,resizable=yes';
        window.open('withdrawal.jsp','',option);
    }
</script>