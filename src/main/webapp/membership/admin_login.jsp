<!-- admin_login / 관리자페이지 로그인 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<title>EATING</title>

<link rel="stylesheet" type="text/css" href="../css/common.css">
<link rel="stylesheet" type="text/css" href="../css/font.css">
<link rel="stylesheet" type="text/css" href="../css/pc_layout.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="../js/script.js"></script>

<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.user_id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.user_id.focus();
			return;
		}
		if (document.loginFrm.member_pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.member_pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>

<body class="login_body"> 
    <section id="admin_login">  
        <form class="admin_main_login" name="loginFrm" method="post" action="admin_loginProc.jsp" >
            <div class="main_login_img">
                <img src="../img/icons/logo.png" alt="EATING_LOGO">            
            </div>
            <div class="main_login">     
                     
                <h2>LOGIN</h2>     
                                  
                <input type="textarea" name="user_id" placeholder="아이디를 입력해주세요." value="admin">
                <input type="password" name="member_pwd" placeholder="비밀번호를 입력해주세요." value="1234">
                <input type="submit" value="로그인">
            </div>
        </form>     
    </section>
</body>