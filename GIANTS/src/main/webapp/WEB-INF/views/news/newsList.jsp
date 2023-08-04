<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 뉴스 목록 시작 -->
<script type="text/javascript">
	$(function(){
		//검색 유효성 체크
		$('#search_form').submit(function(){
			if($('#keyword').val().trim() == ''){
				alert('검색어를 입력하세요.');
				$('#keyword').val('').focus();
				return false;
			}
		}); 
	});
</script>
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>자이언츠 뉴스</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<form action="newsList.do" id="search_form" method="get">
			<ul class="search">
				<li>
					<select name="keyfield" id="keyfield">
						<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제목</option>
						<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>내용</option>
						<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>제목+내용</option>
					</select>
				</li>
				<li>
					<input type="search" name="keyword" id="keyword" value="${param.keyword}">
				</li>
				<li>
					<input type="submit" value="찾기">
					<input type="button" value="목록" onclick="location.href='newsList.do'">
				</li>
			</ul>
			<div class="align-right">
				<select id="order" name="order">
					<option value="1" <c:if test="${param.order == 1}">selected</c:if>>최신</option>
					<option value="2" <c:if test="${param.order == 2}">selected</c:if>>조회수</option>
					<option value="3" <c:if test="${param.order == 3}">selected</c:if>>좋아요</option>
					<option value="4" <c:if test="${param.order == 4}">selected</c:if>>댓글수</option>
				</select>
				<script type="text/javascript">
					$(function(){
						$('#order').change(function(){
							location.href='list.do?keyfield=' + $('#keyfield').val() + '&keyword=' + $('#keyword').val() + '&order=' + $('#order').val();
						});
					});
				</script>
				<c:if test="${!empty user}">
					<input type="button" value="글쓰기" onclick="location.href='newsWrite.do'">
				</c:if>
			</div>
		</form>
		<c:if test="${count == 0}">
		<div>표시할 뉴스가 없습니다.</div>
		</c:if>
		<c:if test="${count > 0}">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="news" items="${list}">
			<tr>
				<td>${news.news_num}</td>
				<td>
					<a href="newsDetail.do?news_num=${news.news_num}">${news.news_title}</a>
				</td>
				<td>${news.news_regdate}</td>
				<td>${news.news_hit}</td>
			</tr>
			</c:forEach>
		</table>
		<div>${page}</div>
		</c:if>
</div>
<!-- 뉴스 목록 끝 -->