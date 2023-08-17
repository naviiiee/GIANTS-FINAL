<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 문의 등록 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/KOY/goodsReview.css">
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>문의 작성</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<form:form modelAttribute="goodsQnaVO" action="writeQna.do" id="qna_register">
		<form:errors element="div" cssColor="error-color"/>
		<ul>
			<li>
				<label>문의할 상품</label>
				<select name="goods_num" required>
					<option>====선택====</option>
					<c:forEach var="goods" items="${goods_list}">
					<option value="${goods.goods_num}">${goods.goods_name}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<form:label path="qna_title">제목</form:label>
				<form:input path="qna_title"/>
				<form:errors path="qna_title" cssColor="error-color"/>
			</li>
			<li>
				<form:label path="qna_content">내용</form:label>
				<form:textarea path="qna_content"/>
				<form:errors path="qna_content" cssColor="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<form:button>등록</form:button>
			<input type="button" value="이전" onclick="location.href='history(-1)'">
		</div>
	</form:form>
</div>
<!-- 문의 등록 끝 -->