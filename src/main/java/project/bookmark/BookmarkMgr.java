package project.bookmark;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import project.DBConnectionMgr;
import project.restInfo.RestInfoBean;
import project.restInfo.RestInfoMgr;

public class BookmarkMgr {

	private DBConnectionMgr pool;
	public BookmarkMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<BookmarkBean> getBookmarkInfos(String user_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<BookmarkBean> vlist = new Vector<BookmarkBean>();
		try {
			con = pool.getConnection();
			sql = "select * from bookmark where user_id = ? and bookmark_status = 1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookmarkBean bean = new BookmarkBean();

				int rest_id = rs.getInt("rest_id");
				
				int bookmarkcount = countBookmarks(rest_id);
				int reviewcount = countReviews(rest_id);
				
				RestInfoMgr info = new RestInfoMgr();
				RestInfoBean rbean = new RestInfoBean();
				rbean = info.getRestInfo(rest_id);
				
				String rest_name = rbean.getRest_name();
				String mainImage = rbean.getRest_image1();
								
				bean.setBookmark_count(bookmarkcount);
				bean.setReview_count(reviewcount);
				bean.setRest_name(rest_name);
				bean.setMain_image(mainImage);
				bean.setRest_id(rest_id);
				
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public Vector<BookmarkBean> getBookmarkInfos2(String user_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<BookmarkBean> vlist = new Vector<BookmarkBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT b.*, r.rest_name, r.rest_image1 "
					+ "FROM bookmark b "
					+ "INNER JOIN rest_info r ON b.rest_id = r.rest_id "
					+ "WHERE b.user_id = ? AND b.bookmark_status = 1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookmarkBean bean = new BookmarkBean();
				
				int rest_id = rs.getInt("rest_id");
				
				int bookmarkcount = countBookmarks(rest_id);
				int reviewcount = countReviews(rest_id);
				
				String mainImage = "../img/rest_info/" + rs.getString("rest_image1");
				
				bean.setBookmark_count(bookmarkcount);
				bean.setReview_count(reviewcount);
				bean.setRest_name(rs.getString("rest_name"));
				bean.setMain_image(mainImage);	
				bean.setRest_id(rest_id);
				
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	private int countReviews(int rest_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from review where rest_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return count;
	}
	
	private int countBookmarks(int rest_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from bookmark where rest_id = ? and bookmark_status = 1";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return count;
	}
	
	public int addToggleBookmark(BookmarkBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int flag = -1;
		try {
			con = pool.getConnection();

			// Finally, add the bookmark (or toggle the existing one)
			sql = "INSERT INTO bookmark (rest_id, user_id, bookmark_status) "
					+ "VALUES (?, ?, 1) "
					+ "ON DUPLICATE KEY UPDATE bookmark_status = CASE bookmark_status "
					+ "    WHEN 0 THEN 1 "
					+ "    WHEN 1 THEN 0 "
					+ "END";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getRest_id());
			pstmt.setString(2, bean.getUser_id());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public int getStatus(String user_id, int rest_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int flag = -1;
		try {
			con = pool.getConnection();
			sql = "select bookmark_status from bookmark "
					+ "where rest_id = ? and user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			pstmt.setString(2, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("bookmark_status");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	
	public Vector<BookmarkBean> getReviews(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<BookmarkBean> vlist = new Vector<BookmarkBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT r.rest_name, r.rest_image1, b.rest_id, COUNT(*) AS cnt FROM rest_info r "
				    + "INNER JOIN bookmark b ON r.rest_id = b.rest_id "
				    + "WHERE b.bookmark_status = 1 "
				    + "GROUP BY b.rest_id "
				    + "ORDER BY cnt DESC, b.rest_id "
				    + "LIMIT 5";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookmarkBean bean = new BookmarkBean();				
				int rest_id = rs.getInt("rest_id");				
				int bookmarkcount = countBookmarks(rest_id);
				int reviewcount = countReviews(rest_id);				
				String mainImage = "../img/rest_info/" + rs.getString("rest_image1");				
				bean.setBookmark_count(bookmarkcount);
				bean.setReview_count(reviewcount);
				bean.setRest_name(rs.getString("rest_name"));
				bean.setMain_image(mainImage);	
				bean.setRest_id(rest_id);
				
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
