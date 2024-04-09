<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.memberMgr"/>
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/pro_2.css">
        <script src="../js/product_list_all.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    <body>
        <div class="container">
           <!-- header 시작 -->
			<% String mem_key = (String)session.getAttribute("mem_key");
			 if (mem_key == null){%>
				 <jsp:include page="../include/headerBfLogin.jsp" />
			 	
			 	<% }else{%>
			 	<jsp:include page="../include/headerLogin.jsp" />
			 	<% } %>
			
			<!-- header 끝. -->

            <!-- 본문 시작 -->
             <div class="every">
                <div class="cate">
                    <ul>
                        <li id="gory1"><a href="product_list_all.jsp"><h3>All</h3></a></li>
                        <li id="gory2"><a href="product_1_living.jsp"><h3>&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;Living</h3></a></li>
                    </ul>
                </div>   
                <form name="pro" method="post" action="">	
                	<input type="hidden" name="wish_pro_key" value="47">
					<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">
					       
                    <div class="po1">
                        <div id="po2">
                            <img src="../images/living_15.png" id="po3" onclick="displaySrc()">
                            <div id="small-pic">
                                 <img src="../images/living_15.png" class="small">
                                 <img src="../images/living_15_1.png" class="small">
                                 <img src="../images/living_15_2.png" class="small">
                             </div>
                         </div>
                        <div id="text">
                            <h1>올바른 설거지 워싱바 300g</h1>
                            <h2>10,000원</h2>
                            <div id="heart"> 
                                <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite </span>
                            </div>
                    </form> 
					            <hr>
					<form name="pro" method="post" action="productServlet">				
						<input type="hidden" name="pro_count" id="result11">
						<input type="hidden" name="pro_price" id="price11">
						<input type="hidden" name="cart_pro_key" value="47">
						<input type="hidden" id="mm1" name="cart_mem_key" value="<%= mem_key%>">

						
                            <div class="tt">
                                <p><b>잔존 세제 걱정 없이 안심할 수 있는 설거지비누, 동구밭 올바른 설거지 워싱바</b></p>
                                <br>
                                <br>
                                <h3>올바른 설거지 워싱바 300g</h3>
                                <p><b>배송 방법</b> 택배</p>
                                <p><b>배송비</b> 3,000원</p>
                            </div>
                            <div>
                                <div>
                                    <p/>
                                    <div>
                                        <p></p>
                                    </div>
                                    <div class="addOption">
                                        <div class="addOption1"><b>상품 수량</b></div>
                                        <div class="addOption2">
                                            <div class="optionTitle" id="result2"></div>
                                            <input type='button' onclick='count2("minus")' value='-' class="plusminus">
                                            <div id='result1' class="zero">0</div>
                                            <input type='button' onclick='count("plus")' value='+' class="plusminus">
                                        </div>
                                    </div>
                                    <div class="total_price">
                                       <div class="total_price1"><b>총 합계금액</b></div>
                                        <div class="total_price2">
                                            <strong id="price">0</strong> 원
                                        </div>                                              
                                    </div>
                                    <p/>
                                    <div>
										<div class="buy">
		                                    <button id="buy1" onclick="cart()"><h3>구매하기</h3></button>                                          
		                                    <button id="buy2" onclick="cart()"><h3>장바구니</h3></button>
		                                </div>
                                    </div>
                                </div>
                            </div>
                        </div>  
                    </div>      
                </form> 
                    <div class="cate2" >
                        <div class="pos2">
                            <div class="menu">
                                <div id="menu1"><a href="product_2_living_15_de.jsp" style="color: rgb(93, 93, 93)">DETAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu2"><a href="product_2_living_15_gu.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;GUIDE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu3"><a href="product_2_living_15_re.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;<b>REVIEW</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu4"><a href="product_2_living_15_qa.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q&A</a></div>
                            </div>
                        </div>
                     </div> 
                <!--리뷰 시작-->
                <div style="margin-left: 150px; margin-right: 150px;"><hr></div>  
                
                <div class="re1">
                    <p>상품을 구매하신 분들이 작성한 리뷰입니다.</p>
                    <div id="re_1">
                        <a href="../board/review_write.jsp"onclick="window.open(this.href, '_blank', 'width=550, height=600'); return false;">리뷰 작성</a>
                    </div>
                    <br>
                    <!--리뷰작성된 글 보이기-->   
                    <br>
                    <div class="re_board">
                        <table id="re_table">
                            <tr>
                                <td id="re_grade">★★★★★</td>
                                <td id="re_title"><a href="../board/review_1.jsp" 
                                    onclick="window.open(this.href, '_blank', 'width=800, height=800'); return false;"><strong>향이 은은하니 정말 좋아요!</strong></a></td>
                                <td id="re_info">2024.02.02</td>
                                <td id="re_info">네이버페이 구매자</td>
                            </tr>
                            <tr>
                                <td id="re_grade">★★★★★</td>
                                <td id="re_title"><a href="../board/review_2.jsp" 
                                    onclick="window.open(this.href, '_blank', 'width=800, height=800'); return false;"><strong>거품이 잘나와 잘 닦여 좋아요.</strong></a></td>
                                <td id="re_info">2024.01.25</td>
                                <td id="re_info">네이버페이 구매자</td>
                            </tr>
                            <tr>
                                <td id="re_grade">★★★★★</td>
                                <td id="re_title"><a href="../board/review_3.jsp"  
                                    onclick="window.open(this.href, '_blank', 'width=800, height=800'); return false;"><strong>빠른 배송 감사합니다! 사용감도 완전 굿!!</strong></a></td>
                                <td id="re_info">2024.01.13</td>
                                <td id="re_info">네이버페이 구매자</td>
                            </tr>
                            </table>
                    </div>
                    <br>
                    <br>
                    <div id="re_2"><a href="#">리뷰 작성</a></div>
                </div>
                <!--리뷰 끝-->  
                <!-- 본문 끝 -->
                <!-- 푸터 시작 -->
                <%@include file="../include/footer.jsp" %><p/>
                <!-- 푸터 끝 -->
            </div> 
        </div>
    </body>
