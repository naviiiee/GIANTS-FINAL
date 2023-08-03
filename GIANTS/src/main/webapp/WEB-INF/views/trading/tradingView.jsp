<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 게시글 상세 시작 -->
<div class="page-main">
	<h2>${trading.trade_title}</h2>
	<ul class="detail-info">
		<li style="float: left; margin-right: 5px;">
			<img src="${pageContext.request.contextPath}/member/viewProfile.do?mem_num=${trading.mem_num}" width="40" height="40" class="my-photo">
		</li>
		<li>
			<c:if test="${empty trading.mem_nickname}">${trading.mem_id}</c:if>
			<c:if test="${!empty trading.mem_nickname}">${trading.mem_nickname}</c:if>
			<br>
			<c:if test="${!empty trading.trade_modifydate}">
				최근 수정일 : ${trading.trade_modifydate}	
			</c:if>
			<c:if test="${empty trading.trade_modifydate}">
				작성일 : ${trading.trade_date}	
			</c:if>
			조회: ${trading.trade_hit}
		</li>
	</ul>
	<hr size="1" width="100%">
	<div class="detail-content">
		${trading.trade_content}
	</div>
	<hr size="1" width="100%">
	<div>
		<%-- 북마크 --%>
		<img id="output_bookmark" data-num="${trading.trade_num}" src="${pageContext.request.contextPath}/images/fav01.gif" width="40">
		<span id="output_bookmarkcnt"></span>
	</div>
	<hr size="1" width="100%">
	<div class="align-right">
		<c:if test="${!empty user && user.mem_num == trading.mem_num}"> <!-- 로그인한 회원번호와 작성자 회원번호가 같을 시 -->
		<input type="button" value="수정" onclick="location.href='tradingUpdate.do?trade_num=${trading.trade_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick = function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					//히스토리 정보 삭제
					location.replace('tradingDelete.do?trade_num=${trading.trade_num}');
				}
			};
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='tradingList.do'">
	</div>
</div>
<!-- 게시글 상세 끝 -->