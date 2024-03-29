<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean"%>
<% 

		int board_key = Integer.parseInt(request.getParameter("board_key"));
	  String nowPage = request.getParameter("nowPage");
	  
	  //session에 저장된 bean객체를 이용해서 게시물 정보를 각 각 변수에 저장 
	  BoardBean bean = (BoardBean)session.getAttribute("bean");
	  String board_subject = bean.getBoard_subject();
	  String board_content = bean.getBoard_content(); 
%>
<!DOCTYPE html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/board_wirte.css">
    </head>
    <body>
<jsp:include page="../include/headerLogin.jsp" />
	<main>
        <h2>공지사항</h2>
        <hr>
        <form name="updateFrm" method="post" action="boardUpdate">
            <div class="size">        
            <ul>
                <li>제목&nbsp;&nbsp; <input type="text" name="board_subject" id="t_text" value="<%=board_subject%>" required style="width: 600px; height: 30px;"></li>
                <li style="border-bottom: none;">본문</li>
                <li>
                    <textarea id="editor" name="board_content" required cols="100" rows="30"><%=board_content%></textarea></li>
                <li>
                    <div>첨부파일&nbsp;
                        <label for="attach">
                            <input type="text" class="file" title="파일 첨부하기" readonly="readonly" style="width: 200px; height: 30px;">
                        </label>
                            <input type="file" name="search">
                    </div>
                </li>
            </ul>
            </div>
            <div class="write_btn">
				<button type="button" onclick="history.back(-1)" style="width: 80px; height: 40px; font-size: 20px;"><strong>이전</strong></button>
				<button type="submit" onclick="check();" style="width: 80px; height: 40px; font-size: 20px;"><strong>등록</strong></button>
				<input type="hidden" name="board_write" value="관리자"> 
			</div>
			<jsp:include page="../include/footer.jsp" />
	 <input type="hidden" name="nowPage" value="<%=nowPage%>">
	 <input type='hidden' name="board_key" value="<%=board_key%>">
	</form>
	</main>
</body>
</html>
<script>
	function check() {
		  alert("수정되었습니다.")
		  document.updateFrm.submit();
	}
</script>