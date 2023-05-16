<%@page import="project.review.ReviewBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="rmgr" class="project.review.ReviewMgr"/>    
<jsp:useBean id="mmgr" class="project.membership.MemberMgr"/>    
<jsp:useBean id="rbean" class="project.review.ReviewBean"/>    
<jsp:useBean id="mbean" class="project.membership.MemberBean"/>    

 
<%
	if(session.getAttribute("user_id")==null){
	    response.sendRedirect("../membership/main_login.jsp");
	    return;
	}

	String user_id = (String) session.getAttribute("user_id");
	Vector<ReviewBean> vlist = rmgr.showReviews(user_id);
	mbean = mmgr.getMember(user_id);
	int reviewcount = rmgr.countReviews(user_id);
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
                    <a href="mypage.jsp"><img src="../img/icons/mypage.png" alt="MYPAGE"></a>
                </div>
            </div>
        </article>
    </section>
    <section id="content">
        <article class="mypage_review">
            <div class="wrap">
                <div class="review_list">
                    <h3>
                        <span><%=mbean.getMember_name() %></span>님이 작성하신 리뷰는<br>
                        <span class="review_num"><%=reviewcount %> 개</span> 입니다!
                    </h3>
                    <ul>
                    
                    <%
                    	for(int i=0; i<vlist.size(); i++){
                    		rbean = vlist.get(i);
                   	%>
                        <li>
                        <a href="../review/review_detaile.jsp?page2=<%=rbean.getReview_id()%>">
                            <div class="review_img" style="background-image: url('<%=rbean.getReview_image1()%>');"></div>
                        </a>  
                            <div class="review_txt">
                                <h4><%=rbean.getReview_title() %></h4>
                                <p> <%=rbean.getReview_content()%>
                                </p>
                            </div>
                        </li>
                        
                    <%} %>
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
