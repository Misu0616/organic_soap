<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OrganicSOAPS</title>
    <link rel="stylesheet" href="../css/board_write.css">
</head>
<body>
		<jsp:include page="../include/headerLogin.jsp"></jsp:include>

    <!-- 본문 시작 -->
    <main>
        <h2>공지사항</h2>
        <hr>
        <form name="postFrm" method="post" action="boardPost" enctype="multipart/form-data">
            <div class="size">
            <ul>
                <li>제목&nbsp;&nbsp; <input type="text" name="board_subject" id="t_text" required style="width: 600px; height: 30px;"></li>
                <li style="border-bottom: none;">본문</li>
                <li>
                    <textarea id="editor" name="board_content" required cols="100" rows="30"></textarea></li>
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
        </form>
</main>
<!-- 본문 끝 -->

		<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
<script>
    function check() {

let title = document.getElementById('t_text');
let edit = document.getElementById('editor');

if(title.value==""){
alert("제목을 입력해주세요.");
exit;
}
else if(edit.value==""){
    alert("내용을 작성해주세요.");
    exit;
}
else {
    alert("등록 되었습니다.")
}
}
</script>