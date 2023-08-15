<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<style>
/* 공통 스타일 */
.content {
	display: flex;
	margin: 0 auto;
}

/* 3가지 섹션의 컨텐츠를 정렬 */
/* .page-main >.giants-photo, 
.page-main > .news-shop, 
.page-main > .sch-cal{
	display: flex;
	justify-content: space-between;
	position : relative; /*box 설정을 위해 넣음*/
} */
.main-content { /*이미지 제외 아래 항목들*/
    justify-content: space-between;
    text-align: center;
    width: 1200px;
	margin:0 auto;
}

.page-main{
	text-align: center;
}

/* 슬라이드 위로 올라오게 띄우기
.giants-photo {
    order: 1;
}

.news-shop {
    order: 2;
}

.sch-cal {
    order: 3;
} */

/* 왼쪽 섹션 */
.sch-cal {
	float: left;
	width: 35%;
	text-align: center;
	border:1px solid;
	
}

/* 가운데 섹션 */
.giants-photo {
	float: left;
	width: 35%;
	text-align: center;
	margin-right: 10px;
	margin-left: 30px;
	border:1px solid;
}


/* 오른쪽 섹션 */
.news-shop {
float: inherit;
	text-align: center;
	margin-right: 10px;
	margin-left: 900px;
	width: 460px;
}

.main-news{
border:1px solid;
}
/* SNS 섹션 */
.sns {
		margin : 0 auto;
		text-align: center;
		display: flex; /* 자식 요소를 가로로 정렬 */
		justify-content: center; /* 추가: 가로 정렬을 중앙에 맞춤 */
	}

	.sns ul {
		display: flex;
		list-style: none;
		padding: 0;
		margin: 0; /* 추가: ul 요소의 마진 제거 */
	}

	.sns li {
		flex: 1;
		margin-right: 10px;
	}

	.sns li:last-child {
		margin-right: 0;
	}

	.sns li img {
		margin: 0; /* 추가: 이미지의 마진 제거 */
	}
	
	/* 이미지 슬라이드 시작*/
	 li{
		list-style: none;
		}
	div.image-slide>ul{
		position: relative;
	} 
	.image-slide li{
		display: inline-block;
	}
	.image-slide{
	z-index : -99;/*우선순위는 클수록 높음*/
	text-align: center;
	}
/**/

</style>

	

<!-- 내용 S -->
<div class="page-main">
	<!-- 이미지 슬라이드 시작 -->
	<div class="image-slide">
		<ul>
			<li>
				<img src="${pageContext.request.contextPath}/images/main-image4.jpg" width="120%">
			</li>
			
			<li>
				<img src="${pageContext.request.contextPath}/images/main-image3.jpg" width="120%">
			</li>
			
			<li>
				<img src="${pageContext.request.contextPath}/images/main-image5.jpg" width="120%">
			</li>
		</ul>
	</div>
	 <script>
        $(document).ready(function() {
            var slideIndex = 0;
            showSlide(slideIndex);
            
            function showSlide(index) {
                var slides = $(".image-slide li");
                if (index >= slides.length) {
                    slideIndex = 0;
                } else if (index < 0) {
                    slideIndex = slides.length - 1;
                }
                slides.hide();
                slides.eq(slideIndex).fadeIn();
                slideIndex++;
                setTimeout(function() {
                    showSlide(slideIndex);
                }, 3000); // 3초마다 이미지 전환
            }
        });
    </script>
	<!-- 이미지 슬라이드 끝 -->
	<!-- content 시작ㄱ -->
	<div class="main-content">
	<!-- 좌측 시작-->
	<div class="sch-cal">
		<!-- 경기정보 -->
		<a href="#"><strong>경기일정</strong></a>

		<div class="bh_sch_prev">
			<strong class="sch_tit">이전경기</strong>
			<div class="sch_date">07.26 &nbsp;수요일 &nbsp;18:30 &nbsp;[잠실]</div>
			<div class="sch_home">
				<div class="sch_emblem">
					<img src="${pageContext.request.contextPath}/images/ico_bears.png"
						alt="두산 베어스">
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
			<div class="sch_date">07.27 &nbsp;목요일 &nbsp;18:30 &nbsp;[잠실]</div>
			<div class="sch_home">
				<div class="sch_emblem">
					<img src="${pageContext.request.contextPath}/images/ico_bears.png"
						alt="두산 베어스">
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
			<div class="sch_date">07.28 &nbsp;금요일 &nbsp;18:30 &nbsp;[광주]</div>
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
	<!-- 좌측 끝-->

	<!-- 중앙 시작-->
	<div class="giants-photo">
		<!-- 메인 포토 게시판 -->
		<div class="gp-section">
			<div class="gp-box">
				<a href="#" class="gp-more"><strong>자이언츠 포토</strong></a>
			</div>

			<ul class="giantsPhoto">

				<li><a href="#" class=""> <img
						src="https://file.giantsclub.com/upload2014/2023/07/24/230723-키움전-04-시구KCH32512.jpg"
						width="320" height="320">
				</a></li>

				<li><a href="#" class=""> <img
						src="https://file.giantsclub.com/upload2014/2023/07/22/230722-키움전-03-시구시타KCH39847.jpg"
						width="320" height="320">
				</a></li>

				<li><a href="#" class=""> <img
						src="https://file.giantsclub.com/upload2014/2023/07/22/230721-키움전-38-구승민 역투KCH39883.jpg"
						width="320" height="320">
				</a></li>

			</ul>


		</div>
		<!--// 메인 포토 게시판 -->
	</div>
	<!-- 중앙 끝-->

	<!-- 우측 시작 -->
	<div class="news-shop">
		<!-- 자이언츠 뉴스 시작 -->
		<div class="main-news">
			<strong> <a href="#" class="news-more">자이언츠 뉴스</a></strong>
			뉴스내용
			<br>
			~~~~~~<br>
			~~~~~~<br>~~~~~~<br>~~~~~~<br>~~~~~~<br>~~~~~~<br>~~~~~~<br>~~~~~~<br>
		</div>
		<!-- 자이언츠 뉴스 끝 -->
		<br>

		<div class="ticket-btn">
			<a href="#"><img src="${pageContext.request.contextPath}/images/ticket_btn.png" >
			</a>
		</div>

		<div class="goods-btn">
			<a href="${pageContext.request.contextPath}/goods/goodsList.do"><img src="${pageContext.request.contextPath}/images/goods_btn.png">
			</a>
		</div>

		<div class="food-btn">
			<a href="#" > 먹거리 이동 </a>
		</div>

	</div>
	<!-- 우측 끝 -->
	
	

	</div>
</div>
<!-- content 끝-->

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


