<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 등급상세 및 좌석목록 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<div class="page-main">
	<div class="ticket-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" width="50" height="6">
		<h2>등급 | 좌석</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<div class="align-right">
		<input type="button" value="+" onclick="location.href='gradeWrite.do'" class="admin-btn">
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
		<div class="seat-info">
			
		</div>
	</div>
</div>