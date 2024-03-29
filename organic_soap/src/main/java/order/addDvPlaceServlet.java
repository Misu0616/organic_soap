package order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.memberBean;

@WebServlet("/order/addDvPlaceServlet")
public class addDvPlaceServlet extends HttpServlet {
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int mem_key = Integer.parseInt(request.getParameter("mem_key"));
		
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
		
		order_mgr oMgr = new order_mgr();
		r_inform rMgr = new r_inform(); 
		
		oMgr.insertRinform(request,response);
		oMgr.selectR_inform(mem_key);
		
		ServletContext context =getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/order/addDvPlace.jsp");
		dispatcher.forward(request, response);
	}
	
}
