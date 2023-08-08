<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 식품 상세 페이지 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/OSJ/food.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/foodJS/food.public.js"></script>
<div class="page-main">
	<div class="main-title">
		<img class="title-img" src="${pageContext.request.contextPath}/images/title_icon.gif">
		<h2> 푸드 | <a href="/food/foodList.do">매장</a> | <a href="/food/foodCompDetail.do?comp_num=${comp.comp_num}">${comp.comp_name}</a></h2>
	</div>
	<hr noshade="noshade">
	<!-- 카테고리 시작 -->
	<div class="food-category">
		<ul class="float-left">
			<li><div class="food-cbox" data-comp_cate="1">치 킨</div></li><!--
		--><li><div class="food-cbox" data-comp_cate="2">술/안주</div></li><!--
		--><li><div class="food-cbox" data-comp_cate="3">분 식</div></li><!--
		--><li><div class="food-cbox" data-comp_cate="4">간 식</div></li><!--
		--><li><div class="food-cbox" data-comp_cate="5">패스트푸드</div></li>
		</ul>
		<form id="foodList_sort" action="foodList.do" method="get">
			<input type="hidden" name=comp_cate id="comp_cate" value="${comp.comp_cate}">
		</form>
		<!-- 관리자 접속시 수정 버튼 생성 -->
		<c:if test="${!empty user.mem_auth && user.mem_auth > 2 && comp.comp_num == user.companyDetailVO.comp_num || user.mem_auth == 9}">
			<div class="float-right">
				<input type="button" class="adminBtn" value="수정하기" onclick='location.href="/food/fixCompFoodList.do?comp_num=${comp.comp_num}"'>
			</div>
		</c:if>
	</div>
	<div class="clear"></div>
	<!-- 식품 상세정보 시작 -->
	<div class=comp-container>
		<div class="comp-detail"><!-- 상세페이지 링크는 스크립트로 해결해야함. -->
			<div class="f-img"><img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-main-img"></div>
			<div class="comp-title"><b>매장명 - ${comp.comp_name}</b></div>
			<div class="comp-score"><b>별점 - ${comp.comp_score}</b></div>
			<div class="comp-content">
				${comp.comp_content}
			</div>
		</div>
		<!-- 메뉴보기, 리뷰보기 -->	
		<div class="comp-menu">
			<div id="showMenu" class="food-cbox-on">메뉴 보기</div>
			<div id="showReview">리뷰 보기</div>
		</div>
		<!-- 메뉴 -->
		<div id="compMenu_content">
			<div id="menu_tb">
			<c:if test="${count == 0}">
				<h1 class="align-center">표시할 상품이 없습니다.</h1>
			</c:if>
			
			<c:if test="${count > 0}">
			<c:forEach var="food" items="${list}">
				<div class="food-info">
					<img src="imageView.do?food_num=${food.food_num}&food_type=1" class="food-mainImg">
					<div class="food-textBox">
						<p class="float-left"><b>${food.food_name}</b></p><p class="float-right"><fmt:formatNumber value="${food.food_price}"/>원</p>
					</div>
				</div>
			</c:forEach>
			<c:forEach begin="0" end="${7 - fn:length(list)}" step="1" varStatus="stat">
				<div class="food-info">
					<img src="${pageContext.request.contextPath}/images/product-ready.png" class="food-mainImg">
					<div class="food-textBox"></div>
				</div>
			</c:forEach>
				<div class="paging align-center">${page}</div>
			</c:if>
			</div>
		</div>
		<!-- 메뉴보기 내용 끝-->
	</div>
	
	<!-- 목록 끝 -->
</div>
<!-- 식품 상세보기 페이지 끝-->