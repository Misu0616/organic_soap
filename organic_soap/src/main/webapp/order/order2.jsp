<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String pro_name = (String) request.getAttribute("pro_name");
	String pro_img = (String) request.getAttribute("pro_img");
	int  pro_price = (int) request.getAttribute("pro_price");
	String cart_tot = (String) request.getAttribute("cart_tot");
	String mem_name = (String) request.getAttribute("mem_name");
	String mem_tel = (String) request.getAttribute("mem_tel");
	String mem_email = (String) request.getAttribute("mem_email");
	String mem_postal_code = (String) request.getAttribute("mem_postal_code");
	String mem_address1 = (String) request.getAttribute("mem_address1");
	String mem_address2 = (String) request.getAttribute("mem_address2");
	int mem_key = (int) request.getAttribute("mem_key");
	
	String r_name = request.getParameter("r_name");
	String r_phone = request.getParameter("r_phone");
	String r_postal_code = request.getParameter("r_postal_code");
	String r_address1 = request.getParameter("r_address1");
	String r_address2 = request.getParameter("r_address2");
	String memo = request.getParameter("memo");
	
	int my_point = (int) request.getAttribute("my_point");
	int use_point = (int) request.getAttribute("use_point");
	int get_point = (int) request.getAttribute("get_point");
	
	System.out.println("ord2.jsp , pro_name = " + pro_name);
	System.out.println("ord2.jsp , pro_img = " + pro_img);
	System.out.println("ord2.jsp , pro_price = " + pro_price);
	System.out.println("ord2.jsp , mem_name = " + mem_name);
	System.out.println("ord2.jsp , mem_tel = " + mem_tel);
	System.out.println("ord2.jsp , mem_email = " + mem_email);
	System.out.println("ord2.jsp , mem_postal_code = " + mem_postal_code);
	System.out.println("ord2.jsp , mem_address1 = " + mem_address1);
	System.out.println("ord2.jsp , mem_address2 = " + mem_address2);

	System.out.println("ord2.jsp , mem_key = " + mem_key);
	System.out.println("ord2.jsp , r_name = " + r_name);
	System.out.println("ord2.jsp , r_phone = " + r_phone);
	System.out.println("ord2.jsp , r_postal_code = " + r_postal_code);
	System.out.println("ord2.jsp , r_address1 = " + r_address1);
	System.out.println("ord2.jsp , r_address2 = " + r_address2);
	System.out.println("ord2.jsp , memo = " + memo);
	
	System.out.println("ord2.jsp , my_point = " + my_point);
	System.out.println("ord2.jsp , use_point = " + use_point);
	System.out.println("ord2.jsp , get_point = " + get_point);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/order4.css">
