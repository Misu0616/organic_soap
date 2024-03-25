<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/good_search.css">
        <script src="../js/product_list_all.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    <body>
        <div class="container">
            <!-- header 시작 -->
            <%@include file="../include/headerLogin.jsp" %><p/>  
            <!-- 헤더 끝 -->

            <!-- 본문 시작 -->  
            <div class="every">    
                <form>
                	<div class="search1">
	                    <div class="search2"><b>"입욕제" 검색결과 5개</b></div>
	                    <div class="search3">
	                        <div>
	                        	<b>상품명</b>
		                       	<input class="sch1"  type="text">
		                        <button class="sch2" onclick="check()"><i class="material-icons">search</i></button>
		                    </div>
	                    </div>
	                </div> 
	                <!--상단 메뉴 시작-->
                
                    <!--상단 메뉴 끝-->
                    <div class="items">     
                        
                        <div class="item-ima" >
                            <a href="product_2_face_1.jsp" style="text-decoration-line: none;">
                                <img src="../images/face_1.png" width="300px" height="300px">
                                <div class="item-te">
                                    <p>릴랙싱 모먼트 배쓰밤 입욕제 세트</p>
                                    <p>28,000원</p>
                                </div> 
                            </a>       
                            <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</span>
                        </div> 

                        <div class="item-ima" >
                            <a href="product_2_face_9.jsp" style="text-decoration-line: none;">
                                <img src="../images/face_9.png" width="300px" height="300px">
                                <div class="item-te">
                                    <p>올바른 거품입욕제 페퍼민트</p>
                                    <p>7,000원</p>
                                </div> 
                            </a>       
                            <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</span>
                        </div>

                        <div class="item-ima" >
		                <a href="product_2_face_10.jsp" style="text-decoration-line: none;">
		                    <img src="../images/face_10.png" width="300px" height="300px">
		                    <div class="item-te">
		                        <p>올바른 거품입욕제 로즈</p>
		                        <p>7,000원</p>
		                    </div>
		                </a>
		                <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite </span>
		            </div>
		
		            <div class="item-ima" >
		                <a href="product_2_face_11.jsp" style="text-decoration-line: none;">
		                    <img src="../images/face_11.png" width="300px" height="300px">
		                    <div class="item-te">
		                        <p>올바른 거품입욕제 레몬그라스</p>
		                        <p>7,000원</p>
		                    </div>
		                </a>
		                <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite </span>
		            </div>
		
		            <div class="item-ima" >
		                <a href="product_2_face_12.jsp" style="text-decoration-line: none;">
		                    <img src="../images/face_12.png" width="300px" height="300px">
		                    <div class="item-te">
		                        <p>올바른 거품입욕제 라벤더</p>
		                        <p>7,000원</p>
		                    </div>
		                </a>
		                <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite </span>
		            </div>

                    </div> 
                </form>  
                <!-- 본문 끝 -->

                <!-- 푸터 시작 -->
                <%@include file="../include/footer.jsp" %><p/>
                <!-- 푸터 끝 -->
            </div>
        </div>
    </body>
</html>