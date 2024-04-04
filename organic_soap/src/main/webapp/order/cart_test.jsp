<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String mem_key = (String)session.getAttribute("mem_key");
if(mem_key !=null){
%>
	<jsp:include page="../include/headerLogin.jsp" />
	<% } else { %>
		<jsp:forward page="index.jsp" />
	<%	} %>
	<form method="post" action="orderServlet">
		<input type="submit" value="장바구니 데이터 이동">
	</form> 
</body>
</html>