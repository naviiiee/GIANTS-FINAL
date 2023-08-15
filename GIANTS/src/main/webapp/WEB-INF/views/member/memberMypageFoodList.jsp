<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/YHJ/member.css">
<div class="mypage-top2">
	<div class="mypage-top-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>Foods</h2>
		<p>자이언츠 Food 구매내역 입니다.</p>
	</div>
</div>
<!-- 마이페이지 푸드구매내역 시작 -->
<div class="mypage-form">
	<c:if test="${count == 0}">
		<div class="result-display">Food구매내역이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<table class="striped-table">
			<tr>
				<th>주문번호</th>
				<th>상호명</th>
				<th>상품</th>
				<th>결제금액</th>
				<th>상태</th>
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
</div>
<!-- 마이페이지 푸드구매내역 끝 -->