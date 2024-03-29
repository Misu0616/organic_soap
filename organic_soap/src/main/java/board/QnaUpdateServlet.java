package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/qnaUpdate")
public class QnaUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");


		QnaMgr qMgr = new QnaMgr();
		
		String nowPage = request.getParameter("nowPage");
		
		QnaBean upBean = new QnaBean(); //BoardBean 클래스 객체 upBean 생성
		
		//BoardBean 클래스 객체 upBean을 생성하고, 게시물 관련 파라미터를 setter 메서드를 이용해 담는다.
		upBean.setQna_key(Integer.parseInt(request.getParameter("qna_key")));
		upBean.setMem_name(request.getParameter("qna_write"));
		upBean.setQna_subject(request.getParameter("qna_subject"));
		upBean.setQna_content(request.getParameter("qna_content"));
		upBean.setQna_file_name(request.getParameter("qna_file_name"));
			//BoardMgr 클래스 updateBoard() 메서드를 호출
			qMgr.updateQna(upBean);
			
			String url = "qna_view.jsp?nowPage=" + nowPage + "&qna_key=" + upBean.getQna_key();
			
			response.sendRedirect(url);
		
		
	}
}
