<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/YHJ/member.css">
<div class="mypage-top">
	<div class="mypage-top-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>(기업)회원탈퇴</h2>
		<p>자이언츠 기업 회원탈퇴 입니다.</p>
	</div>
</div>
<!-- 회원탈퇴 폼 시작 -->
<div class="page-main">
	<form:form modelAttribute="memberVO" action="deleteCompany.do" id="company_delete">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="mem_id">아이디</form:label>
	            <form:input path="mem_id"/>
	            <form:errors path="mem_id" cssClass="error-color"/> <!-- 아이디 또는 비밀번호 불일치만 출력 -->
			</li>
			<li>
				<form:label path="passwd">비밀번호</form:label>
	            <form:input path="passwd"/>
			</li>
			<li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="MY페이지"
				   onclick="location.href='myPage.do'">
		</div>
	</form:form>
</div>
<!-- 회원탈퇴 폼 끝 -->
