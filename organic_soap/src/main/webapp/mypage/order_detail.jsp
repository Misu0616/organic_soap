<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mypage.mp_order_detail_bean" %>
<jsp:useBean id="m_o_d_mgr" class="mypage.mp_order_detail_mgr"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");

	String mem_key = (String)session.getAttribute("mem_key");
	System.out.println("세션에 담은 아이디키 = " + mem_key);	
	
	String od_key = request.getParameter("od_key");
	System.out.println("order.jsp 에서 넘어온 od_key = " + od_key);

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 상세</title>
	<link href="../css/mp_order_detail.css?after" rel="stylesheet" type="text/css"> 
</head>
<body>
<div class="container">
<!-- 헤더 시작 -->
<%
if(mem_key !=null){
%>
	<jsp:include page="../include/headerLogin.jsp" />
	<% } else { %>
		<jsp:forward page="../index.jsp" />
	<%	} %>
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
		<%
			//세션에 담긴 아이디 키 값을 이용해서 조회하는 메서드 를 호출
			//Vector<memberBean> vlist = new Vector<memberBean>();

			Vector<mp_order_detail_bean> vlist = new Vector<mp_order_detail_bean>();
				 
			vlist = m_o_d_mgr.select_point(mem_key);
			System.out.println("회원이름 및 포인트조회 메서드 호출 완료");
				 
			for(int i=0; i < vlist.size(); i++) {
				mp_order_detail_bean bean = vlist.get(i);
				int my_point = bean.getMy_point();
				String mem_name = bean.getMem_name();
		%>
			<div id="mem_icon"><a href="edit_profile.jsp"><img src="../images/member_icon.png"></a></div>
			<div id="info"><p><span id="name"><%= mem_name %> 님 안녕하세요.</span><br></p></div>
			<div id="point"><p>포인트</p><p id="num"><a href="point.jsp"><b><%= my_point %></b></a></p></div>
		<%} %>
		</div>
		
		<br>
		<br>
		<div>
			<h3><a href="order.jsp">←</a> 주문 상세 내역</h3>
		</div>
		<div class="order_detail">
		<%
			String mem_name = "";
			int my_point = 0;
			String od_date = "";
			String od_status = "";
			String mem_tel = "";
			String mem_email = "";
			String r_name = "";
			String r_phone = "";
			String r_postal_code = "";
			String r_address1 = "";
			String r_address2 = "";
			String memo = "";
			int od_tot = 0;
			String pay = "";
		
			Vector<mp_order_detail_bean> vlist1 = new Vector<mp_order_detail_bean>();
			
			vlist1 = m_o_d_mgr.select_order_detail(od_key, mem_key);
			System.out.println("주문내역조회 메서드 호출 완료");
			System.out.println("현재 od_key = " + od_key + " 현재 mem_key = " + mem_key );
			int vlist1size = vlist1.size();
			System.out.println("vlist1 사이즈 = " + vlist1size);
					
			mp_order_detail_bean bean1 = vlist1.get(0);
					
			od_key = bean1.getOd_key();
			mem_name = bean1.getMem_name();
			my_point = bean1.getMy_point();
			od_date = bean1.getOd_date();
			od_status = bean1.getOd_status();
			mem_tel = bean1.getMem_tel();
			mem_email = bean1.getMem_email();
			r_name = bean1.getR_name();
			r_phone = bean1.getR_phone();
			r_postal_code = bean1.getR_postal_code();
			r_address1 = bean1.getR_address1();
			r_address2 = bean1.getR_address2();
			memo = bean1.getRequest();
			od_tot = bean1.getOd_tot();
			pay = bean1.getPay();

			//배송비
			int shipping_fee = 0;
			if(od_tot < 30000) {
				shipping_fee = 3000;
			} else {
				shipping_fee = 0;
			}
			
		%>
			<div id="order_date"><b>주문일자</b> <%= od_date %> / <b>주문번호</b> <%= od_key %></div>
			<br>
			<div id="order_table">
				<table>
					<thead>
						<th id="th1">상품정보</th>
						<th id="th2">배송비</th>
						<th id="th1">진행상태</th>
					</thead>
					<tbody>
					<%
						String pro_link = "";
						String pro_img = "";
						String pro_name = "";
						int pro_price = 0;
						int cart_qty = 0;
						
						Vector<mp_order_detail_bean> vlist2 = new Vector<mp_order_detail_bean>();
						
						vlist2 = m_o_d_mgr.select_order_product(od_key, mem_key);
						System.out.println("주문상품조회 메서드 호출 완료");
						
						int vlist2size = vlist2.size();
						System.out.println("vlist2 사이즈 = " + vlist2size);
						
						for(int j=0; j<vlist2.size(); j++) {
							
							mp_order_detail_bean bean2 = vlist2.get(j);
							
							System.out.println("주문상품조회 for문 시작");
							
							pro_link = bean2.getPro_link();
							pro_img = bean2.getPro_img();
							pro_name = bean2.getPro_name();
							pro_price = bean2.getPro_price();
							cart_qty = bean2.getCart_qty();
							
							System.out.println("주문상품조회 for문 끝");
														
					%>
						<tr>
							<td>
								<div id="subject">
									<a href="../product/<%= pro_link %>"><img src="../images/<%= pro_img %>">
									<p><span id="p_name"><%= pro_name %></span></a><br> <%= pro_price %>원 / <%= cart_qty %>개</p>
								</div>
							</td>
							<td>
								<div id="shipping_fee">
									<p><%= shipping_fee %>원</p>
								</div>
							</td>
							<td id="cancel"><b>주문완료</b></td>
						</tr>
					<%} %>
					</tbody>
				</table>
			</div>
			<h4>구매자 정보</h4>
			<div id="customer_info">
				<table>
					<tr>
						<td id="td1">주문자</td>
						<td><%= mem_name %></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><%= mem_tel %></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><%= mem_email %></td>
					</tr>
				</table>
			</div>
			<h4>배송지 정보</h4>
			<div  id="customer_addr">
				<table>
					<tr>
						<td id="td1">수령인</td>
						<td><%= r_name %></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><%= r_phone %></td>
					</tr>
					<tr>
						<td>배송지</td>
						<td>(<%= r_postal_code %>) <%= r_address1 %> <%= r_address2 %></td>
					</tr>
					<tr>
						<td>배송메모</td>
						<td><%= memo %></td>
					</tr>
				</table>
			</div>
			<h4>주문 금액 상세</h4>
			<div id="payment">
				<table>
					<thead>
					<%
						int price = 0;
						int total_price = 0;
						
						price = od_tot + shipping_fee;
						
					%>
						<th id="th3">주문금액</th>
						<th id="th3"><%= price %>원</th>
						<th id="th3">- 할인금액</th>
						<th id="th3"> 0원</th>
						<th id="th3">= 총 주문금액</th>
						<th id="th3"><%= price %>원</th>
					</thead>
					<tbody>
						<tr>
							<td>상품금액<br>배송비</td>
							<td><%= od_tot %>원<br><%= shipping_fee %>원</td>
							<td>포인트 사용<br>쿠폰 적용</td>
							<td></td>
							<td><%= pay %><br>농협중앙회<br>예금주<br><br></td>
							<td><br>79014505889493 <br>오가닉소프스<br>2024-01-14 13:20까지</td> 
						</tr>
					</tbody>
				</table>
			</div>
		</div> 
	</div>
<!-- 본문 끝 -->
<!-- 푸터 시작 -->
	<%@ include file="../include/footer.jsp" %>
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