package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/qnaPost")
public class QnaPostServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
	
		request.setCharacterEncoding("UTF-8"); 
		
		QnaMgr qMgr = new QnaMgr();
		
		qMgr.insertQna(request);
		
		//응답 시 list.jsp 페이지로 이동한다.
		response.sendRedirect("qna_list.jsp");
	}
}
