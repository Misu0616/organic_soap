<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.QnaBean"%>
<% 

		int qna_key = Integer.parseInt(request.getParameter("qna_key"));
	  String nowPage = request.getParameter("nowPage");
	  
	  //session에 저장된 bean객체를 이용해서 게시물 정보를 각 각 변수에 저장 
	  QnaBean qbean = (QnaBean)session.getAttribute("bean");
	  String qna_subject = qbean.getQna_subject();
	  String qna_content = qbean.getQna_content();
	  String mem_name = qbean.getMem_name(); 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/board_wirte.css">
    </head>
    <body>
        
	<main>
        <h2>공지사항</h2>
        <hr>
        <form name="updateFrm" method="post" action="qnaUpdate">
            <div class="size">        
            <ul>
                <li>제목&nbsp;&nbsp; <input type="text" name="board_subject" id="t_text" value="<%=qna_subject%>" required style="width: 600px; height: 30px;"></li>
                <li style="border-bottom: none;">본문</li>
                <li>
                    <textarea id="editor" name="board_content" required cols="100" rows="30"><%=qna_content%></textarea></li>
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
				<input type="hidden" name="mem_name" value="<%=mem_name%>"> 
			</div>
	 <input type="hidden" name="nowPage" value="<%=nowPage%>">
	 <input type='hidden' name="qna_key" value="<%=qna_key%>">
	</form>
	</main>
</body>
</html>
<script>
function check() {
	  if (document.updateFrm.pass.value == "") {
		alert("수정을 위해 패스워드를 입력하세요.");
		document.updateFrm.pass.focus();
		return false;
		}
	  document.updateFrm.submit();
}

</script>