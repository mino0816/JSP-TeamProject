package project.noticeBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import project.DBConnectionMgr;

public class NoticeMgr {
	
	private DBConnectionMgr pool;
	public NoticeMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<NoticeBoardBean> showNoticeEditList(int rest_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<NoticeBoardBean> vlist = new Vector<NoticeBoardBean>();
		try {
			con = pool.getConnection();
			sql = "select * from NoticeBoard where rest_id = ? order by notice_datetime ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeBoardBean bean = new NoticeBoardBean();
				bean.setNotice_id(rs.getInt("notice_id"));
				bean.setNotice_userid(rs.getString("notice_userid"));
				bean.setRest_id(rs.getInt("rest_id"));
				bean.setNotice_content(rs.getString("notice_content"));
				bean.setNotice_datetime(rs.getString("notice_datetime"));				
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	public boolean deleteNotice(int notice_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from NoticeBoard where notice_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_id);
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean insertNotice(NoticeBoardBean bean){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert NoticeBoard(notice_userid,"
					+ "rest_id, "
					+ "notice_content) "
					+ "values(?, ? ,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getNotice_userid());
			pstmt.setInt(2, bean.getRest_id());
			pstmt.setString(3, bean.getNotice_content());
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean editNotice(NoticeBoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update NoticeBoard SET "
					+ "notice_content = ? "
					+ "where notice_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getNotice_content());
			pstmt.setInt(2, bean.getNotice_id());
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public Vector<NoticeBoardBean> showNoticeList(int rest_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<NoticeBoardBean> vlist = new Vector<NoticeBoardBean>();
		try {
			con = pool.getConnection();
			sql = "select * from NoticeBoard "
			+ " where rest_id = ?"
			+ "	order by notice_datetime ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeBoardBean bean = new NoticeBoardBean();
				bean.setNotice_id(rs.getInt("notice_id"));
				bean.setNotice_userid(rs.getString("notice_userid"));
				bean.setRest_id(rs.getInt("rest_id"));
				bean.setNotice_content(rs.getString("notice_content"));
				bean.setNotice_datetime(rs.getString("notice_datetime"));				
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

}
