package mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class mp_order_mgr {

	private DBConnectionMgr pool;
	
	public mp_order_mgr() {
		
		try {
			
			pool = DBConnectionMgr.getInstance();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
/*	
	//회원이름 불러오기
	public String getMemInfo(int mem_key) { //return시 vector타입으로 결과값을 return  하겠다
		System.out.println("getMemInfo 메서드 호출");
		Connection con = null; //db 연결객체
		PreparedStatement pstmt = null; //쿼리실행객체
		ResultSet rs = null; //결과값저장 객체
		
		String sql = null; //쿼리문을 문자열타입으로 저장하는 변수
		
		//Vector<memberBean> vlist = new Vector<memberBean>();
		String memName = null;
		System.out.println("매개변수 값 = " + mem_key);
		
		try {
			
			con = pool.getConnection();
			
			sql = "SELECT mem_name FROM members WHERE mem_key = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem_key);
			rs = pstmt.executeQuery();
			System.out.println("쿼리 실행 완료.");
			//System.out.println( "쿼리 실행 결과 =" + rs.getString("mem_name"));
			while(rs.next()) {
			memName = rs.getString("mem_name");
			}
			System.out.println("회원이름 조회완료");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			pool.freeConnection(con, pstmt, rs);
			
		}
		
		return memName;
	}
*/
	// 이름, 포인트 조회하는 메서드 (마이페이지 공용)
	
	public Vector<mp_order_bean> select_point(String mem_key) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null; 
		
		Vector<mp_order_bean> vlist = new Vector<mp_order_bean>();
		
		try {
			
			System.out.println("select_point 실행");
			con = pool.getConnection();
			
			mp_order_bean mpBean = new mp_order_bean();

			sql = "SELECT b.mem_name, a.my_point FROM points a "
					+ "JOIN members b "
					+ "ON a.point_mem_key = b.mem_key "
					+ "WHERE b.mem_key = ?";
			
			System.out.println("쿼리 실행 완료");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_key);
			rs = pstmt.executeQuery();
			System.out.println("while 진입 전");
			
			while(rs.next()) {

				mpBean.setMem_name(rs.getString("mem_name"));
				mpBean.setMy_point(rs.getInt("my_point"));
				
				System.out.println("회원 이름  = " + mpBean.getMem_name());
				System.out.println("마이포인트  = " + mpBean.getMy_point());
				
				vlist.add(mpBean);
				System.out.println();
				
				
			}
		}	catch(Exception e) {
				e.printStackTrace();
				
		}	finally {
				pool.freeConnection(con, pstmt, rs);
				
		}	return vlist;
	}
	
	//주문번호, 주문날짜 select
	/*public Vector<mp_order_bean> select_order_date(String mem_key) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		Vector<mp_order_bean> vlist = new Vector<mp_order_bean>();
		
		try {
			
			con = pool.getConnection();
			
			mp_order_bean mpBean = new mp_order_bean();
			
			sql = "SELECT b.od_key, b.od_date FROM order_pro_sheet a "
					+ "JOIN order_sheet b "
					+ "ON a.odp_od_key = b.od_key "
					+ "JOIN members c "
					+ "ON a.odp_mem_key = c.mem_key "
					+ "WHERE c.mem_key = ? ";
			
			System.out.println("주문조회 쿼리 실행 완료");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_key);
			rs = pstmt.executeQuery();
			System.out.println("while 진입 전");
			
			while(rs.next()) {
				
				mpBean.setOd_key(rs.getString("od_key"));
				mpBean.setOd_date(rs.getString("od_date"));
				
				
				System.out.println("주문 번호  = " + mpBean.getOd_key());
				System.out.println("주문 날짜  = " + mpBean.getOd_date());
				vlist.add(mpBean);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}*/
	
	//주문조회 페이지 select
	
	public Vector<mp_order_bean> select_order(String mem_key) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		Vector<mp_order_bean> vlist = new Vector<mp_order_bean>();
		
		try {
			
			con = pool.getConnection();
			
			sql = "SELECT b.od_key, b.od_date,c.pro_img, c.pro_name, c.pro_price, c.pro_link, a.cart_qty, b.od_status FROM cart a "
					+ "JOIN order_sheet b " 
					+ "ON a.cart_od_key = b.od_key "
					+ "JOIN product c " 
					+ "ON a.cart_pro_key = c.pro_key "
					+ "WHERE a.cart_mem_key = ?"
					+ "ORDER BY b.od_date DESC"; 
			
			System.out.println("주문조회 쿼리 실행 완료");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_key);
			rs = pstmt.executeQuery();
			System.out.println("while 진입 전");
			
			while(rs.next()) {
				mp_order_bean mpBean = new mp_order_bean();
				
				mpBean.setOd_key(rs.getString("od_key"));
				mpBean.setOd_date(rs.getString("od_date"));
				mpBean.setPro_img(rs.getString("pro_img"));
				mpBean.setPro_name(rs.getString("pro_name"));
				mpBean.setPro_price(rs.getInt("pro_price"));
				mpBean.setPro_link(rs.getString("pro_link"));
				mpBean.setCart_qty(rs.getInt("cart_qty"));
				mpBean.setOd_status(rs.getString("od_status"));
				
				
				System.out.println("주문 번호  = " + mpBean.getOd_key());
				System.out.println("주문 날짜  = " + mpBean.getOd_date());
				System.out.println("상품 사진  = " + mpBean.getPro_img());
				System.out.println("상품 이름  = " + mpBean.getPro_name());
				System.out.println("상품 가격  = " + mpBean.getPro_price());
				System.out.println("상품 링크  = " + mpBean.getPro_link());
				System.out.println("상품 갯수  = " + mpBean.getCart_qty());
				System.out.println("주문 상태  = " + mpBean.getOd_status());
				
				vlist.add(mpBean);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
	
	
	
}
