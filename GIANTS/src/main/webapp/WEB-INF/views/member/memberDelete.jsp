<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 회원탈퇴 폼 시작 -->
<div class="page-main">
	<h2>회원탈퇴</h2>
	<form:form modelAttribute="memberVO" action="deleteMember.do" id="member_delete">
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
