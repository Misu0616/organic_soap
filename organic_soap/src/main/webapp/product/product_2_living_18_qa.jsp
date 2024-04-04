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
                <form name="pro" method="post"> 
					<input type="hidden" name="pro_img" value="living_18.png"> 
					<input type="hidden" name="pro_name" value="씹는 고체치약 대용량 180정"> 
					<input type="hidden" name="pro_price" id="price11">
					<input type="hidden" name="pro_count" id="result11">
					         
                    <div class="po1">
                        <div id="po2">
                            <img src="../images/living_18.png" id="po3" onclick="displaySrc()">
                            <div id="small-pic">
                             <img src="../images/living_18.png" class="small">
                             <img src="../images/living_18_1.png" class="small">
                             </div>
                         </div>
                        <div id="text">
                            <h1>씹는 고체치약 대용량 180정</h1>
                            <h2>20,000원</h2>
                            <div id="heart"> 
                                <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite </span>
                            </div>
                            <hr>
                            <div class="tt">
                                <p><b>물, 우려 성분, 과도한 거품을 모두 빼고 치약 본질에 충실한 비건 포뮬라 고체치약</b></p>
                                <br>
                                <br>
                                <h3>씹는 고체치약 대용량 180정</h3>
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
                                            <div id='result1' class="zero">1</div>
                                            <input type='button' onclick='count("plus")' value='+' class="plusminus">
                                            
                                            <input type="hidden" name="plus" value="1추가">
                                            <input type="hidden" name="minus" value="1빼기">
                                        </div>
                                    </div>
                                    <div class="total_price">
                                       <div class="total_price1"><b>총 합계금액</b></div>
                                        <div class="total_price2">
                                            <strong id="price">20000</strong> 원
                                        </div>                                              
                                    </div>
                                    <p/>
                                    <div>
                                        <div class="buy">
	                                    	<button id="buy1" onclick="order()"><h3>구매하기</h3></button>                                          
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
                                <div id="menu1"><a href="product_2_living_18_de.jsp" style="color: rgb(93, 93, 93)">DETAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu2"><a href="product_2_living_18_gu.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;GUIDE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu3"><a href="product_2_living_18_re.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;REVIEW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu4"><a href="product_2_living_18_qa.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Q&A</b></a></div>
                            </div>
                        </div>
                     </div> 
                <!--Q%A시작--> 
                <div style="margin-left: 150px; margin-right: 150px;"><hr></div>

                <div class="qa1" id="q&a">
                     구매하시려는 상품에 대해 궁금한 점이 있으면 문의주세요.
                    <div id="qa_1"><a href="../board/qna_list.jsp">1:1 문의</a></div>                   
                </div>
           		<!--Q%A끝-->  
                <!-- 본문 끝 -->
                <!-- 푸터 시작 -->
                <div class="footer">
                    <p>상호 : (주)오가닉소프스</p>
                    <p>주소 : 전라북도 전주시 완산구 팔달로 184, 2층</p>
                    <p>사업자등록번호 : 941-84-8967 ｜ 통신판매업 신고 : 제 2024-전북전주-000 호</p>
                    <p>대표 : 김민호 ｜ 개인정보관리책임자 : 전운찬</p>
                    <p>Help Center : 070 - 0978 - 5349 (AM10 - PM4, Lunch PM12:30 - PM13:30, Weekend and Holiday Off)</p>
                    <p>e-mail : cs@organicsoaps.com</p>
                    <p>Copyright ⓒ 2024 OrganicSOAPS inc. all right reserved.</p>
                    <br>
                    <p>Social Media : <a href="https://www.instagram.com/donggubat_story/"><span>INSTAGRAM</span></a> / <a href="https://mysterious-cloche-461.notion.site/eb68d5534ad4471ba51edb6b755b409a"><span>NOTION</span></a></p>
                    <br>
                    <br>
                    <p><a href="../privacy.jsp"><span>개인정보처리방침</span></a> ｜ <a href="../terms.jsp"><span>이용약관</span></a></p>
                </div>
                <!-- 푸터 끝 -->
            </div> 
        </div>
    </body>
</jsp>
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
            
            let total = (parseInt(a.textContent) * 20000) +20000;
            

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
           
            let total = (parseInt(a.textContent) * 20000) -20000;
          
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

</script>