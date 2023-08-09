<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<style>
.content-main {
	background-color: #ffffff; /* 배경색 */
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
	padding: 20px;
	padding-top: 10px;
}
h2 {
	margin-top: 0;
}
table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}
th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: center;
}
.align-center {
	text-align: center;
}
input[type="submit"], input[type="button"] {
    padding: 8px 16px;
    background-color: #052345;
    color: #FFFFFF;
    border: none;
    border-radius: 3px;
    margin-right: 10px;
    cursor: pointer;
}
input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #052345;
}
.result-display {
	margin-bottom: 20px;
	text-align: center;
	font-style: italic;
}
.cart-modify, .cart-del {
	padding: 5px 10px;
	border: none;
	background-color:#dd032f;
	color: white;
	cursor: pointer;
}
.cart-modify:hover, .cart-del:hover {
	background-color: #35c5f0;
}
.cart-submit {
	margin-top: 20px;
}
.header h1 {
	margin: 0;
}
.content {
	background-color: #052345;
	padding: 20px;
}

.goods-link {
	color: #052345;
	text-decoration: none;
}
.goods-photo {
	width: 80px;
	margin-right: 10px;
	vertical-align: middle;
}

#order-btn{
	background-color: #dd032f;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/goods_cart.js"></script>
<!-- all_total, list(g_order_detail) - 사이즈 포함 -->
<!-- 장바구니 시작 -->
<div class="page-main">
	<h2>장바구니</h2>
	<br>
	<hr size="1">
	<br>
	<c:if test="${empty list}">
	<div class="result-display">
		장바구니에 담은 상품이 없습니다.
	</div>
	</c:if>
	<c:if test="${!empty list}">
	<form id="cart_order" action="${pageContext.request.contextPath}/gorder/orderForm.do" method="post">
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
						<span class="goods-price" data-price="${cart.goodsVO.goods_dprice}"><fmt:formatNumber value="${cart.goodsVO.goods_dprice}"/>원</span>
					</td>
					
					<!-- 5. 수량 및 상태 체크 -->
					<td class = "align-center">
						<c:if test="${cart.goodsVO.goods_status==2 or cart.goodsOptionVO.goods_stock < cart.order_quantity}">[판매중지]</c:if>
						<c:if test="${cart.goodsVO.goods_status==1 and cart.goodsOptionVO.goods_stock >= cart.order_quantity}">
							<input type="number" name="order_quantity" min="1" max="${cart.goodsOptionVO.goods_stock}" autocomplete = "off" value = "${cart.order_quantity}">
							<br>
							<br>
							<input type = "button" value = "변경" class = "cart-modify" data-cartnum = "${cart.cart_num}" data-goodsnum = "${cart.goods_num}">
						</c:if>
						
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
					<c:if test="${cart.goods_size != '옵션없음'}">
						<tr>
							<td colspan="6">
								<img src="${pageContext.request.contextPath}/images/btn_order_option.gif" alt="옵션" title="옵션">
								 사이즈 : ${cart.goods_size}
							</td>	
						</tr>
					</c:if>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="5" class="align-right"><b>총구매금액</b></td>
					<td class="align-center"><span class="all-total" data-alltotal="${all_total}"><fmt:formatNumber value="${all_total}"/>원</span></td>
				</tr>
		</table>
		
		<div class = "buttons">
				<input type="button" value="쇼핑 계속하기" onclick="location.href='${pageContext.request.contextPath}/goods/goodsList.do'">
				<input type = "submit" value = "주문하기" onclick="location.href='${pageContext.request.contextPath}/gorder/user_orderForm.do'" id="order-btn">
				<input type="button" value="장바구니 비우기" class="deleteCartAll"> <!-- js click 처리 -->
		</div>
	</form>
	</c:if>
</div>
<!-- 장바구니 끝 -->