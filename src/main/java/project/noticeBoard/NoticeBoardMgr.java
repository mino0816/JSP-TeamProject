package project.noticeBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import project.DBConnectionMgr;

public class NoticeBoardMgr {
	private DBConnectionMgr pool;
	
	public NoticeBoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//공지사항 등록
	public void writeNoticeBoard(NoticeBoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert noticeBoard(notice_content, notice_datetime, rest_id)values(?, now(), ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getNotice_content());
			pstmt.setInt(2, bean.getRest_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//가계별 공지사항 리스트
	public Vector<NoticeBoardBean> listNoticeBoard(int rest_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<NoticeBoardBean> vlist = new Vector<NoticeBoardBean>();
		try {
			con = pool.getConnection();
			sql = "select * from noticeboard where rest_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeBoardBean bean = new NoticeBoardBean();
				bean.setNotice_id(rs.getInt("notice_id"));
				bean.setNotice_content(rs.getString("notice_content"));
				bean.setNotice_datetime(rs.getString("notice_datetime"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}

	
	//가게사장이 보는 공지사항 리스트
	//자기 가게의 공지만 볼 수 있게 sql 나중에 수정
	public Vector<NoticeBoardBean> listNoticeBoard(int start, int cnt){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		Vector<NoticeBoardBean> vlist = new Vector<NoticeBoardBean>();
		try {
			con = pool.getConnection();
			sql = "select * from noticeboard order by notice_datetime desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, cnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoticeBoardBean bean = new NoticeBoardBean();
				bean.setNotice_id(rs.getInt("notice_id"));
				bean.setNotice_content(rs.getString("notice_content"));
				bean.setNotice_datetime(rs.getString("notice_datetime"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}
	
	//공지사항 삭제
	public void deleteNoticeBoard(int notice_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from noticeboard where notice_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_id);
			pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
	}

	//공지사항 수정
	public void modifyNoitceBoard(NoticeBoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update noticeBoard set notice_content = ?, notice_datetime =?  where notice_id = ? ";
			pstmt = con.prepareStatement(sql);			
			pstmt.setString(1, bean.getNotice_content());
			pstmt.setString(2, bean.getNotice_datetime());
			pstmt.setInt(3, bean.getNotice_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//공지사항 전체 수
	public int getTotalCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from noticeboard";
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
	
	//공지사항 한개 가져오기
	public NoticeBoardBean getNoticeBoard(int notice_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		NoticeBoardBean bean = new NoticeBoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from noticeboard where notice_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNotice_id(rs.getInt("notice_id"));
				bean.setNotice_content(rs.getString("notice_content"));
				bean.setNotice_datetime(rs.getString("notice_datetime"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

}
