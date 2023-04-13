<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="project.util.UtilMgr"%>
<%@page import="project.menu.MenuBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="mMgr" class="project.menu.MenuMgr" />
<%
		if(request.getParameter("rest_id")!=null){
			int rest_id =  Integer.parseInt(request.getParameter("rest_id")) ;
			session.setAttribute("rest_id", rest_id);
		}
		if (!session.getAttribute("user_id").equals("admin")) {
		    response.sendRedirect("../../membership/admin_login.jsp");
		    return;
		}
		int menu_id = 0;
		if(request.getParameter("menu_id")==null){
			response.sendRedirect("menulist.jsp");
			return;
		}else{
			menu_id = Integer.parseInt(request.getParameter("menu_id"));
		}
		MenuBean bean = mMgr.getreaddmenu(menu_id);
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
                        <a href="../rest/admin_rest_list.jsp">가게</a>
                    </li>
                    <li>
                        <a href="../notice/admin_noticeBoard_list.jsp">공지사항</a>
                        <ul class="menu_dep">
                            <li><a href="#">공지사항 목록</a></li>
                            <li><a href="#">공지사항 등록</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="on">메뉴</a>
                        <ul class="menu_dep on">
                            <li><a href="menulist.jsp">메뉴 목록</a></li>
                            <li><a href="addmenulist.jsp" class="on">메뉴 등록</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </article>
        <article class="main admin_addmenu">
         <form name="postFrm" method="post" action="modify.jsp" enctype="multipart/form-data">
            <div class="addmenu">
                <h2>메뉴 수정</h2>
                <div class="addpic">
                    <h3>사진</h3>
                            <div class="swiper-slide">
                                <img src="../../img/menu/<%=bean.getMenu_image1()%>" alt="menu" name="img1" id="img1" onclick="clickImage('fileInput1')" style="cursor:pointer;">
                                <input type="file" name="menu_image1" value="<%=bean.getMenu_image1() %>" id="fileInput1" style="display:none" onchange="changeImage('fileInput1', 'img1')">
                            </div>
                            <div class="swiper-slide">
                                <img src="../../img/menu/<%=bean.getMenu_image2() %>" alt="menu" name="img2" id="img2" onclick="clickImage('fileInput2')" style="cursor:pointer;">
                                <input type="file" name="menu_image2" value="<%=bean.getMenu_image2() %>" id="fileInput2" style="display:none" onchange="changeImage('fileInput2', 'img2')">
                            </div>
                            <div class="swiper-slide">
                                <img src="../../img/menu/<%=bean.getMenu_image3() %>" alt="menu" name="img3" id="img3" onclick="clickImage('fileInput3')" style="cursor:pointer;">
                                <input type="file" name="menu_image3" value="<%=bean.getMenu_image3() %>" id="fileInput3" style="display:none" onchange="changeImage('fileInput3', 'img3')">
                            </div>
                </div>
                <script type="text/javascript">
                      	function clickImage(inputId){
                    	  document.getElementById(inputId).click();
                    	}
                      	function changeImage(inputId, imgId){
                      		var input = document.getElementById(inputId)
                      	    if (input.files && input.files[0]) {
                      	      var reader = new FileReader();
                      	      reader.onload = function (e) {
                      	        document.getElementById(imgId).src = e.target.result;
                      	      };
                      	      reader.readAsDataURL(input.files[0]);
                      	    }
                      	  }
                      </script> 
                <div class="addmenu_name">
                    <label for="menuname">메뉴 이름</label>
                    <input type="text" id="menu_name" name="menu_name" value="<%=bean.getMenu_name()%>">
                </div>
                <div class="addmenu_price">
                    <label for="menuname">금액</label>
                    <input type="text" id="menu_price" name="menu_price" value="<%=bean.getMenu_price()%>">
                </div>
                <input type="hidden" id="menu_id" name="menu_id" value="<%=bean.getMenu_id()%>">
                <input type="submit" value="수정" class="sub_btn">
            </div>
            </form>
        </article>
    </section>
</body>
