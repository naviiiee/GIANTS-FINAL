<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 예매확인 --> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ticket.js"></script>
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>예매확인</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<form action="order.do" id="ticket_order" method="post">
		<div>
			<%-- 왼쪽 절반 --%>
			<div class="select-left">
				${seatVO.detailVO.mem_name }
				${seatVO.detailVO.mem_phone }
				${seatVO.detailVO.mem_email }
			</div>
			<%-- 오른쪽 절반 --%>
			<div class="select-right">
				
			</div>
		</div>
	</form>
</div>