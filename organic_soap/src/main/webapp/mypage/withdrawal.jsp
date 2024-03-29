<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 탈퇴</title>
	<link href="../css/mp_withdrawal.css" rel="stylesheet">
</head>
<body>
	<form action="#" method="get">
		<div class="container">
			<h2>* 회원 탈퇴 *</h2>
			<hr>
			<p>가입된 회원정보가 모두 삭제됩니다. 작성하신 게시물은 삭제되지 않습니다.<br>
			탈퇴 후 같은 계정으로 재가입 시 기존에 가지고 있던 적립금은 복원되지 않으며,<br>
			사용 및 다운로드했던 쿠폰도 사용 불가능합니다.<br>
			회원 탈퇴를 진행하시겠습니까?</p>
			<hr>
			<div id="btn">
				<button id="cancel" onclick="window.close()">취소</button>
				<button type="submit" id="withdrawal" onclick="javascript:end()">탈퇴</button>
				<input type="hidden" id="useridpw" name="useridpw">
			</div>
		</div>
	</form>
</body>
</html>
<script>
    function end() {
        alert("탈퇴가 완료되었습니다.");
        opener.location.href='../index.jsp';
        window.close();
        // 함수 호출 해서 회원 탈퇴 alert 
        // -> end함수 호출시 탈퇴하려는 회원의 id,pw 를 input 받아서 데이터를 전송해서 데이터베이스에서 
        //해당 id,pw 를 조회 한 후 delete 하는 작업을 해야됨.
    }
</script>