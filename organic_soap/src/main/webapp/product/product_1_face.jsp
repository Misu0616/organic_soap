<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.memberMgr"/> 
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/pro_1_face.css">
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
		                <p><h3>Face/Body</h3></p>
		            </div>
		        </div>
		         <!--상단 메뉴 끝-->
		        <div class="items">
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="13">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_1.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_1.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>릴랙싱 모먼트 배쓰밤 입욕제 세트</p>
			                        <p>28,000원</p>
			                    </div>
			                </a>
			             	<button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="14">
							<<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_2.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_2.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>앰플 세안바 다시마 폼클렌징</p>
			                        <p>18,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="15">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_3.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_3.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>페이스 앤 바디바 레몬그라스</p>
			                        <p>11,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="16">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_4.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_4.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>가꿈비누 5종 세트</p>
			                        <p>26,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="17">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_5.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_5.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 핸드크림 시어버터</p>
			                        <p>13,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="18">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_6.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_6.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 바디스크럽바 씨솔트</p>
			                        <p>12,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="19">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_7.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_7.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 고체바디로션바 시어버터</p>
			                        <p>18,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="20">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_9.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_9.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 거품입욕제 페퍼민트</p>
			                        <p>7,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="21">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_10.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_10.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 거품입욕제 로즈</p>
			                        <p>7,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="22">
							<<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_11.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_11.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 거품입욕제 레몬그라스</p>
			                        <p>7,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="23">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_12.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_12.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 거품입욕제 라벤더</p>
			                        <p>7,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="24">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_13.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_13.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 아기비누 알로에</p>
			                        <p>9,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="25">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_14.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_14.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>가꿈비누 오이가지</p>
			                        <p>6,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="26">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_15.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_15.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>가꿈비누 페퍼민트</p>
			                        <p>5,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="27">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_16.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_16.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>가꿈비누 케일</p>
			                        <p>5,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="28">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_17.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_17.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>가꿈비누 바질</p>
			                        <p>5,000원</p>
			                    </div>
			                   </a>
		                   <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="29">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_18.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_18.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>가꿈비누 상추</p>
			                        <p>5,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="30">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_19.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_19.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>아이가꿈 DIY 키트 북극곰</p>
			                        <p>17,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="31">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_20.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_20.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 세안비누 콜라겐</p>
			                        <p>9,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="32">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_21.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_21.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 바디비누 노니</p>
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