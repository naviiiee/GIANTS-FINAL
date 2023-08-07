<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- [관리자] 상품 목록 시작 -->
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
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>[관리자] 상품목록</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<form action="admin_goodsList.do" id="search_form" method="get">
		<div class="align-right">
			<input type="button" value="상품등록" onclick="location.href='registerGoods.do'">
		</div>
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>상품명</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>내용</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>상품명+내용</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="찾기">
				<input type="button" value="목록" onclick="location.href='admin_goodsList.do'">
			</li>
		</ul>
	</form>
	<c:if test="${count == 0}">
	<div>표시할 상품이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table class="striped-table">
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>등록일</th>
			<th>상태</th>
		</tr>
		<c:forEach var="goods" items="${list}">
		<tr>
			<td class="align-center">${goods.goods_num}</td>
			<td>
				<a href="admin_modify.do?goods_num=${goods.goods_num}">${goods.goods_name}</a>
			</td>
			<td class="align-center">
				<fmt:formatNumber value="${goods.goods_price}"/>원
			</td>
			<td>${goods.goods_regdate}</td>
			<td class="align-center">
				<c:if test="${goods.goods_status == 1}">판매중</c:if>
				<c:if test="${goods.goods_status == 2}">판매중지</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${page}</div>
	</c:if>
</div>
<!-- [관리자] 상품 목록 끝 -->