<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.memberMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	
	String pro_name = request.getParameter("pro_name");
	String pro_img =  request.getParameter("pro_img");
	int  pro_price = Integer.parseInt(request.getParameter("pro_price"));
	int cart_tot = Integer.parseInt(request.getParameter("cart_tot"));
	int cart_qty = Integer.parseInt(request.getParameter("cart_qty"));
	String mem_name = request.getParameter("mem_name");
	String mem_tel = request.getParameter("mem_tel");
	String mem_email = request.getParameter("mem_email");
	String mem_postal_code = request.getParameter("mem_postal_code");
	String mem_address1 = request.getParameter("mem_address1");
	String mem_address2 = request.getParameter("mem_address2");
	
	String r_name = request.getParameter("r_name");
	String r_phone = request.getParameter("r_phone");
	String r_postal_code = request.getParameter("r_postal_code");
	String r_address1 = request.getParameter("r_address1");
	String r_address2 = request.getParameter("r_address2");
	String memo = request.getParameter("memo");
	
	int my_point = (int) request.getAttribute("my_point");
	int use_point = 0;
	
	int total_price = Integer.parseInt(request.getParameter("total_price"));
	int od_tot = Integer.parseInt(request.getParameter("od_tot"));
	int od_r_info_key = Integer.parseInt(request.getParameter("od_r_info_key"));
	
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
<%

String mem_key = (String)session.getAttribute("mem_key");
if(mem_key !=null){
%>
	<jsp:include page="../include/headerLogin.jsp" />
	<% } else { %>
		<jsp:forward page="index.jsp" />
	<%	} %>
            <div id="div">
             <form name="ord2Frm" method="post" action="#">
             	<input type="hidden" id="result_price" name="result_price" value="0">
             	<input type="hidden" id="result_point" name="result_point">
             	<h2>배송 정보 입력</h2>
             	<%=pro_name %><%=pro_img %><%=pro_price %><%= cart_tot%><%=mem_name %>
             	<%=mem_tel %><%=mem_email %><%= mem_postal_code%><%=mem_address1 %>
             	<%=mem_address2 %><%=mem_key %><%=r_name %><%= r_phone%><%=r_postal_code %>
             	<%=r_address1 %><%=r_address2 %><%= memo%><%=total_price %>
                  	<section class="section1"> 
                    <div class="pointInfo"><p id="bold">포인트</p> 
                        <p/> 
                        <div>
                            <label for="point"></label>
                            <input type="number" class="inputline" id="use_point" name="point" value="0" size="45" onchange="set_point(<%=my_point%>, 1000, <%=total_price%>)">
                            <button type="button" name="useall" value="전액 사용" class="btnColor" id="useAll" onclick="use_all(<%=my_point%>, 1000, <%=total_price%>)">전액 사용</button>
                       
                        <p/> 보유 포인트 : <span id="left_pnt"><%=my_point%></span>
                        <p class="fontColor"> 1000 포인트 이상 보유 및 10,000원 이상 구매시 </p>
                        <p class="fontColor"> 사용 가능</p>
                        </div>
                    </div>
                    <p/>
                    <!-- section 1에 position-fixed 값을 넣으면 input 입력이 안 돼서 일단 제외
                    모델 사이트처럼 float이 되지 않음 -->
                    <div class="div1"> <p id="bold">주문 요약</p>
                        <section id="divinline1"><p>상품 가격</p>
                            <p>배송비</p></section>
                        <section id="divinline2"><p><%=total_price %>원</p>
                        <%
						    int a;
						    if (total_price < 30000) {
						        a = 3000;
						    } else {
						        a = 0;
						    }
						%>
                            <p><%=a %>원</p></section>
                        <hr>
                        <section id="divinline1"><p>총 주문 금액</p></section>
                        <%
                        	int b = total_price;
                        	int c = a + b;
                        %>
                        <section id="divinline3"><p id="result_po"><%=c%>원</p></section>
                    </div>
                    <div class="getPoint">
                    <%
                    int Price = total_price;
                    int get_point = Price/100;
                    %>
                        포인트 적립 예정 : <%=get_point%>원
                    </div>
                        <p/>
                    <div class="pointInfo"> <p id="bold">결제 수단</p>
                        <p class="p1">
                        <label for="pay1"></label>
                        <input type="radio" name="pay" id="pay1" value="신용카드">신용카드
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="pay1"></label>
                        <input type="radio" name="pay" id="pay2" value="가상계좌">가상계좌</p>

                        <p class="p1"><label for="pay3"></label>
                        <input type="radio" name="pay" id="pay3" value="네이버페이">네이버 페이 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="pay4"></label>
                        <input type="radio" name="pay" id="pay4" value="삼성페이">삼성페이</p>
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
                	<input type="hidden" name="pro_price" value="<%=pro_price%>">
					<input type="hidden" name="pro_name" value="<%=pro_name%>">
					<input type="hidden" name="pro_img" value="<%=pro_img%>">
					<input type="hidden" name="cart_tot" value="<%=cart_tot%>">
					<input type="hidden" name="cart_qty" value="<%=cart_qty%>">
					<input type="hidden" name="total_price" value="<%=total_price%>">
					<input type="hidden" name="mem_key" value="<%= mem_key%>">
					<input type="hidden" name="mem_name" value="<%= mem_name%>">
					<input type="hidden" name="mem_tel" value="<%= mem_tel%>">
					<input type="hidden" name="mem_email" value="<%= mem_email%>">
					<input type="hidden" name="mem_address1" value="<%= mem_address1%>">
					<input type="hidden" name="mem_address2" value="<%= mem_address2%>">
					<input type="hidden" name="mem_postal_code" value="<%= mem_postal_code%>">
					<input type="hidden" name="r_name" value="<%=r_name%>">
					<input type="hidden" name="r_phone" value="<%=r_phone%>">
					<input type="hidden" name="r_postal_code" value="<%=r_postal_code%>">
					<input type="hidden" name="r_address1" value="<%=r_address1%>">
					<input type="hidden" name="r_address2" value="<%=r_address2%>">
					<input type="hidden" name="memo" value="<%=memo%>">
					<input type="hidden" name="my_point" value="<%=my_point%>">
					<input type="hidden" name="point" value="<%=use_point%>">
					<input type="hidden" name="get_point" value="<%=get_point%>">
					<input type="hidden" name=shipping_fee value="<%=a%>">
					<input type="hidden" name=total_price value="<%=c%>">
					<input type="hidden" name="od_tot" value="<%=od_tot%>">
					<input type="hidden" name="od_r_info_key" value="<%=od_r_info_key %>">					
                 </form>
            </div>
    <jsp:include page="../include/footer.jsp" />
