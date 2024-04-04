<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mMgr" class="member.memberMgr"/>
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/pro_1_living.css">
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
		                <p><h3>Living</h3></p>
		            </div>
		        </div>
		         <!--상단 메뉴 끝-->
		        <div class="items">
		            
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="33">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_1.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_1.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>설거지 비누 무화과 500g</p>
			                        <p>28,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="34">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_2.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_2.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>리포레스트 인센스 홀더</p>
			                        <p>22,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="35">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_3.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_3.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>리포레스트 인센스 세트</p>
			                        <p>40,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="36">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_4.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_4.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>비건 설거지 비누 녹차 100g</p>
			                        <p>8,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="37">
							<input type="hidden" name="wish_mem_key" value="1">
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
							<input type="hidden" name="wish_mem_key" value="1">
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
							<input type="hidden" name="wish_mem_key" value="1">
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
							<input type="hidden" name="wish_mem_key" value="1">
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
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="41">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_9.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_9.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>씹는 고체치약 45정</p>
			                        <p>11,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="42">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_10.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_10.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>설거지 비누 풋귤 100g</p>
			                        <p>5,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="43">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_11.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_11.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>친환경 고체 세탁 세제 70정</p>
			                        <p>29,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="44">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_12.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_12.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 세탁비누 소프넛 200g</p>
			                        <p>7,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="45">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_13.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_13.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 설거지 워싱바 대용량 1kg</p>
			                        <p>28,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="46">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_14.jsp" style="text-decoration-line: none;">
			                        <img src="../images/living_14.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 설거지 워싱바 400g</p>
			                        <p>12,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="47">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_15.jsp" style="text-decoration-line: none;">
			                        <img src="../images/living_15.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 설거지 워싱바 300g</p>
			                        <p>10,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="48">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_16.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_16.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 설거지 워싱바 100g</p>
			                        <p>5,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="49">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_17.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_17.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 설거지 워싱바 선물세트</p>
			                        <p>32,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="50">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_18.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_18.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>씹는 고체치약 대용량 180정</p>
			                        <p>20,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="51">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_19.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_19.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>올바른 수세미 대형</p>
			                        <p>4,500원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		            <div class="item-ima" >
		            	<form method="post" action="wishServlet">
				            <input type="hidden" name="wish_pro_key" value="52">
							<input type="hidden" name="wish_mem_key" value="1">
			                <a href="product_2_living_20.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_20.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>수세미 기본형</p>
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
		                <li id="page_1"><b>1&nbsp;</b></li>
		                <li id="page_2"><a href="product_1_living_2.jsp">&nbsp;2&nbsp;</a></li>
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