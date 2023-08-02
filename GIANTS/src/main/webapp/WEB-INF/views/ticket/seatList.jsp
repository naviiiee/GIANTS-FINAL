<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 등급상세 및 좌석목록 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>등급 | 좌석</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<div>
		<table id="seat_list">
			<tr>
				<th>등급명</th>
				<th>주중가격</th>
				<th>주말가격</th>
			</tr>
			<tr>
				<td>${grade.title}</td>
				<td>${grade.price_week}</td>
				<td>${grade.price_weekend}</td>
			</tr>
		</table>
		<div class="align-right">
			<input type="button" value="+" id="open_seatForm" class="admin-btn">
		</div>
		<form:form action="seatWrite.do" id="seat_write" method="post" modelAttribute="seatVO">
			<ul>
				<li>
					<form:label path="seat_block">블럭번호</form:label>
					<form:input path="seat_block" type="number"/>
					<form:errors path="seat_block" cssClass="error-color"/>
				</li>
				<li>
					<form:label path="seat_row">좌석행</form:label>
					<form:checkbox path="seat_row" value="A"/>A
					<form:checkbox path="seat_row" value="B"/>B
					<form:checkbox path="seat_row" value="C"/>C
					<form:checkbox path="seat_row" value="D"/>D
					<form:checkbox path="seat_row" value="E"/>E
				</li>
				<li>
					<form:label path="seat_col">좌석열</form:label>
					<form:checkbox path="seat_col" value="1"/>1
					<form:checkbox path="seat_col" value="2"/>2
					<form:checkbox path="seat_col" value="3"/>3
					<form:checkbox path="seat_col" value="4"/>4
					<form:checkbox path="seat_col" value="5"/>5
				</li>
				<li>
					<form:button class="admin-btn small">등록</form:button>
					<input type="button" value="취소" id="close_seatForm" class="default-btn small">
				</li>
			</ul>
		</form:form>
		<div class="seat-list"></div>
	</div>
</div>