</body>	
</html>
<script>

	function use_all(myP, min, price) {
		
		let my_point = 0; //사용할 포인트 (input 입력값)
		
		let left_pnt = document.getElementById("left_pnt").textContent;
		
		console.log("price : " + price);
		
		if(myP > price){ // 포인트가 가격보다 클때
			
			my_point = price;
			left_pnt = left_pnt - my_point;
				
			document.getElementById("use_point").value = price; 
			console.log("사용 포인트가 구매 금액보다 많을 때, my_point = " + my_point);
			
			var final_amount = price + <%=a%> - my_point + "원";
			
			document.getElementById("left_pnt").innerHTML = left_pnt;
			document.getElementById("result_po").innerHTML = final_amount;
			
			console.log("마지막 my_point : " + left_pnt); 
			console.log("마지막 left_pnt : " + final_amount); 
			
			document.getElementById("left_pnt").innerHTML = left_pnt;
			document.getElementById("result_po").innerHTML = final_amount;
			
			let result_price = price + <%=a%> - my_point;
			let result_point = myP - my_point;
			
			//최종 주문 금액 querySelector 사용하여 id값이 result_price 인 input 태그에 value 삽입.
			document.querySelector('#result_price').value = result_price;
			document.querySelector('#result_point').value = result_point;
			
			
		}
		
		if(myP < price){ // 포인트가 가격보다 작을 때
			
			if(myP < min) {
				alert("포인트의 최소 사용 단위는 1000원입니다.");
				document.getElementById("use_point").value = 0;
				my_point = 0;
			}
			
			document.getElementById("use_point").value = myP; 
			
			let my_point = document.getElementById("left_pnt").textContent; // 5000
			
			let left_pnt = document.getElementById("left_pnt").textContent;
			
			left_pnt = my_point - my_point;
			
			console.log("최종 my_point : " + my_point); // 5000
			console.log("최종 left_pnt : " + left_pnt); // 0
			
			var final_amount = price + <%=a%> - my_point + "원";
			
			document.getElementById("left_pnt").innerHTML = left_pnt;
			document.getElementById("result_po").innerHTML = final_amount;
			
			console.log("마지막 my_point : " + left_pnt); // 
			console.log("마지막 left_pnt : " + final_amount); // 
			
			document.getElementById("left_pnt").innerHTML = left_pnt; // 5000
			document.getElementById("result_po").innerHTML = final_amount; // 18000
			
			let result_price = price + <%=a%> - my_point;
			let result_point = myP - my_point;
			
			//최종 주문 금액 querySelector 사용하여 id값이 result_price 인 input 태그에 value 삽입.
			document.querySelector('#result_price').value = result_price;
			document.querySelector('#result_point').value = result_point;
			console.log("***** result_point, input value = " + document.querySelector('#result_point').value);	
		} 
		
	}

	
	function set_point(myP, min, price){		
		
		var my_point = parseInt(document.getElementById("use_point").value);
		var left_point = document.getElementById("left_pnt").textContent; 
		
	
		console.log("함수 set_point 실행, 사용자가 쓰려는 금액 : " + my_point);
		
		if (my_point > myP){ //입력값이 사용가능 포인트보다 클때
		
			my_point = myP;
			document.getElementById("use_point").value = my_point; 
			console.log("사용 포인트가 잔여 포인트보다 많을 때, my_point = " + my_point);
		}
		
		if(my_point > price){ //결제금액보다 포인트가 더 클 때
			my_point = price; 
			document.getElementById("use_point").value = price; 
			console.log("사용 포인트가 구매 금액보다 많을 때, my_point = " + my_point);
		}
		
		if (my_point < min || isNaN(my_point) == true){  //최소 사용 단위보다 작거나 NaN일때
			alert("포인트의 최소 사용 단위는 1000원입니다.");
			document.getElementById("use_point").value = 0;
			my_point = 0;
		}
		
		var final_point = myP - my_point;
			
		var final_amount = price + <%=a%> - my_point + "원";
		
		let result_price = price + <%=a%> - my_point;
		
		let result_point = myP - my_point;
		
		//최종 주문 금액 querySelector 사용하여 id값이 result_price 인 input 태그에 value 삽입.
		document.querySelector('#result_price').value = result_price;
		
		document.querySelector('#result_point').value = result_point;
		console.log("result_point 2, input value = " + document.querySelector('#result_point').value);	
		
		document.getElementById("left_pnt").innerHTML = final_point;
		document.getElementById("result_po").innerHTML = final_amount;

		console.log("마지막, my_point = " + my_point);
		console.log("마지막, left_pnt = " + left_point);
		console.log("마지막, final_point = " + final_point);
	}
	
	
	function final(){
		document.ord2Frm.action = "order_detail_Servlet";
		document.ord2Frm.submit();
	}
</script>