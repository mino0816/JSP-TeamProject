<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="project.menu.MenuMgr" />
<%
		if (!session.getAttribute("user_id").equals("admin")) {
		    response.sendRedirect("../../membership/admin_login.jsp");
		    return;
		}
		int menu_id = Integer.parseInt(request.getParameter("menu_id"));
		mMgr.deletemenu(menu_id);
		response.sendRedirect("menulist.jsp");
%>