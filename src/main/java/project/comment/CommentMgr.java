package project.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import project.DBConnectionMgr;

public class CommentMgr {

	private DBConnectionMgr pool;
	public CommentMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<CommentBean> getComments(int review_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<CommentBean> vlist = new Vector<CommentBean>();
		try {
			con = pool.getConnection();
			sql = "select * from comment where comment_post_id = ? order by ref desc, pos";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentBean bean = new CommentBean();
				bean.setComment_datetime(rs.getString("Comment_datetime"));
				bean.setComment_id(rs.getInt("Comment_id"));
				bean.setComment_post_id(rs.getInt("Comment_post_id"));
				bean.setComment_text(rs.getString("Comment_text"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("Depth"));
				bean.setUser_id(rs.getString("User_id"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;		
	}
	
	public CommentBean getComment(int comment_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		CommentBean bean = new CommentBean();
		try {
			con = pool.getConnection();
			sql = "select * from comment where comment_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setComment_datetime(rs.getString("Comment_datetime"));
				bean.setComment_id(rs.getInt("Comment_id"));
				bean.setComment_post_id(rs.getInt("Comment_post_id"));
				bean.setComment_text(rs.getString("Comment_text"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("Depth"));
				bean.setUser_id(rs.getString("User_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;		
	}
	
	public boolean insertComment(CommentBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		boolean flag = false;
		int ref = getMaxNum()+1;
		try {
			con = pool.getConnection();
			sql = "insert comment(comment_post_id, user_id, comment_text, pos, ref, depth) "
			+ "values(?, ?, ?, 0, ?, 0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getComment_post_id());
			pstmt.setString(2, bean.getUser_id());
			pstmt.setString(3, bean.getComment_text());			
			pstmt.setInt(4, ref);
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	public boolean insertComment2(CommentBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert comment(comment_post_id, user_id, comment_text, pos, ref, depth) "
			+ "values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getComment_post_id());
			pstmt.setString(2, bean.getUser_id());
			pstmt.setString(3, bean.getComment_text());		
			pstmt.setInt(4, bean.getPos()+1);//원글 : pos +1
			pstmt.setInt(5, bean.getRef());
			pstmt.setInt(6, bean.getDepth()+1);//원글 : depth +1
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(comment_id) from comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) maxNum = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}
	
	
}
