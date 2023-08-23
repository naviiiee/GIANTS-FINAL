<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- (회원) 리뷰작성 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/OSJ/food.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
.page-main{
	color:gray !important;	
}
</style>
<!-- include ckeditor js -->
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<div class="page-main">
	<!-- 타이틀 시작 -->
	<div class="main-title">
		<img class="title-img" src="${pageContext.request.contextPath}/images/title_icon.gif">
		<h2> 푸드 | 리뷰작성</h2>
	</div>
	<hr noshade="noshade">
	<!-- 타이틀 끝 -->
	<form:form modelAttribute="food_reviewVO" action="foodReviewSubmit.do" id="food_review" enctype="multipart/form-data">
		<input type="hidden" name="f_order_num" value="${f_order_num}">
		<div class="comp-container tbox">
			<h2>리뷰 작성</h2>
			<!-- 상단 분리박스 -->
			<div class="inner-top">
				<ul>
					<li>
						<div class="label-wid"><form:label path="review_title">제목</form:label></div>
						<form:input path="review_title" placeholder="최대20자" autocomplete="off"/>
						<form:errors path="review_title"/>
					</li>
					<li>
						<div class="label-wid"><form:label path="comp_score">별점</form:label></div>
						<form:radiobutton path="comp_score" value="1"/>1점
						<form:radiobutton path="comp_score" value="2"/>2점
						<form:radiobutton path="comp_score" value="3"/>3점
						<form:radiobutton path="comp_score" value="4"/>4점
						<form:radiobutton path="comp_score" value="5"/>5점
						<form:errors path="comp_score"/>
					</li>
					<li><b>리뷰내용</b></li>
					<li>
						<form:textarea path="review_content"/>
						<form:errors path="review_content"/>
						<script>
							function MyCustomUploadAdapterPlugin(editor){
								editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
									return new UploadAdapter(loader);
								}
							}
							
							ClassicEditor.create(document.querySelector('#food_content'),{
						           extraPlugins:[MyCustomUploadAdapterPlugin]
					             })
					             .then(editor => {
					            	 window.editor = editor;
					             })
					             .catch(error => {
					            	 console.error(error);
					             });
						</script>
					</li>
				</ul>
			</div>
			<hr noshade="noshade">
			<!-- 하단 분리박스 -->
			<div class="align-center">
				<form:button>등록하기</form:button>
				<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/food/forder/myFoodOrderList.do'">
			</div>
		</div>
	</form:form>
</div>
<!-- (회원) 리뷰작성 끝 -->