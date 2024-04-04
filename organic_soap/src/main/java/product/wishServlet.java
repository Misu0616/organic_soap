package product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/product/wishServlet")
public class wishServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request,  HttpServletResponse response)
		throws ServletException, IOException {
		System.out.println("위시 서블릿 진입");
		request.setCharacterEncoding("utf-8");
		
		
		//product_mgr 클래스 객체 생성
		product_mgr pMgr = new product_mgr();
		
		
		//product_mgr의 wish 메서드 호출
		
		pMgr.wish(request);
		System.out.println("위시 추가 완료.");
			
		ServletContext context =getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/mypage/wish_list.jsp");
		dispatcher.forward(request, response);
		
	}
}
