package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import project.DBConnectionMgr;
import project.comment.CommentBean;
import project.review.ReviewBean;

public class TestMgr {


	public static final String SAVEFOLDER = "C:/Jsp/eating/src/main/webapp/img/menu/";
	public static final String ENCODING = "UTF-8"; 
	public static final int MAXSIZE = 1024*1024*10;//10MB
	private DBConnectionMgr pool;
	public TestMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<TestBean> get(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<TestBean> vlist = new Vector<TestBean>();
		try {
			con = pool.getConnection();
			sql = "select * from test";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TestBean bean = new TestBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public void insert(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			MultipartRequest multi = 
					new MultipartRequest(req, SAVEFOLDER, MAXSIZE,
							ENCODING, new DefaultFileRenamePolicy());
			sql = "insert test(id, name) values(?, ?)";
			pstmt = con.prepareStatement(sql);
			int id = Integer.parseInt(multi.getParameter("id"));
			String name = multi.getParameter("name");
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
}