<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 매장리스트 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/OSJ/food.css">
<div class="page-main">
	<div class="main-title">
		<img class="title-img" src="${pageContext.request.contextPath}/images/title_icon.gif">
		<h2> 푸드 | <a href="/food/foodList.do">매장</a></h2>
	</div>
	<hr noshade="noshade">
	<!-- 카테고리 시작 -->
	<div class="food-category">
		<ul class="float-left">
			<li><div id="food_c1" class="food-cbox-on">치 킨</div></li><!--
		--><li><div id="food_c2">술/안주</div></li><!--
		--><li><div id="food_c3">분 식</div></li><!--
		--><li><div id="food_c4">간 식</div></li><!--
		--><li><div id="food_c5">패스트푸드</div></li>
		</ul>
	</div>
	<div class="clear"></div>
	<!-- 목록 시작 -->
	<!-- 카테고리별 목록 표시 필터 구현-->
	<div class="food-list">
		<div class="f-list"><!-- 상세페이지 링크는 스크립트로 해결해야함. -->
			<div class="f-img"><img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-main-img"></div>
			<div class="comp-title bdr"><b>네네치킨(부산 롯데 사직야구장점)</b></div>
			<div class="comp-score bdr"><b>별점 (3.00)</b></div>
			<div class="comp-content bdr">
				<p>안녕하세요. <br>네네치킨 부산 롯데 사직야구장점 입니다.<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
			</div>
		</div>
		<div class="f-list"><!-- 상세페이지 링크는 스크립트로 해결해야함. -->
			<div class="f-img"><img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-main-img"></div>
			<div class="comp-title bdr"><b>네네치킨(부산 롯데 사직야구장점)</b></div>
			<div class="comp-score bdr"><b>별점 (3.00)</b></div>
			<div class="comp-content bdr">
				<p>안녕하세요. <br>네네치킨 부산 롯데 사직야구장점 입니다.<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
			</div>
		</div>
	</div>
	<!-- 목록 끝 -->
	<div class="foodList-paging align-center">${page}1 2 3 4</div>
</div>


<script type="text/javascript">
	$(function(){
		$(document).on('click','.f-list',function(){
			location.href="/food/foodCompDetail.do";
		});
	});
</script>
<!-- 매장리스트 끝-->