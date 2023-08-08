<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<!-- 채팅방 생성 시작 -->
<div class="page_main">
	<form action="chatRoomWrite.do" method="post" id="chat_form">
		<input type="hidden" name="members" id="user" data-id="${user.id}" value="${user.mem_num}">
		<input type="submit" value="전송">
		<input type="button" value="목록" onclick="location.href='chatList.do'">
	</form>
</div>