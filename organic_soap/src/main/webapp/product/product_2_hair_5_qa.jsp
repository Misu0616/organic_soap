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
                        <li id="gory2"><a href="product_1_hair.jsp"><h3>&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;Hair</h3></a></li>
                    </ul>
                </div>   
                <form>     
                    <div class="po1">
                        <div id="po2">
                            <img src="../images/hair_5.png" id="po3" onclick="displaySrc()">
                            <div id="small-pic">
                                 <img src="../images/hair_5.png" class="small">
                                 <img src="../images/hair_5_1.png" class="small">
                                 <img src="../images/hair_5_2.png" class="small">
                             </div>
                         </div>
                        <div id="text">
                            <h1>올바른 헤어 케어 세트</h1>
                            <h2>19,000원</h2>
                            <div id="heart"> 
                                <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite </span>
                            </div>
                            <hr>
                            <div class="tt">
                                <p><b>매끄럽고, 부드러운 머릿결 가꿔주는 식물 유래 성분 고체 린스바,트리트먼트바</b></p>
                                <br>
                                <br>
                                <h3>올바른 헤어 케어 세트</h3>
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
                                            <strong id="price">19000</strong> 원
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
                                <div id="menu1"><a href="product_2_hair_5_de.jsp" style="color: rgb(93, 93, 93)">DETAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu2"><a href="product_2_hair_5_gu.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;GUIDE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu3"><a href="product_2_hair_5_re.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;REVIEW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/</a></div>
                                <div id="menu4"><a href="product_2_hair_5_qa.jsp" style="color: rgb(93, 93, 93)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Q&A</b></a></div>
                            </div>
                        </div>
                     </div> 
                <!--Q%A시작--> 
                <div style="margin-left: 150px; margin-right: 150px;"><hr></div>

                <div class="qa1" id="q&a">
                    <div>구매하시려는 상품에 대해 궁금한 점이 있으면 문의주세요.</div>
                    <div id="qa_1"><a href="#">상품 문의</a></div>
                    <div id="qa_2"><a href="#">1:1 문의</a></div>
                    
                    <div id="qa_3">등록된 문의가 없습니다.</div>
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

function count(type)  {
            const resultElement = document.getElementById('result1');
            let resultTotal = document.getElementById('price');
            let number = resultElement.innerText;
            let total = (number * 19000) +19000;
           
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
            let total = (number * 19000) -19000;
           
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

