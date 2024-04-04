package product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/product/productServlet")
public class productServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request,  HttpServletResponse response)
		throws ServletException, IOException {
		System.out.println("프로덕트 서블릿 진입");
		request.setCharacterEncoding("utf-8");
		
		//product_mgr 클래스 객체 생성
		product_mgr pMgr = new product_mgr();
		
		
		//product_mgr의 cart 메서드 호출
		
		pMgr.cart(request);
		System.out.println("장바구니 추가 완료.");
		
		ServletContext context =getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/cart/cart.jsp");
		dispatcher.forward(request, response);
		
	}
}
