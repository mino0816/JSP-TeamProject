<!-- findpwd / 비밀번호찾기 -->
<%@ page contentType="text/html; charset=UTF-8"%>
 
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
                    <a href="#"><img src="../img/icons/logo.png" alt="EATING_LOGO"></a>
                </h1>
            </div>
        </article>
    </section>
    <section id="content">
        <article class="findpwd">
            <div class="wrap">
                <form class="findpwd" name="postfrm" method="post" action="findpwd_mailSendProc.jsp">
                    <div class="findpwd_text">
		              <h1><span>비</span>밀번호 찾기</h1>            
		              <p>비밀번호를 찾으려면 어쩌구저쩌구 작성해주세요.</p>
		            </div>           
		            <div class="information">
		                <p>아이디  <input type="text" name="user_id"></p>
		                <p>이름  <input type="text" name="member_name"></p>
		                <p>이메일<input type="text" name="member_email"></p>         
		            </div>
		            <div class="loginbtn">
						<input type="submit" value="비밀번호 찾기"  style="cursor:pointer;" >
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
