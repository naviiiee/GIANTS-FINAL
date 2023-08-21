<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 티켓정보 --> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ticket.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>티켓정보</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<div class="ticket-info2">
		<div class="ticket-content">
			<ul>
				<li>${ticket.ticket_num}</li>
				<li>${ticket.game_title}</li>
				<li>사직야구장</li>
				<li>${ticket.game_date} ${ticket.game_time}</li>
			</ul>
		</div>
		<div class="ticket-content2">
			결제금액 <fmt:formatNumber value="${ticket.total_price}"/>원
		</div>
	</div>
	<div class="ticket-info3">
		<div class="info3-left">
			<table class="ticket-table">
				<tr>
					<td>예매일시</td>
					<td>${ticket.ticket_date}</td>
				</tr>
				<tr>
					<td>예매번호</td>
					<td>${ticket.ticket_num}</td>
				</tr>
				<tr>
					<td>경기명</td>
					<td>${ticket.game_title}</td>
				</tr>
				<tr>
					<td>관람장소 및 일시</td>
					<td>사직야구장 ${ticket.game_date} ${ticket.game_time}</td>
				</tr>
			</table>
		</div>
		<div class="info3-right">
			<table class="ticket-table">
				<tr>
					<td>예매자</td>
					<td>${ticket.order_name}</td>
				</tr>
				<tr>
					<td>인원수</td>
					<td>${ticket.ticket_quantity}명</td>
				</tr>
				<tr>
					<td>종 결제내역</td>
					<td>${ticket.pg} <fmt:formatNumber value="${ticket.total_price}"/>원</td>
				</tr>
				<tr>
					<td>수령방법</td>
					<td>무인발권기 발권 또는 경기 당일 모바일티켓 발권</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="ticket-info4">
		<table class="ticket-table">
			<tr>
				<td>좌석</td>
				<td id="status_info">
					<span class="gradeTitle">${grade.title}</span>
					<c:forEach var="status" items="${list}">
						 <span class="seat-info">${status.seat_info} </span>
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>
</div>