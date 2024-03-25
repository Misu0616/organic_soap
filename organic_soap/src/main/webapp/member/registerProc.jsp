<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%request.setCharacterEncoding("UTF-8");%>
<!-- MemberMgr 클래스 와 MemberBean 클래스 빈 사용  -->
<jsp:useBean id="mgr" class="member.memberMgr"/>
<jsp:useBean id="bean" class="member.memberBean"/>  
<!-- MemberBean 클래스 setProperty 사용 -->
<jsp:setProperty property="*" name="bean"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
		boolean result = mgr.registerMember(bean);
		
		String msg = "회원가입에 실패하였습니다. 다시 시도해주세요.";
		
		String location = "register.jsp";
		
		if(result) {
			msg = "회원가입이 완료되었습니다.";
			
			location = "../index.jsp";
		}
	%>
</body>
</html>
<script>
	alert("<%=msg%>");
	
	location.href = "<%=location%>"
</script>