<%@page import="project.restInfo.RestInfoMgr"%>
<%@page import="project.restInfo.RestInfoBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="project.util.UtilMgr"%>
<%@page import="project.menu.MenuBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="mMgr" class="project.menu.MenuMgr" />
<jsp:useBean id="rmgr" class="project.restInfo.RestInfoMgr"/>		

<%
/* 	if(request.getParameter("rest_id")!=null){
		int rest_id =  Integer.parseInt(request.getParameter("rest_id")) ;
		session.setAttribute("rest_id", rest_id);
	} */

	if (!session.getAttribute("user_id").equals("admin")) {
	    response.sendRedirect("../../membership/admin_login.jsp");
	    return;
	}
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
    	function chk() {
			rest_id = document.postFrm.rest_id.value;
			if(rest_id==0){
				alert("가계를 선택하세요");
				return;
			}
			menu_name = document.getElementById("menu_name").value.trim();
			menu_price = document.getElementById("menu_price").value.trim();

			if (menu_name === "") {
				alert("메뉴 이름을 입력해주세요.");
				return;
			}

			if (menu_price === "") {
			    alert("메뉴 가격을 입력해주세요.");
			    return;
			}
			
		
			document.postFrm.submit();
		}
    </script>
</head>

<body>
    <section id="header">
        <article class="header">
            <div class="wrap">
                <h1 class="logo">
                    <a href="../rest/admin_rest_list.jsp"><img src="../../img/icons/logo.png" alt="EATING_LOGO"></a>
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
                        <ul class="menu_dep">
                            <li><a href="../rest/admin_rest_list.jsp">가게 목록</a></li>
                            <li><a href="../rest/admin_rest_regist.jsp">가게 등록</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="../notice/admin_noticeBoard_list.jsp">공지사항</a>
                        <ul class="menu_dep">
                            <li><a href="../notice/admin_noticeBoard_list.jsp">공지사항 목록</a></li>
                            <li><a href="../notice/admin_noticeBoard_regist.jsp">공지사항 등록</a></li>
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
        <form name="postFrm" method="post" action="write.jsp" enctype="multipart/form-data">
        <%Vector<RestInfoBean> rvlist = rmgr.showStorelist();%> 
            <div class="addmenu">
                <h2>메뉴 등록 &nbsp;&nbsp;
                 <select name="rest_id">
                <option value="0">가계를 선택하세요.</option>
                <%
                		for(int i=0;i<rvlist.size();i++){
                			RestInfoBean rbean = rvlist.get(i);
                %>
                	<option value="<%=rbean.getRest_id()%>"><%=rbean.getRest_name() %></option>
                <%}%>
                </select>
                </h2>
                <div class="addpic">
                    <div class="swiper mySwiper">
	                    <div class="swiper-wrapper">
                           <div class="swiper-slide">
                                <img src="../../img/icons/ready.png" alt="menu" name="img1" id="img1" onclick="clickImage('fileInput1')" style="cursor:pointer;">
                                <input type="file" name="menu_image1" id="fileInput1" style="display:none" onchange="changeImage('fileInput1', 'img1')">
                            </div>
                            <div class="swiper-slide">
                                <img src="../../img/icons/ready.png" alt="menu" name="img2" id="img2" onclick="clickImage('fileInput2')" style="cursor:pointer;">
                                <input type="file" name="menu_image2" id="fileInput2" style="display:none" onchange="changeImage('fileInput2', 'img2')">
                            </div>
                            <div class="swiper-slide">
                                <img src="../../img/icons/ready.png" alt="menu" name="img3" id="img3" onclick="clickImage('fileInput3')" style="cursor:pointer;">
                                <input type="file" name="menu_image3" id="fileInput3" style="display:none" onchange="changeImage('fileInput3', 'img3')">
                            </div>
                          <%--   <input type="hidden" name="rest_id" value="<%=session.getAttribute("rest_id") %>"> --%>
	                      
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
                </div>
                <div class="addmenu_name">
                    <label for="menuname">메뉴 이름</label>
                    <input type="text" id="menu_name" name="menu_name">
                </div>
                <div class="addmenu_price">
                    <label for="menuname">금액</label>
                    <input type="text" id="menu_price" name="menu_price">
                </div>
                <input type="button" onclick="chk()" value="등록" class="sub_btn">
            </div>
            </form>
        </article>
    </section>
</body>