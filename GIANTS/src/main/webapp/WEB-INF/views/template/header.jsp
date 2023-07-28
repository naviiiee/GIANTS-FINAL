<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">
	<div id="center-header">
		<div class="top-menu">
			<ul class="float-right margin-zero">
				<!-- 로그아웃상태 -->
				<c:if test="${empty user}">
					<li class="top-menu-login"><a href="#"><img src="${pageContext.request.contextPath}/images/로그인이미지.png">로그인</a></li>
					<li class="top-menu-register"><a href="#"><img src="${pageContext.request.contextPath}/images/캐릭터.png">회원가입</a></li>
				</c:if>
				
				<!-- 로그인상태 -->
				<c:if test="${!empty user && mem_auth < 9}">
					<li class="top-menu-loginout"><a href="#"><img src="${pageContext.request.contextPath}/images/로그아웃이미지.png">로그아웃</a></li>
					<li class="top-menu-mypage"><a href="#"><img src="${pageContext.request.contextPath}/images/캐릭터.png">마이페이지</a></li>
				</c:if>
				
				<!-- 로그인 상태 (관리자)-->
				<c:if test="${!empty user && mem_auth == 9}">	
					<li class="top-menu-loginout"><a href="#"><img src="${pageContext.request.contextPath}/images/로그아웃이미지.png">로그아웃</a></li>
					<li class="top-menu-adminpage"><a href="#"><img src="${pageContext.request.contextPath}/images/캐릭터.png">관리페이지</a></li>
				</c:if>
				
				<li><img alt="" src="${pageContext.request.contextPath}/images/검색어입력.gif"></li>
			</ul>
		</div>
		<div class="nav">
			<h1><a href="#"><img src="${pageContext.request.contextPath}/images/Giantlogo.png"></a></h1>
			<div class="inner-nav">
				<ul>
				   <li class="li_depth1"><a href="#" class="dep1_tit"><span>소개</span></a>
				   <li class="li_depth1"><a href="#" class="dep1_tit"><span>NEWS</span></a>
				   <li class="li_depth1"><a href="#" class="dep1_tit"><span>굿즈</span></a>
				   <li class="li_depth1"><a href="#" class="dep1_tit"><span>티켓</span></a>
				   <li class="li_depth1"><a href="#" class="dep1_tit"><span>먹거리</span></a>
				   <li class="li_depth1"><a href="#" class="dep1_tit"><span>중고거래</span></a>
				</ul>
			</div>
		</div>
	</div>
</div>










