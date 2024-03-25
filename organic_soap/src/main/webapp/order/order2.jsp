<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/order2.css">
<script type="text/javascript" src="../js/order.js"></script>
</head>
<body>
	<jsp:include page="../include/headerLogin.jsp" />
            <div id="div">
             <form method="post" action="#">
             	<h2>배송 정보 입력</h2>
                  	<section class="section1"> 
                    <div class="pointInfo"><p id="bold">포인트</p> 
                        <p/>
                        <div>
                            <label for="point"></label>
                            <input type="text" class="inputline" id="point" name="포인트" size="45" placeholder="0">
                            <button name="useall" name="전액사용하기" value="전액 사용" class="use">전액 사용</button>
                        <p/> 보유 포인트 0
                        <p class="fontColor"> 10 포인트 이상 보유 및 10,000원 이상 구매시 </p>
                        <p class="fontColor"> 사용 가능</p>
                        </div>
                    </div>
                    <p/>
                    <!-- section 1에 position-fixed 값을 넣으면 input 입력이 안 돼서 일단 제외
                    모델 사이트처럼 float이 되지 않음 -->
                    <div class="div1"> <p id="bold">주문 요약</p>
                        <section id="divinline1"><p>상품 가격</p>
                            <p>배송비</p></section>
                        <section id="divinline2"><p>13,500원</p>
                            <p>3000원</p></section>
                        <hr>
                        <section id="divinline1"><p>총 주문 금액</p></section>
                        <section id="divinline3"><p>16,500원</p></section>
                    </div>
                    <div class="getPoint">
                        포인트 적립 예정 : 500원
                    </div>
                        <p/>
                    <div class="pointInfo"> <p id="bold">결제 수단</p>
                        <p class="p1">
                        <label for="pay1"></label>
                        <input type="radio" name="pay" value="credit" id="pay1">신용카드
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="pay1"></label>
                        <input type="radio" name="pay" value="virtual" id="pay2">가상계좌</p>

                        <p class="p1"><label for="pay3"></label>
                        <input type="radio" name="pay" value="naver" id="pay3">네이버 페이 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="pay4"></label>
                        <input type="radio" name="pay" id="pay4">삼성페이</p>
                    </div>
                        <p/>
                    <div class="div1">
                        <p/>
                        <input type="checkbox" id="agree" name="agreetoo" required> 구매 조건 확인 및 결제 진행에 동의 
                        <p/>
                    </div>
                    <div>
                        <button type="submit" class="finalpay" name="paylast" value="lastpay">결제하기</button>
                    </div>
                        <p/><br>
                </section>
                 </form>
            </div>
    <jsp:include page="../include/footer.jsp" />
</body>
</html>
