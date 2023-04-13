package project.membership;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import project.DBConnectionMgr;

public class MemberMgr {
	
	private DBConnectionMgr pool;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// 로그인
	public boolean loginMember(String user_id, String member_pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select user_id from Member where user_id=? and member_pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, member_pwd);
			rs = pstmt.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//아이디 중복 체크
	public boolean checkId(String user_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from Member where user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//회원가입
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert Member(user_id, member_pwd, member_name, member_birth, member_email) values(?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUser_id());
			pstmt.setString(2, bean.getMember_pwd());
			pstmt.setString(3, bean.getMember_name());
			pstmt.setString(4, bean.getMember_birth());
			pstmt.setString(5, bean.getMember_email());
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//회원정보 가져오기
	public MemberBean getMember(String user_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberBean bean = new MemberBean();
		try {
			con = pool.getConnection();
			sql = "select * from Member where user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setUser_id(rs.getString("user_id"));
				bean.setMember_pwd(rs.getString("member_pwd"));
				bean.setMember_name(rs.getString("member_name"));
				bean.setMember_grade(rs.getString("member_grade"));
				bean.setMember_birth(rs.getString("member_birth"));
				bean.setMember_email(rs.getString("member_email"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	//회원정보 수정
	public boolean updateMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update Member set member_pwd=?, member_name=?, member_birth=?, member_email=? where user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getMember_pwd());
			pstmt.setString(2, bean.getMember_name());
			pstmt.setString(3, bean.getMember_birth());
			pstmt.setString(4, bean.getMember_email());
			pstmt.setString(5, bean.getUser_id());
			if(pstmt.executeUpdate()==1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//메일보내기
	public String findId(String member_name, String member_email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String user_id = null;
		try {
			con = pool.getConnection();
			sql = "select user_id from member where member_name = ? and member_email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  member_name);
			pstmt.setString(2,  member_email);
			rs = pstmt.executeQuery();
			if(rs.next())
				user_id = rs.getString(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return user_id;
	}
	
	//메일보내기_비밀번호
	public String findPwd(String user_id, String member_name, String member_email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String member_pwd = null;
		try {
			con = pool.getConnection();
			sql = "select member_pwd from member where user_id = ? and member_name = ? and member_email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  user_id);
			pstmt.setString(2,  member_name);
			pstmt.setString(3,  member_email);
			rs = pstmt.executeQuery();
			if(rs.next())
				member_pwd = rs.getString(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return member_pwd;
	}

}
