<!DOCTYPE html> 
<html lang="ko">
<%@page import="project.restInfo.RestInfoBean"%>
<%@page import="project.util.UtilMgr"%>
<%@page import="project.noticeBoard.NoticeBoardMgr"%>
<%@page import="java.io.Console"%>
<%@page import="project.noticeBoard.NoticeBoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="project.noticeBoard.NoticeBoardMgr"/>
<jsp:useBean id="rmgr" class="project.restInfo.RestInfoMgr"/>
<%
	int rest_id = 0;
	if(request.getParameter("rest_id")!=null){
		rest_id =  Integer.parseInt(request.getParameter("rest_id")) ;
		session.setAttribute("rest_id", rest_id);
	}
	if (!session.getAttribute("user_id").equals("admin")) {
	    response.sendRedirect("../../membership/admin_login.jsp");
	    return;
	}
	
	int totalRecord = 0 ;	//총게시물
	int numPerPage = 5;	//페이지당 레코드 수
	int pagePerBlock = 5;	//블럭당 페이지 수
	int totalPage = 0;		//총 페이지 수
	int totalBlock = 0;		//총 블럭 수
	int nowPage = 1;		//현재 페이지
	int nowBlock = 1;		//현자 블럭
		
	//numPage값이 요청되지 않으면 기본값 1로 세팅
	if(request.getParameter("nowPage")!=null){
		nowPage = UtilMgr.parseInt(request, "nowPage");
	}

	totalRecord = mgr.getTotalCount();
	int start = (nowPage*numPerPage)-numPerPage;
	int cnt = numPerPage;
	/* out.print(start+ " : "+ cnt); */
	//전체페이지 개수
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
	//전체블럭 개수
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	//현재블럭
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
	%>

<script  type="text/javascript">
	function pageing(page) {
		document.readFrm.nowPage.value=page;
		document.readFrm.submit();
	}
	
	function block(block) {
		document.readFrm.nowPage.value=<%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}
	function numPerFn(numPerPage) {
		//alert(numPerPage);
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function chglist(rest_id) {
		//alert(rest_id);
		document.notice.rest_id.value=rest_id;
		document.notice.submit();
	}
</script>

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
                            <li><a href="admin_noticeBoard_list.jsp" class="on">공지사항 목록</a></li>
                            <li><a href="admin_noticeBoard_regist.jsp">공지사항 등록</a></li>
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
        <article class="main admin_noticeBoard_list">
            <div class="noticeBoard_main_list"> 
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
                <div class="noticeBoard_list">
                    <h3>공지사항 목록</h3>
                    <%
                    	Vector<NoticeBoardBean> vlist = null;
                    	int listsize = 0;
                    	if(rest_id==0){
                    		vlist = mgr.listNoticeBoard(start, cnt);
                   			listsize = vlist.size();
                    	}else{
                    		vlist = mgr.listNoticeBoard(rest_id);
                    		listsize = vlist.size();
                    	}
                    /* out.print(vlist.size()); */
                    %>
                  
                    <% for(int i = 0; i < listsize; i++){
                    	if(i == listsize)break;
                    	NoticeBoardBean bean = vlist.get(i);
                    	int notice_id = bean.getNotice_id();
                    	String notice_content = bean.getNotice_content();
                    	String notice_datetime = bean.getNotice_datetime();
                    
                    %>
                     <div class="notice_list">
                        <ul>
                            <li><%=notice_content%></li>
                            <li><%=notice_datetime %></li>                              	
                          	<input type="submit" value="수정" class="sub_btn sub_btn1" onclick="location.href='admin_noticeBoard_modify.jsp?notice_id=<%=notice_id%>'">                         
                          	<input type="submit" value="삭제" class="sub_btn sub_btn2" onclick="location.href='admin_noticeBoard_delete.jsp?notice_id=<%=notice_id%>'">
                        </ul>                   
                    </div>                    
                    <%} %>  
                    <input type="hidden" name="nowPage" value="1">                 
                </div>
            </div>
        </article>
        <article class="page_btn">
            <div class="paging">
              
     		<!-- 페이징 및 블럭 Start -->
     		<%-- <%out.print(nowBlock+ " : "+ nowPage);%> --%>
			<!-- 이전블럭 -->
			<%if(nowBlock>1){ %>
				<a href="javascript:block('<%=nowBlock-1%>')"><<</a>
			<%} %>
			<!-- 페이징 -->
			<%
					int pageStart = (nowBlock-1)*pagePerBlock+1;
					int pageEnd = (pageStart+pagePerBlock)<totalPage?
							pageStart+pagePerBlock:totalPage+1;
					for(;pageStart<pageEnd;pageStart++){
			%>
				<a href="javascript:pageing('<%=pageStart%>')">
						<%if(nowPage==pageStart){%><font style="font-weight: bolder;"><%}%>
						<%=pageStart%>
					<%if(nowPage==pageStart){%></font><%}%>
				</a>
			<%}//--for %>
			<!-- 다음블럭 -->
			<%if(totalBlock>nowBlock){ %>
				<a href="javascript:block('<%=nowBlock+1%>')">>></a>
			<%} %>
		<!-- 페이징 및 블럭 End -->
             
            </div>
        </article>
    </section>
    
    <form name="readFrm">
    	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="notice_id">
    </form>
    <form name="notice">
    	<input type="hidden" name="rest_id">
    </form>
    <!-- <section id="footer">
        <article class="footer">
            <p>COPYRIGHT ALL RESERVED BY EATING</p>
        </article>
    </section> -->
</body>

</html>
