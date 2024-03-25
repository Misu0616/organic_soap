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

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		BoardMgr bMgr = new BoardMgr();
		
		//BoardBean 클래스 객체인 bean에 session에 저장된 게시물 bean 데이터를 대입한다.
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		
		String nowPage = request.getParameter("nowPage");
		
		BoardBean upBean = new BoardBean(); //BoardBean 클래스 객체 upBean 생성
		
		//BoardBean 클래스 객체 upBean을 생성하고, 게시물 관련 파라미터를 setter 메서드를 이용해 담는다.
		upBean.setBoard_key(Integer.parseInt(request.getParameter("board_key")));
		upBean.setBoard_write(request.getParameter("board_write"));
		upBean.setBoard_subject(request.getParameter("board_subject"));
		upBean.setBoard_content(request.getParameter("board_content"));
		upBean.setBoard_file_name(request.getParameter("board_file_name"));
		
		//수정할 내용이 담긴 데이터는 upBean 객체에 있고, (jsp 화면에서 이동해온 게시글 데이터)
		//수정 전 내용이 담긴 데이터는 bean 객체에 있다. (수정 전 session 에 저장한 게시글 데이터)
		
		
			
			//BoardMgr 클래스 updateBoard() 메서드를 호출
			bMgr.updateBoard(upBean);
			
			String url = "board_view.jsp?nowPage=" + nowPage + "&board_key=" + upBean.getBoard_key();
			
			response.sendRedirect(url);
		
		
	}
}
