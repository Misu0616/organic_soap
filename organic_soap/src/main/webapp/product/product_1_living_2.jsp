<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <jsp:useBean id="mMgr" class="member.memberMgr"/>
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/pro_1_living_2.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    <body>
	    <div class="container">
			<!-- header 시작 -->
			<% String mem_key = (String)session.getAttribute("mem_key");
			 if (mem_key == null){%>
				 <jsp:include page="../include/headerBfLogin.jsp" />
			 	
			 	<% }else{%>
			 	<jsp:include page="../include/headerLogin.jsp" />
			 	<% } %>
			
			<!-- header 끝. -->
		
		    <!-- 본문 시작 -->  
		    <div class="every">    
		        <!--상단 메뉴 시작-->
		        <div class="menu">
		            <div class="top_menu">
		                <div id="to4"><a href="product_list_all.jsp"><h3>All</h3></a></div>
		                <div id="to1"><a href="product_1_hair.jsp"><h3>Hair</h3></a></div>
		                <div id="to2"><a href="product_1_face.jsp"><h3>&nbsp;Face/Body</h3></a></div>
		                <div id="to3"><a href="product_1_living.jsp"><h3>&nbsp;&nbsp;&nbsp;Living</h3></a></div>
		            </div>
		            <div class="mid_menu">
		                <p><h3>Living</h3></p>
		            </div>
		        </div>
		         <!--상단 메뉴 끝-->
		        <div class="items">
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="53">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_living_21.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_21.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 설거지 워싱바 500g</p>
			                        <p>14,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="54">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_living_22.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_22.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 설거지 워싱바 150g</p>
			                        <p>6,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		            
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="55">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_living_23.jsp" style="text-decoration-line: none;">
			                 	<img src="../images/living_23.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>선물용 쇼핑백 (소)</p>
			                        <p>1,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		            
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="56">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_living_24.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_24.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>스테인리스 고리집개</p>
			                        <p>1,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		            
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="57">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_living_25.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_25.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>삼베 비누망</p>
			                        <p>3,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		            
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="58">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_living_26.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_26.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>순면 비누 거품망</p>
			                        <p>4,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		            
		        </div>
		    
		        
		       <br>
		       <br>
		       <br>
		       <br>
		        <div>
		            <ul class="page">
		                <li id="page_1"><a href="product_1_living.jsp">1&nbsp;</a></li>
		                <li id="page_2"><b>&nbsp;2&nbsp;</b></li>
		            </ul>
		        </div>
		    </div> 
	        <!-- 본문 끝 -->
			<!-- bottom 시작 -->
			<%@include file="../include/footer.jsp" %><p/>
			<!-- bottom 끝. -->
        </div>
    </body>
</html>
<script>
//찜하기 기능

function save() {
    //save함수 호출시 icon_color 변수 선언 하고, 변수에 id값이 icon인 요소를 담는다.
    console.log("save 함수 진입.");
   
    var key;

    key = document.querySelector("#mm").value;
    console.log("key 변수 값 = " + key);

	if(key == "null"){
		alert("로그인하셔야 본 서비스를 이용하실 수 있습니다.");
	}else{
		alert("완료!");
		document.submit();
		document.action="../product/wishServlet";
	}
 
}

//페이지 이동
function cart(){
	console.log("cart 메서드 호출");	
    
	document.submit();
	document.action="../product/productServlet";
}

</script>