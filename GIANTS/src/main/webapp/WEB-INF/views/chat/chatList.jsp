<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 채팅방 목록 시작 -->
<div class="page-main">
	<h2>채팅방 목록</h2>
	<form action="chatList.do" id="search_form" method="get">
		<c:if test="${count == 0}">
		<div class="result-display">표시할 채팅방이 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
		<table class="striped-table">
			<c:forEach var="chat" items="${list}">
			<tr>
				<td>
					<a href="chatting.do?chatroom_num=${chat.chatroom_num}">
						<!-- <b>${chat.chatRoomVO.mem_id}(${chat.room_cnt})</b> -->
						<br>
						<span>${fn:substring(chat.chatVO.message, 0, 45)}</span> <!-- 45자의 메시지가 보여짐 --> 
					</a>
				</td>
				<td>
					<c:if test="${!empty chat.chatVO.chat_date}">${chat.chatVO.chat_date}</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
		<div class="align-center">${page}</div>
		</c:if>
	</form>
</div>
<!-- 채팅방 목록 끝 -->