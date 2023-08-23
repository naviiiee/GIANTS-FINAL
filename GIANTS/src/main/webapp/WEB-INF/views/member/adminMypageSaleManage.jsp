<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/YHJ/member.css">

<div class="mypage-top2">
	<div class="mypage-top-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>매출관리</h2>
		<p>자이언츠 매출관리 입니다.</p>
<!-- 만약 order_status>5라면 매출에 포함시키면 안됨-->		
<!-- ~~ 날짜 별 매출 - orderVO에서 날짜 계산 처리 ~~ -->
<br>
<!-- 컨트롤러에 goods_num을 넘겨줘서 detaild읽어오기? -->
<%-- <form action="adminMypageSaleManage" > --%>
<%-- <input type="hidden" name="goods_num" value="${order.goods_num}"> --%>
<div class="align-center">
	<h1>총 매출</h1>
	<h1>
	<%-- <fmt:formatNumber value=" ${order_revenue}"/> --%>
	 ${order_revenue}원  </h1>
</div>
<!-- 이름 불러오는 메서드 컨트롤러에서 실행1 -->

<h2>굿즈 상세 매출</h2>
<hr size="1">
<table class="basic-table">

	<tr>
		<th>순위</th>
		<th>상품번호</th>
		<th>상품사진</th>
		<th>판매량</th>
		<th>합계</th>
		
	</tr>
	
	<c:forEach var="order" items="${list}">
	<tr>
		<td>
			${order.goods_rank}
		</td>
		<td>${order.goods_num}</td>
		<td>
			<img src="${pageContext.request.contextPath}/goods/imageView.do?goods_num=${order.goods_num}" width="80" height="80">
		</td>
		<td>
			 ${order.order_quantity}
		</td>
		
		<td>
			 ${order.goods_total_list}
		</td>
	
	</tr>
	
	</c:forEach>
	</table>
<%-- </form> --%>
		
		
		
		</div>
	</div> 