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
	<div class="align-right">
		<input type="button" value="경기등록" onclick="location.href='gameWrite.do'" class="admin-btn">
	</div>
	<c:if test="${count == 0}">
	<div class="result-display">예매중인 경기가 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table id="game_list">
		<tr>
			<th>날짜</th>
			<th>시간</th>
			<th>경기</th>
			<th>구장</th>
			<th>예매</th>
			<th>관리자</th>
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
				<input type="button" value="준비중" class="default-btn" readonly="readonly">
				</c:if>
				<c:if test="${game.game_state == 1}">
				<input type="button" value="예매" class="accept-btn">
				</c:if>
				<c:if test="${game.game_state == 2}">
				<input type="button" value="매진" class="default-btn" readonly="readonly">
				</c:if>
				<c:if test="${game.game_state == 3}">
				<input type="button" value="취소" class="default-btn" readonly="readonly">
				</c:if>
			</td>
			<td>
				<input type="button" value="수정" onclick="location.href='gameUpdate.do?game_num=${game.game_num}'" class="admin-btn small">
				<input type="button" value="좌석" onclick="location.href='gradeWrite.do?game_num=${game.game_num}'" class="admin-btn small">
			</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
</div>