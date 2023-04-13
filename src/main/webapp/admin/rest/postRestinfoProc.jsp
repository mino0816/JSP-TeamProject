<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.restInfo.RestInfoMgr"/>
<%
	mgr.registRestinfo(request);
	response.sendRedirect("admin_rest_list.jsp");

%>
