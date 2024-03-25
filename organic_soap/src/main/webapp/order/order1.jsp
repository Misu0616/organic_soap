<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Vector" %>
<%@ page import ="product.productBean" %>
<%@ page import="order.r_inform" %>
<jsp:useBean id="oMgr" class="order.order_mgr" />
<%
	request.setCharacterEncoding("utf-8");
	
	String pro_name = request.getParameter("pro_name");
	String pro_img = request.getParameter("pro_img");
	String pro_price = request.getParameter("pro_price");
	String cart_tot = request.getParameter("cart_tot");
	String mem_name = request.getParameter("mem_name");
	String mem_tel = request.getParameter("mem_tel");
	String mem_email = request.getParameter("mem_email");
	String mem_postal_code = request.getParameter("mem_postal_code");
	String mem_address1 = request.getParameter("mem_address1");
	String mem_address2 = request.getParameter("mem_address2");

	String mem_key = request.getParameter("mem_key");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/order3.css">
<script type="text/javascript" src="../js/order.js"></script>
</head>
<body>
	<jsp:include page="../include/headerLogin.jsp" />
            <div id="div">
                <h2>배송 정보 입력</h2>
                <section class="section1">
                <form name="ordFrm1" method="post" action="orderServlet">
                    <div class="div1">주문 상품 정보
                        <p/>
                        <div class="div11"><a href="../product/product_2_hair_1.html"><img class="imgSmall" src="../images/<%=pro_img%>"></a>
                        <div class="div12"><p><%=pro_name%> </p>
                        	<p><%=cart_tot %>개</p>
                            <p id="bold"><%=pro_price%>원</p>
                        </div>
                        </div>
                        <div class="div111">배송비 <span id="bold">3000원</span></div>
                    </div>
                        <p/>
                    <div class="odInfo">주문자 정보
                        <p/>
                        <div>
                            <label for="name"></label>
                            <input type="text" class="inputline" id="name" name="name" value="<%=mem_name %>" placeholder="이름" size="32" required>
                            <label for="text"></label>
                            <input type="tel" class="inputline" id="text" name="phonenum1" value="<%=mem_tel %>" placeholder="연락처" size="31.8" required>
                        <p/>
                            <label for="mail"></label>
                            <input type="email" class="inputline" id="mail" name="email" value="<%=mem_email %>" placeholder="이메일" size="70" required>
                        </div>
                    </div>
                        <p/> 
                    </form>
                <form name="ordFrm2" method="post" action="orderServlet">
                    <div class="dvInfo"><p id="bold">배송 정보</p>  
                        <p/> 
                            <div>
                           		<label for="check1"></label>
                                <input type="checkbox" id="check1" name="check1" onclick="is_check()" value="checkbox1">
                                주문자 정보와 동일
                                <p/>
                                <p class="dvplace">
                                <button type="button" name="r_info_address1" id="r_info_address1" value="배송지 1" class="use" onclick="dv_place1()">배송지1</button>
                                <button type="button" name="r_info_address2" id="r_info_address2" value="배송지 2" class="use" onclick="dv_place2()">배송지2</button>
                                <button type="button" name="r_info_address3" id="r_info_address3" value="배송지 3" class="use" onclick="dv_place3()">배송지3</button>
	                           	<button name="add_addr" id="check2" value="checkbox2" class="use2">배송지 목록에 추가</button>
                            	</p>
                            </div>
                        <p/>   
                            <label for="person"></label>
                            <input type="text" class="inputline" id="person" name="receive" placeholder="수령인" size="32">
                            <label for="number"></label>
                            <input type="tel" class="inputline" id="number" name="phonenum2" placeholder="연락처" size="31.8">
                        <p/>
                            <label for="addrn"></label>
                            <input type="text" class="inputline" id="postal" name="addn"  placeholder="우편번호" size="14">
                            <button type="button" name="findaddr" value="주소 찾기" class="find_addr" onclick="openCenter('', 'pop', 500, 500);">주소 찾기</button>
                        <p/>
                            <label for="addr"></label>
                            <input type="text" class="inputline" id="addr1" name="adr" placeholder="주소" size="70">
                        <p/>
                            <label for="det"></label>
                            <input type="text" class="inputline" id="addr2" name="detadr"  placeholder="상세주소" size="70">
                        <p/>
                            <p id="bold">배송 메모</p> 
                            <p/>
                        <textarea class="request" name="memo" id="memo" placeholder="배송 메모를 입력해주세요."></textarea>
                        <label for="check1"></label>
                        <p/>
                        <input type="hidden" name="mem_key" id="memkey" value="1">
                    </div>
                        <p/>
                    <div>
                        <button type="button" class="finalpay" name="paylast" value="lastpay" onclick="nextPage()">다음으로</button>
                    </div>
                </form>
            </section> 
			<form name="dv1" method="post" action="dvPlace1.jsp">
					<input type="hidden" name="pro_price" value="<%= pro_price%>">
					<input type="hidden" name="pro_name" value="<%= pro_name%>">
					<input type="hidden" name="pro_img" value="<%= pro_img%>">
					<input type="hidden" name="cart_tot" value="1">
					<input type="hidden" name="mem_name" value="<%= mem_name%>">
					<input type="hidden" name="mem_tel" value="<%= mem_tel%>">
					<input type="hidden" name="mem_email" value="<%= mem_email%>">
					<input type="hidden" name="mem_address1" value="<%= mem_address1%>">
					<input type="hidden" name="mem_address2" value="<%= mem_address2%>">
					<input type="hidden" name="mem_postal_code" value="<%= mem_postal_code%>">
					<input type="hidden" name="mem_key" value="<%=mem_key%>">
				</form>
				<form name="dv2" method="post" action="dvPlace2.jsp">
					<input type="hidden" name="pro_price" value="<%= pro_price%>">
					<input type="hidden" name="pro_name" value="<%= pro_name%>">
					<input type="hidden" name="pro_img" value="<%= pro_img%>">
					<input type="hidden" name="cart_tot" value="1">
					<input type="hidden" name="mem_name" value="<%= mem_name%>">
					<input type="hidden" name="mem_tel" value="<%= mem_tel%>">
					<input type="hidden" name="mem_email" value="<%= mem_email%>">
					<input type="hidden" name="mem_address1" value="<%= mem_address1%>">
					<input type="hidden" name="mem_address2" value="<%= mem_address2%>">
					<input type="hidden" name="mem_postal_code" value="<%= mem_postal_code%>">
					<input type="hidden" name="mem_key" value="<%=mem_key%>">
				</form>
				<form name="dv3" method="post" action="dvPlace3.jsp">
					<input type="hidden" name="pro_price" value="<%= pro_price%>">
					<input type="hidden" name="pro_name" value="<%= pro_name%>">
					<input type="hidden" name="pro_img" value="<%= pro_img%>">
					<input type="hidden" name="cart_tot" value="1">
					<input type="hidden" name="mem_name" value="<%= mem_name%>">
					<input type="hidden" name="mem_tel" value="<%= mem_tel%>">
					<input type="hidden" name="mem_email" value="<%= mem_email%>">
					<input type="hidden" name="mem_address1" value="<%= mem_address1%>">
					<input type="hidden" name="mem_address2" value="<%= mem_address2%>">
					<input type="hidden" name="mem_postal_code" value="<%= mem_postal_code%>">
					<input type="hidden" name="mem_key" value="<%=mem_key%>">
				</form>
				<form name="dv3" method="post" action="order2.jsp">
					<input type="hidden" name="pro_price" value="<%= pro_price%>">
					<input type="hidden" name="pro_name" value="<%= pro_name%>">
					<input type="hidden" name="pro_img" value="<%= pro_img%>">
					<input type="hidden" name="cart_tot" value="1">
					<input type="hidden" name="mem_name" value="<%= mem_name%>">
					<input type="hidden" name="mem_tel" value="<%= mem_tel%>">
					<input type="hidden" name="mem_email" value="<%= mem_email%>">
					<input type="hidden" name="mem_address1" value="<%= mem_address1%>">
					<input type="hidden" name="mem_address2" value="<%= mem_address2%>">
					<input type="hidden" name="mem_postal_code" value="<%= mem_postal_code%>">
					<input type="hidden" name="mem_postal_code" value="<%= mem_postal_code%>">
					<input type="hidden" name="request" value="<%=request%>">
				</form>
         </div>
    <jsp:include page="../include/footer.jsp" />
