<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="top_menu">
	<!-- 로그아웃 상태 -->
	<c:if test="${empty user}">
		<a href="#">[ 로그인 ]</a>
		<a href="#">[ 회원가입 ]</a>
	</c:if>
	
	<!-- 로그인 상태 (일반, 기업)-->
	<c:if test="${!empty user && mem_auth < 9}">
		<a href="#">[ 로그아웃 ]</a>
		<a href="#">[ 마이페이지 ]</a>
	</c:if>
	
	<!-- 로그인 상태 (관리자)-->
	<c:if test="${!empty user && mem_auth == 9}">
		<a href="#">[ 로그아웃 ]</a>
		<a href="#">[ 관리페이지 ]</a>
	</c:if>
	<a class="float-right" href="#">[ 검색어 입력 ]</a>
</div>

<div class="nav">
	<a href="#"><span>GIANTS</span></a>
	<a href="#"><img src="#" width="50" height="50"></a>
	<a href="#"><span>소개</span></a>
	<a href="#"><span>굿즈</span></a>
	<a href="#"><span>티켓</span></a>
	<a href="#"><span>먹거리</span></a>
	<a href="#"><span>중고거래</span></a>
	
</div>