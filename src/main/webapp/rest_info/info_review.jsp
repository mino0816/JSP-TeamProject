<!-- 가게리뷰 -->
<%@page import="project.restInfo.RestInfoBean"%>
<%@page import="project.restInfo.RestInfoMgr"%>
<%@page import="project.review.ReviewBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="rmgr" class="project.review.ReviewMgr" />
<jsp:useBean id="rbean" class="project.review.ReviewBean" />
<jsp:useBean id="bmgr" class="project.bookmark.BookmarkMgr" />

<%
int rest_id;
if (request.getParameter("url") == null) {
	rest_id = 30;//임시아이디
} else {
	rest_id = Integer.parseInt(request.getParameter("url"));
}

String user_id;
if (session.getAttribute("user_id") == null) {
	user_id = "hongildong";//임시아이디
} else {
	user_id = (String) session.getAttribute("user_id");
}
%>

<%
Vector<ReviewBean> vlist = rmgr.showReviews(rest_id);
%>

<!DOCTYPE html>
<%@ include file="header.jsp"%>


<section id="content">
	<article class="영역구별할때 써주세요">
		<div class="wrap">

			<%
			RestInfoMgr rimgr = new RestInfoMgr();
			RestInfoBean ribean = new RestInfoBean();
			ribean = rimgr.getRestInfo(rest_id);
			%>

			<!-- 메인사진 -->

			<%
			if (ribean.getRest_image1() == null) {
			%>
			<div class="main_pic" style="background-color: #000;"></div>
			<%
			} else {
			%>
			<div class="main_pic"
				style="background-image: url('../img/rest_info/<%=ribean.getRest_image1()%>');"></div>

			<%
			}
			%>

			<h2 class="rname"><%=ribean.getRest_name()%></h2>


			<div class="bookmarkshare_box">
				<div class="bookmarkshare">
					<!-- 북마크 기능 -->

					<a
						href="bookmarkProc.jsp?user_id=<%=user_id%>&rest_id=<%=rest_id%>">
						<div class="bookmark_box">
							<%
							if (bmgr.getStatus(user_id, rest_id) == 1) {
							%>
							<img src="../img/icons/star (1).png" alt="bookmark"
								class="bookmark">
							<%
							} else {
							%>
							<img src="../img/icons/star.png" alt="bookmark" class="bookmark">
							<%
							}
							%>
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
					<li class="list1"><a href="info_home.jsp?url=<%=rest_id%>"><h3>홈</h3></a>
					</li>
					<li class="list2"><a href="info_notice.jsp?url=<%=rest_id%>"><h3>공지사항</h3></a>
					</li>
					<li class="list3"><a href="info_menu.jsp?url=<%=rest_id%>"><h3>메뉴</h3></a>
					</li>
					<li class="list4"><a href="info_review.jsp?url=<%=rest_id%>"><h3>리뷰</h3></a>
					</li>
				</ul>
				<!-- <hr style="color: #D9D9D9;"> -->
			</div>


			<div class="info_review">
				<h2>리뷰</h2>
				<div class="info_review_box">
					<ul>
						<%-- 	<%
						for (int i = 0; i < vlist.size(); i++) {
							ReviewBean bean = vlist.get(i);
							//String[] mainImg = rmgr.showReviewImgs();
							String mainImg = bean.getReview_image1();
						%>
						<li class="review_lists review_list1">
							<!-- <img src="img/menu.png" alt="메뉴사진"> --> 
						<a href="../review/review_detaile.jsp?page=<%=bean.getReview_id()%>">
							<img src="<%=mainImg%>" alt="리뷰사진<%=i + 1%>">
						</a>
							<div class="reviewcontentsbox">
								<h2>
									<%=bean.getReview_title()%>
								</h2>
								<h3
									style="display: block; color: black; overflow: hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; height: 4.8em; word-wrap: break-word; display: -webkit-box; -webkit-line-clamp: 4; -webkit-box-orient: vertical;">
									<%=bean.getReview_content()%>
								</h3>

							</div> <!-- <hr style="color: #D9D9D9;"> -->
						</li>

						<%
						} //-- for (메뉴 리스트)
						%> --%>
						<%
						Vector<ReviewBean> review_vlist = new Vector<ReviewBean>();
						// rest_id 매개변수가 -1이면 SQL 쿼리에서 "or ? = -1" 부분이 참이 되어, 특정한 음식점 ID를 선택하지 않은 모든 리뷰를 반환합니다. 즉, 모든 음식점의 리뷰를 보여주기 위해 사용되는 것입니다.
						review_vlist = rmgr.showReviews(-1);
						%>

						<%
						for (int i = 0; i < review_vlist.size() && i < 5; i++) {
							rbean = review_vlist.get(i);
						%>
						<li class="review_lists review_list1">
						<a
							href="../review/review_detaile.jsp?url=<%=rbean.getReview_id()%>">
								<img class="review_img"
									style="background-image: url('<%=rbean.getReview_image1()%>')"></img>
						</a>
							<div class="reviewcontentsbox">
								<h2><%=rbean.getReview_title()%></h4>
								<h3><%=rbean.getReview_content()%>
								</p>
							</div></li>
						<%
						}
						%>
						</li>
					</ul>
					
				</div>

				<input type="button" class="sub_btn" value="리뷰 작성하기"
					onclick="location.href='../review/review_write.jsp?url='+<%=rest_id%>"
					style="cursor: pointer;">

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
