<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 좌석선택 --> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ticket.js"></script>
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>좌석선택</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<form action="order.do" method="post">
		<input type="hidden" name="game_num" value="${game_num}">
		<div class="select-ticket">
			<div class="select-left">
				<img src="${pageContext.request.contextPath}/images/groundInfo.png" width="80%" height="80%">
			</div>
			<%-- 오른쪽 절반 --%>
			<div class="select-right">
				<%-- 상단 div --%>
				<div class="selected-info">
					<img src="${pageContext.request.contextPath}/images/nochoice.png"> 예매불가
					<img src="${pageContext.request.contextPath}/images/selected.png"> 선택한 좌석
				</div>
				<%-- 등급선택 div --%>
				<div class="select-grade">
					<hr width="100%" class="color-red" noshade>
					<table class="grade-table scrollBar">
						<tr>
							<th>좌석등급</th>
							<th>잔여석</th>
						</tr>
						<c:forEach var="grade" items="${list}">
						<tr data-grade="${grade.grade_num}" class="grade_title">
							<td>${grade.title}</td>
							<td>${grade.quantity}</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<%-- 블럭 선택 div --%>
				<div class="select-block">
					<hr width="100%" class="color-red" noshade>
					<table class="block-table">
						<tr>
							<th>블록번호</th>
							<th>잔여석</th>
						</tr>
					</table>
				</div>
				<%-- 선택된 좌석 div --%>
				<div class="selected-seat">
					<hr width="100%" class="color-red" noshade>
					<table class="seat-table">
						<tr>
							<th colspan="2">선택된 좌석정보</th>
						</tr>
					</table>
				</div>
				<%-- 버튼 div --%>
				<div class="group-btn">
					<input type="button" value="이전" class="default-btn big">
					<input type="submit" value="구매하기" class="accept-btn big">
				</div>
			</div>
		</div>
	</form>
</div>