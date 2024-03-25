<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
           <%@include file="../include/headerLogin.jsp" %><p/>  
            <!-- 헤더 끝 -->

            <!-- 본문 시작 -->
             <div class="every">
                <div class="cate">
                    <ul>
                        <li id="gory1"><a href="product_list_all.jsp"><h3>All</h3></a></li>
                        <li id="gory2"><a href="product_1_living.jsp"><h3>&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;Living</h3></a></li>
                    </ul>
                </div>   
                <form>     
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
                                            <div id="buy1"><a href="#"><h3>구매하기</h3></a></div>
                                            <div id="buy2"><a href="#"><h3>장바구니</h3></a></div>
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
                                <div id="menu2"><a href="product_2_living_18_gu.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;<b>GUIDE</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu3"><a href="product_2_living_18_re.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;REVIEW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu4"><a href="product_2_living_18_qa.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q&A</a></div>
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

function count(type)  {
            const resultElement = document.getElementById('result1');
            let resultTotal = document.getElementById('price');
            let number = resultElement.innerText;
            let total = (number * 20000) +20000;
           
            console.log("total 변수 값 = " + total);

            
            if(type === 'plus') {
                number = parseInt(number) + 1;
            }
             if(number < 1){
                return;
            }
        
            resultElement.innerText = number;
            resultTotal.innerText = total;
        }
   
function count2(type)  {
            const resultElement = document.getElementById('result1');
            let resultTotal = document.getElementById('price');
            let number = resultElement.innerText;
            let total = (number * 20000) -20000;
           
            console.log("total 변수 값 = " + total);

            
            if(type === 'minus') {
                number = parseInt(number) -1;
            }
            if(number < 1){
                return;
            }
        
            resultElement.innerText = number;
            resultTotal.innerText = total;
        }
       
</script>

