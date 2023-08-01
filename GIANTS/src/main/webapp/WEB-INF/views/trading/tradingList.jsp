<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중고거래 게시판 목록 시작 -->
<div class="page-main">
	<h2>중고거래 게시판 목록</h2>
	<form>
		<c:if test="${!empty user}">
		<input type="button" value="글쓰기" onclick="location.href='tradingWrite.do'">
		</c:if>
	</form>
</div>
<!-- 중고거래 게시판 목록 끝 --> 