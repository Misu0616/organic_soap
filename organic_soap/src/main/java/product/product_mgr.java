package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.DBConnectionMgr;

public class product_mgr {
	
	private DBConnectionMgr pool;
		
		public product_mgr() {
			try {
				pool = DBConnectionMgr.getInstance();
			}	catch(Exception e) {
				e.printStackTrace();
			}
		}
				
// cart 데이터베이스 저장
			
	public void cart(HttpServletRequest request) {
			System.out.println("cart 메서드 진입");
			int cart_tot = Integer.parseInt(request.getParameter("pro_count"));
			int cart_qty = Integer.parseInt(request.getParameter("pro_price"));
			int cart_pro_key = Integer.parseInt(request.getParameter("cart_pro_key"));
			int cart_mem_key = Integer.parseInt(request.getParameter("cart_mem_key"));
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null; 
			System.out.println("cart 메서드 try구문 진입전.");
			try {
				
				con = pool.getConnection();
				
				sql = "INSERT INTO cart(cart_tot,cart_qty,cart_pro_key,cart_mem_key)\r\n"
						+ "VALUES(?,?,?,?);";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cart_tot );
				pstmt.setInt(2, cart_qty);
				pstmt.setInt(3, cart_pro_key);
				pstmt.setInt(4, cart_mem_key);
				pstmt.executeUpdate();	
				System.out.println("쿼리 실행 완료. ");
				System.out.println("데이터베이스 저장 완료.");
				
			}	catch(Exception e) {
					e.printStackTrace();
					
			}	finally {
					pool.freeConnection(con, pstmt, rs);
					
			}	
			return;
	}
	
	// wish 데이터베이스 저장
	
		public void wish(HttpServletRequest request) {
				System.out.println("wish 메서드 진입");
				int wish_pro_key = Integer.parseInt(request.getParameter("wish_pro_key"));
				int wish_mem_key = Integer.parseInt(request.getParameter("wish_mem_key"));
				
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null; 
				System.out.println("위시 메서드 try구문 진입전.");
				try {
					
					con = pool.getConnection();
					
					sql = "INSERT INTO wish(wish_pro_key, wish_mem_key)\r\n"
							+ "VALUES(?,?);";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, wish_pro_key);
					pstmt.setInt(2, wish_mem_key);
					pstmt.executeUpdate();	
					System.out.println("쿼리 실행 완료. ");
					System.out.println("데이터베이스 저장 완료.");
					
				}	catch(Exception e) {
						e.printStackTrace();
						
				}	finally {
						pool.freeConnection(con, pstmt, rs);
						
				}	
				return;
		}
	
}
