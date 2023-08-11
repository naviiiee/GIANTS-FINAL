<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 유저 장바구니(푸드) 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/OSJ/food.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/foodJS/foodCss.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/foodJS/fixCompFoodList.js"></script>
<div class="page-main">
	<div class="main-title">
		<img class="title-img" src="${pageContext.request.contextPath}/images/title_icon.gif">
		<h2> 푸드 | <a href="/food/foodList.do">장바구니</a></h2>
	</div>
	<hr noshade="noshade">
	<!-- 내용물 시작 -->
	<div class="cart-container">
		<div class="cart-List">
			<c:if test="${not empty list}">
			<table>
				<tr>
					<th><input type="checkbox" id="all_chk"><!-- 전체체크박스 --></th>
					<th>식품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>총 가격</th>
				</tr>
				<c:forEach var="cart" items="${list}">
				<tr>
					<td><input type="checkbox" class="food-chk"></td>
					<td>${cart.foodVO.food_name}</td>
					<td><fmt:formatNumber value="${cart.f_cart_quantity}"/>개</td>
					<td><fmt:formatNumber value="${cart.f_cart_price}"/>원</td>
					<td><fmt:formatNumber value="${cart.f_cart_quantity * cart.f_cart_price}"/>원</td>
				</tr>
				</c:forEach>
			</table>
			</c:if>
		</div>
	</div>
	<!-- 내용물 끝 -->
</div>
<!-- 유저 장바구니(푸드) 끝-->