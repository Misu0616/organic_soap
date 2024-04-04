<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Vector" %>
<%@ page import ="product.productBean" %>
<%@ page import="order.r_inform" %>
<%@ page import ="cart.cart_dto" %>
<%@ page import ="order.order_cart_bean" %>
<jsp:useBean id="oMgr" class="order.order_mgr" />
<jsp:useBean id="mMgr" class="member.memberMgr" />
<%
	request.setCharacterEncoding("utf-8");

	String mem_name = request.getParameter("mem_name");
	String mem_tel = request.getParameter("mem_tel");
	String mem_email = request.getParameter("mem_email");
	String mem_postal_code = request.getParameter("mem_postal_code");
	String mem_address1 = request.getParameter("mem_address1");
	String mem_address2 = request.getParameter("mem_address2");

	order_cart_bean ocb = new order_cart_bean();
	String pro_name = "";
	String pro_img = "";
	int pro_price = 0;
	int cart_tot = 0;
	int cart_qty = 0;
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
<%

String mem_key = (String)session.getAttribute("mem_key");
if(mem_key !=null){
%>
	<jsp:include page="../include/headerLogin.jsp" />
	<% } else { %>
		<jsp:forward page="index.jsp" />
	<%	} %>
            <div id="div">
                <h2>배송 정보 입력</h2>
                <section class="section1">
                <form name="ordFrm" method="post" action="#">
                    <div class="div1">주문 상품 정보
                        <p/>
                        <%
                        	
	                        Vector<order_cart_bean> vlist = oMgr.select_cart(mem_key);
	                        System.out.println("resultList.size jsp : " + vlist.size());
	                        
		                        for(int i=0; i<vlist.size(); i++){
		                        	order_cart_bean ocb1 = vlist.get(i);
		                        	
			                        cart_tot = ocb1.getCart_tot();
					                cart_qty = ocb1.getCart_qty();
					               
			                        pro_name = ocb1.getPro_name();
			                        pro_img = ocb1.getPro_img();
					                pro_price = ocb1.getPro_price();
					                
					                System.out.println("jsp cart_tot : " + cart_tot);
					            	System.out.println("jsp cart_qty : " + cart_qty);
					                System.out.println("jsp pro_name : " + pro_name);
					                System.out.println("jsp cart_qty : " + pro_img);
					                System.out.println("jsp pro_price : " + pro_price);
	                        		
		                        
	                        	%>
                        <div class="div11"><a href="../product/product_2_hair_1.html"><img class="imgSmall" src="../images/<%=pro_img%>"></a>
                        <div class="div12"><p><%=pro_name%> </p>
                        	<p><%=cart_qty%>개</p>
	                        <% cart_tot = pro_price*cart_qty; %>
	                        <p><%=cart_tot%>원</p>
                        </div>
                        </div>
                        <%
                        	}
                        %>
                        <%
	                        int a;
						    if (pro_price < 30000) {
						    	System.out.println("3 pro_price : " + pro_price);
						        a = 3000;
						    } else {
						        a = 0;
						    }
						%>
                        <div class="div111">배송비 <span id="bold"><%=a%>원</span></div>
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
	                           	<button type="button" name="add_addr" id="check2" value="checkbox2" onclick="addDv1()" class="use2">배송지 목록에 추가</button>
                            	</p>
                            </div>
                        <p/> 
                        <% 
	                        Vector<r_inform> vlist5 = null;
	                    	vlist5 = oMgr.getdvPlace3(mem_key);
	                    	
	                    	int vlistsize = vlist5.size();
	                    	
	                    	  for(int i = 0; i < vlist5.size(); i++) {
                     		
                     			r_inform dto = vlist5.get(i);
                     		
	                     		int r_info_key = dto.getR_info_key();
	                     		String r_name = dto.getR_name();
	                     		String r_phone = dto.getR_phone();
	                     		String r_postal_code = dto.getR_postal_code();
	                     		String r_address1 = dto.getR_address1();
	                     		String r_address2 = dto.getR_address2();
	                     		String memo = dto.getRequest();
	                     		int r_mem_key = dto.getR_mem_key();
                     		
                     		if(dto.getR_name() != null) {
                     			%>
                     			   
                            <label for="person"></label>
                            <input type="text" class="inputline" id="person" name="r_name" value="<%=r_name %>" placeholder="수령인" size="32" required>
                            <label for="number"></label>
                            <input type="tel" class="inputline" id="number" name="r_phone" value="<%= r_phone %>" placeholder="연락처" size="31.8" required>
                        <p/>
                            <label for="addrn"></label>
                            <input type="text" class="inputline" id="postal" name="r_postal_code" value="<%= r_postal_code%>" placeholder="우편번호" size="14" required>
                            <button type="button" name="findaddr" value="주소 찾기" class="find_addr" onclick="findmap()">주소 찾기</button>
                        <p/>
                            <label for="addr"></label>
                            <input type="text" class="inputline" id="addr1" name="r_address1" value="<%= r_address1 %>" placeholder="주소" size="70" required>
                        <p/>
                            <label for="det"></label>
                            <input type="text" class="inputline" id="addr2" name="r_address2" value="<%= r_address2 %>" placeholder="상세주소" size="70" required>
                        <p/>
                            <p id="bold">배송 메모</p>
                            <p/>
                        <textarea class="request" name="memo" id="memo" placeholder="배송 메모를 입력해주세요."><%=memo%></textarea>
                        <label for="check1"></label>
                        <input type="hidden" name="od_r_info_key" value="<%=r_info_key %>">
                       <%
                     			    }
                        %>
                        <% } %>
                        <p/>
                    </div>
                        <p/>
                    <div>
                         <button type="button" class="finalpay" name="paylast" value="lastpay" onclick="nextPage()">다음으로</button>
                    </div>
                    <%
					int sum2 = 0;
                    int num1 = 0;    		
                   	for(int i=0; i<vlist.size(); i++){
                   		
                   			order_cart_bean ocb1 = vlist.get(i);
                   			
                   			pro_price = ocb1.getPro_price();
                   			cart_qty = ocb1.getCart_qty();
                   			int sum1 = 0;
                   			 
                   			sum1 = pro_price * cart_qty;
                   			sum2 += sum1;
                   			
                   			
                   			num1 += cart_qty; 
                   	
                   	}
					
					%>
                    <input type="hidden" name="pro_price" value="<%=pro_price%>">
					<input type="hidden" name="pro_name" value="<%=pro_name%>">
					<input type="hidden" name="pro_img" value="<%=pro_img%>">
					<input type="hidden" name="cart_tot" value="<%=cart_tot%>">
					<input type="hidden" name="cart_qty" value="<%=cart_qty%>">
					<input type="hidden" name="total_price" value="<%=sum2%>">
					<input type="hidden" name="od_tot" value="<%=num1%>">
					<%System.out.println("dvPlace3 : " + sum2); %>
					<input type="hidden" name="mem_key" value="<%= mem_key%>">
					<input type="hidden" name="mem_name" value="<%= mem_name%>">
					<input type="hidden" name="mem_tel" value="<%= mem_tel%>">
					<input type="hidden" name="mem_email" value="<%= mem_email%>">
					<input type="hidden" name="mem_address1" value="<%= mem_address1%>">
					<input type="hidden" name="mem_address2" value="<%= mem_address2%>">
					<input type="hidden" name="mem_postal_code" value="<%= mem_postal_code%>">
                </form>
            </section>
         </div>
    <jsp:include page="../include/footer.jsp" />
</body>
</html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	
	document.ordFrm.action = "dvPlace1.jsp";
	document.ordFrm.submit();
}

function dv_place2(){
	
	document.ordFrm.action = "dvPlace2.jsp";
	document.ordFrm.submit();
}

function dv_place3(){
	
	document.ordFrm.action = "dvPlace3.jsp";
	document.ordFrm.submit();
}
function addDv1(){
	document.ordFrm.action = "addDvPlaceServlet";
	document.ordFrm.submit();
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

function findmap() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postal').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}

function nextPage(){
	document.ordFrm.action ="order2Servlet";
	document.ordFrm.submit();
	
}
</script>