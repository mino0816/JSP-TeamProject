<!-- member_update / 회원정보수정 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="project.membership.MemberBean" %>
<jsp:useBean id="mgr" class="project.membership.MemberMgr" />
<%
	String user_id = (String)session.getAttribute("idKey");
	if(user_id==null){
		response.sendRedirect("main_login.jsp");
		return;
	}
	MemberBean bean = mgr.getMember(user_id);
%>

<title>EATING</title>

<link rel="stylesheet" type="text/css" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="../css/font.css">
<link rel="stylesheet" type="text/css" href="../css/layout2.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/script.js"></script>

<body>
    <section id="header">
        <article class="header">
            <div class="wrap">
                <h1 class="logo">
                    <a href="../main/index.jsp"><img src="../img/icons/logo.png" alt="EATING_LOGO"></a>
                </h1>
            </div>
        </article>
    </section>
    <section id="content">
        <article class="members_change">
            <div class="wrap">
                <form class="members_change" name="regFrm" method="post" action="memberUpdateProc.jsp">
                    <div class="change_text">
              			<h1><span>회</span>원정보 수정</h1>
              			<p>회원정보 찾으려면 어쩌구저쩌구 작성해주세요.</p>
            		</div>
		            <div class="information">
		                <p>아이디  <input type="text" name="user_id" value="<%=bean.getUser_id()%>" readonly></p>
		                <p>비밀번호<input type="text" name="member_pwd" value="<%=bean.getMember_pwd()%>"></p>
		                <p>이름<input type="text" name="member_name" value="<%=bean.getMember_name()%>"></p>
		                <p>생년월일<input type="text" name="member_birth" value="<%=bean.getMember_birth()%>"></p>
		                <p>이메일<input type="text" name="member_email" value="<%=bean.getMember_email()%>"></p>
		               
		            </div>
                    <div class="loginbtn">
                        <input type="submit" value="수정">
                    </div>  
            	</form>
            </div>
        </article>
    </section>
    <section id="footer">
        <article class="footer">
            <p>COPYRIGHT ALL RESERVED BY EATING</p>
        </article>
    </section>
</body>
