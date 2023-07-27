<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
  .sns ul {
    display: flex; 
     list-style: none;
    padding: 0; 
  }

  .sns li {
    flex: 1; 
    margin-right: 10px; 
  }
  .sns li:last-child {
    margin-right: 0;
  }
</style>

<!-- 내용 S -->
<div class="page-main">
	<h3>최신 게시글</h3>














	<!-- 하단 SNS 시작 -->
	<div class="sns">
		<ul>
			<li class="facebook_btn">
				<a href="https://www.facebook.com/lottegiantsbusan/" target="_blank" title="새창열림"> 
					<img src="${pageContext.request.contextPath}/images/facebook.png" width="180" height="100"> <!--페이스북 헤더-->
				</a>
			</li>

			<li class="youtube_btn">
				<a href="https://www.youtube.com/channel/UCAZQZdSY5_YrziMPqXi-Zfw" target="_blank" title="새창열림">
					<img src="${pageContext.request.contextPath}/images/youtube.jpg" width="180" height="100">
				</a>
				
			</li>

			<li class="instagram_btn">
				<a href="https://www.instagram.com/busanlottegiants/" target="_blank" title="새창열림"> 
					<img src="${pageContext.request.contextPath}/images/instagram.png" width="180" height="100">
				</a>
			</li>

		</ul>

	</div>
	<!-- 하단 SNS 끝 -->
</div>
<!-- 내용 E -->