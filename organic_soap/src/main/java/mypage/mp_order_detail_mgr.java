package mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class mp_order_detail_mgr {
	
	private DBConnectionMgr pool;
	
	public mp_order_detail_mgr() {
		
		try {
			
			pool = DBConnectionMgr.getInstance();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	// 이름, 포인트 조회하는 메서드 (마이페이지 공용)
	
	public Vector<mp_order_detail_bean> select_point(String mem_key) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null; 
		
		Vector<mp_order_detail_bean> vlist = new Vector<mp_order_detail_bean>();
		
		try {
			
			System.out.println("select_point 실행");
			con = pool.getConnection();
			
			mp_order_detail_bean mpBean = new mp_order_detail_bean();

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
	
	//주문조회 페이지 select
	
	public Vector<mp_order_detail_bean> select_order_detail(String od_key, String mem_key) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		Vector<mp_order_detail_bean> vlist = new Vector<mp_order_detail_bean>();
		
		try {
			
			con = pool.getConnection();
			
			sql = "SELECT a.od_key, a.od_date, a.od_status, "
					+ "c.mem_name, c.mem_tel, c.mem_email, "
					+ "d.r_name, d.r_phone, d.r_postal_code, d.r_address1, d.r_address2, d.request, "
					+ "a.od_tot, e.pay "
					+ "FROM order_sheet a "
					+ "JOIN cart b "
					+ "ON a.od_key = b.cart_od_key "
					+ "JOIN members c "
					+ "ON b.cart_mem_key = c.mem_key "
					+ "JOIN r_inform d "
					+ "ON c.mem_key = d.r_mem_key "
					+ "JOIN payment e "
					+ "ON a.od_pay_key = e.pay_key "
					+ "WHERE a.od_key = ? AND c.mem_key = ?";
 
			
			System.out.println("주문조회 쿼리 실행 완료");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, od_key);
			pstmt.setString(2, mem_key);
			rs = pstmt.executeQuery();
			System.out.println("while 진입 전");
			
			while(rs.next()) {
				mp_order_detail_bean mpBean = new mp_order_detail_bean();
				

				mpBean.setOd_key(rs.getString("od_key"));
				mpBean.setOd_date(rs.getString("od_date"));
				mpBean.setOd_status(rs.getString("od_status"));
				mpBean.setMem_name(rs.getString("mem_name"));
				mpBean.setMem_tel(rs.getString("mem_tel"));
				mpBean.setMem_email(rs.getString("mem_email"));
				mpBean.setR_name(rs.getString("r_name"));
				mpBean.setR_phone(rs.getString("r_phone"));
				mpBean.setR_postal_code(rs.getString("r_postal_code"));
				mpBean.setR_address1(rs.getString("r_address1"));
				mpBean.setR_address2(rs.getString("r_address2"));
				mpBean.setRequest(rs.getString("request"));
				mpBean.setOd_tot(rs.getInt("od_tot"));
				mpBean.setPay(rs.getString("pay"));
				
				System.out.println("주문 번호 = " + mpBean.getOd_key());
				System.out.println("주문 날짜 = " + mpBean.getOd_date());
				System.out.println("주문 상태 = " + mpBean.getOd_status());
				System.out.println("회원 이름 = " + mpBean.getMem_name());
				System.out.println("회원 전화 = " + mpBean.getMem_tel());
				System.out.println("회원 메일 = " + mpBean.getMem_email());
				System.out.println("주문자 이름 = " + mpBean.getR_name());
				System.out.println("주문자 전화 = " + mpBean.getR_phone());
				System.out.println("주문자 우편번호 = " + mpBean.getR_postal_code());
				System.out.println("주문자 주소 1 = " + mpBean.getR_address1());
				System.out.println("주문자 주소 2 = " + mpBean.getR_address2());
				System.out.println("배송 요청 = " + mpBean.getRequest());
				System.out.println("총 금액 = " + mpBean.getOd_tot());
				System.out.println("결제 수단 = " + mpBean.getPay());

				
				vlist.add(mpBean);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}
	
	//주문상품조회 select
	
	public Vector<mp_order_detail_bean> select_order_product(String od_key, String mem_key) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		Vector<mp_order_detail_bean> vlist = new Vector<mp_order_detail_bean>();
		
		try {
			
			con = pool.getConnection();
			
			sql = "SELECT b.pro_link, b.pro_img, b.pro_name, b.pro_price, a.cart_qty FROM cart a "
					+ "JOIN product b "
					+ "ON a.cart_pro_key = b.pro_key "
					+ "JOIN members c "
					+ "ON a.cart_mem_key = c.mem_key "
					+ "JOIN order_sheet d "
					+ "ON a.cart_od_key = d.od_key "
					+ "WHERE d.od_key = ? AND c.mem_key = ?";
 
			
			System.out.println("주문상품조회 쿼리 실행 완료");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, od_key);
			pstmt.setString(2, mem_key);
			rs = pstmt.executeQuery();
			System.out.println("while 진입 전");
			
			while(rs.next()) {
				mp_order_detail_bean mpBean1 = new mp_order_detail_bean();
				
				mpBean1.setPro_link(rs.getString("pro_link"));
				mpBean1.setPro_img(rs.getString("pro_img"));
				mpBean1.setPro_name(rs.getString("pro_name"));
				mpBean1.setPro_price(rs.getInt("pro_price"));
				mpBean1.setCart_qty(rs.getInt("cart_qty"));

				
				System.out.println("상품 링크 = " + mpBean1.getPro_link());
				System.out.println("상품 사진 = " + mpBean1.getPro_img());
				System.out.println("상품 이름 = " + mpBean1.getPro_name());
				System.out.println("상품 가격 = " + mpBean1.getPro_price());
				System.out.println("상품 갯수 = " + mpBean1.getCart_qty());

				
				vlist.add(mpBean1);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			pool.freeConnection(con, pstmt, rs);
		}
		
		return vlist;
	}

}
