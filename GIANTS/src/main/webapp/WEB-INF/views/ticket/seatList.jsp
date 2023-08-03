<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 등급상세 및 좌석목록 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ticket.js"></script>
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>${grade.title} | 좌석</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<div>
		<div class="align-right">
			<input type="button" value="+" id="open_seatForm" class="admin-btn small">
			<input type="button" value="목록" onclick="location.href='gradeList.do'" class="default-btn small">
		</div>
		<form action="seatWrite.do" id="seat_write" method="post" style="display:none;">
			<input type="hidden" name="grade_num" id="grade_num" value="${grade.grade_num}">
			<ul>
				<li>
					<label for="seat_block">블럭번호</label>
					<input type="number" name="seat_block" id="seat_block">
					<span id="block_error" class="error-color"></span>
				</li>
				<li>
					<label for="seat_row">좌석행</label>
					<input type="checkbox" name="seat_row" value="selectAll">All
					<input type="checkbox" name="seat_row" value="A">A
					<input type="checkbox" name="seat_row" value="B">B
					<input type="checkbox" name="seat_row" value="C">C
					<input type="checkbox" name="seat_row" value="D">D
					<input type="checkbox" name="seat_row" value="E">E
					<span id="row_error" class="error-color"></span>
				</li>
				<li>
					<label for="seat_col">좌석열</label>
					<input type="checkbox" name="seat_col" value="selectAll">All
					<input type="checkbox" name="seat_col" value="1">1
					<input type="checkbox" name="seat_col" value="2">2
					<input type="checkbox" name="seat_col" value="3">3
					<input type="checkbox" name="seat_col" value="4">4
					<input type="checkbox" name="seat_col" value="5">5
					<span id="col_error" class="error-color"></span>
				</li>
				<li>
					<input type="submit" value="등록" class="admin-btn small">
					<input type="button" value="취소" id="close_seatForm" class="default-btn small">
				</li>
			</ul>
		</form>
		<div class="seat-list"></div>
	</div>
</div>