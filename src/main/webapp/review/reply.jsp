	<!-- 대댓글 -->
<!-- review_detaile.jsp에서 건너옴 -->

<%@page import="project.comment.CommentBean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mgr" class="project.comment.CommentMgr"/>
 <%
			 String page2 = request.getParameter("page2");			
			 int  comment_id = Integer.parseInt(request.getParameter("comment_id"));
			CommentBean cbean = mgr.getComment(comment_id);
 %>

<form name="Frm" action="insert_comment_Proc2.jsp?page2=<%=page2%>" method="post">     
					<input type="hidden" name="comment_post_id" value="<%=page2%>" >
					<input type="hidden" name="user_id" value="<%=(String)session.getAttribute("user_id")%>">
					<input type="hidden" name="ref" value="<%=cbean.getRef()%>">
					<input type="hidden" name="depth" value="<%=cbean.getDepth()%>">
                    <div class="reply">
                    <input id="input" type="text" name="comment_text" placeholder="댓글을 입력하세요">
                    <input id="button" type="submit" value="등록" style="cursor: pointer;">
                    </div>
</form>

<%-- <%

		String page2 = request.getParameter("page2");
		String redirectPage = "review_detaile.jsp?page2="+page2;
		boolean result = mgr.insertComment(bean);
		
%> --%>