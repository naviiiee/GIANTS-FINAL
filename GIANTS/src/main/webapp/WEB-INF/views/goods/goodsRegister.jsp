<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 상품 등록폼 시작 -->
<!-- include libraries (jquery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include ckdeitor js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/goods.option.js"></script>
<script type="text/javascript">
				$(function(){
					$('#goods_price').keyup(function(){
						let dprice = $('#goods_price').val() - $('#goods_disc').val() / 100;
						$('#goods_dprice').val(dprice);
					});
				});
			</script>
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>
<div class="page-main">
	<h2>상품 등록</h2>
	<form:form modelAttribute="goodsVO" action="registerGoods.do" id="register_form">
		<form:errors element="div" cssColor="error-color"/>
		<ul>
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
					<form:hidden path="goods_size" value="1"/>
					<form:label path="goods_stock">85</form:label>
					<form:input path="goods_stock" type="number"/>
					<form:errors path="goods_stock"/>
				</div>
				<div>
					<form:hidden path="goods_size" value="2"/>
					<form:label path="goods_stock">90</form:label>
					<form:input path="goods_stock" type="number"/>
					<form:errors path="goods_stock"/>
				</div>
				<div>
					<form:label path="goods_stock">95</form:label>
					<form:input path="goods_stock" type="number"/>
					<form:errors path="goods_stock"/>
				</div>
				<div>
					<form:label path="goods_stock">100</form:label>
					<form:input path="goods_stock" type="number"/>
					<form:errors path="goods_stock"/>
				</div>
				<div>
					<form:label path="goods_stock">105</form:label>
					<form:input path="goods_stock" type="number"/>
					<form:errors path="goods_stock"/>
				</div>
				<div>
					옵션 : 110
					<form:input path="goods_stock" type="number"/>
					<form:errors path="goods_stock"/>
				</div>
			</li>
			<li class="hasNoSize" style="display:none;">
				옵션 : 옵션없음
				<form:input path="goods_stock" type="number"/>
				<form:errors path="goods_stock"/>
			</li>
						
			<%-- 
			<li id="gsize" style="display:none;">
				<form:label path="goods_size">사이즈</form:label>
				<form:select path="goods_size" id="goods_size">
					<form:option value="1">85</form:option>
					<form:option value="2">90</form:option>
					<form:option value="3">95</form:option>
					<form:option value="4">100</form:option>
					<form:option value="5">105</form:option>
					<form:option value="6">110</form:option>
					<form:option value="7">옵션없음</form:option>
				</form:select>
			</li>
			
			<li>
				<form:label path="goods_stock">재고수량</form:label>
				<form:input path="goods_stock" type="number"/>
				<form:errors path="goods_price" cssClass="error-color"/>
			</li>
			--%>
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
				<form:radiobutton path="goods_status" value="2"/>판매중단
				<form:errors path="goods_content" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="goods_photo">상품 썸네일 사진</form:label>
				<%-- 
				<input type="file" id="upload" accept="image/gif,image/png,image/jpeg">
				--%>
				<input type="file" name="goods_photo" id="goods_photo">
			</li>
		</ul>
		<div class="align-center">
			<form:button class="default-btn">전송</form:button>
			<input type="button" value="목록" onclick="location.href='goodsList.do'">
		</div>
	</form:form>
</div>
<!-- 상품 등록폼 시작 -->