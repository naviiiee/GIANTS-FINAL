<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/YHJ/member.css">
<div class="mypage-top2">
	<div class="mypage-top-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>Goods</h2>
		<p>자이언츠 Goods 구매내역 입니다.</p>
	</div>
</div> 
<!-- 마이페이지 굿즈구매내역 시작 -->
<div class="mypage-form">
	<c:if test="${count == 0}">
		<div class="result-display">Goods구매내역 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<table class="striped-table">
			<tr>
				<th>주문번호</th>
				<th>상품사진</th>
				<th>상품명</th>
				<th>주문날짜</th>
				<th>배송상태</th>
			</tr>
			<c:forEach var="#" items="#">
				<tr> 
					<td class="align-center">1</td>
					<td class="align-center">2</td>
					<td class="align-center">3</td>
					<td class="align-center">4</td>
					<td class="align-center">5</td>
				</tr>
			</c:forEach>
		</table>
		<div class="form-page">${page}</div>
	</c:if>
	<input type="button" value="장바구니" class="login-sub-btn"
		   onclick="location.href='${pageContext.request.contextPath}/gorder/goods_cart.do'">
</div>
<!-- 마이페이지 굿즈구매내역 끝  -->