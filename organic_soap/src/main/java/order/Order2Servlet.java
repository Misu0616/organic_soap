package order;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/order/order2Servlet")
public class Order2Servlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String mem_key = (String)session.getAttribute("mem_key");
		
		// 포인트 메서드
		order_mgr oMgr = new order_mgr();
		
	    Vector<points> pointList = oMgr.select_point(mem_key);

	    // 결과 처리
	    for (points po : pointList) { 
	    	// pointList 안에서 차례대로 객체를 꺼내 points po에 넣는다는 의미
	        int myPoint = po.getMy_point();
	        int usePoint = po.getUse_point();
	        int getPoint = po.getGet_point();

	        // 포인트 값 설정
	        request.setAttribute("my_point", myPoint);
	        request.setAttribute("use_point", usePoint);
	        request.setAttribute("get_point", getPoint);

	        // 디버깅 메시지
	        System.out.println("Order2Servlet my_point : " + myPoint);
	        System.out.println("Order2Servlet use_point : " + usePoint);
	        System.out.println("Order2Servlet get_point : " + getPoint);
	    }
	    
	    // 결제 메서드 
	    
		ServletContext context =getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/order/order2.jsp");
		dispatcher.forward(request, response);
		
	}
}
