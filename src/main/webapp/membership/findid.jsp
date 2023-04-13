<!-- findid / 아이디찾기 -->
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
        <article class="findid">
            <div class="wrap">
                <form class="findid" name="postFrm" method="POST" action="findid_mailSendProc.jsp">
                    <div class="findid_text">
              			<h1><span>아</span>이디 찾기</h1>
              			<p>아이디 찾으려면 어쩌구저쩌구 작성해주세요.</p>
            		</div>
		            <div class="information">
		                <p>이름  <input type="text" name="member_name"></p>
		                <p>이메일<input type="text" name="member_email" ></p>
		            </div>
                    <div class="loginbtn">
                        <input type="submit" value="아이디 찾기">
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
