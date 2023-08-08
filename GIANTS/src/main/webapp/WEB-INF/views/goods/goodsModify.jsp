<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 상품 수정폼 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/KOY/goods.css">
<!-- include libraries (jquery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include ckdeitor js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/goods.option.js"></script>
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>
<div class="page-main">
		<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>[관리자] 상품수정</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<form:form modelAttribute="goodsVO" action="goodsUpdate.do" id="update_form" enctype="multipart/form-data">
		<form:hidden path="goods_num"/>
		<form:errors element="div" cssColor="error-color"/>
		<ul>
			<li>
				<%-- 
				<img src="${pageContext.request.contextPath}/goods/goodsPhotoView.do" width="200" height="200">
				<br> --%>
				<label for="upload">상품 썸네일 사진</label>
				<input type="file" id="upload" name="upload" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty goodsVO.goods_photo}">
					<div id="file_detail">
						(${goodsVO.goods_photoname})파일이 등록되어 있습니다.
					</div>
				</c:if>
				<form:errors path="goods_photo" cssColor="error-color"/>
			</li>
			<li> 
				<form:label path="goods_name">상품명</form:label>
				<form:input path="goods_name"/>
				<form:errors path="goods_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="goods_category">상품 카테고리</form:label>
				<form:select path="goods_category" id="goods_category">
					<form:option value="0">===선택===</form:option>
					<form:option value="1">유니폼</form:option>
					<form:option value="2">모자</form:option>
					<form:option value="3">응원도구</form:option>
					<form:option value="4">기타</form:option>
				</form:select>
			</li>
			<li class="hasSize" style="display:none;">
				<div>
					<form:hidden path="goods_sizes" value="85"/>
					<form:label path="goods_stocks">85</form:label>
					<form:input path="goods_stocks" type="number" placeholder="재고수량 입력"/>
					<form:errors path="goods_stocks"/>
				</div>
				<div>
					<form:hidden path="goods_sizes" value="90"/>
					<form:label path="goods_stocks">90</form:label>
					<form:input path="goods_stocks" type="number" placeholder="재고수량 입력"/>
					<form:errors path="goods_stocks"/>
				</div>
				<div>
					<form:hidden path="goods_sizes" value="95"/>
					<form:label path="goods_stocks">95</form:label>
					<form:input path="goods_stocks" type="number" placeholder="재고수량 입력"/>
					<form:errors path="goods_stocks"/>
				</div>
				<div>
				    <form:hidden path="goods_sizes" value="100"/>
					<form:label path="goods_stocks">100</form:label>
					<form:input path="goods_stocks" type="number" placeholder="재고수량 입력"/>
					<form:errors path="goods_stocks"/>
				</div>
				<div>
					<form:hidden path="goods_sizes" value="105"/>
					<form:label path="goods_stocks">105</form:label>
					<form:input path="goods_stocks" type="number" placeholder="재고수량 입력"/>
					<form:errors path="goods_stocks"/>
				</div>
				<div>
					<form:hidden path="goods_sizes" value="110"/>
					<form:label path="goods_stocks">110</form:label>
					<form:input path="goods_stocks" type="number" placeholder="재고수량 입력"/>
					<form:errors path="goods_stocks"/>
				</div>
			</li>
			<li class="hasNoSize" style="display:none;">
				<form:hidden path="goods_sizes" value="옵션없음"/>
				<form:label path="goods_stocks">옵션없음</form:label>
				<form:input path="goods_stocks" type="number" placeholder="재고수량 입력"/>
				<form:errors path="goods_stocks"/>
			</li>
			<li>
				<form:label path="goods_price">상품가격</form:label>
				<form:input path="goods_price" type="number"/>
				<form:errors path="goods_price" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="goods_disc">할인율</form:label>
				<form:input path="goods_disc" type="number"/>
				<form:errors path="goods_disc" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="goods_dprice">판매가격</form:label>
				<form:input path="goods_dprice" type="number" readonly="true"/>
				<form:errors path="goods_dprice" cssClass="error-color"/>
			</li>
			<li>상품설명</li>
			<li>
				<form:textarea path="goods_content"/>
				<form:errors path="goods_content" cssClass="error-color"/>
				<script>
					function MyCustomUploadAdapterPlugin(editor){
						editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
							return new UploadAdapter(loader);
						}
					}
					
					ClassicEditor.create(document.querySelector('#goods_content'), {
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
			<li>
				<form:label path="goods_status">상태</form:label>
				<form:radiobutton path="goods_status" value="1"/>판매중
				<form:radiobutton path="goods_status" value="2"/>판매중지
				<form:errors path="goods_content" cssClass="error-color"/>
			</li>
			
		</ul>
		<div class="align-center">
			<form:button class="default-btn">수정</form:button>
			<input type="button" value="목록" onclick="location.href='goodsList.do'">
		</div>
	</form:form>
</div>
<!-- 상품 수정폼 시작 -->