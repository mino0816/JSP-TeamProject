package project.restInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import project.DBConnectionMgr;
import project.noticeBoard.NoticeBoardBean;




public class RestInfoMgr{

	// 업로더 저장 위치
	public static final String SAVEFOLDER = "C:/Jsp/eating/src/main/webapp/img/rest_info/";
	// 업로더 파일명 인코딩
	public final String ENCODING = "UTF-8";
	// 업로도 파일 크기
	public final int MAXSIZE = 1024*1024*10;//10MB
	
	private DBConnectionMgr pool;
	public RestInfoMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public RestInfoBean getRestInfo(int rest_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		RestInfoBean bean = new RestInfoBean(); 
		
		
		try {
			con = pool.getConnection();
			sql = "select * from rest_info where rest_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setRest_introduction(rs.getString("rest_introduction"));
				bean.setBookmark_count(rs.getInt("bookmark_count"));
				bean.setOpen_time(rs.getString("open_time"));
				bean.setRest_call(rs.getString("rest_call"));
				bean.setRest_id(rs.getInt("rest_id"));
				bean.setRest_image1(rs.getString("rest_image1"));
				bean.setRest_image2(rs.getString("rest_image2"));
				bean.setRest_image3(rs.getString("rest_image3"));
				bean.setRest_name(rs.getString("rest_name"));
				bean.setReview_count(rs.getInt("review_count"));
				bean.setRest_address(rs.getString("rest_address"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public void registRestinfo(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE,
					ENCODING, new DefaultFileRenamePolicy());
			String rest_image1 = multi.getFilesystemName("rest_image1");
			String rest_image2 = multi.getFilesystemName("rest_image2");
			String rest_image3 = multi.getFilesystemName("rest_image3");
			String rest_name = multi.getParameter("rest_name");
			String rest_address = multi.getParameter("rest_address");
			String open_time = multi.getParameter("open_time");
			String rest_call = multi.getParameter("rest_call");
			String rest_introduction = multi.getParameter("rest_introduction");
			sql = "insert rest_info(rest_image1, rest_image2, rest_image3, rest_name,  rest_address, open_time, rest_call, rest_introduction) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rest_image1);
			pstmt.setString(2, rest_image2);
			pstmt.setString(3, rest_image3);
			pstmt.setString(4, rest_name);
			pstmt.setString(5, rest_address);
			pstmt.setString(6, open_time);
			pstmt.setString(7, rest_call);
			pstmt.setString(8, rest_introduction);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	public void modifyRestinfo(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE,
							ENCODING, new DefaultFileRenamePolicy());
			
			String rest_image1 = multi.getFilesystemName("rest_image1");
			String rest_image2 = multi.getFilesystemName("rest_image2");
			String rest_image3 = multi.getFilesystemName("rest_image3");
			String rest_name = multi.getParameter("rest_name");
			String rest_address = multi.getParameter("rest_address");
			String open_time = multi.getParameter("open_time");
			String rest_call = multi.getParameter("rest_call");
			String rest_introduction = multi.getParameter("rest_introduction");
			int rest_id = Integer.parseInt(multi.getParameter("rest_id"));
			///이미지는 수정하지 않고 수정을 한다면
			if(rest_image1==null) 
				rest_image1 = getRestInfo(rest_id).getRest_image1();
			if(rest_image2==null) 
				rest_image2 = getRestInfo(rest_id).getRest_image2();
			if(rest_image3==null) 
				rest_image3 = getRestInfo(rest_id).getRest_image3();
			
			sql = " update rest_info set rest_image1 = ?, rest_image2 = ?, rest_image3 = ?, rest_name =? , rest_address = ?, open_time = ?, "
					+ " rest_call = ?, rest_introduction = ? where rest_id = ?  ";
			
			pstmt = con.prepareStatement(sql);			
			pstmt.setString(1, rest_image1);
			pstmt.setString(2, rest_image2);
			pstmt.setString(3, rest_image3);
			pstmt.setString(4, rest_name);
			pstmt.setString(5, rest_address);
			pstmt.setString(6, open_time);
			pstmt.setString(7, rest_call);
			pstmt.setString(8, rest_introduction);
			pstmt.setInt(9, rest_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	public Vector<RestInfoBean> showStorelist(/* int start, int cnt */){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<RestInfoBean> vlist = new Vector<RestInfoBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT rest_id, rest_image1, rest_name, "
			+ "(SELECT COUNT(bookmark) FROM bookmark WHERE rest_id = rest_info.rest_id AND bookmark_status=1) AS bookmark_count, "
			+ "(SELECT COUNT(review_id) FROM review WHERE rest_id = rest_info.rest_id) AS review_count "
			+ "FROM rest_info "
			+ "order by rand()";
			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, start);
//			pstmt.setInt(2, cnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RestInfoBean bean = new RestInfoBean();
				bean.setRest_id(rs.getInt("rest_id"));
				bean.setRest_image1(rs.getString("rest_image1"));
				bean.setRest_name(rs.getString("rest_name"));
				bean.setBookmark_count(rs.getInt("bookmark_count"));
				bean.setReview_count(rs.getInt("review_count"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public Vector<RestInfoBean> showStorelist(int start, int cnt){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<RestInfoBean> vlist = new Vector<RestInfoBean>();
		try {
			con = pool.getConnection();
			sql = "select * from rest_info ORDER BY rest_id desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, cnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RestInfoBean bean = new RestInfoBean();
				bean.setRest_id(rs.getInt("rest_id"));
				bean.setRest_image1(rs.getString("rest_image1"));
				bean.setRest_name(rs.getString("rest_name"));
				bean.setBookmark_count(rs.getInt("bookmark_count"));
				bean.setReview_count(rs.getInt("review_count"));
				bean.setRest_id(rs.getInt("rest_id"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public void deleterest(int rest_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from rest_info where rest_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//가게리스트 전체 수
	public int getTotalCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from rest_info";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	

}
