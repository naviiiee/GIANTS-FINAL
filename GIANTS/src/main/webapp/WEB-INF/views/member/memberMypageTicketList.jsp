<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/YHJ/member.css">
<div class="mypage-top2">
	<div class="mypage-top-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>Ticket</h2>
		<p>자이언츠 Ticket 구매내역 입니다.</p>
	</div>
</div> 
<!-- 마이페이지 티켓구매내역 시작 -->
<div class="mypage-form">
	<c:if test="${count == 0}">
		<div class="result-display">Ticket구매내역 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<table class="striped-table">
			<tr>
				<th>티켓번호</th>
				<th>상대팀</th>
				<th>일시</th>
				<th>좌석</th>
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
					<td class="align-center">6</td>
				</tr>
			</c:forEach>
		</table>
		<div class="form-page">${page}</div>
	</c:if>
</div>
<!-- 마이페이지 티켓구매내역 끝  -->