<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="page-main">
  	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>커뮤니티 신고</h2>
		</div>
      	
      	
      	<form:form modelAttribute="commuReportVO" action="repo.do" id="commuRepo" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:radiobutton path="status" value="1" id="status1"/>음란성 또는 부적합한 내용
			</li>
			<li>
				<form:radiobutton path="status" value="2" id="status2"/>특정인 대상의 비방/욕설
			</li>
			<li> 
				<form:radiobutton path="status" value="3" id="status3"/>명예 훼손/사생활 침해 및 저작권 침해 등
			</li>
		</ul>
		
		<div class="align-center">
			<form:button>등록</form:button>
			<input type="button" value="취소" onclick="location.href='commuList.do'">
		</div> 
	</form:form>
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	
      	<!--  
        	<form style="border:none;" id="repo_submit" action="commuRepo.do" method="post">
        	<input type="hidden" name="post_num" value="${post.post_num}">
               <div class="form-row" style="margin-left:100px;">
                  <dl class="row">
                        <dd class="col-1 col-sm-2 d-flex align-items-center" style="width:300; margin-left: 70px">
                        <fieldset data-role="controlgroup">
                           <div class="form-check form-check-inline">
                               <input class="form-check-input" type="radio" name="repo_category" id="repo_category1" value="1">
                               <label class="form-check-label" for="inlineRadio1" style="width:102px">욕설 및 비방</label>
                           </div>
                           <div class="form-check form-check-inline">
                               <input class="form-check-input" type="radio" name="repo_category" id="repo_category2" value="2">
                               <label class="form-check-label" for="inlineRadio2" style="width:135px">홍보 및 영리 목적</label>
                           </div>
                           <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="repo_category" id="repo_category3" value="3">
                                <label class="form-check-label" for="inlineRadio3" style="width:168px">불법 정보, 청소년 유해</label>
                           </div>
                           <div class="form-check form-check-inline">
                                 <input class="form-check-input" type="radio" name="repo_category" id="repo_category4" value="4">
                                 <label class="form-check-label" for="inlineRadio4" style="width:186px">개인 정보 노출/유포/거래</label>
                           </div>
                           <div class="form-check form-check-inline">
                                 <input class="form-check-input" type="radio" name="repo_category" id="repo_category5" value="5">
                                 <label class="form-check-label" for="inlineRadio5" style="width:100px">도배 및 스팸</label>
                           </div>
                           <div class="form-check form-check-inline">
                                 <input class="form-check-input" type="radio" name="repo_category" id="repo_category6" value="6">
                                 <label class="form-check-label" for="inlineRadio6" style="width:47px">기타</label>
                           </div>
                           <div>
                           <textarea class="chat-content form-control" name="repo_content" id="repo_content" placeholder="*상세 사유를 입력하세요." style="width:230px; height: 68px; margin-top: 10px; resize:none;"></textarea>
                           </div>
                      </fieldset>
                     </dd>       
                  </dl>
               </div>  
                 <div class="modal-footer">
                 
           
        	
 
			<div id="re_second" class="align-center">
				<input type="button" value="취소" onclick="location.href='commuList.do'">
				<input type="submit" value="신고하기">
			</div>
      			</div>               
        	</form>
-->

</div>
</html>