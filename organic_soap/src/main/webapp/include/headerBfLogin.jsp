<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String search="";
%>

<!DOCTYPE html> 
<html> 
<head>
<meta charset="UTF-8">
<title>OrganicSOAPS</title>
<link rel="stylesheet" href="../css/headerBfLogin.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />    
</head>
<body>
<div class="container">
        <!-- header 시작. 로그인되지 않은 상태 -->
        <div class="header1">
                <form name="hSearchFrm" method="post" action="#">
                    <div class="search" id="btn">
                        <input id="search1" type="text" name="search" placeholder="SEARCH">
                        <button id="icon" onclick="check()"><i class="material-icons">search</i></button>
                    </div>
                </form>  
            <div class="header2">
                <div id="logo"><a href="../index.jsp"><img src="../images/logo.png"></a></div>
                <ul class="dropdown">
                    <li class="selected">
                        <a href="../index.jsp">home</a>
                    </li>
                    <li class="pro1">
                        <a href="../product/product_list_all.jsp">product</a>
                        <div class="dropdown-content1">
                            <a href="../product/product_list_all.jsp">ALL</a>
                            <a href="../product/product_1_hair.jsp">HAIR</a>
                            <a href="../product/product_1_face.jsp">FACE / BODY</a>
                            <a href="../product/product_1_living.jsp">LIVING</a>
                        </div>
                    </li>
                    <li class="pro2">
                        <a href="../board/board_main1.jsp">help center</a>
                        <div class="dropdown-content2">
                            <a href="../board/board_list.jsp">NOTICE</a>
                            <a href="../board/qna_list.jsp" style="text-transform: none;">QnA</a>
                        </div>
                    </li>
                    <li>
                        <a href="../member/register.jsp">Join</a>
                    </li>
                    <li>
                        <a href="../member/login.jsp">Login</a>
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
		document.hSearchFrm.action="../product/good_search.jsp";
		document.hSearchFrm.submit();
		}
	}
	
	
	/*function check(){
	let search1 = document.getElementById("search1").value;
	if(search1 == ""){
		alert("검색어를 입력하세요.");
		document.hSearchFrm.search.focus();
	} else {
		document.hSearchFrm.action="product/product.jsp";
		document.hSearchFrm.submit();
		}
	}*/
	
</script>