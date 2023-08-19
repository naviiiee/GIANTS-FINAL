<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!--  
<script>
$(document).ready(function(){
	$("#regbtn").click(functio(){
		invalidItem();
	});
	function invalidItem(){
		if($("input[name=repo_category]:radio:checked").length < 1){
			alert("신고 유형 선택 필수");
			return false;
		}else{
			alert("신고가 완료되었습니다.");
		}
	}
});
</script>
-->
<div class="page-main">
  	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>커뮤니티 신고</h2>
		</div>
      	
      	
      	<form:form modelAttribute="commuReportVO" action="commuRepo.do" id="commuRepo" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<input type="hidden" name="commu_num" value="${commu.commu_num}">
		<ul>
			<li>
				<form:radiobutton path="repo_category" value="1" id="status1" name="repo_category"/>음란성 또는 부적합한 내용
			</li>
			<li>
				<form:radiobutton path="repo_category" value="2" id="status2" name="repo_category"/>특정인 대상의 비방/욕설
			</li>
			<li> 
				<form:radiobutton path="repo_category" value="3" id="status3" name="repo_category"/>명예 훼손/사생활 침해 및 저작권 침해 등
			</li>
			<li>
				<form:label path="repo_content">신고 내용</form:label>			
				<form:input path="repo_content"/>
				<form:errors path="repo_content" cssClass="error-color"/>
			</li>
		</ul>
		
		<div class="align-center">
			<form:button>등록</form:button>
			<input type="button" value="취소" id="regbtn" onclick="location.href='commuList.do'">
		</div> 
	</form:form>
      	

</div>
</html>