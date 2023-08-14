<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 상품목록 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/KOY/goods.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/goods.filter.js"></script>
<script type="text/javascript">
	$(function(){
		//검색 유효성 체크
		$('#search_form').submit(function(){
			if($('#keyword').val().trim() == ''){
				alert('검색어를 입력하세요.');
				$('#keyword').val('').focus();
				return false;
			}
		});
	});
</script>
<style>
.horizontal-area img{ width:175px; height:175px;}
</style>
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>상품목록</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<div class="cate-filter">
		<input name="category" type="button" value="전체" id="filter_all" class="on" onclick="location.href='goodsList.do'">
		<input name="category" type="button" value="유니폼" id="filter_uniform" class="off" onclick="location.href='goodsList.do?category=1'"> 
		<input name="category" type="button" value="모자" id="filter_cap" class="off" onclick="location.href='goodsList.do?category=2'"> 
		<input name="category" type="button" value="응원도구" id="filter_cheering" class="off" onclick="location.href='goodsList.do?category=3'"> 
		<input name="category" type="button" value="기타" id="filter_etc" class="off" onclick="location.href='goodsList.do?category=4'">
	</div>
	<hr size="1" width="100%" noshade>
	<c:if test="${!empty user && user.mem_auth == 9}">
	<div class="align-right list-btns">
		<input type="button" value="관리자-상품목록" onclick="location.href='admin_goodsList.do'" id="admin_btn">
		<input type="button" value="전체목록" onclick="location.href='goodsList.do'">
	</div>
	</c:if>
	<form action="goodsList.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="">==선택==</option>
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>유니폼</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>모자</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>응원도구</option>
					<option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>>기타</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="검색">
			</li>
		</ul>
		<div class="align-right">
			<select id="order" name="order">
				<option value="1" <c:if test="${param.order == 1}">selected</c:if>>최신</option>
				<option value="2" <c:if test="${param.order == 2}">selected</c:if>>찜하기순</option>
				<option value="3" <c:if test="${param.order == 3}">selected</c:if>>리뷰많은순</option>
			</select>
			<script type="text/javascript">
				$(function(){
					$('#order').change(function(){
						location.href='goodsList.do?keyfield=' + $('#keyfield').val() + '&keyword=' + $('#keyword').val() + '&order=' + $('#order').val();
					});
				});
			</script>
			<c:if test="${!empty user && user.mem_auth == 9}">
				<input type="button" value="상품등록" onclick="location.href='registerGoods.do'">
			</c:if>
		</div>
	</form>
	<c:if test="${count == 0}">
	<div>표시할 상품이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<div class="goods-space">
		<c:forEach var="goods" items="${list}">
		<div class="horizontal-area">
			<a href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_num=${goods.goods_num}">
				<img src="${pageContext.request.contextPath}/goods/imageView.do?goods_num=${goods.goods_num}">
				<span>${goods.goods_name}</span>
				<br>
				<b><fmt:formatNumber value="${goods.goods_dprice}"/>원</b>
			</a>
		</div>
		</c:forEach>
		<hr width="100%" size="1" noshade="noshade" class="float-clear">
	</div>
	<div class="align-center">${page}</div>
	</c:if>
</div>
<!-- 상품목록 끝 -->