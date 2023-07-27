<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
.sns{
	margin-top: 1500px;
	text-align : center;
}
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

  .content {
    display: flex;
    margin: 0 auto;
  }

  /* .page-main 클래스를 flexbox로 설정하여 하위 컨텐츠를 가로로 정렬 */
  .page-main {
    display: flex;
    justify-content: space-between
  }

  /* .align-left, .align-center, .align-right 클래스를 가진 div 요소들에게 동일한 너비를 주기 위해 flex: 1 설정 */
  .align-left, .align-center, .align-right {
   float:left;
   width:25%;
   text-align : center;
   margin-right:30px;
   margin-left: 20px;
  }

   .content{
            display: inline-flex;
        }
        
       

</style>

<!-- 내용 S -->
<div class="page-main">
	<div id="container" class="main_container">
	<!-- 메인 컨텐츠 시작 -->
		<div id="content" class="main_content">
		
			<!-- 좌측 시작-->
			<div class="align-left">
				<!-- 경기정보 -->
				<div class="">
					<div class="schedule-box">

						<div class="schedule-box-inner">
							<a href="#"><strong>경기일정</strong></a>
						</div>


						<div class="bh_sch_prev">
							<strong class="sch_tit">이전경기</strong>
							<div class="sch_date">07.26 &nbsp;수요일 &nbsp;18:30
								&nbsp;[잠실]</div>
							<div class="sch_home">
								<div class="sch_emblem">
									<img src="${pageContext.request.contextPath}/images/ico_bears.png" alt="두산 베어스">
								</div>
								<div class="sch_team">두산</div>
							</div>
							<div class="sch_away">
								<div class="sch_emblem">
									<img src="${pageContext.request.contextPath}/images/ico_giants.png"
										alt="롯데 자이언츠">
								</div>
								<div class="sch_team">롯데</div>
							</div>
							<div class="sch_record_box">
								<div class="sch_score">
									<strong> 2 : 7 </strong>
								</div>
								<div class="sch_record">경기종료</div>
							</div>
						</div>

						<div class="bh_sch_now">
							<strong class="sch_tit">오늘경기</strong>
							<div class="sch_date">07.27 &nbsp;목요일 &nbsp;18:30
								&nbsp;[잠실]</div>
							<div class="sch_home">
								<div class="sch_emblem">
									<img src="${pageContext.request.contextPath}/images/ico_bears.png" alt="두산 베어스">
								</div>
								<div class="sch_team">두산</div>
							</div>
							<div class="sch_away">
								<div class="sch_emblem">
									<img src="${pageContext.request.contextPath}/images/ico_giants.png"
										alt="롯데 자이언츠">
								</div>
								<div class="sch_team">롯데</div>
							</div>
							<div class="sch_record_box">
								<div class="sch_score">
									<strong style="background: #eeedea;"> </strong>
								</div>
								<div class="sch_record">경기예정</div>
							</div>
						</div>

						<div class="bh_sch_next">
							<strong class="sch_tit">다음경기</strong>
							<div class="sch_date">07.28 &nbsp;금요일 &nbsp;18:30
								&nbsp;[광주]</div>
							<div class="sch_home">
								<div class="sch_emblem">
									<img src="${pageContext.request.contextPath}/images/ico_tigers.png"
										alt="KIA 타이거즈">
								</div>
								<div class="sch_team">KIA</div>
							</div>
							<div class="sch_away">
								<div class="sch_emblem">
									<img src="${pageContext.request.contextPath}/images/ico_giants.png"
										alt="롯데 자이언츠">
								</div>
								<div class="sch_team">롯데</div>
							</div>
							<div class="sch_record_box">
								<div class="sch_score">
									<strong> </strong>
								</div>
								<div class="sch_record">경기예정</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- 좌측 끝--> 

			<!-- 중앙 시작-->
			<div class="align-center">
				<div class="giants-photo">
					<!-- 메인 포토 게시판 -->
					<div class="gp-section">
						<div class="gp-box">
							<a href="#" class="gp-more"><strong>자이언츠 포토</strong></a>
						</div>

						<ul class="giantsPhoto">

							<li>
								<a href="#" class=""> 
									<img src="https://file.giantsclub.com/upload2014/2023/07/24/230723-키움전-04-시구KCH32512.jpg" width="320" height="320" >
								</a>
							</li>
							
							<li>
								<a href="#" class=""> 
									<img src="https://file.giantsclub.com/upload2014/2023/07/22/230722-키움전-03-시구시타KCH39847.jpg" width="320" height="320">
								</a>
							</li>
							
							<li>
								<a href="#" class=""> 
									<img src="https://file.giantsclub.com/upload2014/2023/07/22/230721-키움전-38-구승민 역투KCH39883.jpg" width="320" height="320">
								</a>
							</li>

						</ul>


					</div>
					<!--// 메인 포토 게시판 -->
				</div>
			</div>
			<!-- 중앙 끝-->

			<!-- 우측 시작 -->
			<div class="align-right">
				<div class="main-news">
					<!-- 자이언츠 뉴스 시작 -->
					<div class="news-inner">
						<div class="news-box">
							<strong>
								<a href="#" class="news-more">자이언츠 뉴스</a>
							</strong>
						</div>

						<ul>

							<li>
								뉴스 내용 1
							</li>

							<li>
								뉴스 내용2
							</li>

						</ul>


					</div>
					<!-- 자이언츠 뉴스 끝 -->

				</div>

				<div class="ticket-btn">
					<a href="#" target="_blank" title="새창열림" alt="티켓예매처 바로가기"> 
						<img src="${pageContext.request.contextPath}/images/ticket_btn.png">
					</a>
				</div>

				<div class="goods-btn">
					<a href="#" target="_blank" title="새창열림" alt="굿즈샵 바로가기"> 
						<img src="${pageContext.request.contextPath}/images/goods_btn.png">
					</a>
				</div>

				<div class="food-btn">
					<a href="#" target="_blank" title="새창열림"> 
						<img>
					</a>
				</div>

				<div class=""> <!-- 커뮤니티나 중고거래  -->
					<a href="#" target="_blank" title="새창열림">
						<img>
					</a>
				</div>
			</div>
			<!-- 우측 끝 -->
		<!-- 메인 컨텐츠 끝-->
		</div>
			
			

			


	</div>






<!-- 하단 SNS 시작 -->
	<div class="sns">
		<ul>
			<li class="facebook_btn"><a
				href="https://www.facebook.com/lottegiantsbusan/" target="_blank"
				title="새창열림"> <img
					src="${pageContext.request.contextPath}/images/facebook.png"
					width="180" height="100"> <!--페이스북 헤더-->
			</a></li>

			<li class="youtube_btn"><a
				href="https://www.youtube.com/channel/UCAZQZdSY5_YrziMPqXi-Zfw"
				target="_blank" title="새창열림"> <img
					src="${pageContext.request.contextPath}/images/youtube.jpg"
					width="180" height="100">
			</a></li>

			<li class="instagram_btn"><a
				href="https://www.instagram.com/busanlottegiants/" target="_blank"
				title="새창열림"> <img
					src="${pageContext.request.contextPath}/images/instagram.png"
					width="180" height="100">
			</a></li>

		</ul>

	</div>
	<!-- 하단 SNS 끝 -->






	
</div>
<!-- 내용 E -->