<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrganicSOAPS</title>
<link rel="stylesheet" href="../css/headerLogin.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
<div class="container">
        <!-- header 시작. 로그인된 상태 -->
        <div class="header1">
            <form name="hSearchFrm" method="get" action="../product/search_product.jsp">
                <div class="search" id="btn">
                    <input id="search1" type="text" name="search" placeholder="SEARCH">
                    <button id="icon" onclick="check()"><i class="material-icons">search</i></button>
                </div>
            </form>  
            <div class="header2">
                <div id="logo"><a href="../index.html"><img src="../images/logo.png"></a></div>
                <ul class="dropdown">
                    <li class="selected">
                        <a href="../index.html">home</a>
                    </li>
                    <li class="pro1">
                        <a href="../product/product_list_all.html">product</a>
                        <div class="dropdown-content1">
                            <a href="product_list_all.html">ALL</a>
                            <a href="product_1_hair.html">HAIR</a>
                            <a href="product_1_face.html">FACE / BODY</a>
                            <a href="product_1_living.html">LIVING</a>
                        </div>
                    </li>
                    <li class="pro2">
                        <a href="../board/board_main1.html">help center</a>
                        <div class="dropdown-content2">
                            <a href="../board/board_main1.html">NOTICE</a>
                            <a href="../board/board_main1.html" style="text-transform: none;">QnA</a>
                        </div>
                    </li>
                    <li>
                        <a href="../mypage/order.html">My Page</a>
                    </li>
                    <li>
                        <a href="../order/cart.html">Cart</a>
                    </li>
                </ul>
            </div>
        </div>
</body>
</html>
<script>
function check(){
	if(document.hSearchFrm.search1.value == ""){
		alert("검색어를 입력하세요.");
		document.hSearchFrm.search.focus();
		return;
	} else {
		document.hSearchFrm.submit();
		}
	}
</script>