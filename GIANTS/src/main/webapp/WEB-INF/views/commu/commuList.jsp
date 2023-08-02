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
</style>
<!-- 커뮤니티 목록 시작 -->
<script type="text/javascript">
	$(function(){
		//검색 유효성 체크
		$('#search_form').submit(function(){
			if($('#keyword').val().trim() == ''){
				alert('검색어를 입력하세요!');
				#('#keyword').val('').focus();
				return false;
			}
		});
	});
</script>
<div class="page-main">
	<h2>커뮤니티 목록</h2>
	<form action="commuList.do" id="search_form" method="get">
		<ul class="search align-center">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">SELECTED</c:if>>제목</option>
					<option value="2" <c:if test="${param.keyfield == 2}">SELECTED</c:if>>작성자</option>
					<option value="3" <c:if test="${param.keyfield == 3}">SELECTED</c:if>>내용</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="검색" class="default-btn">
			</li>
		</ul>
	
	
	
		<!-- 정렬 -->
		<div class="align-right">
			<select id="order" name="order">
				<option value="1" 
				  <c:if test="${param.order == 1}">selected</c:if>>최신글</option>
				<option value="2" 
				  <c:if test="${param.order == 2}">selected</c:if>>조회수</option>
				<option value="3" 
				  <c:if test="${param.order == 3}">selected</c:if>>좋아요</option>
				<option value="4" 
				  <c:if test="${param.order == 4}">selected</c:if>>댓글수</option>
			</select>
			<script type="text/javascript">
				$(function(){
					$('#order').change(function(){
						location.href='list.do?keyfield='+$('#keyfield').val() 
											+ '&keyword='+$('#keyword').val() 
											+ '&order='+$('#order').val();
					});
				});
			</script>
			<input type="button" value="글쓰기" onclick="location.href='write.do'">
			
			<!--  
			<c:if test="${!empty user}">
			<input type="button" value="글쓰기" onclick="location.href='write.do'">
			</c:if>
			-->
		</div>
	</form>
	
	<!-- 목록 -->
	<c:if test="${count == 0}">
		<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>추천수</th>
			</tr> 
			<c:forEach var="commu" items="${list}">
				<tr>
					<td class="align-center">${commu.commu_num}</td>
					<td class="align-center" width="500">
						<a href="detail.do?commu_num=${commu.commu_num}">${commu.commu_title}</a>
					</td>
					<td class="align-center">${member.mem_nickname}</td>
					<td class="align-center">${commu.commu_date}</td>
					<td class="align-center">${commu.commu_hit}</td>
					<td class="align-center">${commu.commu_regdate}</td>
					<td class="align-center">${commu.fav_cnt}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="align-center">${page}</div>
	</c:if>
</div>
<!-- 커뮤니티 목록 끝 -->