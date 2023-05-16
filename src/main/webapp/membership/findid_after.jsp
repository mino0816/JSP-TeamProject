<!-- findid_after / 아이디찾기 결과창 -->
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
        <article class="findid_end">
            <div class="wrap">
                <div class="findid">
                    <div class="findid_text">
                        <h1><span>아</span>이디 찾기</h1>
                        <p>아이디 찾으려면 어쩌구저쩌구</p>
                    </div>
                    <div class="sendmail">
                        <p>작성하신 이메일 주소로 아이디를 보냈습니다:)</p>
                    </div>
                    <div class="loginbtn">
                        <input type="button" value="로그인" onClick="javascript:location.href='main_login.jsp'" style="cursor:pointer;" class="find_login_btn">
                        <input type="button" value="비밀번호 찾기" onClick="javascript:location.href='findpwd.jsp'" class="find_pwd_style" style="cursor:pointer;" >
                    </div>
                </div>
            </div>
        </article>
    </section>
    <section id="footer">
        <article class="footer">
            <p>COPYRIGHT ALL RESERVED BY EATING</p>
        </article>
    </section>
</body>
