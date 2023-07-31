<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 경기목록 --> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<div class="ticket-body">
	<div class="ticket-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif">
		<h2>경기선택</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<c:if test="${count == 0}">
	<div class="result-display">예매중인 경기가 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>날짜</th>
			<th>시간</th>
			<th>경기</th>
			<th>구장</th>
			<th>예매</th>
		</tr>
		<c:forEach var="game" items="${list}">
		<tr>
			<td>${game.game_date}</td>
			<td>${game.game_time}</td>
			<td>
				${game.game_team}<br>
				<img src="${pageContext.request.contextPath}/images/${game.game_team}.png">
			</td>
			<td>사직야구장</td>
			<td>
				<c:if test="${game.game_state == 0}">
				<input type="button" value="준비중" class="default-btn" disabled="disabled">
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
</div>
