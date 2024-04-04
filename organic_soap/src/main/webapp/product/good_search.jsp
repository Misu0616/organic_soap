<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="product.productBean" %>
<jsp:useBean id ="proBean" class="product.productBean"/>
<jsp:useBean id = "oMgr" class="order.order_mgr"/>
<jsp:useBean id="mMgr" class="member.memberMgr"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>OrganicSOAPS</title>
        <link rel="stylesheet" href="../css/good_search2.css">
        <script src="../js/product_list_all.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    </head>
    <body>
        <div class="container">
            <!-- header 시작 -->
<%
request.setCharacterEncoding("utf-8");

String search = request.getParameter("search");
System.out.println("goodSerach.jsp search : " + search);

//order_mgr 클래스의 search 메서드 호출시 파라미터로 이동해온 검색어. search 를 매개변수로
//이용해서 search 메서드 호출.
//메서드 호출 한 다음 vector 배열로 return 되므로, 호출시 vector배열에 return 값 저장.

Vector<productBean> vlist = null;
vlist = oMgr.search(search);

String mem_key = (String)session.getAttribute("mem_key");
if(mem_key !=null){
%>
	<jsp:include page="../include/headerLogin.jsp" />
	<% } else { %>
	<jsp:include page="../include/headerBfLogin.jsp" />
	<%	} %>
            <!-- 헤더 끝 -->
            
            <!-- 본문 시작 -->  
            <div class="every"> 
                <form name="">
                	<div class="search1">
                	<%
						if(search == "" || vlist.size() == 0) { %>
							<p/><br>
							<div class="search3">
	                        <div>
	                        	<div class="search2"><b>고객님께서 검색하신 단어를 찾을 수 없습니다.</b></div>
		                    </div>
	                    </div>	
						<% }
	
						else { %>
                	<p/><br>
	                    <div class="search3">
	                        <div>
	                        	<div class="search2">고객님께서 검색하신 <b><%=search %></b>에 대한 결과입니다.</b></div>
		                    </div>
	                    </div>
	                    <%	}
						%>  <p/><br>
	                    
	                </div> 
	                <!--상단 메뉴 시작-->
                
                    <!--상단 메뉴 끝-->
                    <div class="items">     
                        <% for(int i=0; i<vlist.size(); i++){
                        	
                        	productBean proBe = vlist.get(i); 
                        	
                        	String pro_name = proBe.getPro_name();
                        	String pro_img = proBe.getPro_img();
                        	int pro_price = proBe.getPro_price();
                        	String pro_link = proBe.getPro_link();
                        	
                        	System.out.println("jsp pro_name : " + proBe.getPro_name());
                        	System.out.println("jsp pro_img : " + proBe.getPro_img());
                        	System.out.println("jsp pro_price : " + proBe.getPro_price());
                        			
                        	%>
                        <div class="item-ima" >
                            <a href="<%=pro_link%>" style="text-decoration-line: none;">
                                <img src="../images/<%=pro_img %>" width="300px" height="300px">
                                <div class="item-te">
                                    <p><%=pro_name %></p>
                                    <p><%=pro_price %>원</p>
                                </div> 
                            </a>       
                            <span class="material-symbols-outlined" id="icon1" onclick="style.color='red',save()">favorite</span>
                        </div> 
                        <% } %>
                    </div> 
                </form>  
                <!-- 본문 끝 -->

                <!-- 푸터 시작 -->
                <%@include file="../include/footer.jsp" %><p/>
                <!-- 푸터 끝 -->
            </div>
        </div>
    </body>
</html>