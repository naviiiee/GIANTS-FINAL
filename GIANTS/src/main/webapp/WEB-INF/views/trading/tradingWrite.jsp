<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중고거래 게시판 글 등록 시작 -->
<!-- include libraries (jquery, bootstrap) -> CKEditor를 사용하기 위해 필요한 라이브러리 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include CKEditor js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<div class="page-main">
	<h2>글쓰기</h2>
	<form:form modelAttribute="tradingVO" action="write.do" id="register_form">
		<form:errors element="div" cssClass="error-color"/>
			<ul>
				<li>
				<form:label path="trade_title">제목</form:label>
				<form:input path="trade_title"/>
				<form:errors path="trade_title" cssClass="error-color"/>
				</li>
				<li>내용</li>
				<li>
					<form:textarea path="trade_content"/>
					<form:errors path="trade_content" cssClass="error-color"/>
					<script>
						function MyCustomUploadAdapterPlugin(editor){
							editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
								return new UploadAdapter(loader);
							}
						}
						
						ClassicEditor.create(document.querySelector('#trade_content'),{
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
			<div class="align-center">
				<form:button>전송</form:button>
				<input type="button" value="목록" onclick="location.href='tradingList.do'">
			</div>
	</form:form>
</div>
<!-- 중고거래 게시판 글 등록 끝 --> 