<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>찜목록</title>
	<link href="../css/mp_wish_list.css" rel="stylesheet">
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
		<h3>위시리스트</h3>
		<br>
		<form action="#" method="get">
			<div class="wish_list">
				<div id="wrapper">
					<div class="card">
						<figure>
							<a href="../product/product_2_face_17.jsp"><img src="../images/face_17.png">
							<button id="delete" onclick="javascript:del_wish()">X</button>
						</figure>
					</div>
					<div class="card_detail">
						<p><span><input type="hidden" name="pd_name" value="hair_12">가꿈비누 바질</span></span><br>5,000원</p></a>
					</div>
				</div>
			</div>
		</form>
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
    function del_wish() {
        alert("삭제되었습니다.");
    }
</script>