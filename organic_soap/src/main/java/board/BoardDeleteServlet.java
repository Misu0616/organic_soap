package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/boardDelete")
public class BoardDeleteServlet extends HttpServlet {



	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		BoardMgr bMgr = new BoardMgr();
		
		int board_key = Integer.parseInt(request.getParameter("board_key"));
		bMgr.deleteBoard(board_key);
		String nowPage = request.getParameter("nowPage");
		
		String url = "board_list.jsp?nowPage=" + nowPage;
		response.sendRedirect(url);
	}

}
