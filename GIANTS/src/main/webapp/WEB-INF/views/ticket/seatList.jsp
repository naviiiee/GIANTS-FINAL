<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!-- 등급상세 및 좌석목록 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/seat.js"></script>
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>${grade.title} | 좌석관리</h2>
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
					<input type="checkbox" value="selectRow" id="check_row">All
					<input type="checkbox" name="seat_row" value="A" class="seat-row">A
					<input type="checkbox" name="seat_row" value="B" class="seat-row">B
					<input type="checkbox" name="seat_row" value="C" class="seat-row">C
					<input type="checkbox" name="seat_row" value="D" class="seat-row">D
					<input type="checkbox" name="seat_row" value="E" class="seat-row">E
					<span id="row_error" class="error-color"></span>
				</li>
				<li>
					<label for="seat_col">좌석열</label>
					<input type="checkbox" value="selectCol" id="check_col">All
					<input type="checkbox" name="seat_col" value="1" class="seat-col">1
					<input type="checkbox" name="seat_col" value="2" class="seat-col">2
					<input type="checkbox" name="seat_col" value="3" class="seat-col">3
					<input type="checkbox" name="seat_col" value="4" class="seat-col">4
					<input type="checkbox" name="seat_col" value="5" class="seat-col">5
					<span id="col_error" class="error-color"></span>
				</li>
				<li>
					<label for="seat_quantity">좌석개수</label>
					<input type="number" name="seat_quantity" id="seat_quantity" value="">
				</li>
				<li>
					<input type="submit" value="등록" class="admin-btn small">
					<input type="button" value="취소" id="close_seatForm" class="default-btn small">
				</li>
			</ul>
		</form>
		<c:if test="${count == 0}">
		<div>관리할 블럭 無</div>
		</c:if>
		<c:if test="${count > 0}">
		<div class="seat-list">
			<table>
				<tr>
					<th>블록번호</th>
					<th>행</th>
					<th>열</th>
					<th></th>
				</tr>
				<c:forEach var="seat" items="${list}">
				<tr>
					<td>${seat.seat_block}</td>
					<td>${seat.seat_row}</td>
					<td>${seat.seat_col}</td>
					<td>
						<input type="hidden" name="seat_num" value="${seat.seat_num}" id="seatNum">
						<input type="button" value="수정" data-seatblock="${seat.seat_block}" data-quantity="${seat.seat_quantity}" class="seat-update admin-btn small">
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="seatform-update"></div>
		</c:if>
	</div>
</div>