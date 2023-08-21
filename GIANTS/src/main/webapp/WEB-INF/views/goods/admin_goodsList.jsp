<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- [관리자] 상품 목록 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/KOY/goods.css">
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
		
		$('#filter_all').click(function(){
			console.log($('#filter_all').val());
			location.href='admin_goodsList.do';
		});
		
		$('#filter_uniform').click(function(){
			console.log($('#filter_uniform').val());
			location.href='admin_goodsList.do?keyfield=' + $('#keyfield').val() + '&keyword=' + $('#keyword').val() + '&goods_category=' + $('#filter_uniform').val();
		}); 
		
		$('#filter_cap').click(function(){
			console.log($('#filter_cap').val());
			location.href='admin_goodsList.do?keyfield=' + $('#keyfield').val() + '&keyword=' + $('#keyword').val() + '&goods_category=' + $('#filter_cap').val();
		}); 
		
		$('#filter_cheering').click(function(){
			console.log($('#filter_cheering').val());
			location.href='admin_goodsList.do?keyfield=' + $('#keyfield').val() + '&keyword=' + $('#keyword').val() + '&goods_category=' + $('#filter_cheering').val();
		}); 
		
		$('#filter_etc').click(function(){
			console.log($('#filter_etc').val());
			location.href='admin_goodsList.do?keyfield=' + $('#keyfield').val() + '&keyword=' + $('#keyword').val() + '&goods_category=' + $('#filter_etc').val();
		});
	});
</script>
<div class="page-main">
	<div class="goods-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>[관리자] 상품목록</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<form action="admin_goodsList.do" id="search_form" method="get">
		<ul class="filter-btns">
			<li>
				<c:if test="${!empty user && user.mem_auth == 9}">
					<div class="align-right" id="list-btns">
						<input type="button" value="[관리자]목록" onclick="location.href='admin_goodsList.do'" id="admin_btn">
						<input type="button" value="일반목록" onclick="location.href='goodsList.do'">
						<input type="button" value="상품등록" onclick="location.href='registerGoods.do'">
					</div>
				</c:if>
				<div id="cate-filter">
					<button name="goods_category" type="button" value="0" id="filter_all"
						<c:if test="${empty param.goods_category || param.goods_category == 0}"> class="on" </c:if>
						<c:if test="${param.goods_category != 0}"> class="off" </c:if>>전체</button>
					<button name="goods_category" type="button" value="1" id="filter_uniform" 
						<c:if test="${param.goods_category == 1}"> class="on" </c:if>
						<c:if test="${param.goods_category != 1}"> class="off" </c:if>>유니폼</button>
					<button name="goods_category" type="button" value="2" id="filter_cap" 
						<c:if test="${param.goods_category == 2}"> class="on" </c:if>
						<c:if test="${param.goods_category != 2}"> class="off" </c:if>>모자</button>
					<button name="goods_category" type="button" value="3" id="filter_cheering"
						<c:if test="${param.goods_category == 3}"> class="on" </c:if>
						<c:if test="${param.goods_category != 3}"> class="off" </c:if>>응원도구</button>
					<button name="goods_category" type="button" value="4" id="filter_etc"
						<c:if test="${param.goods_category == 4}"> class="on" </c:if>
						<c:if test="${param.goods_category != 4}"> class="off" </c:if>>기타</button>
				</div>
				<hr size="0.05" width="100%" noshade>
			</li>
		</ul>
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>상품명+내용</option>
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>상품명</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>내용</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="찾기">
			</li>
		</ul>

	</form>
	<c:if test="${count == 0}">
	<div>표시할 상품이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<div class="goods-list">
		<table>
			<tr>
				<th style="width:5%;">번호</th>
				<th style="width:8%;">카테고리</th>
				<th>상품명</th>
				<th style="width:12%;">판매가</th>
				<th style="width:10%;">등록일</th>
				<th style="width:7%;">상태</th>
				<th style="width:7%;">수정</th>
			</tr>
			<c:forEach var="goods" items="${list}">
			<tr>
				<td class="align-center">${goods.goods_num}</td>
				<td>
					<c:if test="${goods.goods_category == 1}">유니폼</c:if>
					<c:if test="${goods.goods_category == 2}">모자</c:if>
					<c:if test="${goods.goods_category == 3}">응원도구</c:if>
					<c:if test="${goods.goods_category == 4}">기타</c:if>
				</td>
				<td>
					<a href="goodsDetail.do?goods_num=${goods.goods_num}">${goods.goods_name}</a>
				</td>
				<td class="align-center">
					<fmt:formatNumber value="${goods.goods_dprice}"/>원
				</td>
				<td>${goods.goods_regdate}</td>
				<td>
					<c:if test="${goods.goods_status == 1}">판매중</c:if>
					<c:if test="${goods.goods_status == 2}"><b style="color:#dd032f;">판매중지</b></c:if>
				</td>
				<td>
					<input class="list-btn" type="button" value="수정" onclick="location.href='goodsUpdate.do?goods_num=${goods.goods_num}'">
				</td>
			</tr>
			</c:forEach>
		</table>
		<div class="align-right" style="margin-top:5px;">
			<input type="button" value="목록" onclick="location.href='admin_goodsList.do'">
		</div>
	</div>
	<div class="align-center">${page}</div>
	</c:if>
</div>
<!-- [관리자] 상품 목록 끝 -->