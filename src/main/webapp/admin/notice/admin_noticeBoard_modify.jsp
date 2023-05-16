 
<%@page import="project.util.UtilMgr"%>
<%@page import="project.noticeBoard.NoticeBoardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.noticeBoard.NoticeBoardMgr"/>
<%
	if(request.getParameter("rest_id")!=null){
		int rest_id =  Integer.parseInt(request.getParameter("rest_id")) ;
		session.setAttribute("rest_id", rest_id);
	}
	if (!session.getAttribute("user_id").equals("admin")) {
	    response.sendRedirect("../../membership/admin_login.jsp");
	    return;
	}
	if (request.getParameter("notice_id") == null) {
	    response.sendRedirect("admin_noticeBoard_list.jsp");
	    return;
	}
	int notice_id = UtilMgr.parseInt(request, "notice_id");
	NoticeBoardBean bean = mgr.getNoticeBoard(notice_id);
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

    <link rel="stylesheet" type="text/css" href="../../css/common.css">
    <link rel="stylesheet" type="text/css" href="../../css/font.css">
    <link rel="stylesheet" type="text/css" href="../../css/pc_layout.css">

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="../../js/script.js"></script>
    <script type="text/javascript">
    
    	function calc(){
    		if(document.getElementById('noticeBoard').value.length==40){
    			alert("최대 글자수를 초과했습니다.");
    			return;
    		};    		
    	}
    </script>
</head>

<body>
    <section id="header">
        <article class="header">
            <div class="wrap">
                <h1 class="logo">
                    <img src="../../img/icons/logo.png" alt="EATING_LOGO">
                </h1>
            </div>
        </article>
    </section>
    <section id="content">
        <article class="admin_menu">
            <div class="menu">
                <ul>
                    <li>
                        <a href="../rest/admin_rest_list.jsp" >가게</a>
                    </li>
                    <li>
                        <a href="#">공지사항</a>
                        <ul class="menu_dep">
                            <li><a href="admin_noticeBoard_list.jsp">공지사항 목록</a></li>
                            <li><a href="admin_noticeBoard_regist">공지사항 등록</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="../menu/menulist.jsp">메뉴</a>
                        <ul class="menu_dep">
                            <li><a href="#">메뉴 목록</a></li>
                            <li><a href="#">메뉴 등록</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </article>
       <form method="post" action ="admin_noticeBoard_modifyProc.jsp">
        <article class="main admin_noticeBoard_regist">
            <div class="noticeBoard_regist">           
                <h2>공지사항</h2>
                <div class="noticeBoard_main">
                    <h3>공지사항 수정</h3>
                    <input  maxlength='40' id="noticeBoard" name="notice_content" value="<%=bean.getNotice_content()%>" 
                    onkeydown="calc()" onkeyup="calc()" onkeypress="calc()">                
                    <div>
                        <input type="submit" value="수정" class="sub_btn" onclick="admin_noticeBaord_modifyProc.jsp">
                    </div>
                  
                </div>
            </div>
        </article>
        <input type="hidden" name="notice_id" value="<%=bean.getNotice_id()%>">
       </form>
    </section>
    <!-- <section id="footer">
        <article class="footer">
            <p>COPYRIGHT ALL RESERVED BY EATING</p>
        </article>
    </section> -->
</body>

</html>
