<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 상품 상세 시작 -->
<div class="page-main">
	<h2>${goods.goods_name}</h2>
	<hr size="1" width="97%">
	<div>
		<input type="button" value="수정" onclick="location.href='admin_goodsModify.do?goods_num=${goods.goods_num}'">
		<input type="button" value="삭제">
	</div>
	<hr size="1" width="97%">
	<ul> 
		<li>
			상품이미지
		</li>
		<li>
			카테고리 : 
			<c:if test="${goods.goods_category == 1}">유니폼</c:if>
			<c:if test="${goods.goods_category == 2}">모자</c:if>
			<c:if test="${goods.goods_category == 3}">응원도구</c:if>
			<c:if test="${goods.goods_category == 4}">기타</c:if>
			<br>
			가격 : <fmt:formatNumber value="${goods.goods_price}" type="number"/>원
			<br>
			할인율 : <fmt:formatNumber value="${goods.goods_disc}" type="number"/>%
			<br>
			할인금액 : <fmt:formatNumber value="${goods.goods_dprice}" type="number"/>원
			<br>
			상품설명 : ${goods.goods_content}
			<br>
			상품등록일 : ${goods.goods_regdate}
			<c:if test="${!empty goods.goods_mdate}"><br>${goods.goods_mdate}</c:if>
			<br>
			상태 :  
			<c:if test="${goods.goods_status == 1}">판매중</c:if>
			<c:if test="${goods.goods_status == 2}">판매중지</c:if>
		</li>
	</ul>
	<hr size="1" width="97%">
	<div>
		<input type="button" value="찜하기">
		<input type="button" value="장바구니" onclick="location.href='${pageContext.request.contextPath}/gorder/goods_cart.do'">
		<input type="button" value="바로구매">
	</div>
	<br>
	<div>
		<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/goods/goodsList.do'">
	</div>
</div>
<!-- 상품 상세 끝 -->