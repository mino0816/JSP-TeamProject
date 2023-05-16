<!-- review_write_proc -->
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="rmgr" class="project.review.ReviewMgr"/>
<jsp:useBean id="bean" class="project.review.ReviewBean"/>

<% 
request.setCharacterEncoding("UTF-8");

/* 
String img1 = request.getParameter("img1");
String img2 = request.getParameter("img2");
String img3 = request.getParameter("img3");
*/

if(session.getAttribute("user_id")!=null){
	bean.setUser_id((String)session.getAttribute("user_id"));
}else
	bean.setUser_id("hongildong");//임시아이디

if(request.getParameter("rest_id")!=null){
	int rest_id = Integer.parseInt(request.getParameter("rest_id"));
	bean.setRest_id(rest_id);
}else
	bean.setRest_id(10);//임시아이디


boolean flag = rmgr.insertReview(request, bean);
if(flag=true)
	response.sendRedirect("review_list.jsp");
%>

