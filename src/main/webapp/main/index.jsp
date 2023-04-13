
<%@page import="project.bookmark.BookmarkBean"%>
<%@page import="project.bookmark.BookmarkMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="project.review.ReviewBean"%>
<jsp:useBean id="rmgr" class="project.review.ReviewMgr"/>
<jsp:useBean id="rbean" class="project.review.ReviewBean"/>

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
    <script type="text/javascript" src="../js/swiper.min.js"></script>
    <script type="text/javascript" src="../js/script.js"></script>

</head>

<body>
    <section id="header">
        <article class="header">
            <div class="wrap">
                <h1 class="logo">
                    <a href="#"><img src="../img/icons/logo.png" alt="EATING_LOGO"></a>
                </h1>
                <div class="mypage">
                    <a href="../mypage/mypage.jsp"><img src="../img/icons/mypage.png" alt="MYPAGE"></a>
                </div>
            </div>
        </article>
    </section>
    <section id="content">
        <article class="mainpage">
            <div class="wrap">
                <div class="mainpage_swiper">
                    <h4>인기있는<br><span>맛집 리스트</span> 입니다.</h4>
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
<% BookmarkMgr bmgr = new BookmarkMgr();
	Vector<BookmarkBean> vlist = new Vector<BookmarkBean>();
	vlist = bmgr.getReviews();
%>                        
                        
<% for(int i=0; i<vlist.size(); i++){
	BookmarkBean bean = vlist.get(i);
%>  
                            <div class="swiper-slide">
                            <a href="../rest_info/info_home.jsp?url=<%=bean.getRest_id()%>">
                                <div class="mainswiper_img" style="background-image: url('<%=bean.getMain_image()%>');"></div>
                            </a>
                                <h4><%=bean.getRest_name() %></h4>
                                <p>북마크  <span><%=bean.getBookmark_count() %></span>개| 리뷰 </span><%=bean.getReview_count() %></span>개</p>
                            </div>
<% }%>                               
                        </div>
                    </div>
                </div>
                <div class="store_more">
                    <a href="../rest_info/store_list.jsp">더보기 >></a>
                </div>
                <div class="mainpage_review">
                    <h4>다양한 리뷰 확인하고<br><span>맛집</span> 찾아가자!</h4>
                    <div class="review_list">
                        <ul>
<% 
	Vector<ReviewBean> review_vlist = new Vector<ReviewBean>();
	// rest_id 매개변수가 -1이면 SQL 쿼리에서 "or ? = -1" 부분이 참이 되어, 특정한 음식점 ID를 선택하지 않은 모든 리뷰를 반환합니다. 즉, 모든 음식점의 리뷰를 보여주기 위해 사용되는 것입니다.
	review_vlist = rmgr.showReviews(-1);
%>                        

<%
	for(int i=0; i<review_vlist.size() && i<5;i++){
		rbean = review_vlist.get(i);
%>
                            <li>
                            <a href="../review/review_detaile.jsp?url=<%=rbean.getReview_id()%>">
                                <div class="review_img" style="background-image: url('<%=rbean.getReview_image1()%>');"></div>
                            </a>
                                <div class="review_txt">
                                    <h4><%=rbean.getReview_title() %></h4>
                                    <p><%=rbean.getReview_content() %>
                                    </p>
                                </div>
                            </li>
<%		
	}
%>                            
    
                        </ul>
                    </div>
                </div>
                <div class="reivew_more">
                    <a href="../review/review_list.jsp">리뷰 더보기</a>
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
