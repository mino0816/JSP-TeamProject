<!-- 리뷰상세2 -->
<%@page import="project.comment.CommentBean"%>
<%@page import="java.io.PrintWriter"%>

<%@page import="java.util.Vector"%>
<%@page import="project.review.ReviewBean"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="rmgr" class="project.review.ReviewMgr"/>
<jsp:useBean id="cmgr" class="project.comment.CommentMgr"/>
<jsp:useBean id="rbean" class="project.review.ReviewBean"/>
<jsp:useBean id="cbean" class="project.comment.CommentBean"/>
<%request.setCharacterEncoding("UTF-8");%>

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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>

    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
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
    
    
  
   <% 
	int review_id = 30;//임시리뷰페이지
	String page2 = request.getParameter("url");
    if (page2 != null && !page2.trim().isEmpty() && !page2.equals("null")) {//null방지
    	review_id = Integer.parseInt(page2.trim());//만약 리뷰페이지를 get방식을 통해 받아왔다면 재설정
    } 
   %>
   
   
   <% rbean = rmgr.getReview(review_id); 
		String imageUrl1 = rbean.getReview_image1();
		String imageUrl2 = rbean.getReview_image2();
		String imageUrl3 = rbean.getReview_image3();
   %>
   
    
    <section id="content">
        <article class="review_detaile">
            <div class="wrap">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                    
                    
                        <div class="swiper-slide"><div class="img" 
                        style="background-image: url('<%=imageUrl1%>')"></div></div>
                        <div class="swiper-slide"><div class="img" 
                        style="background-image: url('<%=imageUrl2%>')"></div></div>
                        <div class="swiper-slide"><div class="img" 
                        style="background-image: url('<%=imageUrl3%>')"></div></div>

                        
                        
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
                <div class="review_write">
                <div class="writer">
                    <div class="writer_profile">
                        <div class="icon"></div>

                        <p>@<%=rbean.getUser_id() %></p>
                    </div>                    

                    <h1><%=rbean.getReview_title() %><span><%=rbean.getReview_datetime() %></span></h1>

                    <h4><%=rbean.getReview_content() %></h4>
                </div>
                
      		<% 
      			Vector<CommentBean> vlist = cmgr.getComments(review_id); %>
                <div class="review">
                <h5><img src="../img/review_icon.png" alt="">댓글</h5>
     		 <% for(int i =0; i < vlist.size(); i++ ){ 
      				cbean = vlist.get(i);
      			%>
      				
                    <h4>
                     <%for(int j=0;j<cbean.getDepth();j++){out.println("&nbsp;&nbsp;&nbsp;");} %>
                    @<%=cbean.getUser_id() %><span><%=cbean.getComment_datetime() %></span></h4>
                    <h6><%if(cbean.getRef()>0)out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");%><!-- 만약 답글일 경우 -->
                    <%=cbean.getComment_text() %> 
                    <% String user_id = (String) session.getAttribute("user_id");
                    if(user_id!=null){
                    %><a href="#" onclick="doReply(<%=cbean.getComment_id()%>)"><span>답글달기</span></a>
                    <%}%>
                    </h6>
                <%--     <div class="myreview">
                        <h4><span>ㄴ</span> @hongildong(작성자)<span><%=cbean.getComment_datetime() %></span></h4>
                        <h6>  야 담에 먹으러가자 개맛잇음<!-- <span>답글달기</span> --></h6>
                    </div> --%>         
      <%} %>
                          <!-- 답글달기 구현 -->
                    <script type="text/javascript">
                    	function doReply(comment_id, ref){
                    		alert(comment_id+"에 답글!");
                    		url = "reply.jsp?comment_id="+comment_id+"&page2=<%=page2%>";
                    		window.open(url , "답글달기", "width=340, height=80");
                    	}
                    
                    </script>
                    <%if(session.getAttribute("user_id")!=null){ // 로그인 된 경우만 댓글입력란이 보이게
                    %>      
<form name="Frm" action="insert_comment_Proc.jsp?page2=<%=page2%>" method="post">     
					<input type="hidden" name="comment_post_id" value="<%=page2%>" >
					<input type="hidden" name="user_id" value="<%=(String)session.getAttribute("user_id")%>">
 
                    <div class="reply">
                    <input id="input" type="text" name="comment_text" placeholder="댓글을 입력하세요">
                    <input id="button" type="submit" value="등록" style="cursor: pointer;">
                    </div>
</form>
 					<%
                    } 
                    %>
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
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script>
        var swiper = new Swiper(".mySwiper", {
          pagination: {
            el: ".swiper-pagination",
          },
        });
      </script>
</body>

</html>