</body>
</html>
<script>
//배송 정보 주문자의 정보와 동일하게
function is_check() {
	  
	  let checkbox = document.getElementById('check1');

	  let is_checked = checkbox.checked;
	 
		if(is_checked == true){
			document.getElementById("person").value = '<%=mem_name%>';
			document.getElementById("number").value = '<%=mem_tel%>';
			document.getElementById("postal").value = '<%=mem_postal_code%>';
			document.getElementById("addr1").value = '<%=mem_address1%>';
			document.getElementById("addr2").value = '<%=mem_address2%>';
		}
		else {
			document.getElementById("person").value = null;
			document.getElementById("number").value = null;
			document.getElementById("postal").value = null;
			document.getElementById("addr1").value = null;
			document.getElementById("addr2").value = null;
		}
	}

function dv_place1(){
	document.dv1.action = "dvPlace1.jsp";
	document.dv1.submit();
}

function dv_place2(){
	
	document.dv2.action = "dvPlace2.jsp";
	document.dv2.submit();
}
function dv_place3(){
	
	document.dv3.action = "dvPlace3.jsp";
	document.dv3.submit();
}

function dv_send(){
	let checkbox = document.getElementById('check2');

	  let is_checked = checkbox.checked;
	  
	  console.log("is_checked");
	 
		if(is_checked == true){
			document.submit.getElementById("person").value;
			document.submit.getElementById("number").value;
			document.submit.getElementById("postal").value; 
			document.submit.getElementById("addr1").value;
			document.submit.getElementById("addr2").value; 
		}
	
}

function findmap(){
	/* 주소 찾기 팝업 필요 */
	document.findaddr.action="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"
}

function nextPage(){
	location.href="order2.jsp";
	
}
</script>