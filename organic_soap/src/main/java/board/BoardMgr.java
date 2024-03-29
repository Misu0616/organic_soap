package board;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {
	private DBConnectionMgr pool = new DBConnectionMgr();

	//파일 업로드 관련 설정 작성
		private static final String  SAVEFOLDER = "C:/jsp/organic_soap/src/main/webapp/filestorage";
		private static final String ENCTYPE = "UTF-8";
		private static int MAXSIZE = 10*1024*1024;

		public BoardMgr() {
			try {
				pool = DBConnectionMgr.getInstance();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	

	// 게시판 리스트
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int end) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		
		try {
			con = pool.getConnection();
			//keyWord 값이 없는 경우 게시물 조회
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from board order by board_key desc, board_key limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else { //keyField 와 keyWord 값이 있는 경우 게시물 조회
				sql = "select from  board where " + keyField + " like ? ";
				sql += "order by board_key desc, board_key limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setBoard_key(rs.getInt("board_key"));
				bean.setBoard_subject(rs.getString("board_subject"));
				bean.setBoard_date(rs.getString("board_date"));
				bean.setBoard_count(rs.getInt("board_count"));
				bean.setBoard_write(rs.getString("board_write"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//총 게시물수
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			
			//keyField , keyWord 값이 없는 경우 총 게시물 가져오기
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(board_key) from board";
				pstmt = con.prepareStatement(sql);
			} else { //keyField, keyWord 값이 있는 경우 총 게시물 가져오기
				sql = "select count(board_key) from  board where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	// 게시물 입력 메서드
			// 게시물 입력 메서드는 리턴타입 이 void 이므로 반환값은 없다.
			public void insertBoard(HttpServletRequest req) {
				
				Connection con = null; //연결객체
				PreparedStatement pstmt = null; //쿼리처리객체
				ResultSet rs = null;  //결과값 담는 객체
				
				String sql = null; //쿼리문 저장 변수
				
				MultipartRequest multi = null; //파일 업로드 위한 객체
				
				
				String board_file_name = null; //파일이름 변수
				
				try {
					con = pool.getConnection();
					sql = "select max(board_key) from board"; //게시물이 총 몇개 인지 조회하는 쿼리
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					File file = new File(SAVEFOLDER);
					
					if (!file.exists())
						file.mkdirs();
					multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE,
							new DefaultFileRenamePolicy());

					if (multi.getFilesystemName("board_file_name") != null) {
						board_file_name = multi.getFilesystemName("filename");
					}
					String board_content = multi.getParameter("board_content");

					sql = "insert board(board_subject,board_content,board_count,board_date,board_file_name,board_write)";
					sql += "values(?, ?, 0, NOW(), ?, ?)";
					
					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, multi.getParameter("board_subject"));
					pstmt.setString(2, board_content);
					pstmt.setString(3, board_file_name);
					pstmt.setString(4, multi.getParameter("board_write"));

					pstmt.executeUpdate();

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
			}
			
			// 게시물 리턴 메서드
			public BoardBean getBoard(int board_key) {
				
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = null;
				
				BoardBean bean = new BoardBean();
				
				try {
					con = pool.getConnection();
					sql = "select * from board where board_key=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, board_key);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						bean.setBoard_key(rs.getInt("board_key"));
						bean.setBoard_subject(rs.getString("board_subject"));
						bean.setBoard_content(rs.getString("board_content"));
						bean.setBoard_date(rs.getString("board_date"));
						bean.setBoard_count(rs.getInt("board_count"));
						bean.setBoard_file_name(rs.getString("board_file_name"));
						bean.setBoard_write(rs.getString("board_write"));
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return bean;
			}

			// 조회수 증가 메서드
			public void upCount(int board_key) {
				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = null;
				
				try {
					con = pool.getConnection();
					sql = "update board set board_count=board_count+1 where board_key=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, board_key);
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt);
				}
			}
			// 게시물 삭제 메서드
			public void deleteBoard(int board_key) {
				
					Connection con = null;
					
					PreparedStatement pstmt = null;
					
					String sql = null;
					
					ResultSet rs = null;
					
					try {
						con = pool.getConnection();
						sql = "select board_file_name from board where board_key = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, board_key);
						rs = pstmt.executeQuery();
						
						if (rs.next() && rs.getString(1) != null) {
							if (!rs.getString(1).equals("")) {
								File file = new File(SAVEFOLDER + "/" + rs.getString(1));
								if (file.exists())
									UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
							}
						}
						//board_key를 이용하여 board 테이블의 컬럼을 찾아서 delete 쿼리문으로 해당 컬럼 삭제. 
						sql = "delete from board where board_key=?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, board_key);
						pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
				}
			// 게시물 수정
			public void updateBoard(BoardBean bean) {
				
				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = null;
				
				try {
					con = pool.getConnection();
					
					sql = "update board set board_subject=?,board_content=?,board_file_name=? where board_key=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bean.getBoard_subject());
					pstmt.setString(2, bean.getBoard_content());
					pstmt.setString(3, bean.getBoard_file_name());
					pstmt.setInt(4, bean.getBoard_key());
					pstmt.executeUpdate();
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt);
				}
			}
			
			
			
			
			
			
			
			
}
