<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-main">
	<h2>회원상세정보</h2>
	아이디:${member.mem_id}<br>
	이름:<br>
	회원분류:<br>
	회원가입일:<br>
	프로필사진:<br>
</div>

<%-- 
<h2>
	회원상세정보 <input type="button" value="회원정보수정"
		onclick="location.href='update.do'">
</h2>
<ul>
	<li>이름 : ${member.name}</li>
	<li>별명 : ${member.nick_name}</li>
	<li>전화번호 : ${member.phone}</li>
	<li>이메일 : ${member.email}</li>
	<li>우편번호 : ${member.zipcode}</li>
	<li>주소 : ${member.address1} ${member.address2}</li>
	<li>가입날짜 : ${member.reg_date}</li>
	<c:if test="${!empty member.modify_date}">
		<li>정보 수정일 : ${member.modify_date}</li>
	</c:if>
</ul>
 --%>