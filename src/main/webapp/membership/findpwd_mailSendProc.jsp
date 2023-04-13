<!-- findpwd_mailSendProc.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.membership.pwd_MailSend"/>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	String user_id = request.getParameter("user_id");
	String member_name = request.getParameter("member_name");
	String member_email = request.getParameter("member_email");
	boolean result = mgr.sendPwd(user_id, member_name, member_email);
	String msg = "전송실패";
	String url = "findpwd.jsp";
	if(result){
		msg = "전송성공";
		url = "findpwd_after.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>