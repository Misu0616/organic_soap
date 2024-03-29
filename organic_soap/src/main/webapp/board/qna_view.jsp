<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="board.QnaBean"%>
<jsp:useBean id="qMgr" class="board.QnaMgr" />
<%
	  request.setCharacterEncoding("UTF-8");

	  int qna_key = Integer.parseInt(request.getParameter("qna_key"));
	  
		String nowPage = request.getParameter("nowPage");

		  String keyField = request.getParameter("keyField");
		  String keyWord = request.getParameter("keyWord");
	 
	  QnaBean qbean = qMgr.getQna(qna_key);//게시물 가져오기
	  
	  
	  String mem_name = qbean.getMem_name();
	  String qna_subject = qbean.getQna_subject();
      String qna_date = qbean.getQna_date();
	  String qna_content = qbean.getQna_content();
	  String qna_file_name = qbean.getQna_file_name();
	  String reply_write = qbean.getReply_write();
	  String reply_content = qbean.getReply_content();
	  String reply_date = qbean.getReply_date();
	  String reply_file_name = qbean.getReply_file_name(); 
	  int reply_key = qbean.getReply_key();
	  
	  session.setAttribute("bean", qbean);//게시물을 세션에 저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main>
        <h1>1:1 문의</h1>
        <h2><%=qna_subject%></h2>
        <p style="margin-left: 20px;"><%=mem_name%></p>
                    <div class="b_date">
                        <p><%=qna_date%></p>
                    </div>
                    <hr style="border: 0; height: 3px; background-color: black;">
                    <div class="view">
                        <p class="f_strong">Q.</p>
                        <p><%=qna_content%></p>
                    </div>
        <hr class="QnA_line">

                    <div class="b_line">
                    <p style="margin-left: 20px;"><%=reply_write%></p>
                                <div class="b_date">
                                    <p><%=reply_date%></p>
                                </div>
                            </div>
                                <div class="view">
                                    <p class="f_strong">A.</p>
                                    <p><%=reply_content%></p>
                                </div>
	 [ <a href="javascript:list()" >리스트</a> | 
	 <a href="qna_update.jsp?nowPage=<%=nowPage%>&num=<%=qna_key%>" >수 정</a> |
	 <a href="qna_reply.jsp?nowPage=<%=nowPage%>" >답 변</a> |
	 <a href="qna_delete.jsp?nowPage=<%=nowPage%>&num=<%=qna_key%>">삭 제</a> ]<br/>

    </main>
    <form name="downFrm" action="download.jsp" method="post">
		<input type="hidden" name="filename">
	</form>
	
	<form name="listFrm" method="post" action="qna_list.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<%if(!(keyWord==null || keyWord.equals(""))){ %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%}%>
		</form>
</body>
</html>
<script>
	function list(){
		document.listFrm.submit();
		
		} 
		
	function down(filename){
		document.downFrm.filename.value=filename;
		document.downFrm.submit();
	}
</script>