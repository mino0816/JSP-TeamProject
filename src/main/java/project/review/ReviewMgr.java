package project.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import project.DBConnectionMgr;



public class ReviewMgr {

	// 업로더 저장 위치
	public static final String SAVEFOLDER = "C:/Jsp/eating/src/main/webapp/img/review/";
	// 업로더 파일명 인코딩
	public final String ENCODING = "UTF-8";
	// 업로도 파일 크기
	public final int MAXSIZE = 1024*1024*10;//10MB
	
	private DBConnectionMgr pool;
	public ReviewMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<ReviewBean> showReviews(int rest_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<ReviewBean> vlist = new Vector<ReviewBean>();
		try {
			con = pool.getConnection();
			sql = "select * from review "
					+ "where rest_id = ? or ? = -1 "
					+ "order by review_datetime desc "
					+ "limit 24 ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			pstmt.setInt(2, rest_id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				ReviewBean review = new ReviewBean();
				review.setReview_id(rs.getInt("review_id"));//리뷰번호
				review.setUser_id(rs.getString("user_id"));//유저 id
				review.setReview_title(rs.getString("review_title"));//리뷰제목
				review.setReview_content(rs.getString("review_content"));
				
				String review_image1 = "../img/review/" + rs.getString("review_image1");//메인사진
				String review_image2 = "../img/review/" + rs.getString("review_image2");//사진2
				String review_image3 = "../img/review/" + rs.getString("review_image3");//사진3
				//String thumbnail = rs.getString("review_image1");
				review.setReview_image1(review_image1);
				review.setReview_image2(review_image2);
				review.setReview_image3(review_image3);
				
				review.setRest_id(rs.getInt("rest_id"));
				//System.out.println(thumbnail);
				review.setReview_datetime(rs.getString("Review_datetime"));
				vlist.addElement(review);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public Vector<ReviewBean> showReviews(String user_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<ReviewBean> vlist = new Vector<ReviewBean>();
		try {
			con = pool.getConnection();
			sql = "select * from review "
					+ "where user_id = ? "
					+ "order by review_datetime "
					+ "limit 27 ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				ReviewBean review = new ReviewBean();
				review.setReview_id(rs.getInt("review_id"));//리뷰번호
				review.setUser_id(rs.getString("user_id"));//유저 id
				review.setReview_title(rs.getString("review_title"));//리뷰제목
				review.setReview_content(rs.getString("review_content"));
				
				String review_image1 = "../img/review/" + rs.getString("review_image1");//메인사진
				String review_image2 = "../img/review/" + rs.getString("review_image2");//사진2
				String review_image3 = "../img/review/" + rs.getString("review_image3");//사진3
				review.setReview_image1(review_image1);
				review.setReview_image2(review_image2);
				review.setReview_image3(review_image3);
				review.setRest_id(rs.getInt("rest_id"));
			
				review.setReview_datetime(rs.getString("Review_datetime"));
				vlist.addElement(review);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public ReviewBean getReview(int review_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		ReviewBean bean = new ReviewBean();
		try {
			con = pool.getConnection();
			sql = "select * from review where review_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setReview_content(rs.getString("review_content"));
				bean.setReview_datetime(rs.getString("review_datetime"));
				bean.setReview_id(rs.getInt("review_id"));
				
				String rimg1 = "../img/review/" + rs.getString("Review_image1");
				String rimg2 = "../img/review/" + rs.getString("Review_image2");
				String rimg3 = "../img/review/" + rs.getString("Review_image3");
				
				bean.setReview_image1(rimg1);
				bean.setReview_image2(rimg2);
				bean.setReview_image3(rimg3);
				bean.setReview_title(rs.getString("Review_title"));
				bean.setUser_id(rs.getString("User_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public String[] showReviewImgs() {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    String sql = null;
	    ResultSet rs = null;
	    String[] mainImg = new String[18];
	    try {
	        con = pool.getConnection();
	        sql = "select * from review "
		            + "order by review_datetime desc "
	            	+ "limit 18 ";
	        pstmt = con.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        int i = 0;
	        while (rs.next()) {
	            mainImg[i] = rs.getString("review_image1");
	            i++;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }
	    return mainImg;
	}
	
	public boolean uploadReview(ReviewBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			sql = "insert review(review_title,"
					+ "review_content, "
					+ "review_image1, review_image2, review_image3) "
					+ "values(?, ?, ?, ?, ?) ";
					
			pstmt.setString(1, bean.getReview_title());
			pstmt.setString(2, bean.getReview_content());
			pstmt.setString(3, bean.getReview_image1());
			pstmt.setString(4, bean.getReview_image2());
			pstmt.setString(5, bean.getReview_image3());
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;	
	}
	
	public boolean editNotice(ReviewBean bean, int review_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update review set "
			+ "review_title = ?, review_content = ?, review_image1 = ? "
			+ "review_image2 = ? review_image3  =? where review_id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getReview_title());
			pstmt.setString(2, bean.getReview_content());
			pstmt.setString(3, bean.getReview_image1());
			pstmt.setString(4, bean.getReview_image2());
			pstmt.setString(5, bean.getReview_image3());
			pstmt.setInt(6, bean.getReview_id());
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;	
	}
	
	public boolean insertReview(HttpServletRequest req, ReviewBean bean){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			MultipartRequest multi = 
					new MultipartRequest(req, SAVEFOLDER, MAXSIZE, 
							ENCODING, new DefaultFileRenamePolicy());
			String upFile1 = multi.getFilesystemName("fileInput1");
			String upFile2 = multi.getFilesystemName("fileInput2");
			String upFile3 = multi.getFilesystemName("fileInput3");
			
			String review_title =  multi.getParameter("title_post");
			String review_content = multi.getParameter("content_post");
			
			con = pool.getConnection();
			sql = "insert review(user_id, rest_id, review_title, review_content, "
					+ "review_image1, review_image2, review_image3) "
					+ "values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUser_id());
			pstmt.setInt(2, bean.getRest_id());
			pstmt.setString(3, review_title);
			pstmt.setString(4, review_content);
			pstmt.setString(5, upFile1);
			pstmt.setString(6, upFile2);
			pstmt.setString(7, upFile3);
			if(pstmt.executeUpdate()==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public Vector<ReviewBean> searchReviews(String keyword){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<ReviewBean> vlist = new Vector<ReviewBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT review_id FROM review "
				+ "WHERE CONCAT(review_title, review_content) LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewBean bean = new ReviewBean();
				bean = getReview(rs.getInt(1));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	public int countReviews(String user_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from review where user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
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
	
	
}
