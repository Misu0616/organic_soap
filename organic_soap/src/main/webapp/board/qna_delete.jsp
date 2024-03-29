<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.QnaBean"%>
<jsp:useBean id="qMgr" class="board.QnaMgr" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP Board</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<%
		request.setCharacterEncoding("UTF-8");
	
	String nowPage = request.getParameter("nowPage");
		
		int qna_key = Integer.parseInt(request.getParameter("qna_key"));
		
		if (request.getParameter("qna_pass") != null) {
			
			String qna_pass = request.getParameter("qna_pass");
			
			QnaBean qbean = (QnaBean) session.getAttribute("qbean");
			
			//bean 객체에서 pass 값을 받아서 변수에 저장.
			String dbPass = qbean.getQna_pass();
			
			if (qna_pass.equals(dbPass)) {
				
				qMgr.deleteQna(qna_key);
				
				String url = "qna_list.jsp?nowPage=" + nowPage;
				
				response.sendRedirect(url);
				
			} else { //두 pass 가 서로 같지 않다면 아래 script 내용 실행.
	%>
	<script type="text/javascript">
		alert("입력하신 비밀번호가 아닙니다.");
		history.back();
	</script>
	<%}
		} else {
	%>
	<script type="text/javascript">
		function check() {
			if (document.delFrm.pass.value == "") {
				alert("패스워드를 입력하세요.");
				document.delFrm.pass.focus();
				return false;
			}
			document.delFrm.submit();
		}
	</script>
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
			<br/><br/>
			<table width="600" cellpadding="3">
				<tr>
					<td bgcolor=#dddddd height="21" align="center">
						사용자의 비밀번호를 입력해주세요.
					</td>
				</tr>
			</table>
			<form name="delFrm" method="post" action="delete.jsp">
				<table width="600" cellpadding="2">
					<tr>
						<td align="center">
							<table>
								<tr>
									<td align="center">
										<input type="password" name="pass" size="17" maxlength="15">
									</td>
								</tr>
								<tr>
									<td><hr size="1" color="#eeeeee"/></td>
								</tr>
								<tr>
									<td align="center">
										<input type="button" value="삭제완료" onClick="check()"> 
										<input type="button" value="뒤로" onClick="history.go(-1)">
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
				<input type="hidden" name="qna_key" value="<%=qna_key%>">
			</form>
		</div>
		<%}%>
</body>
</html>