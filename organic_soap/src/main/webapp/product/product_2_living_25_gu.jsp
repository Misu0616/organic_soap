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
                	<input type="hidden" name="wish_pro_key" value="57">
					<input type="hidden" id="mm" name="wish_mem_key" value="<%= mem_key%>">  
					      
                    <div class="po1">
                        <div id="po2">
                            <img src="../images/living_25.png" id="po3" onclick="displaySrc()">
                            <div id="small-pic">
                                 <img src="../images/living_25.png" class="small">
                                 <img src="../images/living_25_1.png" class="small">
                                 <img src="../images/living_25_2.png" class="small">
                             </div>
                         </div>
                        <div id="text">
                            <h1>삼베 비누망</h1>
                            <h2>3,000원</h2>
                            <div id="heart"> 
                                <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite </span>
                            </div>
                    </form> 
					            <hr>
					<form name="pro" method="post" action="productServlet">				
						<input type="hidden" name="pro_count" id="result11">
						<input type="hidden" name="pro_price" id="price11">
						<input type="hidden" name="cart_pro_key" value="57">
						<input type="hidden" id="mm1" name="cart_mem_key" value="<%= mem_key%>">
						
                            <div class="tt">
                                <p><b></b></p>
                                <br>
                                <br>
                                <h3>삼베 비누망</h3>
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
                                <div id="menu1"><a href="product_2_living_25_de.jsp" style="color: rgb(93, 93, 93)">DETAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu2"><a href="product_2_living_25_gu.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;<b>GUIDE</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu3"><a href="product_2_living_25_re.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;REVIEW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu4"><a href="product_2_living_25_qa.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q&A</a></div>
                            </div>
                        </div>
                     </div> 
                 
                <!--가이드 시작--> 
                <div style="margin-left: 150px; margin-right: 150px;"><hr></div>
                <div class="gu1">
                    <p>배송안내</p>
                    <p>- 배송비 : 기본배송료는 3,000원 입니다. (도서,산간,오지 일부지역은 배송비가 추가될 수 있습니다)  30,000원 이상 구매시 무료배송입니다.</p>
                    <p>- 본 상품의 평균 배송일은 3일입니다.(입금 확인 후) [배송예정일은 주문시점(주문순서)에 따른 유동성이 발생하므로 평균 배송일과는 차이가 발생할 수 있습니다.]</p>
                    <br>
                    <br>
                    <p> AS안내</p>
                    <p> - 소비자분쟁해결 기준(공정거래위원회 고시)에 따라 피해를 보상받을 수 있습니다.</p>
                    <p> - A/S는 판매자에게 문의하시기 바랍니다.</p>
                </div>
                <!--가이드 끝--> 
                 
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
            
            let total = (parseInt(a.textContent) * 3000) +3000;
            

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
           
            let total = (parseInt(a.textContent) * 3000) -3000;
          
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

