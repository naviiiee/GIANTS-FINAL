<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<script type="text/javascript">
	let chatroom_num = ${chatroom_num};
</script>
<!-- 채팅방 생성 시작 -->
<div class="page_main">
	<form action="chatRoomWrite.do" method="post" id="chat_form">
		<input type="hidden" name="members" id="user" data-id="${user.id}" value="${user.mem_num}">
		<input type="submit" value="전송">
		<input type="button" value="목록" onclick="location.href='chatList.do'">
	</form>
	
		<div class="chatting-main">
		<!-- 채팅방 헤더 시작 -->
		<div class="chatting-header">
			<ul>
				<li>
					<img src="${pageContext.request.contextPath}/member/viewProfile.do?mem_num=${trading.mem_num}" width="40" height="40" class="my-photo">
					<small>${chatroom.mem_id}</small>
				</li>
			</ul>
		</div>
		<!-- 채팅방 헤더 끝 -->
		<!-- 채팅 내용 시작 -->
		<div class="content-main">		
			<!-- 채팅 내용 출력 시작 -->
			<div class="chatting-content">
				<div id="output"></div>
			</div>
			<!-- 채팅 내용 출력 끝 -->
		</div>
		<div id="chatting_send">
			<form id="chat_form">
				<input type="hidden" name="chatroom_num" value="${chatroom_num}" id="chatroom_num">
				<input type="text" name="message" id="message" class="chat-message" placeholder="내용을 입력하세요.">
				<div id="re_second" class="chat-sender">
					<input type="submit" value="전송">
				</div>
			</form>
		</div>
		<!-- 채팅 내용 끝 -->
		<div class="chatting-exit">
			<button class="btn-exit" onclick="location.href='${pageContext.request.contextPath}/market/list.do'">목록</button>
		</div>
	</div>
	
	
	
</div>
