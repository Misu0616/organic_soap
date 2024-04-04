<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.memberMgr"/>

<DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/pro_1_2.css">
        <script src="../js/product_list_all.js"></script>
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
		                <div id="to4"><a href="product_list_all.jsp"><h3>All</h3></a></div>
		            </div>
		        </div>
		         <!--상단 메뉴 끝-->
		         <div class="items">
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="21">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>"> 							
			                <a href="product_2_face_10.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_10.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 거품입욕제 로즈</p>
			                        <p>7,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="22">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="23">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="24">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="25">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="26">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="27">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="28">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="29">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="30">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="31">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_20.html" style="text-decoration-line: none;">
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
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="32">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_face_21.html" style="text-decoration-line: none;">
			                    <img src="../images/face_21.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 바디비누 노니</p>
			                        <p>9,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="9">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_10.html" style="text-decoration-line: none;">
			                    <img src="../images/hair_10.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>비건 샴푸바 동백</p>
			                        <p>15,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="10">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_11.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_11.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>샴푸바 민감용</p>
			                        <p>11,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="11">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_12.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_12.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>베이직 케어 세트</p>
			                        <p>14,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="12">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_hair_13.jsp" style="text-decoration-line: none;">
			                    <img src="../images/hair_13.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 헤어 케어 세트</p>
			                        <p>19,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="37">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_living_5.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_5.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>설거지 비누 무화과 100g</p>
			                        <p>6,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="38">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_living_6.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_6.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>리포레스트 인센스 스틱</p>
			                        <p>18,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="39">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_living_7.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_7.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>식기세척기 세제 타블렛 240g</p>
			                        <p>16,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="40">
							<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">
			                <a href="product_2_living_8.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_8.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>설거지 비누 풋귤 1kg</p>
			                        <p>32,000원</p>
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
		                <li id="page_1"><a href="product_list_all.jsp">  1&nbsp;</a></li>
		                <li id="page_2"><b>&nbsp;2&nbsp;</b></li>
		                <li id="page_3"><a href="product_1_3.jsp">&nbsp;3&nbsp;</a></li>
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