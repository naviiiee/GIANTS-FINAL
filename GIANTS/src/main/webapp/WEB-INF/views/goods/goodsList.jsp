<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 상품목록 시작 -->
<script type="text/javascript">
	$(function(){
		//검색 유효성 체크
		$('#search_form').submit(function(){
			if($('#keyword').val().trim() == ''){
				alert('검색어를 입력하세요.');
				$('#keyword').val('').focus();
				return false;
			}
		});
	});
</script>
<div class="page-main">
	<h2>상품 목록</h2>
	<input type="button" value="굿즈등록" onclick="location.href='registerGoods.do'">
	<form action="goodsList.do" id="search_form" method="get">
		<ul>
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>유니폼</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>모자</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>응원도구</option>
					<option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>>기타</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="검색">
				<input type="button" value="전체목록" onclick="location.href='goodsList.do'">
			</li>
		</ul>
		<div class="align-right">
			<select id="order" name="order">
				<option value="1" <c:if test="${param.order == 1}">selected</c:if>>최신</option>
				<option value="2" <c:if test="${param.order == 2}">selected</c:if>>조회수</option>
				<option value="3" <c:if test="${param.order == 3}">selected</c:if>>좋아요</option>
				<option value="4" <c:if test="${param.order == 4}">selected</c:if>>댓글수</option>
			</select>
			<script type="text/javascript">
				$(function(){
					$('#order').change(function(){
						location.href='goodsList.do?keyfield=' + $('#keyfield').val() + '&keyword=' + $('#keyword').val() + '&order=' + $('#order').val();
					});
				});
			</script>
			<c:if test="${!empty user}">
				<input type="button" value="상품등록" onclick="location.href='registerGoods.do'">
			</c:if>
		</div>
	</form>
	<c:if test="${count == 0}">
	<div>표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>상품번호</th>
			<th>카테고리</th>
			<th>상품명</th>
			<th>옵션</th>
			<th>재고수량</th>
			<th>상품가격</th>
			<th>할인율</th>
			<th>판매가격</th>
			<th>등록일</th>
			<th>상태</th>
		</tr>
		<c:forEach var="goods" items="${list}">
		<tr>
			<td>${goods.goods_num}</td>
			<td>${goods.goods_category}</td>
			<td><a href="goodsDetail.do?goods_num=${goods.goods_num}">${goods.goods_name}</a></td>
			<td>${goods.goods_size}</td>
			<td>${goods.goods_stock}</td>
			<td>${goods.goods_price}</td>
			<td>${goods.goods_disc}</td>
			<td>${goods.goods_dprice}</td>
			<td>${goods.goods_regdate}</td>
			<td>${goods.goods_status}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>
</div>
<!-- 상품목록 시작 -->