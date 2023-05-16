<!-- findid_mailSendProc.jsp / 아이디찾기 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.membership.id_MailSend"/>
<%request.setCharacterEncoding("UTF-8"); %>
<% 
	String member_name = request.getParameter("member_name");
	String member_email = request.getParameter("member_email");
	boolean result = mgr.sendId(member_name, member_email);
	String msg = "전송실패";
	String url = "findid.jsp";
	if(result){
		msg = "전송성공";
		url = "findid_after.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>