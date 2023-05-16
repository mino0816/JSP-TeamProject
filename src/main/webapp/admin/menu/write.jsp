<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="project.menu.MenuMgr" />
<% 
		mMgr.registerAddmenu(request);
		response.sendRedirect("menulist.jsp");
%>