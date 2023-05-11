<%@page import="project.util.UtilMgr"%>
<%@page import="project.restInfo.RestInfoBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.restInfo.RestInfoMgr"/>

<%
	if (!session.getAttribute("user_id").equals("admin")) {
	    response.sendRedirect("../../membership/admin_login.jsp");
	    return;
	}
	int rest_id = 0;
	if(request.getParameter("rest_id")!=null)
		rest_id = UtilMgr.parseInt(request, "rest_id");
	else
		response.sendRedirect("admin_rest_list.jsp");
	RestInfoBean bean = mgr.getRestInfo(rest_id);
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
                        <a href="#">가게</a>
                        <ul class="menu_dep on">
                            <li><a href="admin_rest_list.jsp" class="on">가게 목록</a></li>
                            <li><a href="admin_rest_regist.jsp">가게 등록</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="../notice/admin_noticeBoard_list.jsp">공지사항</a>
                        <ul class="menu_dep">
                            <li><a href="#">공지사항 목록</a></li>
                            <li><a href="#">공지사항 등록</a></li>
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
        <form name="postFrm" method="post" action="admin_rest_modifyproc.jsp" enctype="multipart/form-data">
        <article class="main admin_rest_regist">
            <div class="rest_regist">           
                <h2>가게수정</h2>
                <div class="rest_img">
                    <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <img src="../../img/rest_info/<%=bean.getRest_image1()!=null?bean.getRest_image1():"../../img/icons/ready.png"
                                %>" alt="menu" name="img1" id="img1" onclick="clickImage('fileInput1')" style="cursor:pointer;">
                                <input type="file" name="rest_image1" value="<%=bean.getRest_image1() %>" id="fileInput1" style="display:none" onchange="changeImage('fileInput1', 'img1')">
                            </div>
                            <div class="swiper-slide">
                                <img src="../../img/rest_info/<%=bean.getRest_image2()!=null?bean.getRest_image2():"../../img/icons/ready.png"
                                %>" alt="menu" name="img2" id="img2" onclick="clickImage('fileInput2')" style="cursor:pointer;">
                                <input type="file" name="rest_image2" value="<%=bean.getRest_image2() %>" id="fileInput2" style="display:none" onchange="changeImage('fileInput2', 'img2')">
                            </div>
                            <div class="swiper-slide">
                                <img src="../../img/rest_info/<%=bean.getRest_image3()!=null?bean.getRest_image3():"../../img/icons/ready.png"
                                %>"  alt="menu" name="img3" id="img3" onclick="clickImage('fileInput3')" style="cursor:pointer;">
                                <input type="file" name="rest_image3" value="<%=bean.getRest_image3() %>" id="fileInput3" style="display:none" onchange="changeImage('fileInput3', 'img3')">
                            </div>
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
                </div>
                <div class="rest_address">
                    <label for="rest_name">가게 이름</label>
                    <input id="rest_name" name="rest_name" value="<%=bean.getRest_name()%>">
                </div>
                <div class="rest_address">
                    <label for="rest_info">주소</label>
                    <input id="rest_address" name="rest_address" value="<%=bean.getRest_address()%>" >
                </div>
                <div class="rest_open_time">
                    <label for="rest_info">영업 시간</label>
                    <input id="open_time" name="open_time" value="<%=bean.getOpen_time()%>" >
                </div>
                <div class="rest_call">
                    <label for="rest_info">대표전화</label>
                    <input id="rest_call" name="rest_call" value="<%=bean.getRest_call()%>" >
                </div>
                <div class="rest_introduction">
                    <label for="rest_info">가게 한줄 소개</label>
                    <input id="rest_introduction" name="rest_introduction" value="<%=bean.getRest_introduction()%>" >
                </div>
                <input type="submit" value="수정" class="sub_btn" onclick="admin_rest_modifyproc.jsp">
            </div>
        </article>
        <input type="hidden" name="rest_id" value="<%=bean.getRest_id()%>">
        </form>
    </section>
    <!-- <section id="footer">
        <article class="footer">
            <p>COPYRIGHT ALL RESERVED BY EATING</p>
        </article>
    </section> -->
</body>

</html>