<!-- memberUpdateProc.jsp /  -->
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.membership.MemberMgr"/>
<jsp:useBean id="bean" class="project.membership.MemberBean"/>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:setProperty property="*" name="bean"/>
<% 
	boolean result = mgr.updateMember(bean);
	if(result){
%>
	<script>
		alert("회원정보를 수정하였습니다.");
		location.href="main_login.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("회원정보 수정에 실패 하였습니다.");
		history.back();
	</script>
<%
	}
%>