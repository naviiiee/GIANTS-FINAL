<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LYJ/cart.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/goods_cart.js"></script>
<style>


</style>
<!-- all_total, list(g_order_detail) - 사이즈 포함 -->
<!-- 장바구니 시작 -->
<div class="page-main">
${list }
<br>

	<h2>장바구니</h2>
	<br>
	<hr size="1">
	<br>
	<c:if test="${empty list}">
	<div class="result-display">
		장바구니에 담은 상품이 없습니다!
		<br>
		<br>
		<br>
		<br>
		<input type="button" value="상품 구경하러가기" onclick="location.href='${pageContext.request.contextPath}/goods/goodsList.do'">
	</div>
	</c:if>
	<c:if test="${!empty list}">
	<form id="cart_order" action="${pageContext.request.contextPath}/gorder/orderForm.do" method="post">
	<input type="hidden" id="mem_num">
		<table class="basic-table">
			<tr>
				<!-- 1. 체크박스 -->
				<th>
					<input type="checkbox" checked="checked" id="chk_all">
				</th>
				<!-- 2. 사진  -->
				<th>사진</th>
				<!-- 3. 상품정보 -->
				<th>상품정보</th>
				<th>판매가</th>
				<th>수량</th>
				<th>적립예정포인트</th>
				<th>합계</th>
			</tr>
			<c:forEach var="cart" items="${list}">
				<tr>
					<!-- 1. 체크박스 -->
					<td class="align-center">
						<input type="checkbox" name="cart_numbers" checked="checked" class="choice-btn" value="${cart.cart_num}">
					</td>
					<!-- 2. 사진  -->
					<td>
						<a href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_num=${cart.goods_num}">
							<img src="${pageContext.request.contextPath}/goods/imageView.do?goods_num=${cart.goods_num}" width="80" height="80">
						</a>
					</td>
					<!-- 3. 상품정보 -->
					<!-- 상품정보 (상품명 + 옵션있는 경우 tr추가해서 옵션 노출)-->
					<td>
							${cart.goodsVO.goods_name}
					</td>
					
					<!-- 상품정보 끝 -->
					
					<!-- 4. 판매가 -->
					<td class="align-center">
						<span class="goods_dprice" data-dprice="${cart.goodsVO.goods_dprice}"><fmt:formatNumber value="${cart.goodsVO.goods_dprice}"/>원</span>
						<input type="hidden" name="goods_dprice">
					</td>
					
					<!-- 5. 수량 및 상태 체크 -->
					<td class = "align-center">
					<%-- <div class="order_quantity> --%>
						<c:if test="${cart.goodsVO.goods_status==2 or cart.goodsOptionVO.goods_stock < cart.order_quantity}">[판매중지]</c:if>
						<c:if test="${cart.goodsVO.goods_status==1 and cart.goodsOptionVO.goods_stock >= cart.order_quantity}">
							<input type="number" name="order_quantity" min="1" max="${cart.goodsOptionVO.goods_stock}" autocomplete = "off" value = "${cart.order_quantity}">
							<br>
							<br>
							<input type = "button" value = "변경" class = "cart-modify" data-cartnum = "${cart.cart_num}" data-goodsnum = "${cart.goods_num}">
						</c:if>
					<!-- </div> -->	
					</td>
					
					<!-- 포인트 -->
					<td class = "align-center">
					<span class="order_point" value="${cart.order_point}">${cart.order_point}p</span>
						<input type="hidden" name="order_point"> 
					</td>
					
					<!-- 6. 합계 -->
					<td class="align-center">
						<div class="sub-total" data-total="${cart.sub_total}">
						<fmt:formatNumber value="${cart.sub_total}"/>원
						<br>
						<input type="button" value="삭제" class="cart-del" data-cartnum="${cart.cart_num}"> <!-- 여러개의 삭제가 생기기 때문에 class로 명시, 하나의 삭제만 필요하면 id로 명시하면 된다 -->
						</div>
					</td>					
					<!-- 옵션 처리 -->
					<c:if test="${cart.goods_size!='옵션없음'}">
						<tr class="option-tr">
						    <td colspan="7" class="option-td">
						        <span class="option-icon">
						            <span class="arrow-content">⤷</span>
						        
						        <img src="${pageContext.request.contextPath}/images/btn_order_option.gif" alt="옵션" title="옵션">
						        사이즈 : ${cart.goods_size}
						        </span>
						    </td>
						</tr>

					</c:if>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="6" class="align-right"><b>총구매금액</b></td>
					<td class="align-center"><span class="all-total" data-alltotal="${all_total}"><fmt:formatNumber value="${all_total}"/>원</span></td>
				</tr>
		</table>
		
		<div class = "buttons">
			<input type="button" value="쇼핑 계속하기" onclick="location.href='${pageContext.request.contextPath}/goods/goodsList.do'">
			<input type = "submit" value = "주문하기"  id="order-btn">
			<input type="button" value="장바구니 비우기" class="deleteCartAll"> 
			<input type="button" value="주문목록" onclick="location.href='${pageContext.request.contextPath}/gorder/orderList.do'">
		</div>
	</form>
	</c:if>
</div>
<!-- 장바구니 끝 -->