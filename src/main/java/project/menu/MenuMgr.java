package project.menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import project.DBConnectionMgr;

public class MenuMgr {
	
	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:/Jsp/eating/src/main/webapp/img/menu/";
	public static final String ENCODING = "UTF-8"; 
	public static final int MAXSIZE = 1024*1024*10;//10MB
	
	public MenuMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	//메뉴 전체 수
	public int getTotalCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from menu";
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
	
	
	
	public Vector<MenuBean> showMenulist(int rest_id, int start, int cnt){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<MenuBean> vlist = new Vector<MenuBean>();
		try {
			con = pool.getConnection();
			sql = "select * from menu where rest_id = ? order by menu_datetime desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, cnt);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MenuBean bean = new MenuBean();
				bean.setMenu_id(rs.getInt("Menu_id"));
				bean.setMenu_image1(rs.getString("Menu_image1"));
				bean.setMenu_image2(rs.getString("Menu_image2"));
				bean.setMenu_image3(rs.getString("Menu_image3"));
				bean.setMenu_name(rs.getString("Menu_name"));
				bean.setMenu_price(rs.getInt("Menu_price"));
				bean.setRest_id(rs.getInt("Rest_id"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public Vector<MenuBean> showMenulist(int rest_id){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<MenuBean> vlist = new Vector<MenuBean>();
		try {
			con = pool.getConnection();
			sql = "select * from menu where rest_id =? order by menu_datetime ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
		
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MenuBean bean = new MenuBean();
				bean.setMenu_id(rs.getInt("Menu_id"));
				bean.setMenu_image1(rs.getString("Menu_image1"));
				bean.setMenu_image2(rs.getString("Menu_image2"));
				bean.setMenu_image3(rs.getString("Menu_image3"));
				bean.setMenu_name(rs.getString("Menu_name"));
				bean.setMenu_price(rs.getInt("Menu_price"));
				bean.setRest_id(rs.getInt("Rest_id"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public void registerAddmenu(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			MultipartRequest multi = 
					new MultipartRequest(req, SAVEFOLDER, MAXSIZE,
							ENCODING, new DefaultFileRenamePolicy());
			String menu_name = multi.getParameter("menu_name");
			int menu_price = Integer.parseInt(multi.getParameter("menu_price"));
			int rest_id = Integer.parseInt(multi.getParameter("rest_id"));
			String menu_image1 = multi.getFilesystemName("menu_image1");
			String menu_image2 = multi.getFilesystemName("menu_image2");
			String menu_image3 = multi.getFilesystemName("menu_image3");
			
			sql = "insert menu(menu_name, menu_price, rest_id ,menu_image1, menu_image2, menu_image3) "
					+ "values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, menu_name);
			pstmt.setInt(2, menu_price);
			pstmt.setInt(3, rest_id);
			pstmt.setString(4, menu_image1);
			pstmt.setString(5, menu_image2);
			pstmt.setString(6, menu_image3);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	public void modifyReAddmenu(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE,
							ENCODING, new DefaultFileRenamePolicy());
			
			int menu_id = Integer.parseInt(multi.getParameter("menu_id"));
			String menu_image1 = multi.getFilesystemName("menu_image1");
			String menu_image2 = multi.getFilesystemName("menu_image2");
			String menu_image3 = multi.getFilesystemName("menu_image3");
			String menu_name = multi.getParameter("menu_name");
			int menu_price = Integer.parseInt(multi.getParameter("menu_price"));
			
			if(menu_image1==null) 
				menu_image1 = getreaddmenu(menu_id).getMenu_image1();
			if(menu_image2==null) 
				menu_image2 = getreaddmenu(menu_id).getMenu_image2();
			if(menu_image3==null) 
				menu_image3 = getreaddmenu(menu_id).getMenu_image3();
			
			sql = " update menu set menu_image1 = ?, menu_image2 = ?, menu_image3 = ?, menu_name = ?, "
					+ "menu_price = ? where menu_id = ?";
	
			
			pstmt = con.prepareStatement(sql);			
			pstmt.setString(1, menu_image1);
			pstmt.setString(2, menu_image2);
			pstmt.setString(3, menu_image3);
			pstmt.setString(4, menu_name);
			pstmt.setInt(5, menu_price);
			pstmt.setInt(6, menu_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	public MenuBean getreaddmenu(int menu_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		MenuBean bean = new MenuBean();
		try {
			con = pool.getConnection();
			sql = "select * from menu where menu_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, menu_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setMenu_id(rs.getInt("Menu_id"));
				bean.setMenu_image1(rs.getString("Menu_image1"));
				bean.setMenu_image2(rs.getString("Menu_image2"));
				bean.setMenu_image3(rs.getString("Menu_image3"));
				bean.setMenu_name(rs.getString("Menu_name"));
				bean.setMenu_price(rs.getInt("Menu_price"));
				bean.setRest_id(rs.getInt("Rest_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public void deletemenu(int menu_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from menu where menu_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, menu_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
}
	
	
	
	
	

