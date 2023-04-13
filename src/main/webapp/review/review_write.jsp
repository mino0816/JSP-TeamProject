<!-- 리뷰쓰기 -->
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="rmgr" class="project.review.ReviewMgr"/>
<jsp:useBean id="bean" class="project.review.ReviewBean"/>


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
    <script type="text/javascript" src="js/swiper.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>


<!-- <script>
	function myFunction(){
		var message = document.getElementByName("title_post").value
		alert("타이틀 제목은 "+ message)
	}

</script>
     -->
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
                    <a href="../mypage/mypage.jsp"><img src="../img/icons/mypage.png" alt="MYPAGE"></a>
                </div>
            </div>
        </article>
    </section>
    
    
    <section id="content">       
    
    <form action="review_write_proc.jsp?rest_id=<%=request.getParameter("url")%>" method="post" name="reviewFrm" enctype="multipart/form-data">
    <!-- <form action="javascript:myFunction()" method="post" name="reviewFrm" enctype="multipart/form-data"> -->
    <!-- <form action="review_write_proc.jsp" method="post" name="reviewFrm"> -->
           
        <article class="review_write">
            <div class="wrap">
                <div class="review_write_header">
                    <img src="../img/icons/pencil.png" alt="edit">
                    <p>리뷰 작성</p>
                </div>
                <hr>
                
         <div class="review_img">
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                        
                        
                            <div class="swiper-slide">
                                <img src="../img/icons/menu2.png" alt="menu" name="img1" id="img1" onclick="clickImage('fileInput1')" style="cursor:pointer;">
                                <input type="file" name="fileInput1" id="fileInput1" style="display:none" onchange="changeImage('fileInput1', 'img1')">
                            </div>
                            <div class="swiper-slide">
                                <img src="../img/icons/menu2.png" alt="menu" name="img2" id="img2" onclick="clickImage('fileInput2')" style="cursor:pointer;">
                                <input type="file" name="fileInput2" id="fileInput2" style="display:none" onchange="changeImage('fileInput2', 'img2')">
                            </div>
                            <div class="swiper-slide">
                                <img src="../img/icons/menu2.png" alt="menu" name="img3" id="img3" onclick="clickImage('fileInput3')" style="cursor:pointer;">
                                <input type="file" name="fileInput3" id="fileInput3" style="display:none" onchange="changeImage('fileInput3', 'img3')">
                            </div>
                            
	<!-- 파일업로드를 사용할 시 오류가 없게 하려면 request 객체가 아니라 MultipartRequest의 객체로 parameter를 받아야 됨 -->
                      
                      <script type="text/javascript">
                      	function clickImage(inputId){
                    	  document.getElementById(inputId).click(); <!-- 이미지를 클릭하면 파일업로드가 연계되어 작동함  -->
                    	}        
                      	function changeImage(inputId, imgId){ 
                      		var input = document.getElementById(inputId)
                      	    if (input.files && input.files[0]) {
                      	      var reader = new FileReader();
                      	      reader.onload = function (e) {
                      	        document.getElementById(imgId).src = e.target.result; 
                      	      };    /* 이미지 태그의 src 주소를 새롭게 변경한 이미지파일로 설정 */
                      	      reader.readAsDataURL(input.files[0]);
                      	    }
                      	  }
                      </script>      
                            
                            
                         </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
                <hr>
                <div class="review_title">
                	<!-- <textarea placeholder="제목" id="title" name="title"></textarea> -->
                	<!-- <input type="text" placeholder="제목" id="title" name="title"> -->
                	<input placeholder="제목" id="title_post" name="title_post">
                </div>
                <hr>
                <div class="review_content">
                	<!-- <textarea placeholder="내용을 작성해주세요" id="content" name="content"></textarea> -->
                	<!-- <input type="text" placeholder="내용을 작성해주세요" id="content" name="content"> -->
                	<input placeholder="내용을 작성해주세요" id="content_post" name="content_post">
                </div>
                <hr>
                <input type="submit" class="sub_btn" value="리뷰 작성하기">
            </div>
        </article>
   		 </form>
    </section>
    
    
    <section id="footer">
        <article class="footer">
            <p>COPYRIGHT ALL RESERVED BY EATING</p>
        </article>
    </section>
</body>

</html>
