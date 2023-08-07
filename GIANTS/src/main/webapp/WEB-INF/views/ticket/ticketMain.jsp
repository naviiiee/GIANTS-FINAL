<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 좌석선택 --> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>좌석선택</h2>
		<hr size="0.05" width="100%" noshade>
		<div class="select-ticket">
			<div class="select-left">
				<img src="${pageContext.request.contextPath}/images/groundInfo.png" width="450" height="450">
			</div>
			<div class="select-right">
				<div class="selected-info">
					<div class="selected-left">
						<img src="${pageContext.request.contextPath}/images/nochoice.png">
						예매불가
					</div>
					<div class="selected-right">
						<img src="${pageContext.request.contextPath}/images/selected.png">
						선택한 좌석
					</div>
				</div>
				<div class="select-grade">
					<hr width="100%" class="color-red" noshade>
					<table class="grade-table">
						<tr>
							<th>좌석등급</th>
							<th>잔여석</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
</div>