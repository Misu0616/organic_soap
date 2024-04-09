<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mMgr" class="member.memberMgr"/> 
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/pro_1_hair.css">
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
		                <p><h3>Hair</h3></p>
		            </div>
		        </div>
		         <!--상단 메뉴 끝-->
		        <div class="items">
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="4">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_4.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_4.jpg" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>비건 동백 헤어 세트</p>
			                        <p>30,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="1">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_1.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_1.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>비건 트리트먼트바 동백</p>
			                        <p>15,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="2">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_2.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_2.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>비건 샴푸바 동백</p>
			                        <p>15,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="3">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_3.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_3.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>샴푸바 민감용</p>
			                        <p>11,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="5">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_5.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_5.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 헤어 케어 세트</p>
			                        <p>19,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="6">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_6.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_6.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 샴푸바 건성용</p>
			                        <p>9,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		            
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="7">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_8.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_8.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>베러 댄 리퀴드 여행용 키트</p>
			                        <p>9,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="8">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_9.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_9.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 린스바</p>
			                        <p>9,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="9">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_10.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_10.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 트리트먼트바</p>
			                        <p>9,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="10">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_11.jsp" style="text-decoration-line: none;">
			                        <img src="../images/hair_11.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 샴푸바 쿨링용</p>
			                        <p>9,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="11">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_12.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_12.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 샴푸바 지성용</p>
			                        <p>9,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="12">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_13.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_13.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 샴푸바 중건성용</p>
			                        <p>9,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		            
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