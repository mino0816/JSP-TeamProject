<%@page import="project.bookmark.BookmarkBean"%>
<%@page import="project.bookmark.BookmarkMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<% 
    String user_id = request.getParameter("user_id");
    int rest_id = Integer.parseInt(request.getParameter("rest_id"));
    BookmarkBean bean = new BookmarkBean();
    bean.setUser_id(user_id);
    bean.setRest_id(rest_id);
    BookmarkMgr mgr = new BookmarkMgr();
    
    mgr.addToggleBookmark(bean);
	response.sendRedirect(request.getHeader("referer"));    
%>

