<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="board.QnaBean"%>
    <%@page import="member.memberBean" %>
<%@page import="java.util.Vector"%>
<jsp:useBean id="qMgr" class="board.QnaMgr" />

<%	
	  request.setCharacterEncoding("UTF-8");



      int totalRecord=0;
	  int numPerPage=10;
	  int pagePerBlock=15;
	  
	  int totalPage=0;
	  int totalBlock=0; 

	  int nowPage=1;
	  int nowBlock=1;
	  

	  int start=0;
	  int end=10;
	  

	String keyWord = "", keyField = ""; 
	  
	Vector<QnaBean> qlist = null;
	
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	totalRecord = qMgr.getTotalCount(keyField, keyWord);
	//게시판 조회 메서드 호출
	qlist = qMgr.getQnaList(keyField, keyWord, start, end);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/board_QnA.css">
    </head>
    <body>
    		<jsp:include page="../include/headerLogin.jsp" />
    
    <main>
        <h2>1:1 문의 게시판</h2>
        <table>
            <thead>
                <tr>
                    <th>제목</th>
                    <th style="width: 100px">작성자</th>
                    <th style="width: 200px">문의상태</th>
                    <th style="width: 100px">작성일자</th>
                </tr>
            </thead>
            <tbody>
                <%
                
                    	for (int i=0; i<qlist.size(); i++) {
						QnaBean bean = qlist.get(i);
						int qna_key = bean.getQna_key();
						String qna_subject = bean.getQna_subject();
						String qna_date = bean.getQna_date();
						String mem_name = bean.getMem_name();
						int qna_mem_key = bean.getQna_mem_key();
						int reply_qna_key= bean.getReply_qna_key();
					%>
                        <tr>
                            <td id="b_title"><a href="javascript:read('<%=qna_key%>')"><%=qna_subject%></a></td>
                            <td><%=mem_name%></td>
                            <td><%
                            	if (reply_qna_key != 0) {
                            		out.println("답변완료");
                            	} else {
                            		out.println("답변 대기중");
                            	}
                            %></td>
                            <td><%=qna_date%></td>
                        </tr>
                        <%}%>
                
            </tbody>
            <tr>
				<td>
				<%
	   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ;
	   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
	   				 
	   				  if(totalPage !=0){
	    			  	if (nowBlock > 1) {%>
	    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev</a><%}%>&nbsp; 
	    			  		<%for ( ; pageStart < pageEnd; pageStart++){%>
	     			     	<a href="javascript:pageing('<%=pageStart %>')"> 
	     					<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
	     					[<%=pageStart%>] 
	     					<%if(pageStart==nowPage) {%></font> <%}%></a> 
	    					<%}//for%>&nbsp; 
	    					<%if (totalBlock > nowBlock ) {%>
	    					<a href="javascript:block('<%=nowBlock+1%>')">next</a>
	    			<%}%>&nbsp;  
	   			<%}%>
				</td>
                </table>
                <!-- 게시판 목록 끝 -->
                <!-- 글쓰기 버튼 -->
                <div class="write">
                    <a href="qna_write.jsp">글쓰기</a>
                </div>
    </main>
    <form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> 
			<input type="hidden" name="nowPage" value="1">
		</form>
		<form name="readFrm" method="get">
			<input type="hidden" name="qna_key"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="keyField" value="<%=keyField%>"> 
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		</form>
		
				<jsp:include page="../include/footer.jsp" />
		
    </body>
</html>
<script>
	function qna_list() {
		document.listFrm.action = "qna_list.jsp";
		document.listFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value){
		 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		 document.readFrm.submit();
	} 
	
	function read(qna_key){
		document.readFrm.qna_key.value=qna_key;
		document.readFrm.action="qna_view.jsp";
		document.readFrm.submit();
	}

</script>