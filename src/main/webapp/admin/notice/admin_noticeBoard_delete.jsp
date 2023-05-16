
<%@page import="project.util.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.noticeBoard.NoticeBoardMgr"/>
<% 

	int notice_id = UtilMgr.parseInt(request, "notice_id");
	mgr.deleteNoticeBoard(notice_id);
	
	response.sendRedirect("admin_noticeBoard_list.jsp");
%>


