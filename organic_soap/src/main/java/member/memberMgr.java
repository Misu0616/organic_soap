package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class memberMgr {
	
	private DBConnectionMgr pool;

	public memberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public boolean checkEmail(String mem_email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			
			sql = "select mem_email from members where mem_email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_email);
			flag = pstmt.executeQuery().next();
					
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return flag;
	}
	
	public boolean registerMember(memberBean bean) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			
			sql = "insert members(mem_email,mem_pw,mem_tel,mem_name,mem_address1,mem_address2,mem_postal_code)values(?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getMem_email());
			pstmt.setString(2, bean.getMem_pw());
			pstmt.setString(3, bean.getMem_tel());
			pstmt.setString(4, bean.getMem_name());
			pstmt.setString(5, bean.getMem_address1());
			pstmt.setString(6, bean.getMem_address2());
			pstmt.setString(7, bean.getMem_postal_code());
			
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
		
		return flag;
	}
	public boolean loginMember(String mem_email, String mem_pw) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		String sql = null;
				
		boolean flag = false;
				
		try {
			con = pool.getConnection();
					
			sql = "select mem_email from members where mem_email = ? and mem_pw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_email);
			pstmt.setString(2, mem_pw);
					
			rs = pstmt.executeQuery();
					
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	public String searchId(String mem_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String email = null;
		
		try {
			con = pool.getConnection();
			
			sql = "select mem_email from members where mem_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_name);		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				email = rs.getString("mem_email");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return email;
	}
	
	public String sessionKey(String mem_email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		String sql = null;
		String key = null;
		
		try {
			con = pool.getConnection();
			
			sql = "select mem_key from members where mem_email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_email);		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				key = rs.getString("mem_key");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return key;
	}
}
