<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/YHJ/member.css">
<div class="mypage-top">
	<div class="mypage-top-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>로그인</h2>
		<p>자이언츠 로그인 입니다.</p>
	</div>
</div>
<!-- 로그인폼시작 -->
<div class="login-main">
	<form:form modelAttribute="memberVO" action="login.do" id="member_login">
		<form:errors element="div" cssClass="error-color" />
		<!-- 로그인폼 -->
		<div class="login-form">
			<p>로그인을 하시면 롯데자이언츠의 다양한 이벤트참여와 혜택을 누리실 수 있습니다.</p>
			<div class="login">
				<ul>
					<li>
						<form:label path="mem_id">아이디</form:label>
						<form:input path="mem_id" placeholder="아이디"
									cssClass="form-input" autocomplete="off"/>
			            <form:errors path="mem_id" element="div" cssClass="error-color" /></li>
					<li>
						<form:label path="passwd">비밀번호</form:label>
						<form:password path="passwd" placeholder="비밀번호"
										cssClass="form-input" autocomplete="off" />
			            <form:errors path="passwd" element="div" cssClass="error-color" />
					</li>
					<li>
						<input type="checkbox" name="auto" id="auto">로그인상태유지
					</li>
				</ul>
				<div>
					<form:button class="login-btn">로그인</form:button>
				</div>
			</div>
		</div>
		<!-- 회원가입 / 아이디 / 비밀번호 찾기 -->
		<div class="login-sub">
			<ul>
				<li>
					아직 롯데자이언츠 회원이 아니신가요?
					<input type="button" value="회원가입" class="login-sub-btn"
							onclick="${pageContext.request.contextPath}/member/registerCommon.do">
				</li>
				<li><hr size="0.05" width="100%" noshade></li>
				<li>
					아이디나 비밀번호를 잊으셨나요?<br>
					<input type="button" value="아이디 / 비밀번호 찾기" class="login-sub-btn"
							onclick="#">
				</li>
			</ul>
		</div>
	</form:form>
</div>
<!-- 로그인폼끝 -->