<!-- loginProc.jsp / 로그인 성공·실패 알람페이지 -->
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mgr" class="project.membership.MemberMgr"/>
<jsp:useBean id="bean" class="project.membership.MemberBean"/>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	  String cPath = request.getContextPath();
	  String id = request.getParameter("user_id");
	  String pass = request.getParameter("member_pwd");
	  String msg = "로그인에 실패 하였습니다.";
	  
	  boolean result = mgr.loginMember(id,pass);
	  if(result){
	    session.setAttribute("idKey",id);
	    session.setAttribute("user_id",id);
	    msg = "로그인에 성공 하였습니다.";
	    //response.sendRedirect(cPath + "/main/index.jsp");
	  } else {
		response.sendRedirect(request.getHeader("referer"));
	  }  
%>
<script>
	alert("<%=msg%>");
	location.href = "../main/index.jsp";
</script>
	