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
                <form name="pro" method="post" action="wishServlet">	
                	<input type="hidden" name="wish_pro_key" value="48">
					<input type="hidden" name="wish_mem_key" value="<%= mem_key%>">   
					       
                    <div class="po1">
                        <div id="po2">
                            <img src="../images/living_16.png" id="po3" onclick="displaySrc()">
                            <div id="small-pic">
                                 <img src="../images/living_16.png" class="small">
                                 <img src="../images/living_16_1.png" class="small">
                                 <img src="../images/living_16_2.png" class="small">
                             </div>
                         </div>
                        <div id="text">
                            <h1>올바른 설거지 워싱바 100g</h1>
                            <h2>5,000원</h2>
                            <div id="heart"> 
                                <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite </span>
                            </div>
                    </form> 
					            <hr>
					<form name="pro" method="post" action="productServlet">				
						<input type="hidden" name="pro_count" id="result11">
						<input type="hidden" name="pro_price" id="price11">
						<input type="hidden" name="cart_pro_key" value="48">
						<input type="hidden" name="cart_mem_key" value="<%= mem_key%>">
						
                            <div class="tt">
                                <p><b>잔존 세제 걱정 없이 안심할 수 있는 설거지비누, 동구밭 올바른 설거지 워싱바</b></p>
                                <br>
                                <br>
                                <h3>올바른 설거지 워싱바 100g</h3>
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
                                            <strong id="price">5000</strong> 원
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
                                <div id="menu1"><a href="product_2_living_16_de.jsp" style="color: rgb(93, 93, 93)">DETAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu2"><a href="product_2_living_16_gu.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;GUIDE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu3"><a href="product_2_living_16_re.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;REVIEW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu4"><a href="product_2_living_16_qa.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q&A</a></div>
                            </div>
                        </div>
                     </div> 
                <!--상세페이지 시작-->   
                <div style="margin-left: 150px; margin-right: 150px;"><hr></div>
                        
                <div class="de1">
                    <img src="../images/living_16_1.jpg">
                    <img src="../images/all.jpg">
               </div>
                <div id="table_info">
                    <table class="info">
                        <caption id="info_1"><h4>상품정보제공고시</h4></caption>
                        <tr id="info_2">
                            <td id="info_3"><b>제품명</b></td>
                             <td id="info_4">제품내 별도표기</td>
                         </tr>
                        <tr id="info_2">
                            <td id="info_3"><b>용량 또는 중량 / 사이즈</b></td>
                            <td id="info_4">제품내 별도표기</td>
                        </tr>
                        <tr id="info_2">
                            <td id="info_3"><b>사용기한 또는 개봉 후 사용기간</b></td>
                            <td id="info_4">제조일로부터 24개월</td>
                        </tr>
                        <tr id="info_2">
                            <td id="info_3"><b>사용방법</b></td>
                            <td id="info_4">제품내 별도표기</td>
                        </tr>
                        <tr id="info_2">
                            <td id="info_3"><b>화장품제조업자</b></td>
                            <td id="info_4">㈜동구밭</td>
                        </tr>
                        <tr id="info_2">
                            <td id="info_3"><b>제조국</b></td>
                            <td id="info_4">대한민국</td>
                        </tr>
                        <tr id="info_2">
                            <td id="info_3"><b>화장품책임판매업자</b></td>
                            <td id="info_4">(주)오가닉소프스</td>
                        </tr>
                        <tr id="info_2">
                            <td id="info_3"><b>전성분</b></td>
                            <td id="info_4">제품내 별도표기</td>
                        </tr>
                        <tr id="info_2">
                            <td id="info_3"><b>기능성 화장품의 경우 화장품 법에 따른 식품의약품안전처 심사 필 유무</b></td>
                            <td id="info_4">해당없음</td>
                        </tr>
                        <tr id="info_2">
                            <td id="info_3"><b>사용할 때의 주의사항</b></td>
                            <td id="info_4">1. 화장품 사용 시 또는 사용 후 직사광선에 의하여 사용부위가 붉은 반점, 부어오름 또는 가려움증 등의 이상 증상이나 부작용이 있는 경우 전문의 등과 상담할 것 
                                            <br>2. 상처가 있는 부위 등에는 사용을 자제할 것 
                                            <br>3. 보관 및 취급 시의 주의사항 가) 어린이의 손이 닿지 않는 곳에 보관할 것 나) 직사광선을 피해서 보관할 것 
                                            <br>4. 눈에 들어갔을 때에는 즉시 씻어낼 것 
                                            <br>5. 사용 후 물로 씻어내지 않으면 탈모 또는 탈색의 원인이 될 수 있으므로 주의할 것 
                                            <br>6. 물이 잘 빠지는 건조한 곳에 보관할 것 
                                            <br>7. 자연 유래 성분으로 색상의 차이가 있을 수 있음 
                                            <br>8. 알러지성분에 민감하신 분들은 전성분을 꼭 참고할 것</td>
                        </tr>
                        <tr id="info_2">
                            <td id="info_3"><b>품질보증기준</b></td>
                            <td id="info_4">본 제품에 이상이 있을 경우 공정거래위원회 고시 소비자분쟁해결 기준에 의거하여 보상받을 수 있습니다.</td>
                        </tr>
                        <tr id="info_2">   
                             <td id="info_3"><b>소비자 상담 관련 전화 번호</b></td>
                             <td id="info_4"> 070 - 0978 - 5349</td>
                        </tr>                
                    </table>
                </div>
                <!--상세페이지 끝-->   
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
                <!--Q%A시작--> 
                <div style="margin-left: 150px; margin-right: 150px;"><hr></div>

                <div class="qa1" id="q&a">
                     구매하시려는 상품에 대해 궁금한 점이 있으면 문의주세요.
                    <div id="qa_1"><a href="../board/qna_list.jsp">1:1 문의</a></div>                   
                </div>
           		<!--Q%A끝-->  
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
            
            let total = (parseInt(a.textContent) * 5000) +5000;
            

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
           
            let total = (parseInt(a.textContent) * 5000) -5000;
          
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

