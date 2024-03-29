<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="member.memberBean" %>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
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
	  
	Vector<BoardBean> vlist = null;
	
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
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	//게시판 조회 메서드 호출
	vlist = bMgr.getBoardList(keyField, keyWord, start, end);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
	
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
	
	String mem_mail = (String)session.getAttribute("emailKey");
%>
<!DOCTYPE html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/board_list.css">
    </head>
    <body>
 <jsp:include page="../include/headerLogin.jsp" />
    

        <!-- 본문 시작 -->
        <main>
        <div class="main">
            <h2>공지사항</h2>
            <div class="b_search">
                <form method="get" action="#">
                    <input type="text" name="b_search" value="" placeholder="SEARCH">
                    <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
                </form>
            </div>
            <!-- 게시판 목록 -->
            <div class="b_list">
                <table width="1300">
                    <thead>
                        <tr>
                            <th style="width: 5%;">No</th>
                            <th>제목</th>
                            <th style="width: 10%">작성일자</th>
                            <th style="width: 15%">글쓴이</th>
                            <th style="width: 10%">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    	for (int i=0; i<vlist.size(); i++) {
						BoardBean bean = vlist.get(i);
						int board_key = bean.getBoard_key();
						String board_subject = bean.getBoard_subject();
						int board_count = bean.getBoard_count();
						String board_date = bean.getBoard_date();
						String board_write = bean.getBoard_write();
					%>
                        <tr>
                            <td><%=totalRecord-((nowPage-1)*numPerPage)-i%></td>
                            <td id="b_title"><a href="javascript:read('<%=board_key%>')"><%=board_subject%></a></td>
                            <td><%=board_date%></td>
                            <td><%=board_write%></td>
                            <td><%=board_count%></td>
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
              <%if(mem_mail != null && mem_mail.equals("imm@naver.com")) {%>
 			<input type="button" value="글쓰기" class="btn" 
         		onclick="location.href='notice_write.jsp'">
<%}%>
                <!-- 글쓰기 버튼 끝 -->
            </div>
            </div>
        </main>
        <!-- 본문 끝 -->

 <jsp:include page="../include/footer.jsp" />
        
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> 
			<input type="hidden" name="nowPage" value="1">
		</form>
		<form name="readFrm" method="get">
			<input type="hidden" name="board_key"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="keyField" value="<%=keyField%>"> 
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		</form>
    </body>
</html>
<script>
	function board_list() {
		document.listFrm.action = "board_list.jsp";
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
	
	function read(board_key){
		document.readFrm.board_key.value=board_key;
		document.readFrm.action="board_view.jsp";
		document.readFrm.submit();
	}
	
	function check() {
	     if (document.searchFrm.keyWord.value == "") {
	   alert("검색어를 입력하세요.");
	   document.searchFrm.keyWord.focus();
	   return;
	     }
	  document.searchFrm.submit();
	 }

</script>