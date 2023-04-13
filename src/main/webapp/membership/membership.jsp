<!-- loginProc.jsp / 회원가입 페이지 -->
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
function login() {
    userId = document.reFrm.user_id.value;
   	userPwd = document.reFrm.member_pwd.value;
   	rememberPwd = document.reFrm.remember_pwd.value;
    memberName = document.reFrm.member_name.value;
    memberBirth = document.reFrm.member_birth.value;
    memberEmail = document.reFrm.member_email.value;

    if (!userId) {
        alert("아이디를 입력해주세요.");
        document.reFrm.user_id.focus();
        return;
    }

    if (!userPwd) {
        alert("비밀번호를 입력해주세요.");
        document.reFrm.member_pwd.focus();
        return;
    }

    if (!rememberPwd) {
        alert("비밀번호를 재확인해주세요.");
        document.reFrm.remember_pwd.focus();
        return;
    }

    if (!memberName) {
        alert("이름을 입력해주세요.");
        document.reFrm.member_name.focus();
        return;
    }

	if (!birthInput.value) {
	  alert("생년월일을 입력해주세요.");
	  document.reFrm.member_birthf.focus();
	  return;
	} 

    if (!memberEmail) {
        alert("이메일을 입력해주세요.");
        document.reFrm.member_email.focus();
        return;
    }

    document.reFrm.submit();
    location.href = "main_login.jsp";
}
	function checkBirth(birthInput) {
	  
	}
</script>
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
        <article class="membership">
            <div class="wrap">
                <form class="membership" name="reFrm" method="post" action="memberProc.jsp" >
                    <div class="member_text">
		            	<h1><span>회</span>원가입</h1>           
		            	<p>회원정보가입 어쩌구저쩌구 작성해주세요.</p>
		            </div>
		            <div class="information">
		                <p>아이디  <input type="text" name="user_id"></p>
		                <p>비밀번호<input type="password" name="member_pwd"></p>
		                <p>비밀번호 재확인<input type="password" name="remember_pwd"></p>
		                <p>이름<input type="text" name="member_name"></p>
		                <p>생년월일<input type="text" name="member_birth" placeholder="ex.0000-00-00 (하이픈'-' 생략 가능)" ></p>               
		                <p>이메일<input type="text" name="member_email"></p>               
		            </div>
		            <div class="loginbtn">
		            	<input type="button" value="가입하기"  onClick="login()">
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