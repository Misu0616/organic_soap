<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String pro_name = request.getParameter("pro_name");
	String pro_img = request.getParameter("pro_img");
	int  pro_price = Integer.parseInt(request.getParameter("pro_price"));
	String cart_tot = request.getParameter("cart_tot");
	String mem_name = request.getParameter("mem_name");
	String mem_tel = request.getParameter("mem_tel");
	String mem_email = request.getParameter("mem_email");
	String mem_postal_code = request.getParameter("mem_postal_code");
	String mem_address1 = request.getParameter("mem_address1");
	String mem_address2 = request.getParameter("mem_address2");
	int mem_key = Integer.parseInt(request.getParameter("mem_key"));
	
	String r_name = request.getParameter("r_name");
	String r_phone = request.getParameter("r_phone");
	String r_postal_code = request.getParameter("r_postal_code");
	String r_address1 = request.getParameter("r_address1");
	String r_address2 = request.getParameter("r_address2");
	String memo = request.getParameter("memo");
	
	int my_point = Integer.parseInt(request.getParameter("my_point"));
	int use_point = Integer.parseInt(request.getParameter("point"));
	int get_point = Integer.parseInt(request.getParameter("get_point"));
	
	int shipping_fee = Integer.parseInt(request.getParameter("shipping_fee"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
				<%=pro_name %><%=pro_img %><%=pro_price %><%= cart_tot%><%=mem_name %>
             	<%=mem_tel %><%=mem_email %><%= mem_postal_code%><%=mem_address1 %>
             	<%=mem_address2 %><%=mem_key %><%=r_name %><%= r_phone%><%=r_postal_code %>
             	<%=r_address1 %><%=r_address2 %><%= memo%>
             	<%= my_point%><%= use_point%><%= get_point%>
             	<%=shipping_fee %>
</body>
</html>