<!-- admin_loginProc.jsp / 로그인 성공·실패 알람페이지 -->
<%@page import="project.membership.MemberBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.membership.MemberMgr"/>
<%request.setCharacterEncoding("UTF-8"); %>
<% 
	  String cPath = request.getContextPath();
	  String user_id = request.getParameter("user_id");
	  String member_pwd = request.getParameter("member_pwd");
	  String msg = "";
	  
	  boolean result = mgr.loginMember(user_id,member_pwd);
	  MemberBean bean = mgr.getMember(user_id);
	  if(result&&bean.getMember_grade().equals("1")){
		    session.setAttribute("idKey",user_id);
		    session.setAttribute("user_id",user_id);
		    msg = "관리자 로그인에 성공 하였습니다.";
		} else {
			 msg = "로그인에 실패 하였습니다.";
			
		}

%>
<script>
	alert("<%=msg%>");
	<% if (msg.equals("로그인에 실패 하였습니다.")) { %>
	    location.href = "admin_login.jsp";
	<% } else { %>
	    location.href = "../admin/rest/admin_rest_list.jsp"; 
	<% } %>
</script>