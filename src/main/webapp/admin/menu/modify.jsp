<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="project.menu.MenuMgr" />
<% 
		mMgr.modifyReAddmenu(request);
		response.sendRedirect("menulist.jsp");
%>