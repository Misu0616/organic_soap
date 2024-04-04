package order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/order/order_detail_Servlet")

public class Order_detail_Servlet extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
		
		throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			
			int mem_key = Integer.parseInt(request.getParameter("mem_key"));
			
			request.getParameter("point");
			request.getParameter("get_point");
			
			order_mgr oMgr = new order_mgr();
			oMgr.update_useGet(request);
			//oMgr.insert_info(request, mem_key);
			
			ServletContext context =getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("/mypage/order_detail.jsp");
			dispatcher.forward(request, response);
			
		}
		
}
