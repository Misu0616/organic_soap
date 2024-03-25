<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
	  request.setCharacterEncoding("UTF-8");

	  int board_key = Integer.parseInt(request.getParameter("board_key"));

		String nowPage = request.getParameter("nowPage");
		bMgr.upCount(board_key);//조회수 증가 
	  
	 
	  BoardBean bean = bMgr.getBoard(board_key);//게시물 가져오기
	  
	  
	  String board_write = bean.getBoard_write();
	  String board_subject = bean.getBoard_subject();
      String board_date = bean.getBoard_date();
	  String board_content = bean.getBoard_content();
	  String board_file_name = bean.getBoard_file_name(); 
	  int board_count = bean.getBoard_count();
	  
	  session.setAttribute("bean", bean);//게시물을 세션에 저장
	  
		String url = "board_list.jsp?nowPage=" + nowPage;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OrganicSOAPS</title>
    <link rel="stylesheet" href="../css/board_edit.css">
</head>
<body>
<jsp:include page="../include/headerLogin.jsp"></jsp:include>

    <main>
        <h1>공지사항</h1>
        <h2><%=board_subject%></h2>
        <p style="margin-left: 20px;"><%=board_write%></p>
                    <div class="admin">
                        <p><%=board_date%> &nbsp;조회수 &nbsp;<%=board_count%></p>
                    </div>
                    <hr>
                        <div class="b_write">
                        <%=board_content%>
                            </div>
                    <hr>
                    <div class="button">
            <form method="get" action="board_list.jsp" name="">
                <input type="button" value="목록" onclick="window.location='board_list.jsp'" style="width: 50px; height: 30px;">
                <input type="button" value="수정" onclick="window.location='board_update.jsp'" style="width: 50px; height: 30px;">
                </form>
                <form method="get" action="board_list.jsp" name="delFrm">
                
            	<input type="button" value="삭제" onclick="check()" style="width: 50px; height: 30px;" >
                
                </form>
            </div>
    </main>


<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
<script>



function check() {bMgr.deleteBoard(board_key);

response.sendRedirect(url);
	document.delFrm.submit();
}
</script>