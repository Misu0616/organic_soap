package order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/order/orderServlet")
public class OrderServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	
			throws ServletException, IOException {
			  
			request.setCharacterEncoding("utf-8");
		
			HttpSession session = request.getSession();
			
			String r_name = (String) session.getAttribute("r_name");
			String r_phone = (String) session.getAttribute("r_phone");
			String r_postal_code = (String) session.getAttribute("r_postal_code");
			String r_address1 = (String) session.getAttribute("r_address1");
			String r_address2 = (String) session.getAttribute("r_address2");
			String memo = (String) session.getAttribute("memo");
			int mem_key = (int)session.getAttribute("mem_key");
			
			order_mgr oMgr = new order_mgr();
			
			oMgr.insertRinform(request);
			
			response.sendRedirect("order1.jsp");
			
	}
			
			/* bMgr.insertBoard(request);
			
			// 응답시 list.jsp 페이지로 이동
			response.sendRedirect("list.jsp");
			} 
			일단 예시임
			*/
		

}
