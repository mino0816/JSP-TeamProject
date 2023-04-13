<!-- 댓글달기 -->
<!-- review_detaile.jsp에서 건너옴 -->
<%@page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mgr" class="project.comment.CommentMgr"/>
<jsp:useBean id="bean" class="project.comment.CommentBean"/>
<jsp:setProperty property="*" name="bean"/>
<%

		String page2 = request.getParameter("page2");
		String redirectPage = "review_detaile.jsp?page2="+page2;
		boolean result = mgr.insertComment(bean);
		response.sendRedirect(redirectPage);
%>