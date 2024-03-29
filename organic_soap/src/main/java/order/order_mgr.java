package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DBConnectionMgr;
import member.memberBean;

public class order_mgr {

	private DBConnectionMgr pool;
	
	public order_mgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		}	catch(Exception e) {
			e.printStackTrace();
		}
	}
		
	
	
	// 주문자 정보 입력받을 쿼리-주문 내역으로 정보 이동-로그인 후 세션에 저장된 정보 가져오기
	// 나중에 다른 분이 beans 이름 저장한대로 바꾸기
	public Vector<memberBean> getMemInfo(int memno){
		//로그인 후 세션에 저장된 사용자 아이디, 혹은 사용자 pk 값을 매개변수로 받아서
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = null;
		
		Vector<memberBean> vlist = new Vector<memberBean>();
		
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
	public Vector<memberBean> getMemInfo2(int memno){
		//로그인 후 세션에 저장된 사용자 아이디, 혹은 사용자 pk 값을 매개변수로 받아서
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = null;
		
		Vector<memberBean> vlist = new Vector<memberBean>();
		
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
		public void insertRinform(HttpServletRequest request,HttpServletResponse response) {
			System.out.println("insertRinform 실행");
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			
			String r_name = request.getParameter("r_name");
			String r_phone = request.getParameter("r_phone");
			String r_postal_code = request.getParameter("r_postal_code");
			String r_address1 = request.getParameter("r_address1");
			String r_address2 = request.getParameter("r_address2");
			String memo = request.getParameter("memo");
			int mem_key = Integer.parseInt(request.getParameter("mem_key"));
			int r_mem_key = 0;
		    int r_mem_key_count = 0;
		    
				try {
				    con = pool.getConnection();
				    
				    sql = "SELECT COUNT(*) AS r_mem_key_count FROM r_inform a JOIN members b ON a.r_mem_key = b.mem_key WHERE mem_key = ?";
				  
				    pstmt = con.prepareStatement(sql);
				    pstmt.setInt(1, mem_key);
				    rs = pstmt.executeQuery();
				    
				    if (rs.next()) {
				        r_mem_key_count = rs.getInt("r_mem_key_count");
				        
				        request.setAttribute("r_mem_key_count", r_mem_key_count);
				    }
				    
				    if (r_mem_key_count < 3) {
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
						
				        pstmt.executeUpdate();
				    }
				   
				    }
			
				catch(Exception e ) {
					e.printStackTrace();
			}	finally {
					pool.freeConnection(con, pstmt, rs); 
			}
		
				}

		
		// r_inform 부분 select하기
		public Vector<r_inform> selectR_inform(int mem_key) {
			System.out.println("selectR_inform 실행");
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null; 

			Vector<r_inform> vlist = new Vector<r_inform>();
			
			try {
				con = pool.getConnection();

				r_inform dto = new r_inform();
				
		        sql = "SELECT a.r_name, a.r_phone, a.r_postal_code, a.r_address1, a.r_address2, a.request FROM r_inform a "
		        		+ "JOIN members b "
		        		+ "ON a.r_mem_key = b.mem_key "
		        		+ "WHERE b.mem_key = ? ORDER BY r_info_key DESC LIMIT 1";
		
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, mem_key);
				rs = pstmt.executeQuery();
				
		        while(rs.next()) {
		        	
				dto.setR_name(rs.getString("r_name"));
				dto.setR_phone(rs.getString("r_phone"));
				dto.setR_postal_code(rs.getString("r_postal_code"));
				dto.setR_address1(rs.getString("r_address1"));
				dto.setR_address2(rs.getString("r_address2"));
				dto.setRequest(rs.getString("request"));
				vlist.add(dto);
				
		      }
		     
		} 	catch (Exception e) {
				e.printStackTrace();
		}	finally {pool.freeConnection(con, pstmt, rs); }
			 return vlist;
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
		// 포인트 조회하는 메서드
							
				public Vector<points> select_point(int mem_key) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null; 
					
					Vector<points> vlist = new Vector<points>();
					
					try {
						
						System.out.println("select_point 실행");
						con = pool.getConnection();
						
						points po = new points();
								
						sql = "SELECT a.my_point, a.use_point, a.get_point FROM members b "
								+ "JOIN points a " 
								+ "ON a.point_key = b.mem_key WHERE b.mem_key = ?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, mem_key);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							po.setMy_point(rs.getInt("my_point"));
							po.setUse_point(rs.getInt("use_point"));
							po.setGet_point(rs.getInt("get_point"));
							vlist.add(po);
							
							System.out.println("oder_mgr my_point : " + po.getMy_point());
							System.out.println("oder_mgr use_point : " + po.getUse_point());
							System.out.println("oder_mgr get_point : " + po.getGet_point());
							
						}
					}	catch(Exception e) {
							e.printStackTrace();
							
					}	finally {
							pool.freeConnection(con, pstmt, rs);
							
					}	return vlist;
				}
				
		// 포인트 사용 후 다시 추가하는 메서드 업데이트 쿼리
		
		// 총 주문금액 입력-주문 내역 정보 이동
		// 적립 예정 포인트-주문 내역 정보 이동
		// 결제 수단-주문 내역 정보 이동
		// 결제 동의-주문 내역 정보 이동
		// 구매 버튼 누르면 정보 이동-주문 내역 정보 이동
		
		
	
}
