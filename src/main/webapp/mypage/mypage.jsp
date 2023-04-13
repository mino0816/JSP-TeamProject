
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mmgr" class="project.membership.MemberMgr"/>   
    
<%	
	if(session.getAttribute("user_id")==null||session.getAttribute("user_id").equals(null)||session.getAttribute("user_id").equals("")){
	    response.sendRedirect("../membership/main_login.jsp");
	    return;
	}
	String user_id = (String) session.getAttribute("user_id");
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0" />

    <meta property="og:type" content="website">
    <meta property="og:title" content="사이트명">
    <meta property="og:description" content="안내말.">
    <meta property="og:image" content="img/favicon/og_img.png">
    <meta property="og:url" content="">

    <meta name="description" content="안내말." />
    <meta name="keywords" content="" />
    <meta name="author" content="" />

    <title>EATING</title>

    <link rel="apple-touch-icon" sizes="57x57" href="img/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="img/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="img/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="img/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="img/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="img/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="img/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="img/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon/favicon-16x16.png">
    <link rel="icon" type="image/png" sizes="32x32" href="img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="img/favicon/favicon-96x96.png">

    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/font.css">
    <link rel="stylesheet" type="text/css" href="../css/layout.css">

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>

    
</head>

<body>
    <section id="header">
        <article class="header">
            <div class="wrap">
                <h1 class="logo">
                    <a href="../main/index.jsp"><img src="../img/icons/logo.png" alt="EATING_LOGO"></a>
                </h1>
                <!-- <div class="login">
                    <a href="#">LOGIN</a>
                </div> -->
                <div class="mypage">
                    <a href="#"><img src="../img/icons/mypage.png" alt="MYPAGE"></a>
                </div>
            </div>
        </article>
    </section>
    <section id="content">
        <article class="mypage_list">
            <div class="wrap">
                <div class="mypage_profile">
                    <div class="profile_pic"></div>
                    <p><span><%=mmgr.getMember(user_id).getMember_name() %></span>님! 환영합니다.</p>
                    
                    <%	
	if(mmgr.getMember(user_id).getMember_name()==null||mmgr.getMember(user_id).getMember_name().equals(null)||mmgr.getMember(user_id).getMember_name().equals("")){
	    response.sendRedirect("../membership/main_login.jsp");
	    return;
	}
                    %>
                </div>
                <div class="mypage_list">
                    <h3>모아보기</h3>
                    <ul>
                        <li style="background-color:#dddddd;">
                            <a href="mypage_bookmark.jsp">
                                <img src="../img/icons/bookmark.png">
                                <p>북마크 모아보기</p>
                            </a>
                        </li>
                        <li>
                            <a href="mypage_review.jsp">
                                <img src="../img/icons/review_ic.png">
                                <p>내 리뷰 모아보기</p>
                            </a>
                        </li>
                        <li style="background-color:#dddddd;">
                            <a href="#">
                                <img src="../img/icons/event.png">
                                <p>공지사항 / 이벤트</p>
                            </a>
                        </li>
                    </ul>
                    <h3>설정</h3>
                    <ul>
                        <li style="background-color:#dddddd;">
                            <a href="../membership/member_update.jsp">
                                <img src="../img/icons/pencil.png">
                                <p>회원 정보 수정</p>
                            </a>
                        </li>
                        <li>
                            <a href="../membership/logout.jsp">
                                <img src="../img/icons/checked.png">
                                <p>로그아웃</p>
                            </a>
                        </li>
                    </ul>
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

</html>
