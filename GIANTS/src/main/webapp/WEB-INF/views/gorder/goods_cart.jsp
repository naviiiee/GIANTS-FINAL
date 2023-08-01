<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/goods_order.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<!-- all_total, list(g_order_detail) 받아옴 -->
<body>
<div class = "page-main">
	<!-- 내용 시작 -->
	<div class = "content-main">
		<h2>장바구니</h2>
		<c:if test = "${empty list}">
		<div class = "result-display">
			장바구니에 담은 상품이 없습니다.
		</div>
		</c:if>
		<c:if test = "${!empty list}">
		<!-- 장바구니 화면 -->
		<form id = "cart_order" action = "goods_cart.do" method = "post">
			<table>
				<tr>
					<th>사진</th>
					<th>상품정보</th>
					<th>예정 적립금</th>
					<th>판매가</th>
					<th>수량</th>
					<th>합계</th>
				</tr>
				<c:forEach var = "cart" items = "${list}">
				<tr>
					<!-- 사진 누르면 상세 페이지로 이동 -->
					<td>
						<a href = "#">
							<img src = "#" width = "80"> 
						</a>
					</td>
					<!-- 상품 정보(사이즈 괄호 안으로 옵션) -->
					<td class = "align-center">
						<%-- 상품 판매 가능 여부 : 미표시 or 상품 재고 < 주문할 상품의 수량 --%>
						<c:if test="${cart.goodsVO.goods_status==1 or cart.itemVO.item_stock < cart.order_quantity}">[판매중지된 상품입니다]</c:if>
						<%-- 상품 판매 가능 여부 : 표시 or 상품 재고 >= 주문할 상품의 수량 --%>
						<c:if test="${cart.goodsVO.goods_status==2 and cart.itemVO.item_stock >= cart.order_quantity}"> <!-- 수량 옵션 -->
							<input type = "number" name = "order_quantity" min = "1" max = "${cart.itemVO.item_stock}" autocomplete = "off" value = "${cart.order_quantity}">
							<br>
							<input type = "button" value = "변경" class = "cart-modify" data-cartnum = "${cart.cart_num}" data-itemnum = "${cart.goods_num}">
						</c:if>
					</td>
					<!-- 적립금 -->
					<td>
						<!-- 판매가 * 2% -->
						${cart.goodsVO.goods_dprice}*0.98 원 <!-- 계산... -->
					</td>
					<!-- 판매가 -->
					<td class = "align-center">
						<fmt:formatNumber value = "${cart.goodsVO.goods_dprice}"/>원
					</td>
					<!-- 수량 -->
					<td class = "align-center">
						<fmt:formatNumber value = "${cart.sub_total}"/>원 <!-- sub_total vo에 없음 -->
						<br>
						<input type = "button" value = "삭제" class = "cart-del" data-cartnum = "${cart.cart_num}">
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan = "3" class = "align-center"><b>총구매금액</b></td>
					<td><fmt:formatNumber value = "${all_total}"/>원</td>
				</tr>
			</table>
			<span class="align-right">5만원 이상 결제 시 무료배송입니다</span>
			
			<!-- 주문하기 말고 다른 버튼도 폼안에 넣어야되나...? -->
			<div class = "buttons">
				<input type="button" value="쇼핑 계속하기" onclick="location.href='#'">
				<input type = "submit" value = "주문하기">
				<input type="button" value="장바구니 비우기" id="deleteCartAll"> <!-- 버튼 처리 -->
			</div>
			
		</form>
		</c:if>
	</div>
	<!-- 내용 끝 -->
</div>
</body>
</html>







