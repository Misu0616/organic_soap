<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/pro_1_living_2.css">
        <script src="../js/product_list_all.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    <body>
	    <div class="container">
		    <!-- header 시작 -->
			<%@include file="../include/headerLogin.jsp" %><p/>  
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
		                <a href="product_2_living_21.jsp" style="text-decoration-line: none;">
		                    <img src="../images/living_21.png" width="300px" height="300px">
		                    <div class="item-te">
		                        <p>올바른 설거지 워싱바 500g</p>
		                        <p>14,000원</p>
		                    </div>
		                </a>
		                <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite </span>
		            </div> 
		
		            <div class="item-ima" >
		                <a href="product_2_living_22.jsp" style="text-decoration-line: none;"
		                    ><img src="../images/living_22.png" width="300px" height="300px">
		                    <div class="item-te">
		                        <p>올바른 설거지 워싱바 150g</p>
		                        <p>6,000원</p>
		                    </div>
		                </a>
		                <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite </span>
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