<script type="text/javascript" src="../js/order.js"></script>
</head>
<body>
	<jsp:include page="../include/headerLogin.jsp" />
            <div id="div">
             <form name="ord2Frm" method="post" action="#">
             	<h2>배송 정보 입력</h2>
             	<%=pro_name %><%=pro_img %><%=pro_price %><%= cart_tot%><%=mem_name %>
             	<%=mem_tel %><%=mem_email %><%= mem_postal_code%><%=mem_address1 %>
             	<%=mem_address2 %><%=mem_key %><%=r_name %><%= r_phone%><%=r_postal_code %>
             	<%=r_address1 %><%=r_address2 %><%= memo%>
                  	<section class="section1"> 
                    <div class="pointInfo"><p id="bold">포인트</p> 
                        <p/> 
                        <div>
                            <label for="point"></label>
                            <input type="text" class="inputline" id="point" name="포인트" size="45" placeholder="0" onchange="set_point(<%=my_point%>, <%=use_point%>, <%=pro_price%>)">
                            <button name="useall" value="전액 사용" class="btnColor" onclick="use_point(<%=my_point%>, <%=use_point%>, <%=pro_price%>)">포인트 사용</button>
                       
                        <p/> 보유 포인트 <%=my_point %>
                        <p class="fontColor"> 10 포인트 이상 보유 및 10,000원 이상 구매시 </p>
                        <p class="fontColor"> 사용 가능</p>
                        </div>
                    </div>
                    <p/>
                    <!-- section 1에 position-fixed 값을 넣으면 input 입력이 안 돼서 일단 제외
                    모델 사이트처럼 float이 되지 않음 -->
                    <div class="div1"> <p id="bold">주문 요약</p>
                        <section id="divinline1"><p>상품 가격</p>
                            <p>배송비</p></section>
                        <section id="divinline2"><p><%=pro_price %>원</p>
                        <%
						    int a = Integer.parseInt(request.getParameter("pro_price"));
							int b = 0;
						    if ( a < 30000) {
						        b = 3000;
						    } else {
						        b = 0;
						    }
						%>
                            <p><%=b %>원</p></section>
                        <hr>
                        <section id="divinline1"><p>총 주문 금액</p></section>
                        <%
                        	int c = Integer.parseInt(request.getParameter("pro_price"));
                        	int d = b;
                        	int e = c+d;
                        %>
                        <section id="divinline3"><p>원</p></section>
                    </div>
                    <div class="getPoint">
                    <%
                    int Price = Integer.parseInt(request.getParameter("pro_price"));
                    int getPoint = Price/100;
                    %>
                        포인트 적립 예정 : <%=getPoint%>원
                    </div>
                        <p/>
                    <div class="pointInfo"> <p id="bold">결제 수단</p>
                        <p class="p1">
                        <label for="pay1"></label>
                        <input type="radio" name="pay" id="pay1">신용카드
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="pay1"></label>
                        <input type="radio" name="pay" id="pay2">가상계좌</p>

                        <p class="p1"><label for="pay3"></label>
                        <input type="radio" name="pay" id="pay3">네이버 페이 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="pay4"></label>
                        <input type="radio" name="pay" id="pay4">삼성페이</p>
                    </div>
                        <p/>
                    <div class="div1">
                        <p/>
                        <input type="checkbox" id="agree" name="agreetoo"> 구매 조건 확인 및 결제 진행에 동의 
                        <p/>
                    </div>
                    <div>
                        <button type="submit" class="finalpay" name="paylast" value="lastpay" onclick="final()">결제하기</button>
                    </div>
                        <p/><br>
                </section>
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
					<input type="hidden" name="r_name" value="<%=r_name%>">
					<input type="hidden" name="r_phone" value="<%=r_phone%>">
					<input type="hidden" name="r_postal_code" value="<%=r_postal_code%>">
					<input type="hidden" name="r_address1" value="<%=r_address1%>">
					<input type="hidden" name="r_address2" value="<%=r_address2%>">
					<input type="hidden" name="memo" value="<%=memo%>">
                 </form>
            </div>
    <jsp:include page="../include/footer.jsp" />
</body>	
</html>
<script>
	
	function set_point(myP, useP, price){		
		
		var user_use = parseInt(document.getElementById("point").value);
		let point = <%=my_point%>;
		let price = <%=pro_price%>;
		
		if (user_use > point) //입력값이 사용가능 포인트보다 클때
		{
			user_use = point;
			document.getElementById("point").value = point; //input 값 재설정
		}

		if(user_use > price ){ //결제금액보다 포인트가 더 클 때
			user_use = price; //사용할 포인트는 결제금액과 동일하게 설정
			document.getElementById("point").value = price; //input 값 재설정
		}

		var left_point = <%=my_point%> //사용가능 포인트, 남은 포인트 값 설정
		for (var i = 0; i < left_point.length; i++) {

			left_point[i].innerHTML = <%=my_point%> - user_use; //= 전체 포인트 중에 사용할 포인트빼고 남은 포인트

		}
		//최종 결제금액 = 결제금액 - 사용할 포인트
		last_price = <%=pro_price%> - use_point;
		document.getElementById("divinline3").value = last_price;
	}
	
	function pay(){
		let card_checked = document.getElementById('pay1').checked;
		let account_checked = document.getElementById('pay2').checked;
		let naver_checked = document.getElementById('pay3').checked;
		let samsung_checked = document.getElementById('pay4').checked;
		
		let payment document.querySelectorAll('pay').value;
		
		if (card_checked == true){
			payment = "신용카드";
		}
		if (account_checked == true){
			payment = "가상계좌";
		}
		if (naver_checked == true){
			payment = "네이버페이";
		}
		if (samsung_checked == true){
			payment = "삼성페이";
		}
		console.log(payment);
	}
	
	function final(){
		document.ord2Frm.action = "orderDetail.jsp";
		document.ord2Frm.submit();
	}
</script>