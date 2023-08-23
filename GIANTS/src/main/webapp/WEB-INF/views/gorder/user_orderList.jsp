<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 주문목록 - 사용자 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LYJ/orderForm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LYJ/cart.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<!-- count, list, page -->
<div class="page-main">
	<h2>주문목록</h2>
	<!-- action으로 인해 유효성 검사를 해도 폼이 제출되므로 onsubmit이 true일때만 처리되도록 -->
	<form action="orderList.do" id="search_form" method="get" onsubmit="return searchCheck()">
		<ul class="search">
			<li>
				<select name="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>주문번호</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>상품명</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="찾기">
				<input type="button" value="목록" 
				   onclick="location.href='orderList.do'">
			</li>
		</ul>
	</form>
	<script>
	function searchCheck(){   
		var selectedValue = document.querySelector("select[name='keyfield']").value;
    	var keywordValue = document.getElementById("keyword").value;
    	//주문번호 입력 시 숫자만 입력 가능
    	if(selectedValue==1 && isNaN(keywordValue)){
    		alert('숫자를 입력하세요!');
    		$('#keyword').val('').focus();
    		return false;
    	}
    	
    	if($('#keyword').val().trim()==''){
    		alert('검색어를 입력하세요');
    		$('#keyword').val('').focus();
    		return false;
    	}
    	return true;
	}
		//대표 상품명으로만 검색됨
	</script>
	
	
	
	<c:if test="${count == 0}">
	<div class="result-display">표시할 주문정보가 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table class="striped-table">
		<tr>
			<th>주문번호</th>
			<th>상품명</th>
			<th>총구매금액</th>
			<th>주문날짜</th>
			<th>배송상태</th>
		</tr>
		<c:forEach var="order" items="${list}">
		<tr>
			<td>${order.order_num}</td>
			<td>
				<a href="orderDetail.do?order_num=${order.order_num}">${order.goods_name}</a>
			</td>
			<td><fmt:formatNumber value="${order.order_total}"/>원</td>
			<td>${order.order_regdate}</td>
			<td>
				<c:if test="${order.order_status == 0}">결제완료</c:if>
				<c:if test="${order.order_status == 1}">배송대기</c:if>
				<c:if test="${order.order_status == 2}">배송준비중</c:if>
				<c:if test="${order.order_status == 3}">배송중</c:if>
				<c:if test="${order.order_status == 4}">배송완료</c:if>
				<c:if test="${order.order_status == 5}">주문취소</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>	
</div>
<!-- 주문목록 - 사용자 끝 -->










