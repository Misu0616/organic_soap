package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DBConnectionMgr;
import member.member_dto;
import product.productBean;

public class order_mgr {

	private DBConnectionMgr pool;
	
	public order_mgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		}	catch(Exception e) {
			e.printStackTrace();
		}
	}
		
	// 주문 상품 정보 가져올 메소드(제품 사진, 이름, 가격)-장바구니에서 가져오기
	public Vector<productBean> getProductList(int memno){
		//로그인 후 세션에 저장된 사용자 아이디, 혹은 사용자 pk 값을 매개변수로 받아서
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = null;
		
		Vector<productBean> vlist = new Vector<productBean>();
		
		System.out.println("매개변수 값 = " + memno);
		try {
			
			con = pool.getConnection();
			
			//sql = "select pro_img, pro_name, pro_price from product where pro_key = 1";
			sql = "SELECT b.pro_price,b.pro_img,b.pro_name,c.mem_name FROM cart a "
					+ "JOIN product b ON a.cart_pro_key = b.pro_key"
					+ "JOIN members c ON a.cart_mem_key = c.mem_key" 
					+ "WHERE a.cart_mem_key = ?";
			
			rs = pstmt.executeQuery(sql);
		
			System.out.println("getproduct리스트 메서드 쿼리 실행완료. ");
	} catch (Exception e) {
			e.printStackTrace();
			
		}	finally {
				pool.freeConnection(con, pstmt, rs);
		}	
		return vlist;
	}
	
	// 주문자 정보 입력받을 쿼리-주문 내역으로 정보 이동-로그인 후 세션에 저장된 정보 가져오기
	// 나중에 다른 분이 beans 이름 저장한대로 바꾸기
	public Vector<member_dto> getMemInfo(int memno){
		//로그인 후 세션에 저장된 사용자 아이디, 혹은 사용자 pk 값을 매개변수로 받아서
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = null;
		
		Vector<member_dto> vlist = new Vector<member_dto>();
		
		System.out.println("매개변수 값 = " + memno);
		try {
			
			con = pool.getConnection();
			
			//sql = "select pro_img, pro_name, pro_price from product where pro_key = 1";
			sql = "SELECT mem_name, mem_tel, mem_email FROM member WHERE mem_key = 1";
			
			rs = pstmt.executeQuery(sql);
		
			System.out.println("getproduct리스트 메서드 쿼리 실행완료. ");
	} catch (Exception e) {
			e.printStackTrace();
			
		}	finally {
				pool.freeConnection(con, pstmt, rs);
		}	
		return vlist;
	}
	
	// 수령인 정보 입력 (회원 정보 불러오기)-주문 내역 정보 이동-로그인 후 세션에 저장된 정보 가져오기
	public Vector<member_dto> getMemInfo2(int memno){
		//로그인 후 세션에 저장된 사용자 아이디, 혹은 사용자 pk 값을 매개변수로 받아서
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = null;
		
		Vector<member_dto> vlist = new Vector<member_dto>();
		
		System.out.println("매개변수 값 = " + memno);
		try {
			
			con = pool.getConnection();
			
			sql = "SELECT mem_name, mem_tel, mem_postalcode, mem_address1, mem_address2 "
					+ "FROM member WHERE mem_key = 1 ";
			sql = "INSERT INTO request VALUES(?)";
			rs = pstmt.executeQuery(sql);
		
			System.out.println("getproduct리스트 메서드 쿼리 실행완료. ");
	} catch (Exception e) {
			e.printStackTrace();
			
		}	finally {
				pool.freeConnection(con, pstmt, rs);
		}	
		return vlist;
	}

	// 배송지 목록 추가 쿼리-  r_inform으로 정보 이동
		public void insertRinform(HttpServletRequest request) {
			System.out.println("insertRinform 실행");
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean check = false;
			
			String r_name = request.getParameter("receive");
			String r_phone = request.getParameter("phonenum2");
			String r_postal_code = request.getParameter("addn");
			String r_address1 = request.getParameter("adr");
			String r_address2 = request.getParameter("detadr");
			String memo = request.getParameter("memo");
			int mem_key = Integer.parseInt(request.getParameter("mem_key"));
			
			try {
				con = pool.getConnection();	
				sql = "INSERT INTO r_inform (r_name, r_phone, r_postal_code, r_address1, r_address2, request, r_mem_key)";
				sql += " VALUES (?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, r_name);
				pstmt.setString(2, r_phone);
				pstmt.setString(3, r_postal_code);
				pstmt.setString(4, r_address1);
				pstmt.setString(5, r_address2);
				pstmt.setString(6, memo);
				pstmt.setInt(7, mem_key);
				
				check = pstmt.execute(); //boolean 결과 담아야함
				//pstmt.executeUpdate(); , int 타입 결과를 담아야 쿼리가 실행이됨.
				r_inform dto = new r_inform();
				
				dto.setR_name(r_name);
				dto.setR_phone(r_phone);
				dto.setR_postal_code(r_postal_code);
				dto.setR_address1(r_address1);
				dto.setR_address2(r_address2);
				dto.setRequest(memo);
				dto.setR_mem_key(mem_key);
			
			}
				catch(Exception e ) {
					e.printStackTrace();
			}	finally {
					pool.freeConnection(con, pstmt);
			}
			
		}
		
		// 저장된 1번 배송지 불러오기
		public Vector<r_inform> getdvPlace1(int mem_key) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			
			Vector<r_inform> vlist = new Vector<r_inform>();

			try {  
				con = pool.getConnection();
				r_inform dto = new r_inform();
					
					sql = "SELECT b.mem_key, a.r_info_key, a.r_name, a.r_phone, a.r_postal_code, a.r_address1, a.r_address2, a.request, a.r_mem_key FROM r_inform a\r\n"
							+ "JOIN members b\r\n"
							+ "ON a.r_mem_key = b.mem_key\r\n"
							+ "WHERE b.mem_key = ? ORDER BY r_info_key ASC LIMIT 0, 1;";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,mem_key);
					rs = pstmt.executeQuery();
					
				while(rs.next()) {
					
					dto.setR_info_key(rs.getInt("r_info_key"));
					dto.setR_name(rs.getString("r_name"));
					dto.setR_phone(rs.getString("r_phone"));
					dto.setR_postal_code(rs.getString("r_postal_code"));
					dto.setR_address1(rs.getString("r_address1"));
					dto.setR_address2(rs.getString("r_address2"));
					dto.setRequest(rs.getString("request"));
					dto.setR_mem_key(rs.getInt("r_mem_key"));
					vlist.add(dto);
					System.out.println("while의 r_info_key : " + rs.getInt("r_info_key"));
					System.out.println("while의 r_name : " + rs.getString("r_name"));
					System.out.println("while의 r_phone" + rs.getString("r_phone"));
					System.out.println("while의 r_postal_code" + rs.getString("r_postal_code"));
					System.out.println("while의 r_address1" + rs.getString("r_address1"));
					System.out.println("while의 r_address2" + rs.getString("r_address2"));
					System.out.println("while의 request" + rs.getString("request"));
					System.out.println("while의 r_mem_key" + rs.getInt("r_mem_key"));
				}	
			}
					catch(Exception e) {
						e.printStackTrace();
				}	finally {
					pool.freeConnection(con, pstmt, rs);
				}
			return vlist;
		}
		
		// 저장된 2번 배송지 불러오기
				public Vector<r_inform> getdvPlace2(int mem_key) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					
					Vector<r_inform> vlist = new Vector<r_inform>();

					try {
						con = pool.getConnection();
						r_inform dto = new r_inform();
							
							sql = "SELECT b.mem_key, a.r_info_key, a.r_name, a.r_phone, a.r_postal_code, a.r_address1, a.r_address2, a.request, a.r_mem_key FROM r_inform a\r\n"
									+ "JOIN members b\r\n"
									+ "ON a.r_mem_key = b.mem_key\r\n"
									+ "WHERE b.mem_key = ? ORDER BY r_info_key ASC LIMIT 1, 1;";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1,mem_key);
							rs = pstmt.executeQuery();
								
						while(rs.next()) {
							
							dto.setR_info_key(rs.getInt("r_info_key"));
							System.out.println("r_info_key : " + dto.getR_info_key() );
							dto.setR_name(rs.getString("r_name"));
							dto.setR_phone(rs.getString("r_phone"));
							dto.setR_postal_code(rs.getString("r_postal_code"));
							dto.setR_address1(rs.getString("r_address1"));
							dto.setR_address2(rs.getString("r_address2"));
							dto.setRequest(rs.getString("request"));
							dto.setR_mem_key(rs.getInt("r_mem_key"));
							vlist.add(dto);
							
						}	
					}
							catch(Exception e) {
								e.printStackTrace();
						}	finally {
							pool.freeConnection(con, pstmt, rs);
						}
					return vlist;
				}
				
				// 저장된 3번 배송지 불러오기
				public Vector<r_inform> getdvPlace3(int mem_key) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					
					Vector<r_inform> vlist = new Vector<r_inform>();

					try {
						con = pool.getConnection();
						r_inform dto = new r_inform();
							
							sql = "SELECT b.mem_key, a.r_info_key, a.r_name, a.r_phone, a.r_postal_code, a.r_address1, a.r_address2, a.request, a.r_mem_key FROM r_inform a\r\n"
									+ "JOIN members b\r\n"
									+ "ON a.r_mem_key = b.mem_key\r\n"
									+ "WHERE b.mem_key = ? ORDER BY r_info_key ASC LIMIT 2, 1;";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1,mem_key);
							rs = pstmt.executeQuery();
							
						while(rs.next()) {
							
							dto.setR_info_key(rs.getInt("r_info_key"));
							dto.setR_name(rs.getString("r_name"));
							dto.setR_phone(rs.getString("r_phone"));
							dto.setR_postal_code(rs.getString("r_postal_code"));
							dto.setR_address1(rs.getString("r_address1"));
							dto.setR_address2(rs.getString("r_address2"));
							dto.setRequest(rs.getString("request"));
							dto.setR_mem_key(rs.getInt("r_mem_key"));
							vlist.add(dto);
							
						}	
					}
							catch(Exception e) {
								e.printStackTrace();
						}	finally {
							pool.freeConnection(con, pstmt, rs);
						}
					return vlist;
				}
				
		// 포인트-주문 내역 정보 이동
		// 총 주문금액 입력-주문 내역 정보 이동
		// 적립 예정 포인트-주문 내역 정보 이동
		// 결제 수단-주문 내역 정보 이동
		// 결제 동의-주문 내역 정보 이동
		// 구매 버튼 누르면 정보 이동-주문 내역 정보 이동
		
		
	
}
