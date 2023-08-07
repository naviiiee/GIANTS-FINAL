<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-main">
	<h2>회원상세정보</h2>
	<c:if test="${!empty user && user.mem_auth == 2}">
		아이디 : ${member.mem_id}<br>
		이름 : ${member.memberDetailVO.mem_name}<br>
		회원분류 : 일반회원<br>
		회원가입일 : ${member.memberDetailVO.mem_regdate}<br>
		프로필사진 : <br>
	</c:if>
	<c:if test="${!empty user && user.mem_auth == 3}">
		아이디 : ${company.mem_id}<br>
		이름 : ${company.companyDetailVO.comp_owner}<br>
		회원분류 : 기업회원<br>
		회원가입일 : ${company.companyDetailVO.comp_regdate}<br>
		프로필사진:<br>
	</c:if>
</div>
