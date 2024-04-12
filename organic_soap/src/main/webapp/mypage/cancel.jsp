<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mypage.mp_order_bean" %>
<jsp:useBean id="m_o_mgr" class="mypage.mp_order_mgr"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_key = (String)session.getAttribute("mem_key");
	System.out.println("세션에 담은 멤버키 = " + mem_key);
		
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문취소</title>
	<link href="../css/mp_order.css?after" rel="stylesheet" type="text/css">
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

			Vector<mp_order_bean> vlist = new Vector<mp_order_bean>();
				 
			vlist = m_o_mgr.select_point(mem_key);
			System.out.println("회원이름 및 포인트조회 메서드 호출 완료");
				 
			for(int i=0; i < vlist.size(); i++) {
				mp_order_bean bean = vlist.get(i);
				int my_point = bean.getMy_point();
				String mem_name = bean.getMem_name();

		%>
			<div id="mem_icon"><a href="edit_profile.jsp"><img src="../images/member_icon.png"></a></div>
			<div id="info"><p><span id="name"><%= mem_name %> 님 안녕하세요.</span><br></p></div>
			<div id="point"><p>포인트</p><p id="num"><a href="point.jsp"><b><%= my_point %></b></a></p></div>
		<%} //아이디 포인트 for%> 
		</div>

		<br>
		<br>
		<div>
			<h3>취소/교환/반품 조회</h3>
		</div>
		<br>
		<div class="shipping">
			<table>
		<%
 
			System.out.println("주문날짜조회 메서드 호출 완료");
			
			String od_key = "";
			String od_date = ""; 
			String pro_img = "";
			String pro_name = "";
			int pro_price = 0;
			String pro_link = "";
			int cart_qty = 0; 
			String od_status = ""; 
			
			Vector<mp_order_bean> vlist1 = new Vector<mp_order_bean>();
			
			vlist1 = m_o_mgr.select_order(mem_key);
			int vlist1size = vlist1.size();
			System.out.println("vlist1 사이즈 = " + vlist1size);
			
				for(int i=0; i < vlist1.size(); i++) {
					
					mp_order_bean bean = vlist1.get(i);
					
					System.out.println("주문 날짜 for문 시작");
					
					od_key = bean.getOd_key();
					od_date = bean.getOd_date();
					pro_img = bean.getPro_img();
					pro_name = bean.getPro_name();
					pro_price = bean.getPro_price();
					pro_link = bean.getPro_link();
					cart_qty = bean.getCart_qty();
					od_status = bean.getOd_status();
					
					System.out.println("주문 날짜 for문 끝");
										
		%>
				<tr>
					<td>
						<div id="orderno">
							<a href="order_detail.jsp?od_key=<%= od_key %>" >주문 번호 : <%= od_key %><br/> 주문일자 : <%= od_date %></a>
						</div>
					</td>
					<td>
						<div id="subject">
							<a href="../product/<%= pro_link %>"><img src="../images/<%= pro_img %>">
							<p><span id="p_name"><%= pro_name %></span></a><br><%= pro_price %>원 / <%= cart_qty %>개</p>
						</div>
					</td>
					<td>
						<div id="status">
							<p><%= od_status %></p>
						</div>
					</td>
					<td id="cancel"><a href="order_detail.jsp?od_key=<%= od_key %>"><b>취소 상세</b></a></td>
				</tr>
		<%} %>
			</table>
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