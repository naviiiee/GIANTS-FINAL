<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<!-- 일반회원일때 NAV -->
	<c:if test="${!empty user && user.mem_auth == 2}">
		<ul class="mypage-nav">
			<li><b>회원정보</b></li>
			<li><a href="${pageContext.request.contextPath}/member/updateMember.do">회원정보수정</a></li>
			<li><a href="${pageContext.request.contextPath}/member/deleteMember.do">회원탈퇴</a></li>
			<li><b>구매내역</b></li>
			<li><a href="${pageContext.request.contextPath}/member/memberMypageTicketList.do">Ticket</a></li>
			<li><a href="${pageContext.request.contextPath}/member/memberMypageFoodList.do">Foods</a></li>
			<li><a href="${pageContext.request.contextPath}/member/memberMypageGoodList.do">Goods</a></li>
		</ul>
	</c:if>
	<!-- 기업회원일때 NAV -->
	<c:if test="${!empty user && user.mem_auth == 3}">
		<ul class="mypage-nav">
			<li><b>회원정보</b></li>
			<li><a href="${pageContext.request.contextPath}/member/updateCompany.do">회원정보수정</a></li>
			<li><a href="${pageContext.request.contextPath}/member/deleteCompany.do">회원탈퇴</a></li>
			<li><b>FOOD</b></li>
			<li><a href="${pageContext.request.contextPath}/member/companyMypageFoodList.do">푸드목록</a></li>
			<li><a href="${pageContext.request.contextPath}/member/companyMypageSaleManage.do">매출관리</a></li>
			<li><a href="${pageContext.request.contextPath}/member/companyMypageOrderList.do">주문내역</a></li>
		</ul>
	</c:if>
	<!-- 관리자일때 NAV -->
	<c:if test="${!empty user && user.mem_auth == 9}">
		<ul class="mypage-nav">
			<li><b>관리</b></li>
			<li><a href="${pageContext.request.contextPath}/member/adminMypageMember.do">회원관리</a></li>
			<li><a href="${pageContext.request.contextPath}/member/adminMypageTicket.do">티켓관리</a></li>
			<li><a href="${pageContext.request.contextPath}/member/adminMypageGoods.do">굿즈관리</a></li>
			<li><a href="${pageContext.request.contextPath}/member/adminMypageSaleManage.do">매출관리</a></li>
		</ul>
	</c:if>
</div>