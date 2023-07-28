<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/sidebar.js"></script>
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
				   <li class="li_depth1"><a href="${pageContext.request.contextPath}/goods/goodsList.do" class="dep1_tit"><span>NEWS</span></a>
				   <li class="li_depth1"><a href="#" class="dep1_tit"><span>굿즈</span></a>
				   <li class="li_depth1"><a href="#" class="dep1_tit"><span>티켓</span></a>
				   <li class="li_depth1"><a href="#" class="dep1_tit"><span>먹거리</span></a>
				   <li class="li_depth1"><a href="#" class="dep1_tit"><span>중고거래</span></a>
				</ul>
			</div>
		</div>








		<div class="nav-right visible-xs">
			<div class="button" id="btn">
				<div class="bar top"></div>
				<div class="bar middle"></div>
				<div class="bar bottom"></div>
			</div>
		</div>
		<!-- nav-right -->
		<main>


			<nav>
				<div class="nav-right hidden-xs">
					<div class="button" id="btn">
						<div class="bar top"></div>
						<div class="bar middle"></div>
						<div class="bar bottom"></div>
					</div>
				</div>
				<!-- nav-right -->
			</nav>

			<a href="https://codepen.io/tonkec/" class="ua" target="_blank">
				<i class="fa fa-user"></i>
			</a>
		</main>
		<!-- 사이드바 -->
		<div class="sidebar">
			<ul class="sidebar-list">
				<li class="sidebar-item"><a href="#" class="sidebar-deq1">소개</a></li>
				<li class="sidebar-item"><a href="#" class="sidebar-deq1">NEWS</a></li>
				<li class="sidebar-item"><a href="#" class="sidebar-deq1">굿즈</a></li>
				<li class="sidebar-item"><a href="#" class="sidebar-deq1">티켓</a></li>
				<li class="sidebar-item"><a href="#" class="sidebar-deq1">먹거리</a></li>
				<li class="sidebar-item"><a href="#" class="sidebar-deq1">중고거래</a></li>
			</ul>
		</div>
	</div>
</div>










