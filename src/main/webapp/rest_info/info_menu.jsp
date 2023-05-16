<%@page import="project.util.UtilMgr"%> 
<%@page import="project.restInfo.RestInfoBean"%>
<%@page import="project.restInfo.RestInfoMgr"%>
<%@page import="project.bookmark.BookmarkMgr"%>
<%@page import="project.menu.MenuBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mbean" class="project.menu.MenuBean"/>
<jsp:useBean id="mmgr" class="project.menu.MenuMgr"/>



<%
	int rest_id;
	if(request.getParameter("url")==null){
		rest_id = 30;//임시아이디
	}else{
		rest_id = Integer.parseInt(request.getParameter("url"));
	}
	
	String user_id;
	if(session.getAttribute("user_id")==null){
		user_id = "hongildong";//임시아이디
	}else{
		user_id = (String) session.getAttribute("user_id");
	}
%>

<%
	Vector<MenuBean> vlist = mmgr.showMenulist(rest_id);

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
    <link rel="stylesheet" type="text/css" href="../css/info_menu.css">

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<body>
    <!-- section은 고정입니다 영역구별이 필요할땐 article 사용해주세요 -->
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
                    <a href="../mypage/mypage.jsp"><img src="../img/icons/mypage.png" alt="MYPAGE"></a>
                </div>
            </div>
        </article>
    </section>
    <section id="content">
        <article class="영역구별할때 써주세요">
            <div class="wrap">

                <!-- 메인사진 -->
<%
	RestInfoMgr rimgr = new RestInfoMgr();
	RestInfoBean ribean = new RestInfoBean();
	ribean = rimgr.getRestInfo(rest_id);
%>

                <!-- 메인사진 -->
                
<% if(ribean.getRest_image1()==null){
%>
                <div class="main_pic"  style="background-color:#000;">
                </div>
<%}else{ %>
                <div class="main_pic" style="background-image: url('../img/rest_info/<%=ribean.getRest_image1()%>');"></div>

<%}%>

                <h2 class="rname"><%=ribean.getRest_name() %></h2>
                <div class="bookmarkshare_box">
                    <div class="bookmarkshare">

                    
<!-- 북마크 기능 -->              
<%
	BookmarkMgr bmgr = new BookmarkMgr();	
	
%>
                        
                        <a href="bookmarkProc.jsp?user_id=<%=user_id%>&rest_id=<%=rest_id%>">
                        <div class="bookmark_box">
                        <%if(bmgr.getStatus(user_id, rest_id)==1){%>
 	                       <img src="../img/icons/star (1).png" alt="bookmark" class="bookmark">
                        <%}else{%>
 	                       <img src="../img/icons/star.png" alt="bookmark" class="bookmark">
 	                    <%}%>
                        <h3>북마크</h3>
                        </div>
                        </a>

<!-- 북마크 기능 -->  
                        
<!-- 공유버튼 url 클립보드에 복사하는 기능  -->                          
                        <a href="#" onclick="javascript:clip()">
                        <div class="share_box">
                        <img src="../img/icons/share.png" alt="share" class="bookmark">
                        <h3>공유</h3>
                        </div>
                        </a>

<script type="text/javascript">
function clip(){
	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}
</script>
<!-- 공유버튼 url 클립보드에 복사하는 기능  -->                             
                        
                        
                        
                    </div>
                </div>


                <div class="lists">
                    <hr style="color: #D9D9D9;">
                    <ul>
                        <li class="list1">
                            <a href="info_home.jsp?url=<%=rest_id%>"><h3>홈</h3></a>
                        </li>
                        <li class="list2">
                            <a href="info_notice.jsp?url=<%=rest_id%>"><h3>공지사항</h3></a>
                        </li>
                        <li class="list3">
                            <a href="info_menu.jsp?url=<%=rest_id%>"><h3>메뉴</h3></a>
                        </li>
                        <li class="list4">
                            <a href="info_review.jsp?url=<%=rest_id%>"><h3>리뷰</h3></a>
                        </li>
                    </ul>
                    <!-- <hr style="color: #D9D9D9;">    -->
                </div>


            <div class="info_menu_box">
                <div class="info_menu">
                    <h3>메뉴</h3>
                    <ul>
                        <li class="menuline1 menuline">
                            <ul>
                            
<%
for (int i=0; i<vlist.size(); i++){
	mbean = vlist.get(i);
	String[] image = new String[vlist.size()];
	if(mbean.getMenu_image1()!=null)
		image[i] = mbean.getMenu_image1();
	else
		image[i] = "../img/icons/menu.png";
	
	String[] menu = new String[vlist.size()];
	menu[i] = mbean.getMenu_name();
		
	int[] price = new int[vlist.size()];
	price[i] = mbean.getMenu_price();
	
%>
                                <li class="menulist<%=i+1%> menulist">
                                    <img src="../img/menu/<%=image[i]%>" alt="menu">
                                    <h3><%=menu[i]%></h3>
                                    <h3 style="color:#CE0000"><%=UtilMgr.intFormat(mbean.getMenu_price())%>원</h3>
                                </li>
                                
<% } %>
                    </ul>
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

</html>
