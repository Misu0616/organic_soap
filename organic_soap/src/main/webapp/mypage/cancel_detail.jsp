<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>취소 상세</title>
	<link href="../css/mp_cancel_detail.css" rel="stylesheet" type="text/css">
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
			<h3><a href="cancel.jsp">←</a> 주문 상세 내역</h3>
		</div>
		<div class="order_detail">
			<div id="order_date"><b>주문일자</b> <%=  %> / <b>주문번호</b> <%=  %></div>
			<br>
			<div id="order_table">
				<table>
					<thead>
						<th id="th1">상품정보</th>
						<th id="th2">배송비</th>
						<th id="th1">진행상태</th>
					</thead>
					<tbody>
						<tr>
							<td>
								<div id="subject">
								<a href="../product/product_2_hair_1.jsp"><img src="../images/<%=  %>.png">
								<p><span id="p_name"><%=  %></span></a><br> <%=  %>원 / <%=  %>개</p>
								</div>
							</td>
							<td rowspan="2">
								<div id="shipping_fee">
									<p><%=  %>원</p>
								</div>
							</td>
							<td id="cancel"><b><%=  %></</td>
						</tr>
						<tr>
							<td>
								<div id="subject">
								<a href="../product/product_2_hair_8.jsp"><img src="../images/hair_8.png">
								<p><span id="p_name">베러 댄 리퀴드 여행용 키트</span></a><br> 9,500원 / 3개</p>
								</div>
							</td>
							<td id="cancel"><b>취소완료</b></td>
						</tr>
					</tbody>
				</table>
			</div>
			<h4>구매자 정보</h4>
			<div id="customer_info">
				<table>
					<tr>
						<td id="td1">주문자</td>
						<td><%=  %></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><%=  %></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><%=  %></td>
					</tr>
				</table>
			</div>
			<h4>배송지 정보</h4>
			<div  id="customer_addr">
				<table>
					<tr>
						<td id="td1">수령인</td>
						<td><%=  %></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><%=  %></td>
					</tr>
					<tr>
						<td>배송지</td>
						<td><%=  %></td>
					</tr>
					<tr>
						<td>배송메모</td>
						<td><%=  %></td>
					</tr>
				</table>
			</div>
			<h4>주문 금액 상세</h4>
			<div id="payment">
				<table>
					<thead>
						<th id="th3">주문금액</th>
						<th id="th3"><%=  %>원</th>
						<th id="th3">- 할인금액</th>
						<th id="th3"><%=  %>원</th>
						<th id="th3">= 총 주문금액</th>
						<th id="th3"><%=  %>원</th>
					</thead>
					<tbody>
						<tr>
							<td>상품금액<br>배송비</td>
							<td><%=  %>원<br><%=  %>원</td>
							<td>포인트 사용<br>쿠폰 적용</td>
							<td><%=  %><br><%=  %></td>
							<td>가상계좌<br>농협중앙회<br>예금주<br><br></td>
							<td><br>79014505889493 <br>오가닉소프스<br>2024-01-14 13:20까지</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
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