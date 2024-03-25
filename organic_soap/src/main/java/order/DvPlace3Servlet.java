package order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.member_dto;

@WebServlet("/order/dvPlace1")
public class DvPlace3Servlet extends HttpServlet {
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		
			throws ServletException, IOException {
		
			request.setCharacterEncoding("utf-8");
		
			order_mgr oMgr = new order_mgr();
			member_dto mMgr = new member_dto();
			
			mMgr.setMem_key(Integer.parseInt(request.getParameter("mem_key")));
			
			int mem_key = mMgr.getMem_key();
			
			oMgr.getdvPlace3(mem_key);
			System.out.println("mem_key : " + mem_key);
			
			response.sendRedirect("dvPlace3.jsp");
	}
}
