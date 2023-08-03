<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<!-- 일반회원일때 NAV -->
	<c:if test="${!empty user && user.mem_auth == 2}">
		<ul>
			<li><b>회원정보</b></li>
			<li><input type="button" class="menu-btn" value="회원정보수정"
				onclick="#"></li>
			<li><input type="button" class="menu-btn" value="회원탈퇴"
				onclick=""></li>
			<li><b>구매내역</b></li>
			<li><input type="button" class="menu-btn" value="Ticket"
				onclick="#"></li>
			<li><input type="button" class="menu-btn" value="Foods"
				onclick="#"></li>
			<li><input type="button" class="menu-btn" value="Goods"
				onclick="#"></li>
		</ul>
	</c:if>
	<!-- 기업회원일때 NAV -->
	<c:if test="${!empty user && user.mem_auth == 3}">
		<ul>
			<li><b>회원정보</b></li>
			<li><input type="button" class="menu-btn" value="회원정보수정"
				onclick="#"></li>
			<li><input type="button" class="menu-btn" value="회원탈퇴"
				onclick="location.href='${pageContext.request.contextPath}/member/delete.do'"></li>
			<li><b>FOOD</b></li>
			<li><input type="button" class="menu-btn" value="푸드목록"
				onclick="#"></li>
			<li><input type="button" class="menu-btn" value="매출관리"
				onclick="#"></li>
			<li><input type="button" class="menu-btn" value="주문내역"
				onclick="#"></li>
		</ul>
	</c:if>
	<!-- 관리자일때 NAV -->
	<c:if test="${!empty user && user.mem_auth == 9}">
		<ul>
			<li><b>관리</b></li>
			<li><input type="button" class="menu-btn" value="회원관리"
				onclick="#"></li>
			<li><input type="button" class="menu-btn" value="티켓관리"
				onclick="#"></li>
			<li><input type="button" class="menu-btn" value="굿즈관리"
				onclick="#"></li>
			<li><input type="button" class="menu-btn" value="매출관리"
				onclick="#"></li>
		</ul>
	</c:if>
</div>