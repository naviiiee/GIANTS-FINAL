<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">
	<div class="top_menu">
		<!-- 로그아웃 상태 -->
		<c:if test="${empty user}">
			<a class="logbar" href="#">로그인</a>
			<a href="#">회원가입</a>
		</c:if>
		
		<!-- 로그인 상태 (일반, 기업)-->
		<c:if test="${!empty user && mem_auth < 9}">
			<a href="#">로그아웃</a>
			<a href="#">마이페이지</a>
		</c:if>
		
		<!-- 로그인 상태 (관리자)-->
		<c:if test="${!empty user && mem_auth == 9}">
			<a href="#">로그아웃 </a>
			<a href="#">관리페이지</a>
		</c:if>
		<a class="searchbar" href="#">검색어 입력</a>
	</div>
	<div class="nav">
		<h1><a href="#"><img src="${pageContext.request.contextPath}/images/Giantlogo.png"></a></h1>
		   <ul>
		      <li id="topMn_1" class="li_depth1"><a href="?pcode=855" class="dep1_tit"><span>소개</span></a>
		      <li id="topMn_2" class="li_depth1"><a href="?pcode=257" class="dep1_tit"><span>NEWS</span></a>
		      <li id="topMn_3" class="li_depth1"><a href="?pcode=281" class="dep1_tit"><span>굿즈</span></a>
		      <li id="topMn_4" class="li_depth1"><a href="?pcode=817" class="dep1_tit"><span>티켓</span></a>
		      <li id="topMn_5" class="li_depth1"><a href="?pcode=308" class="dep1_tit"><span>먹거리</span></a>
		      <li id="topMn_6" class="li_depth1"><a href="/html/?pcode=846" class="dep1_tit"><span>중고거래</span></a>
		   </ul>
</div>
<input type="image" src="${pageContext.request.contextPath}/images/allmenubtn.png">
</div>
