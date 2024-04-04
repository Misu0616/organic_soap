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

import member.memberBean;

@WebServlet("/order/orderServlet")
public class OrderServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	
			throws ServletException, IOException {
			 
			request.setCharacterEncoding("utf-8");
			
			HttpSession session = request.getSession();
			
			order_mgr oMgr = new order_mgr();
			
			String mem_key = (String)session.getAttribute("mem_key");
			
			 Vector<memberBean> vlist = oMgr.getMemInfo(mem_key);
			 
			    for (memberBean mBean : vlist) { 
			    	
			    	String mem_name = mBean.getMem_name();
			    	String mem_tel = mBean.getMem_tel();
			    	String mem_email = mBean.getMem_email();
			    	String mem_address1 = mBean.getMem_address1();
			    	String mem_address2 = mBean.getMem_address2();
			    	String mem_postal_code = mBean.getMem_postal_code();

			        
			        request.setAttribute("mem_name", mem_name);
			        request.setAttribute("mem_tel", mem_tel);
			        request.setAttribute("mem_email", mem_email);
			        request.setAttribute("mem_address1", mem_address1);
			        request.setAttribute("mem_address2", mem_address2);
			        request.setAttribute("mem_postal_code", mem_postal_code);

			        
					System.out.println("orderServlet mem_name : " + mem_name);
					System.out.println("orderServlet mem_tel : " + mem_tel);
					System.out.println("orderServlet mem_email : " + mem_email);
					System.out.println("orderServlet mem_address1 : " + mem_address1);
					System.out.println("orderServlet mem_address2 : " + mem_address2);
					System.out.println("orderServlet mem_postal_code : " + mem_postal_code);
		
					ServletContext context =getServletContext();
					RequestDispatcher dispatcher = context.getRequestDispatcher("/order/order1.jsp");
					dispatcher.forward(request, response);
	}
			
			/* bMgr.insertBoard(request);
			
			// 응답시 list.jsp 페이지로 이동
			response.sendRedirect("list.jsp");
			} 
			일단 예시임
			*/
	}

}
