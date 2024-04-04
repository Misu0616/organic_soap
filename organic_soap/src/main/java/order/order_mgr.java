package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DBConnectionMgr;
import member.memberBean;
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
		
	
	
	// 주문자 정보 입력받을 쿼리-주문 내역으로 정보 이동-로그인 후 세션에 저장된 정보 가져오기
	// 나중에 다른 분이 beans 이름 저장한대로 바꾸기 이건 아직 안 씀
	public Vector<memberBean> getMemInfo(String mem_key){
		//로그인 후 세션에 저장된 사용자 아이디, 혹은 사용자 pk 값을 매개변수로 받아서
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = null;
		
		Vector<memberBean> vlist = new Vector<memberBean>();
		try {
			
			con = pool.getConnection();
			
			sql = "SELECT mem_name, mem_tel, mem_email, mem_address1, mem_address2, mem_postal_code "
					+ " FROM members WHERE mem_key = ?";
			
			System.out.println("getMemInfo mem_key : " + mem_key);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_key);
			rs = pstmt.executeQuery();
			System.out.println("2 mem_key : " + mem_key);
			while(rs.next()) {
				
				memberBean mBean = new memberBean();
				mBean.setMem_name(rs.getString("mem_name"));
				mBean.setMem_tel(rs.getString("mem_tel"));
				mBean.setMem_email(rs.getString("mem_email"));
				mBean.setMem_address1(rs.getString("mem_address1"));
				mBean.setMem_address2(rs.getString("mem_address2"));
				mBean.setMem_postal_code(rs.getString("mem_postal_code"));
				
				System.out.println("getMemInfo mem_name : " + mBean.getMem_name());
				System.out.println("getMemInfo mem_tel : " + mBean.getMem_tel());
				System.out.println("getMemInfo mem_email : " + mBean.getMem_email());
				System.out.println("getMemInfo mem_address1 : " + mBean.getMem_address1());
				System.out.println("getMemInfo mem_address2 : " + mBean.getMem_address2());
				System.out.println("getMemInfo mem_postal_code : " + mBean.getMem_postal_code());
				
				vlist.add(mBean);
			}
	} catch (Exception e) {
			e.printStackTrace();
			
		}	finally {
				pool.freeConnection(con, pstmt, rs);
		}	
		return vlist;
	}
	
	// 카트에 있는 내용 가져오기
	public Vector<order_cart_bean>select_cart(String mem_key){
		
		System.out.println("omgr mem_key : " + mem_key );
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = null;
		
		
		
		Vector<order_cart_bean> vlist = new Vector<order_cart_bean>();
		try {
			
			con = pool.getConnection();
			
			sql = "SELECT a.cart_tot, a.cart_qty, b.pro_img, b.pro_name, b.pro_price FROM cart a "
					+ "JOIN product b "
					+ "ON a.cart_pro_key = b.pro_key "
					+ "JOIN members c "
					+ "ON a.cart_mem_key = c.mem_key "
					+ "WHERE cart_mem_key = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_key);
			rs = pstmt.executeQuery();
			

			while(rs.next()) {
					
				order_cart_bean ocb = new order_cart_bean(); 
				
				ocb.setCart_tot(rs.getInt("cart_tot"));
				ocb.setCart_qty(rs.getInt("cart_qty"));
				ocb.setPro_img(rs.getString("pro_img"));
				ocb.setPro_name(rs.getString("pro_name"));
				ocb.setPro_price(rs.getInt("pro_price"));
				
				vlist.add(ocb);
				
				System.out.println("oMgr cart_tot : " + ocb.getCart_tot());
				System.out.println("oMgr cart_qty : " + ocb.getCart_qty());
				System.out.println("oMgr pro_img : " + ocb.getPro_img());
				System.out.println("oMgr pro_name : " + ocb.getPro_name());
				System.out.println("oMgr pro_price : " + ocb.getPro_price());
				
				
	            System.out.println("resultList.size : " + vlist.size());
				
			}
			
		
			System.out.println("select_cart리스트 메서드 쿼리 실행완료. ");
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
			String mem_key = request.getParameter("mem_key");
			
			int r_mem_key = 0;
		    int r_mem_key_count = 0;
		    
				try {
				    con = pool.getConnection();
				    System.out.println("트라이 실행");
				    sql = "SELECT COUNT(*) AS r_mem_key_count FROM r_inform a JOIN members b ON a.r_mem_key = b.mem_key WHERE mem_key = ?";
				  
				    pstmt = con.prepareStatement(sql);
				    pstmt.setString(1, mem_key);
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
				        pstmt.setString(7, mem_key);
						
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
		public Vector<r_inform> selectR_inform(String mem_key) {
			System.out.println("selectR_inform 실행");
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null; 

			Vector<r_inform> vlist2 = new Vector<r_inform>();
			
			try {
				con = pool.getConnection();

				r_inform dto = new r_inform();
				
		        sql = "SELECT a.r_name, a.r_phone, a.r_postal_code, a.r_address1, a.r_address2, a.request FROM r_inform a "
		        		+ "JOIN members b "
		        		+ "ON a.r_mem_key = b.mem_key "
		        		+ "WHERE b.mem_key = ? ORDER BY r_info_key DESC LIMIT 1";
		
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mem_key);
				rs = pstmt.executeQuery();
				
		        while(rs.next()) {
		        	
				dto.setR_name(rs.getString("r_name"));
				dto.setR_phone(rs.getString("r_phone"));
				dto.setR_postal_code(rs.getString("r_postal_code"));
				dto.setR_address1(rs.getString("r_address1"));
				dto.setR_address2(rs.getString("r_address2"));
				dto.setRequest(rs.getString("request"));
				vlist2.add(dto);
				
		      }
		     
		} 	catch (Exception e) {
				e.printStackTrace();
		}	finally {pool.freeConnection(con, pstmt, rs); }
			 return vlist2;
	}
		
		// 저장된 1번 배송지 불러오기
		public Vector<r_inform> getdvPlace1(String mem_key) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			
			Vector<r_inform> vlist3 = new Vector<r_inform>();

			try {  
				con = pool.getConnection();
				r_inform dto = new r_inform();
					
					sql = "SELECT b.mem_key, a.r_info_key, a.r_name, a.r_phone, a.r_postal_code, a.r_address1, a.r_address2, a.request, a.r_mem_key FROM r_inform a\r\n"
							+ "JOIN members b\r\n"
							+ "ON a.r_mem_key = b.mem_key\r\n"
							+ "WHERE b.mem_key = ? ORDER BY r_info_key ASC LIMIT 0, 1;";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,mem_key);
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
					vlist3.add(dto);
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
			return vlist3;
		}
		
		// 저장된 2번 배송지 불러오기
				public Vector<r_inform> getdvPlace2(String mem_key) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					
					Vector<r_inform> vlist4 = new Vector<r_inform>();

					try {
						con = pool.getConnection();
						r_inform dto = new r_inform();
							
							sql = "SELECT b.mem_key, a.r_info_key, a.r_name, a.r_phone, a.r_postal_code, a.r_address1, a.r_address2, a.request, a.r_mem_key FROM r_inform a\r\n"
									+ "JOIN members b\r\n"
									+ "ON a.r_mem_key = b.mem_key\r\n"
									+ "WHERE b.mem_key = ? ORDER BY r_info_key ASC LIMIT 1, 1;";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1,mem_key);
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
							vlist4.add(dto);
							
						}	
					}
							catch(Exception e) {
								e.printStackTrace();
						}	finally {
							pool.freeConnection(con, pstmt, rs);
						}
					return vlist4;
				}
				
				// 저장된 3번 배송지 불러오기
				public Vector<r_inform> getdvPlace3(String mem_key) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					
					Vector<r_inform> vlist5 = new Vector<r_inform>();

					try {
						con = pool.getConnection();
						r_inform dto = new r_inform();	
							sql = "SELECT b.mem_key, a.r_info_key, a.r_name, a.r_phone, a.r_postal_code, a.r_address1, a.r_address2, a.request, a.r_mem_key FROM r_inform a\r\n"
									+ "JOIN members b\r\n"
									+ "ON a.r_mem_key = b.mem_key\r\n"
									+ "WHERE b.mem_key = ? ORDER BY r_info_key ASC LIMIT 2, 1;";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1,mem_key);
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
							vlist5.add(dto);
							
						}	
					}
							catch(Exception e) {
								e.printStackTrace();
						}	finally {
							pool.freeConnection(con, pstmt, rs);
						}
					return vlist5;
				}
		// 포인트 조회하는 메서드
							
				public Vector<points> select_point(String mem_key) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null; 
					
					Vector<points> vlist = new Vector<points>();
					
					try {
						
						con = pool.getConnection();
						
						points po = new points();
						
						sql = "SELECT my_point FROM points a "
								+ "JOIN members b "
								+ "ON a.point_mem_key = b.mem_key "
								+ "WHERE point_mem_key = ? ";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, mem_key);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							
							po.setMy_point(rs.getInt("my_point"));
							vlist.add(po);
							
						}
					}	catch(Exception e) {
							e.printStackTrace();
							
					}	finally {
							pool.freeConnection(con, pstmt, rs);
							
					}	return vlist;
				}
				
		// 포인트 사용 후 use_point - insert, get_point-update 쿼리
		
					public void update_useGet(HttpServletRequest request) {
					int mem_key = Integer.parseInt(request.getParameter("mem_key"));
					int my_point = Integer.parseInt(request.getParameter("my_point"));
					int use_point = Integer.parseInt(request.getParameter("point"));
					int get_point = Integer.parseInt(request.getParameter("get_point"));
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null; 
					
					try {
						
						con = pool.getConnection();
						
						sql = "UPDATE points SET my_point = my_point-?+?, use_point = ?, get_point = get_point+? "
								+ "WHERE point_mem_key IN ( "
								+ "SELECT mem_key "
								+ "FROM members "
								+ "WHERE mem_key = ?)";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, use_point );
						pstmt.setInt(2, get_point);
						pstmt.setInt(3, use_point);
						pstmt.setInt(4, get_point);
						pstmt.setInt(5, mem_key);
						pstmt.executeUpdate();						
						
					}	catch(Exception e) {
							e.printStackTrace();
							
					}	finally {
							pool.freeConnection(con, pstmt, rs);
							
					}	
				}
					
				public Vector<productBean> search(String search){
						Connection con = null;
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						String sql = null;
						
						
						Vector<productBean> vlist = new Vector<productBean>();
						
						//String search = request.getParameter("search");
						System.out.println("oMgr search : " + search);
						
						try {							
							con = pool.getConnection();
							
							sql = "SELECT * FROM product WHERE pro_name LIKE ?";
							String SearchTerm = "%" + search + "%";
							
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, SearchTerm);
							rs = pstmt.executeQuery();
							
							while(rs.next()) {
								
								productBean proBean = new productBean();
								
								proBean.setPro_name(rs.getString("pro_name"));
								proBean.setPro_img(rs.getString("pro_img"));
								proBean.setPro_price(rs.getInt("pro_price"));
								proBean.setPro_link(rs.getString("pro_link"));
								vlist.add(proBean);
								
								System.out.println("oMgr pro_name2 : " + proBean.getPro_name() );
								System.out.println("oMgr pro_img2 : " + proBean.getPro_img());
								System.out.println("oMgr pro_price2 : " + proBean.getPro_price() );
								
							}
							
						}
						
							catch(Exception e ) {
								e.printStackTrace();
						}	
							finally {
								pool.freeConnection(con, pstmt, rs);
							}
						return vlist;
					}
		
				// order_detail 로 갈 때 주문 정보 insert
				
				public void insert_info(HttpServletRequest request, String mem_key) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					
					String od_status = request.getParameter("od_status");
					String od_shipping = request.getParameter("od_shipping");
					int od_tot = Integer.parseInt(request.getParameter("od_tot"));
					int od_r_info_key = Integer.parseInt(request.getParameter("od_r_info_key"));
					int od_pay_key = Integer.parseInt(request.getParameter("od_pay_key"));
					int od_point_key = Integer.parseInt(request.getParameter("od_point_key"));
					
					
					try {
						
						con = pool.getConnection();
						
						sql = "INSERT INTO order_sheet(od_status, od_shipping, od_tot, od_r_info_key, od_pay_key, od_point_key) "
								+ "VALUES (?, ?, ?, ?, ?, ?);";
						//(\"입금 완료\", \"로젠 택배\", 2, 47, 3, 1)
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, od_status);
						pstmt.setString(2, od_shipping);
						pstmt.setInt(3, od_tot);
						pstmt.setInt(4, od_r_info_key);
						pstmt.setInt(5, od_pay_key);
						pstmt.setInt(6, od_point_key);
						
						
					}	catch (Exception e) {
							e.printStackTrace();
					}	finally {
							pool.freeConnection(con, pstmt);
					}
							
					
				}
				// order_detail 로 갈 때 주문 정보 select
	
}
