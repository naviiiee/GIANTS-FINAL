<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
li{
	float:left;
}
.result-display{
	width:400px;
	height:200px;
	margin:50px auto;
	border:1px solid #000;
	display:flex;
	align-items:center;
	justify-content:center;
}


.title01{
	display:flex;
}



</style>
<!-- [관리자] 선수 목록 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LHJ/commu.css">
<script type="text/javascript">
	$(function(){
		//검색 유효성 체크
		$('#search_form').submit(function(){
			if($('#keyword').val().trim() == ''){
				alert('검색어를 입력하세요!');
				$('#keyword').val('').focus();
				return false;
			}
		});
	});
</script>
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<div class="title01">
			<h2 style="margin-right:5%">선수 소개</h2>
			<p>선수 소개 페이지입니다.</p>
		</div>
	</div>
	<hr size="0.05" width="100%" noshade style="margin-bottom:3%">
	<form action="commuList.do" id="search_form" method="get"  style="padding-bottom: 24px;">
		<ul class="search align-center">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">SELECTED</c:if>>선수명</option>
					<option value="2" <c:if test="${param.keyfield == 2}">SELECTED</c:if>>선수 포지션</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}" style="height:30px;">
			</li>
			<li>
				<input type="submit" value="검색" style="height:30px;"  class="accept-btn">
			</li>
		</ul>
	
	
	
		<div class="align-right" >
			<c:if test="${!empty user}">
			<input type="button" value="선수 등록" onclick="location.href='admin_player.do'" class="accept-btn">
			<input type="button" value="목록" onclick="location.href='admin_playerList.do'" class="accept-btn">
			</c:if>
			
		</div>
	</form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<c:if test="${count == 0}">
		<div class="result-display">표시할 선수목록이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<table class="striped-table">
			<tr>
				<th>선수</th>
			</tr> 
			<c:forEach var="player" items="${list}">
				<tr>
					<td class="align-center"><img src="${pageContext.request.contextPath}/introduce/imageView.do?player_num=${player.player_num}"  width="200" height="200"></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	
	
	
	
	
	
	
	
	
	<!-- 목록 -->
	<!--  
	<div>
		<c:forEach var="player" items="${list}">
		<img src="${pageContext.request.contextPath}/introduce/imageView.do?player_num=${player.player_num}">
		</c:forEach>
	
	
		<table class="striped-table">
			<tr>
				<th>선수 프로필</th>
				<th>선수 이름</th>
			</tr> 
			<c:forEach var="player" items="${list}">
				<tr>
					<td class="align-center"><img src="${pageContext.request.contextPath}/introduce/imageView.do?player_num=${player.player_num}"></td>
					<td class="align-center">${player.player_name}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<c:if test="${count == 0}">
	<div>표시할 선수가 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<div class="player-space">
		<c:forEach var="player" items="${list}">
		<div class="horizontal-area">
			<a href="${pageContext.request.contextPath}/introudce/player_detail.do?player_num=${plyer.player_num}">
				<img src="imageView.do?player_num=${player.player_num}" width="400" height="400">
				<img src="${pageContext.request.contextPath}/introduce/imageView.do?player_num=${player.player_num}">
				<span>${player.player_name}</span>
			</a>
		</div>
		</c:forEach>
		<hr width="100%" size="1" noshade="noshade" class="float-clear">
	</div>
	-->
	
	
		<!-- 페이지 -->
		<div class="align-center">${page}</div>
	</c:if>
	
	
</div>
<!-- [관리자] 선수 목록 끝 -->