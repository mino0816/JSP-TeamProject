<!-- main_login / 유저페이지_로그인 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	 
%>
<title>EATING</title>

<link rel="stylesheet" type="text/css" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="../css/font.css">
<link rel="stylesheet" type="text/css" href="../css/layout2.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/script.js"></script>

<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.user_id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.user_id.focus();
			return false;
		}
		if (document.loginFrm.member_pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.member_pwd.focus();
			return false;
		}
		document.loginFrm.submit();
	}
</script>

<body class="login_body"> 
    <section id="main_login">  
        <div class="wrap">
            <form class="main_main_login" name="loginFrm" method="post" action="loginProc.jsp">
                <div class="main_login_img">
                    <img src="../img/icons/logo.png" alt="EATING_LOGO">            
                </div>
                <div class="main_login">
                    <div class="login_name">
                        <div class="login_line left"></div>
                        <h2>LOGIN</h2>  
                        <div class="login_line right"></div>
                    </div>   
                    <input type="text" name="user_id" placeholder="아이디를 입력해주세요.">
                    <input type="password" name="member_pwd" placeholder="비밀번호를 입력해주세요." >
                    <input type="button" value="로그인" onclick="loginCheck()" style="cursor:pointer;">
                    <input type="button" value="회원가입" onClick="javascript:location.href='membership.jsp'" style="cursor:pointer;">
                    <input type="button" value="회원수정" onClick="javascript:location.href='member_update.jsp'" style="background:red; cursor:pointer; color:#fff;">
                    <p class="find_id" onClick="javascript:location.href='findid.jsp'">아이디 찾기</p>
                    <p class="find_pwd" onClick="javascript:location.href='admin_login.jsp'">어드민 로그인</p>
                    <p class="find_pwd" onClick="javascript:location.href='findpwd.jsp'">비밀번호 찾기</p>
                </div>
            </form> 
        </div>    
    </section>
</body>