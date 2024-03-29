<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Vector" %>
<%@ page import ="product.productBean" %>
<%@ page import="order.r_inform" %>
<jsp:useBean id="oMgr" class="order.order_mgr" />


<%

//입력 끝나고 이 페이지로 sendredirect 되면, 이 페이지 에서는 select 메서드 호출만.
//select 메서드는 return 타입이 배열. 
// 배열을 for문으로 출력 한다.

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

	int r_mem_key_count = (int) request.getAttribute("r_mem_key_count");
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
<input type="hidden" id="count1" value="<%=r_mem_key_count%>">
	<jsp:include page="../include/headerLogin.jsp" />
            <div id="div">
                <h2>배송 정보 입력</h2>
                <section class="section1">
                <form name="ordFrm" method="post" action="#">
                    <div class="div1">주문 상품 정보
                        <p/>
                        <div class="div11"><a href="../product/product_2_hair_1.html"><img class="imgSmall" src="../images/<%=pro_img%>"></a>
                        <div class="div12"><p><%=pro_name%> </p>
                        	<p><%=cart_tot %>개</p>
                            <p id="bold"><%=pro_price%>원</p>
                        </div>
                        </div>
						<%
						    int a = Integer.parseInt(request.getParameter("pro_price"));
							int b = 0;
						    if ( a < 30000) {
						        b = 3000;
						    } else {
						        b = 0;
						    }
						%>
                        <div class="div111">배송비 <span id="bold"><%=b%>원</span></div>
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
	                        <% oMgr.insertRinform(request,response);
                           				
	                           Vector<r_inform> vlist = null;
	                           vlist = oMgr.selectR_inform(mem_key);
		                    	
	                           	int vlistsize = vlist.size();
	                           	
	                           		for (int i =0; i<vlist.size(); i++){
	                           			r_inform dto = vlist.get(i);
	                           			
	                           			String r_name = dto.getR_name();
	                           			String r_phone = dto.getR_phone();
	                           			String r_porstal_code = dto.getR_postal_code();
	                           			String r_address1 = dto.getR_address1();
	                           			String r_address2 = dto.getR_address2();
	                           			String memo = dto.getRequest();
	                           			
	                           			if(dto.getR_name() != null) {
	                           		
	                           %>
                     			 
                            <label for="person"></label>
                            <input type="text" class="inputline" id="person" name="r_name" value="<%=r_name %>" placeholder="수령인" size="32">
                            <label for="number"></label>
                            <input type="tel" class="inputline" id="number" name="r_phone" value="<%=r_phone %>" placeholder="연락처" size="31.8">
                        <p/>
                            <label for="addrn"></label>
                            <input type="text" class="inputline" id="postal" name="r_postal_code" value="<%=r_porstal_code %>" placeholder="우편번호" size="14">
                            <button type="button" name="findaddr" value="주소 찾기" class="find_addr" onclick="findmap()">주소 찾기</button>
                        <p/>
                            <label for="addr"></label>
                            <input type="text" class="inputline" id="addr1" name="r_address1" value="<%= r_address1 %>" placeholder="주소" size="70">
                        <p/>
                            <label for="det"></label>
                            <input type="text" class="inputline" id="addr2" name="r_address2" value="<%=r_address2 %>" placeholder="상세주소" size="70">
                        <p/>
                            <p id="bold">배송 메모</p>
                            <p/>
                        <textarea class="request" name="memo" id="memo" placeholder="배송 메모를 입력해주세요."><%=memo%></textarea>
                        <label for="check1"></label>
                        <% }
	                           			} %>
                        <p/>
                        <input type="hidden" name="mem_key" id="memkey" value="1">
                    </div>
                        <p/>
                    <div>
                         <button type="button" class="finalpay" name="paylast" value="lastpay" onclick="nextPage()">다음으로</button>
                    </div>
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
                
            </section>
         </div>
    <jsp:include page="../include/footer.jsp" />
</body>
</html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

window.onload = function(){
	if("<%=r_mem_key_count%>" == 3) {
		alert("배송지는 3개를 초과할 수 없습니다.");
		console.log("notice 실행 완료");
	}
}

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
	
	document.ordFrm1.action = "dvPlace1.jsp";
	document.ordFrm1.submit();
}

function dv_place2(){
	
	document.ordFrm1.action = "dvPlace2.jsp";
	document.ordFrm1.submit();
}

function dv_place3(){
	
	document.ordFrm1.action = "dvPlace3.jsp";
	document.ordFrm1.submit();
}
function addDv1(){
	document.ordFrm1.action = "addDvPlaceServlet";
	document.ordFrm1.submit();
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