package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");


		BoardMgr bMgr = new BoardMgr();
		
		String nowPage = request.getParameter("nowPage");
		
		BoardBean upBean = new BoardBean(); 
		upBean.setBoard_key(Integer.parseInt(request.getParameter("board_key")));
		upBean.setBoard_write(request.getParameter("board_write"));
		upBean.setBoard_subject(request.getParameter("board_subject"));
		upBean.setBoard_content(request.getParameter("board_content"));
		upBean.setBoard_file_name(request.getParameter("board_file_name"));
			//BoardMgr 클래스 updateBoard() 메서드를 호출
			bMgr.updateBoard(upBean);
			
			String url = "board_view.jsp?nowPage=" + nowPage + "&board_key=" + upBean.getBoard_key();
			
			response.sendRedirect(url);
		
		
	}
}
