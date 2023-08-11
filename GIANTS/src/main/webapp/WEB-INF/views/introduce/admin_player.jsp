<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LHJ/commu.css">
<style>

</style>
<div id="item_form" class="page-main">
	<h2>선수 등록</h2>
	<form:form modelAttribute="playerVO" action="admin_player.do" id="admin_player" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="player_name">선수명</form:label>
				<form:input path="player_name"/>
				<form:errors path="player_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="player_backnumber">선수 번호</form:label>
				<form:input path="player_backnumber"/>
				<form:errors path="player_backnumber" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="player_position">선수 포지션</form:label>
				<form:input path="player_position"/>
				<form:errors path="player_position" cssClass="error-color"/>
			</li>
			<li>
				<label for="upload">선수 사진</label>
				<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg">
				<form:errors path="player_photo" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="player_birthday">선수 생일</form:label>
				<form:input path="player_birthday"/>
				<form:errors path="player_birthday" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="player_height">선수 키</form:label>
				<form:input path="player_height" />
				<form:errors path="player_height" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="player_weight">선수 몸무게</form:label>
				<form:input path="player_weight" />
				<form:errors path="player_weight" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="player_toway">선수 투타</form:label>
				<form:input path="player_toway"/>
				<form:errors path="player_toway" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="player_join">선수 입단년도</form:label>
				<form:input path="player_join"/>
				<form:errors path="player_join" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="player_career">선수 경력사항</form:label>
				<form:input path="player_career"/>
				<form:errors path="player_career" cssClass="error-color"/>
			</li>
			
			
		</ul>
		<div class="align-center">
			<form:button>선수 등록</form:button>
			<input type="button" value="목록" onclick="location.href='admin_playerList.do'">
		</div>
	</form:form>
</div>