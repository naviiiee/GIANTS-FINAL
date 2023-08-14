<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mypage-top2">
	<div class="mypage-top-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>회원정보수정</h2>
		<p>자이언츠 회원정보수정 입니다.</p>
	</div>
</div>
<!-- 회원권한 수정 - 관리자 시작 -->
<div class="page-main">
	<form:form modelAttribute="memberVO" action="admin_updateMem.do" id="member_modify">
		<form:hidden path="mem_num"/>	   
		<form:errors element="div" cssClass="error-color"/>   
		<ul>
			<c:if test="${memberVO.mem_auth == 2 || memberVO.mem_auth == 5}">
				<li>
					<label>이름</label>
					${memberVO.memberDetailVO.mem_name}
				</li>
				<li>
					<label>전화번호</label>
					${memberVO.memberDetailVO.mem_phone}
				</li>
				<li>
					<label>이메일</label>
					${memberVO.memberDetailVO.mem_email}
				</li>
				<li>
					<label>우편번호</label>
					${memberVO.memberDetailVO.mem_zipcode}
				</li>
				<li>
					<label>주소</label>
					${memberVO.memberDetailVO.mem_address1} ${memberVO.memberDetailVO.mem_address2}
				</li>
			</c:if>
		</ul>
		<ul>
			<li>
				<!-- 일반과 기업사이에서는 회원등급을 변경할 수 없다. -->
				<label>회원권한</label>
				<c:if test="${memberVO.mem_auth == 2 || memberVO.mem_auth == 5}">
					<form:radiobutton path="mem_auth" value="5"/>정지
					<form:radiobutton path="mem_auth" value="2"/>일반
				</c:if>
				<c:if test="${memberVO.mem_auth == 9}">관리자</c:if>
			</li>
		</ul>
		<div class="align-center">
			<c:if test="${memberVO.mem_auth != 9}">
				<form:button>전송</form:button>
			</c:if>
			<input type="button" value="회원목록"
				   onclick="location.href='admin_list.do'">
		</div>
	</form:form>
</div>
<!-- 회원권한 수정 - 관리자 끝 -->
