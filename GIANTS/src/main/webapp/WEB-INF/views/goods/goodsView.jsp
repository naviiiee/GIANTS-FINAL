<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 상품 상세 페이지 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/KOY/goods.css">
<script type="text/javascript" src = "${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<h2>${goods.goods_name}</h2>
	<hr size="1" width="97%">
	<%-- 내용 시작 --%>
	<div class="content-main">
		<c:if test="${!empty user && user.mem_auth == 9}">
		<div>
			<input type="button" value="수정" onclick="location.href='goodsUpdate.do?goods_num=${goods.goods_num}'">
			<input type="button" value="삭제">
		</div>
		</c:if>
		<c:if test="${goods.goods_status == 2}">
			<div class="result-display">
				<div class="align-center">
					판매 중지 상품
					<p>
					<input type="button" value="판매상품 보기" onclick="location.href='goodsList.do'">
				</div>
			</div>
		</c:if>
		<c:if test="${goods.goods_status == 1}">
			<div class="goods-detail" ><br><br>
				<form id="goods_cart" action="${pageContext.request.contextPath}/gorder/goods_cart.do" method="post" th:object="${cartVO}">
					<input type="hidden" name="goods_num" value="${goods.goods_num}" id="goods_num">
					<input type="hidden" name="goods_dprice" value="${goods.goods_price}" id="goods_price">
					<%-- <input type="hidden" name="goods_stock" value="${goods.goods_stock}" id="goods_stock"> 수량--%>
					<ul> <%-- <c:if test="${goods.goods_stock > 0}"> 수량 --%>
						<li class="goods-photo">
							<img src="${pageContext.request.contextPath}/goods/imageView.do?goods_num=${goods.goods_num}">
						</li>
						<%-- <li>남은 수량 : <span><fmt:formatNumber value="${goods.goods_stock}"/></span></li> 수량--%>
						<%-- <li>조회수 : <fmt:formatNumber value="${goods.goods_hit}"/>회</li> --%>
						<li>
							상태 :  
							<c:if test="${goods.goods_status == 1}">판매중</c:if>
							<c:if test="${goods.goods_status == 2}">판매중지</c:if>
						</li>
						<li>
							카테고리 : 
							<c:if test="${goods.goods_category == 1}">유니폼</c:if>
							<c:if test="${goods.goods_category == 2}">모자</c:if>
							<c:if test="${goods.goods_category == 3}">응원도구</c:if>
							<c:if test="${goods.goods_category == 4}">기타</c:if>
						</li>
						<li>
							가격 : <s><fmt:formatNumber value="${goods.goods_price}" type="number"/>원</s>
						</li>
						<li>
							할인율 : <fmt:formatNumber value="${goods.goods_disc}" type="number"/>%
						</li>
						<li>
							할인금액 : <fmt:formatNumber value="${goods.goods_dprice}" type="number"/>원
						</li>
						<li>
							상품등록일 : ${goods.goods_regdate}
							<c:if test="${!empty goods.goods_mdate}"><br>최근수정일 : ${goods.goods_mdate}</c:if>
						</li>
						<hr size="1" width="50%" noshade>
						<li id="goods_content">
							상품설명 : ${goods.goods_content}
						</li>
						
						<hr size="1" width="97%">
						<li class="list-cart-btn">
							<input class="btn btn-cart" type="submit" value="장바구니">
						</li>	
						<form id="directBuy" action="${pageContext.request.contextPath}/gorder/directOrderForm.do" method="POST">
							<!-- <input type="hidden" name="order_quantity" id="direct_quantity"> 수량 -->
							<input type="hidden" name="goods_num" value="${goods.goods_num}">
							<button class="btn btn-buy" type="submit">바로 구매</button>
						</form>
					</ul>
				</form>
			</div> <%-- end of goods-detail --%>
		</c:if>
	</div> <%-- end of content-main --%>
</div>
<!-- 상품 상세 페이지 끝 -->