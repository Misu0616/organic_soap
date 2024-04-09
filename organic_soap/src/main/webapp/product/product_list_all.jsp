<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.memberMgr"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/pro_1.css">
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
			<% System.out.println("list 페이지 mem_key = " + mem_key); %>
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
				            <input type="hidden" name="wish_pro_key" value="4">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>"> 										      
				            <a href="product_2_hair_4.jsp" style="text-decoration-line: none;">
				                <img src="../images/hair_4.jpg" width="300px" height="300px">
				                <div class="item-te">
				                    <p>비건 동백 헤어 세트</p>
				                	<p>30,000원</p>
				             	</div>
				             </a>
				        	<button type="button" class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
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
				    	    <button class="material-symbols-outlined" id="icon1" onclick="style.color='red', save()">favorite</button>
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
		            	<form method="post" action="wishServlet">
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
			                        <p>비건 트리트먼트바 동백</p>
			                        <p>15,000원</p>
			                    </div>
			                </a>
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div> 
		
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
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>"> 
			                <a href="product_2_face_2.jsp" style="text-decoration-line: none;">
			                    <img src="../images/face_2.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>앰플 세안바 다시마 폼클렌징</p>
			                        <p>15,300원</p>
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
				            <input type="hidden" name="wish_pro_key" value="33">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>"> 
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="34">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>"> 
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="35">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>"> 
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
		            	<form method="post" action="">
				            <input type="hidden" name="wish_pro_key" value="36">
							<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>"> 
			                <a href="product_2_living_4.jsp" style="text-decoration-line: none;">
			                    <img src="../images/living_4.png" width="300px" height="300px">
			                    <div class="item-te">
			                        <p>비건 설거지 비누 녹차</p>
			                        <p>8,000원</p>
			                    </div> 
			                </a>       
			                <button class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</button> 
						</form>
		            </div>
		
		        </div> 
	          
	        	 <!--페이지 이동-->
		        <br>
		        <br>
		        <br>
		         <br>
		        <div>
		            <ul class="page">
		                <li id="page_1"><b>1&nbsp;</b></li>
		                <li id="page_2"><a href="product_1_2.jsp">&nbsp;2&nbsp;</a></li>
		                <li id="page_3"><a href="product_1_3.jsp">&nbsp;3&nbsp;</a></li>
		            </ul>
		        </div> 
		         <!--페이지 이동 끝-->         
	   		</div> 
	        <!-- 본문 끝 -->
	        
	        <!-- footer 시작 -->
			<%@include file="../include/footer.jsp" %><p/>
			<!-- footer 끝. -->
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

</script>


