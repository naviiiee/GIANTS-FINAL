<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 커뮤니티 목록 시작 -->
<script type="text/javascript">
	$(function(){
		
		
	});
</script>
<div class="page-main">
	<h2>커뮤니티 목록</h2>
	<form action="list.do" id="search_form" method="get">
		<ul class="search align-right">
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
	</form>
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
					<td class="align-center">${commu.commu_regdate}</td>
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