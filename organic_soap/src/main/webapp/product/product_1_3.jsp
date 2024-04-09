<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.memberMgr"/> 
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/pro_1_3.css">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="41">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="42">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="43">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="44">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="45">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="46">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="47">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="48">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="49">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="50">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="51">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="52">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
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
		                <li id="page_1"><a href="product_list_all.jsp">  1&nbsp;</a></li>
		                <li id="page_2"><a href="product_1_2.jsp">&nbsp;2&nbsp;</a></li>
		                <li id="page_3"><b>&nbsp;3&nbsp;</b></li>
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