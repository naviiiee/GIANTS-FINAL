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
		
		
		<!-- 
		<ul>
			<li>
				<select name="keyfield" id="keyfield">
					<option>==선택==</option>
					<option value="">감독</option>
					<option value="" <c:if test="${param.keyfield == 2}">selected</c:if>>투수</option>
					<option value="" <c:if test="${param.keyfield == 3}">selected</c:if>>포수</option>
					<option value="" <c:if test="${param.keyfield == 4}">selected</c:if>>내야수</option>
					<option value="" <c:if test="${param.keyfield == 5}">selected</c:if>>외야수</option>
				</select>
			</li>
		</ul>
		 -->
		
		
		
		<!--
		<ul class="dept_001_wrap">
			<li class="dept_001 location_tap_menu">
				<a href="#">감독</a>
				<ul class="dept_002_wrap" style="display:none;">
					<li class="dept_002">
						<a href="">감독</a>
					</li>
					<li class="dept_002">
						<a href="">투수</a>
					</li>
					<li class="dept_002">
						<a href="">포수</a>
					</li>
					<li class="dept_002">
						<a href="">내야수</a>
					</li>
					<li class="dept_002">
						<a href="">외야수</a>
					</li>
				</ul>
			</li>
		</ul>
	  -->
	
	
	
	
	
	
	
	
		<div class="align-right" >
			<c:if test="${!empty user}">
			<input type="button" value="선수 등록" onclick="location.href='admin_player.do'" class="accept-btn">
			<input type="button" value="수정" onclick="location.href='admin_player.do'" class="accept-btn">
			</c:if>
			
		</div>
	</form>
	
	<!-- 목록 -->
	<c:if test="${count == 0}">
		<div class="result-display">표시할 선수목록이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<table class="striped-table">
			<tr>
				<th>선수</th>
				<th>번호</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>포지션</th>
				<th>투타</th>
				<th>경력사항</th>
				<th>입단년도</th>
			</tr> 
			<c:forEach var="player" items="${list}">
				<tr>
					<td class="align-center"><img src="${pageContext.request.contextPath}/introduce/imageView.do?player_num=${player.player_num}"  width="200" height="200"></td>
					<td class="align-center">${player.player_backnumber}</td>
					<td class="align-center">${player.player_name}</td>
					<td class="align-center">${player.player_birthday}</td>
					<td class="align-center">${player.player_position}</td>
					<td class="align-center">${player.player_toway}</td>
					<td class="align-center">${player.player_career}</td>
					<td class="align-center">${player.player_join}</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 페이지 -->
		<div class="align-center">${page}</div>
	</c:if>
</div>
<!-- [관리자] 선수 목록 끝 -->