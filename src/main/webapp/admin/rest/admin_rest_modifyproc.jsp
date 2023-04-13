<%@page import="project.util.UtilMgr"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.restInfo.RestInfoMgr"/>
<%
	mgr.modifyRestinfo(request);
	response.sendRedirect("admin_rest_list.jsp");

%>
