<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.memberMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		  request.setCharacterEncoding("UTF-8");
	
		  String mem_email = request.getParameter("mem_email");
		  String mem_pw = request.getParameter("mem_pw");
		  
		  String url = "../index.jsp";
		  String msg = "로그인에 실패 하였습니다.";
		  
		  boolean result = mMgr.loginMember(mem_email, mem_pw);
		  
		  if(result){
			 
			int mem_key = mMgr.sessionKey(mem_email);
			  
		    session.setAttribute("mem_key",mem_key);
		    msg = "로그인에 성공 하였습니다.";
		  }
	%>
</body>
</html>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>