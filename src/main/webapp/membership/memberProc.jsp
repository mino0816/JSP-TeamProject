<!-- memberProc.jsp /  회원가입 성공·실패 알람페이지 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.membership.MemberMgr"/>
<jsp:useBean id="bean" class="project.membership.MemberBean"/>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:setProperty property="*" name="bean"/>
<%
	boolean result = mgr.insertMember(bean);
	String msg = "양식에 맞게 작성해주세요.";
	String url = "membership.jsp";
	if(result){
		msg = "회원가입이 되었습니다. 로그인 해주세요.";
		url = "main_login.jsp";
		session.setAttribute("idKey", bean.getUser_id());
		
	}
%>

<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
