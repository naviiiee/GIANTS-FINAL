<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="player-space">
		<c:forEach var="player" items="${list}">
		<div class="horizontal-area">
			<img src="${pageContext.request.contextPath}/introduce/imageView.do?player_num=${player.player_num}">
		</div>
		</c:forEach>
		<hr width="100%" size="1" noshade="noshade" class="float-clear">
	</div>
	<div class="align-center">${page}</div>
</body>
</html>