<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 매장 수정 페이지 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/OSJ/food.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/foodJS/foodCss.js"></script>
<div class="page-main">
	<div class="main-title">
		<img class="title-img" src="${pageContext.request.contextPath}/images/title_icon.gif">
		<h2> 푸드 | <a href="/food/foodList.do">매장</a> | <a href="/food/food_CompDetail.do">상호명</a></h2>
	</div>
	<hr noshade="noshade">
	<!-- 카테고리 시작 -->
	<div class="food-category">
		<!-- 우측 수정, 취소 버튼 -->
		<div class="float-right">
			<input type="submit" class="adminBtn" value="수정">
			<input type="button" class="adminBtn" value="취소" onclick='location.href="/food/foodCompDetail.do"'>
		</div>
	</div>
	<div class="clear"></div>
	<!-- 매장 상세정보 시작 -->
	<div class=comp-container>
		<div class="comp-detail"><!-- 상세페이지 링크는 스크립트로 해결해야함. -->
			<div class="f-img"><img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-main-img"></div>
			<div class="comp-title bdr"><b>네네치킨(부산 롯데 사직야구장점)</b></div>
			<div class="comp-score bdr"><b>별점 (3.00)</b></div>
			<div class="comp-content bdr">
				<p>안녕하세요. <br>네네치킨 부산 롯데 사직야구장점 입니다.<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
			</div>
		</div>
		<!-- 새 상품 추가하기 시작 -->	
		<div class="compFood-list">
			<a href="${pageContext.request.contextPath}/food/addNewFood.do">
				<img src="${pageContext.request.contextPath}/images/plus.png">
				<span>새 상품 추가하기</span>
			</a>
		</div>
		<!-- 새 상품 추가하기 끝-->
		<div id="compMenu_content">
			<table id="menu_tb">
				<tr>
					<td>
						<img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-mainImg">
						<p><b>레드마블치킨</b></p><p class="float-right">20,000원</p>
					</td>
					<td>
						<img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-mainImg">
						<p><b>레드마블치킨</b></p><p class="float-right">20,000원</p>
					</td>
					<td>
						<img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-mainImg">
						<p><b>레드마블치킨</b></p><p class="float-right">20,000원</p>
					</td>
					<td>
						<img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-mainImg">
						<p><b>레드마블치킨</b></p><p class="float-right">20,000원</p>
					</td>
				</tr>
				<tr>
					<td>
						<img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-mainImg">
						<p><b>레드마블치킨</b></p><p class="float-right">20,000원</p>
					</td>
					<td>
						<img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-mainImg">
						<p><b>레드마블치킨</b></p><p class="float-right">20,000원</p>
					</td>
					<td>
						<img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-mainImg">
						<p><b>레드마블치킨</b></p><p class="float-right">20,000원</p>
					</td>
					<td>
						<img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-mainImg">
						<p><b>레드마블치킨</b></p><p class="float-right">20,000원</p>
					</td>
				</tr>
			</table>
			<div class="paging align-center">${page}1 2 3 4</div>
		</div>
		<!-- 메뉴보기, 리뷰보기 내용 끝-->
	</div>
	
	<!-- 목록 끝 -->
</div>
<!-- 매장 상세보기 페이지 끝-->