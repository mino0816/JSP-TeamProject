<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.restInfo.RestInfoMgr"/>
<% 
if (!session.getAttribute("user_id").equals("admin")) {
	    response.sendRedirect("../../membership/admin_login.jsp");
	    return;
	}

	int rest_id = Integer.parseInt(request.getParameter("rest_id"));
	mgr.deleterest(rest_id);
	response.sendRedirect("admin_rest_list.jsp");

%>