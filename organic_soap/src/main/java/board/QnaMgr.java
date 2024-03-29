package board;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QnaMgr {
	private DBConnectionMgr pool = new DBConnectionMgr();

	//파일 업로드 관련 설정 작성
		private static final String  SAVEFOLDER = "C:/jsp/organic_soap/src/main/webapp/filestorage";
		private static final String ENCTYPE = "UTF-8";
		private static int MAXSIZE = 10*1024*1024;

		public QnaMgr() {
			try {
				pool = DBConnectionMgr.getInstance();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		public Vector<QnaBean> getQnaList(String keyField, String keyWord, int start, int end) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = null;
			
			Vector<QnaBean> qlist = new Vector<QnaBean>();

			try {
				con = pool.getConnection();
				//keyWord 값이 없는 경우 게시물 조회
				if (keyWord.equals("null") || keyWord.equals("")) {
					sql = "SELECT a.qna_key, a.qna_subject, a.qna_date, b.mem_name, c.reply_qna_key FROM qna a JOIN members b ON a.qna_mem_key = b.mem_key LEFT JOIN reply c ON a.qna_key = c.reply_qna_key order by qna_key desc, qna_key limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);

				} else { //keyField 와 keyWord 값이 있는 경우 게시물 조회
					sql = "SELECT a.qna_key, a.qna_subject, a.qna_date, b.mem_name, c.reply_qna_key FROM qna a JOIN members b ON a.qna_mem_key = b.mem_key LEFT JOIN reply c ON a.qna_key = c.reply_qna_key" + keyField + " like ? ";
					sql += "order by qna_key desc, qna_key limit ? , ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + keyWord + "%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
				}
				rs = pstmt.executeQuery();
				while (rs.next()) {
					QnaBean qbean = new QnaBean();
					qbean.setQna_key(rs.getInt("qna_key"));
					qbean.setQna_subject(rs.getString("qna_subject"));
					qbean.setMem_name(rs.getString("mem_name"));
					qbean.setQna_date(rs.getString("qna_date"));
					qbean.setReply_qna_key(rs.getInt("reply_qna_key"));
					qlist.add(qbean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return qlist;
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
					sql = "select count(qna_key) from qna";
					pstmt = con.prepareStatement(sql);
				} else { //keyField, keyWord 값이 있는 경우 총 게시물 가져오기
					sql = "select count(qna_key) from qna where " + keyField + " like ? ";
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
				public void insertQna(HttpServletRequest req) {
					
					Connection con = null; //연결객체
					PreparedStatement pstmt = null; //쿼리처리객체
					ResultSet rs = null;  //결과값 담는 객체
					
					String sql = null; //쿼리문 저장 변수
					
					MultipartRequest multi = null; //파일 업로드 위한 객체
					
					
					String qna_file_name = null; //파일이름 변수

					QnaBean qbean = new QnaBean();
					try {
						con = pool.getConnection();
						sql = "select max(qna_key) from qna"; //게시물이 총 몇개 인지 조회하는 쿼리
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						File file = new File(SAVEFOLDER);
						
						if (!file.exists())
							file.mkdirs();
						multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE,
								new DefaultFileRenamePolicy());

						if (multi.getFilesystemName("qna_file_name") != null) {
							qna_file_name = multi.getFilesystemName("filename");
						}
						String qna_content = multi.getParameter("qna_content");

						sql = "insert qna(qna_subject,qna_content,qna_date,qna_pass,qna_file_name, qna_mem_key)";
						sql += "values(?, ?, NOW(), ?, ?, ?)";
						
						pstmt = con.prepareStatement(sql);
						qbean.setQna_key(rs.getInt("qna_mem_key"));
						pstmt.setString(1, multi.getParameter("qna_subject"));
						pstmt.setString(2, qna_content);
						pstmt.setString(3, multi.getParameter("qna_pass"));
						pstmt.setString(4, qna_file_name);
						pstmt.setString(5, multi.getParameter("qna_mem_key"));
						pstmt.executeUpdate();
						
					} catch (Exception e) {
						System.out.println("예외발생");
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
				}
				
				// 게시물 리턴 메서드
				public QnaBean getQna(int qna_key) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql = null;
					
					QnaBean qbean = new QnaBean();
					
					try {
						con = pool.getConnection();
						sql = "SELECT a.qna_key, a.qna_subject, a.qna_content, a.qna_file_name, a.qna_date, c.mem_name, b.reply_key, b.reply_content, b.reply_date, b.reply_file_name, b.reply_write FROM qna a LEFT JOIN reply b ON a.qna_key = b.reply_qna_key JOIN members c ON a.qna_mem_key = c.mem_key WHERE a.qna_key =?;";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, qna_key);
						rs = pstmt.executeQuery();
						if (rs.next()) {
							qbean.setQna_key(rs.getInt("qna_key"));
							qbean.setQna_subject(rs.getString("qna_subject"));
							qbean.setQna_content(rs.getString("qna_content"));
							qbean.setQna_file_name(rs.getString("qna_file_name"));
							qbean.setQna_date(rs.getString("qna_date"));
							qbean.setMem_name(rs.getString("mem_name"));
							qbean.setReply_key(rs.getInt("reply_key"));
							qbean.setReply_content(rs.getString("reply_content"));
							qbean.setReply_date(rs.getString("reply_date"));
							qbean.setReply_file_name(rs.getString("reply_file_name"));
							qbean.setReply_write(rs.getString("reply_write"));
							
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return qbean;
				}
				// 게시물 삭제 메서드
				public void deleteQna(int qna_key) {
					
						Connection con = null;
						
						PreparedStatement pstmt = null;
						
						String sql = null;
						
						ResultSet rs = null;
						
						try {
							con = pool.getConnection();
							sql = "select qna_file_name from qna where qna_key = ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, qna_key);
							rs = pstmt.executeQuery();
							
							if (rs.next() && rs.getString(1) != null) {
								if (!rs.getString(1).equals("")) {
									File file = new File(SAVEFOLDER + "/" + rs.getString(1));
									if (file.exists())
										UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
								}
							}
							sql = "delete from qna where qna_key=?";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, qna_key);
							pstmt.executeUpdate();
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							pool.freeConnection(con, pstmt, rs);
						}
					}
				// 게시물 수정
				public void updateQna(QnaBean qbean) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					
					try {
						con = pool.getConnection();
						
						sql = "update qna set qna_subject=?,qna_content=?,qna_file_name=? where qna_key=?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, qbean.getQna_subject());
						pstmt.setString(2, qbean.getQna_content());
						pstmt.setString(3, qbean.getQna_file_name());
						pstmt.setInt(4, qbean.getQna_key());
						pstmt.executeUpdate();
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
				}
		
				public void memberJoin(int qna_mem_key) {
					
					Connection con = null;
					
					PreparedStatement pstmt = null;
					
					String sql = null;
					
					ResultSet rs = null;
					
					try {
						con = pool.getConnection();
						sql = "select qna_mem_key from qna";
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						if (rs.next()) {
							
						}
						
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, qna_mem_key);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
				}
				
	}
