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

@WebServlet("/order/order2Servlet")
public class Order2Servlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request,  HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String pro_name = request.getParameter("pro_name");
		String pro_img = request.getParameter("pro_img");
		int pro_price = Integer.parseInt(request.getParameter("pro_price"));
		String cart_tot = request.getParameter("cart_tot");
		String mem_name = request.getParameter("mem_name");
		String mem_tel = request.getParameter("mem_tel");
		String mem_email = request.getParameter("mem_email");
		String mem_postal_code = request.getParameter("mem_postal_code");
		String mem_address1 = request.getParameter("mem_address1");
		String mem_address2 = request.getParameter("mem_address2");
		int mem_key = Integer.parseInt(request.getParameter("mem_key"));
		
		request.setAttribute("pro_name", pro_name);
		request.setAttribute("pro_img", pro_img);
		request.setAttribute("pro_price", pro_price);
		request.setAttribute("cart_tot", cart_tot);
		request.setAttribute("mem_name", mem_name);
		request.setAttribute("mem_tel", mem_tel);
		request.setAttribute("mem_email", mem_email);
		request.setAttribute("mem_postal_code", mem_postal_code);
		request.setAttribute("mem_address1", mem_address1);
		request.setAttribute("mem_address2", mem_address2);
		request.setAttribute("mem_key", mem_key);
		
		// 포인트 메서드, 결제 메서드 필요..?
		order_mgr oMgr = new order_mgr();
		
	    Vector<points> pointList = oMgr.select_point(mem_key);

	    // 결과 처리
	    for (points po : pointList) {
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
	    
		ServletContext context =getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/order/order2.jsp");
		dispatcher.forward(request, response);
		
	}
}
