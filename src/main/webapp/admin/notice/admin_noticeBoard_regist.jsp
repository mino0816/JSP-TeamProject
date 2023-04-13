<%@page import="project.restInfo.RestInfoBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.noticeBoard.NoticeBoardMgr"/>
<jsp:useBean id="bean" class="project.noticeBoard.NoticeBoardBean"/>
<jsp:useBean id="rmgr" class="project.restInfo.RestInfoMgr"/>
<%

		String user_id = (String)session.getAttribute("user_id");
		int rest_id = 0;
		if(request.getParameter("rest_id")!=null){
			rest_id =  Integer.parseInt(request.getParameter("rest_id")) ;
			session.setAttribute("rest_id", rest_id);
		}
		
		if (user_id==null) {
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
    <meta property="og:image" content="../img/favicon/og_img.png">
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
    	function write(){
    		frm = document.postFrm;
    		frm.submit();
    	}
    	
    	function calc(){
    		if(document.getElementById('noticeBoard').value.length==40){
    			alert("최대 글자수를 초과했습니다.");
    			return;
    		};    		
    	}
    	function chglist(rest_id) {
    		//alert(rest_id);
    		document.notice.rest_id.value=rest_id;
    		document.notice.submit();
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
                        <a href="../rest/admin_rest_list.jsp" >가게</a>
                        <ul class="menu_dep ">
                            <li><a href="../rest/admin_rest_list.jsp">가게 목록</a></li>
                            <li><a href="../rest/admin_rest_regist.jsp">가게 등록</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="on">공지사항</a>
                        <ul class="menu_dep on">
                            <li><a href="admin_noticeBoard_list.jsp">공지사항 목록</a></li>
                            <li><a href="#" class="on">공지사항 등록</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="../menu/menulist.jsp">메뉴</a>
                        <ul class="menu_dep">
                            <li><a href="../menu/menulist.jsp">메뉴 목록</a></li>
                            <li><a href="../menu/addmenulist.jsp">메뉴 등록</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </article>
        <article class="main admin_noticeBoard_regist">
            <div class="noticeBoard_regist">           
               <%
            		Vector<RestInfoBean> rvlist = rmgr.showStorelist();
            %>          
            	<form name="frm">
                <h2>공지사항 &nbsp;&nbsp;
                <select name="rest_id" onchange="javascript:chglist(this.value)">
                <option value="0">가계를 선택하세요.</option>
                <%
                		for(int i=0;i<rvlist.size();i++){
                			RestInfoBean rbean = rvlist.get(i);
                %>
                	<option value="<%=rbean.getRest_id()%>"><%=rbean.getRest_name() %></option>
                <%}%>
                </select>
                <script type="text/javascript">
                	document.frm.rest_id.value="<%=rest_id%>";
                </script>
                 </h2>
                 </form>
                 <form name="postFrm" method="post" action="admin_noticeBoard_registProc.jsp">
                <div class="noticeBoard_main">
                    <h3>공지사항 등록</h3>
                    <input  maxlength='40' name="notice_content" title="공지사항을 적어주세요." id="noticeBoard"
                    	onkeydown="calc()" onkeyup="calc()" onkeypress="calc()">  
                       <input type="hidden" name="rest_id" value="<%=rest_id%>">
                                   
                    <div>
                       <input type="submit" value="등록" class="sub_btn" onclick="javascript:write">
                    </div>
                </div>
            </div>
        </article>
      </form>
    </section>
    <!-- <section id="footer">
        <article class="footer">
            <p>COPYRIGHT ALL RESERVED BY EATING</p>
        </article>
    </section> -->
    <form name="notice">
    	<input type="hidden" name="rest_id">
    </form>
</body>

</html>

