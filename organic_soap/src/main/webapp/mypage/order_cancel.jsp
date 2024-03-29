<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 취소</title>
	<link href="../css/mp_order_cancel.css" rel="stylesheet" type="text/css">
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
		<form action="#" method="get">
			<div class="container1">
				<h3>주문 취소</h3>
				<br>
				<div id="order">
					<a href="order_detail_1.jsp">
					<div id="img"></div>
					<img src="../images/hair_1.png" width="100px" height="100px">
					<div id="p_name">
						<p><%=  %> / 외 <%=  %>건</p>
						<p>총 주문 금액 <b><%=  %>원</b></p>
					</div>
					</a>
				</div>
				<br>
				<div id="notice">
					<p>주문하신 주문 단위로 취소가 가능합니다.(상품 부분취소 불가)<br>
					주문은 상품이 발송되기 전까지 취소요청을 하실 수 있습니다.<br>
					상품 발송 이후에는 교환/반품을 이용해주세요.</p>
					<p id="accent">상품이 발송된 이후에는 취소요청이 거부될 수 있습니다.<br>
					쿠폰 및 적립금을 사용한 주문의 경우 취소완료처리 이후 반환되며,<br>
					반환된 쿠폰 및 적립금은 동일한 유효기간 내에 재사용 가능합니다.</p>
				</div>
				<br>
				<div id="reason">
					<select name="reason" id="select_value">
						<option value="1">취소 사유를 선택해주세요.</option>
						<option value="2">단순변심</option>
						<option value="3">배송지연</option>
						<option value="4">품목 추가/변경</option>
						<option value="5">다른 상품 잘못 주문</option>
						<option value="6">기타</option>
					</select>
					<br>
					<br>
					<textarea cols="60" rows="5" placeholder="상세 사유를 입력해주세요.(선택)" name="detail"></textarea>
				</div>
				<br>
				<div id="btn1">
					<button type="submit" id="order_cancel" onclick="order1()">주문 취소</button>
					<input type="hidden" id="ordern" name="ordern">
				</div>
				<br>
				<br>
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
    let select_value = document.getElementById('select_value').value;
    console.log(select_value);
        
    function order1() {
        if(select_value === 1) {
            alert("취소사유를 선택해주세요.");
        }
        else {
            alert("취소가 완료되었습니다.");
        }
    }
</script>