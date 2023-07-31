<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 경기등록 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<div class="ticket-body">
	<div class="ticket-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif">
		<h2>경기등록</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<form:form action="gameWrite.do" id="insert_ticket" modelAttribute="ticketGameVO">
		<ul>
			<li>
				<form:label path="game_date">경기일</form:label>
				<form:input path="game_date" placeholder="YYYY-MM-DD 형식으로 작성" autocomplete="off"/>
				<form:errors path="game_date" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="game_time">시작시간</form:label>
				<form:input path="game_time" placeholder="HH:MM 형식으로 작성" autocomplete="off"/>
				<form:errors path="game_time" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="game_team">상대팀</form:label>
				<form:radiobutton path="game_team" value="landers"/>SSG
				<form:radiobutton path="game_team" value="heroes"/>키움
				<form:radiobutton path="game_team" value="twins"/>LG
				<form:radiobutton path="game_team" value="wids"/>KT
				<form:radiobutton path="game_team" value="tigers"/>KIA
				<form:radiobutton path="game_team" value="dinos"/>NC
				<form:radiobutton path="game_team" value="lions"/>삼성
				<form:radiobutton path="game_team" value="bears"/>두산
				<form:radiobutton path="game_team" value="eagles"/>한화
				<form:errors path="game_team" cssClass="error-color"/>
			</li>
		</ul>
		<hr size="0.05" width="100%" noshade>
		<div class="align-center">
			<input type="button" value="이전" class="default-btn">
			<form:button class="accept-btn">등록</form:button>
		</div>
	</form:form>
</div>