</html>
<script>

// 이미지 변경
    var po3 = document.querySelector("#po3");
    var smallPics = document.querySelectorAll(".small");

    for(let i = 0; i < smallPics.length; i++) {
        smallPics[i].addEventListener("click", changePic);}

    function changePic(){
        var newPic = this.src;
        console.log("클릭한 이미지의 src = " + this.src);
        po3.setAttribute("src", newPic);
    } 
// 수량 
	let a = document.querySelector('#result1'); // div태그
	let b = document.querySelector('#result11'); //input태그
	let c = document.querySelector('#price'); // div태그
	let d = document.querySelector('#price11'); //input태그

function count(type)  {
            
            let total = (parseInt(a.textContent) * 10000) +10000;
            

            if(type === 'plus') {
 
            	let countplus = parseInt(a.textContent) + 1;
            
            	a.innerText = countplus;
            	b.value = countplus;
            	console.log("div 태그 = " + a.textContent);
            	console.log("인풋태그 value = " + b.value);
            	
            }
             if(a.textContent < 1){
                return;
            }
                      
            c.innerText = total;
            d.value = total;
            console.log("div price 태그 = " + c.textContent);
            console.log("인풋태그 price 태그 = " + d.value);
            
        }
   
function count2(type)  {
           
            let total = (parseInt(a.textContent) * 10000) -10000;
          
            if(type === 'minus') {
            	let countplus = parseInt(a.textContent) - 1;
                
            	a.innerText = countplus;
            	b.value = countplus;
            	console.log("div 태그 = " + a.textContent);
            	console.log("인풋태그 value = " + b.value);
            }
            if(a.textContent < 1){
                return;
            }
        
            c.innerText = total;
            d.value = total;
            console.log("div price 태그 = " + c.textContent);
            console.log("인풋태그 price 태그 = " + d.value);
        } 
//찜하기 기능

function save() {
    //save함수 호출시 icon_color 변수 선언 하고, 변수에 id값이 icon인 요소를 담는다.
    console.log("save 함수 진입.");
   
    var key;

    key = document.querySelector("#mm").value;
    console.log("key 변수 값 = " + key);

	if(key == "null"){
		alert("로그인하셔야 본 서비스를 이용하실 수 있습니다.");
	}else{
		alert("완료!");
		document.submit();
		document.action="../product/wishServlet";
	}
 
}

//페이지 이동
function cart(){
	console.log("cart 메서드 호출");	
     var ckey;

    ckey = document.querySelector("#mm1").value;
    console.log("key 변수 값 = " + key);

	if(key == "null"){
		alert("로그인하셔야 본 서비스를 이용하실 수 있습니다.");
	}else{
		alert("완료!");
		document.submit();
		document.action="../product/productServlet";
	}	
} 
</script>