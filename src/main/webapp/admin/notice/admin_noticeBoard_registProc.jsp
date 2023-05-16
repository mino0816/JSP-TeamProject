<%@ page contentType="text/html; charset=UTF-8"%> 
<jsp:useBean id="mgr" class="project.noticeBoard.NoticeBoardMgr"/>
<jsp:useBean id="bean" class="project.noticeBoard.NoticeBoardBean"/>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:setProperty property="*" name="bean"/>
<%
	mgr.writeNoticeBoard(bean);
	response.sendRedirect("admin_noticeBoard_list.jsp");

%>
