<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
				<form:radiobutton path="repo_category" value="1" id="status1"/>음란성 또는 부적합한 내용
			</li>
			<li>
				<form:radiobutton path="repo_category" value="2" id="status2"/>특정인 대상의 비방/욕설
			</li>
			<li> 
				<form:radiobutton path="repo_category" value="3" id="status3"/>명예 훼손/사생활 침해 및 저작권 침해 등
			</li>
			<li>
				<form:label path="repo_content">신고 유형</form:label>			
				<form:input path="repo_content"/>
				<form:errors path="repo_content" cssClass="error-color"/>
			</li>
		</ul>
		
		
		
		<div class="align-center">
			<form:button>등록</form:button>
			<input type="button" value="취소" onclick="location.href='commuList.do'">
		</div> 
	</form:form>
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
     

</div>
</html>