<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 굿즈 상품문의 상세 시작 -->
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>상품문의</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<ul>
		<li>${qna.qna_title}</li>
		<li>${qna.mem_num}</li>
		<li>${qna.qna_regdate}</li>
		<li>
			<c:if test="${qna.qna_status == 1}">처리전</c:if>
			<c:if test="${qna.qna_status == 2}"><b>답변완료</b></c:if>
		</li>
	</ul>
	<hr size="1" width="100%">
	<div class="detail-content">
		${qna.qna_content}
	</div>
	<hr size="1" width="100%">
	<div class="align-right">
		<c:if test="${!empty user && user.mem_num == qna.mem_num}">
			<input type="button" value="수정" onclick="location.href='updateQna.do?qna_num=${qna.qna_num}'">
			<input type="button" value="삭제">
		</c:if>
		<input type="button" value="이전" onclick="location.href='goodsDetail.do?goods_num=${qna.goods_num}'s">
	</div>
	<hr size="1" width="100%">
	<%-- 답변 시작 --%>
	<%-- 답변 끝 --%>
</div>
<!-- 굿즈 상품문의 상세 끝 -->