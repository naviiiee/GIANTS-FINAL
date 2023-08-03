<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 메뉴/식품 등록 페이지 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/OSJ/food.css">

<div class="page-main">
	<!-- 타이틀 시작 -->
	<div class="main-title">
		<img class="title-img" src="${pageContext.request.contextPath}/images/title_icon.gif">
		<h2> 푸드 | <a href="/food/foodList.do">기업</a> | <a href="/food/food_CompDetail.do">메뉴/식품 등록</a></h2>
	</div>
	<hr noshade="noshade">
	<!-- 타이틀 끝 -->
 	<!-- 상품 등록 폼 시작 -->
	<form:form modelAttribute="foodVO" action="addNewFood.do" id="food_add">
		<div class="comp-container tbox">
			<h2>식품 등록</h2>
			<!-- 상단 분리박스 -->
			<div class="inner-top">
				<ul>
					<li>
						<form:label path="food_name">식품명</form:label>
						<form:input path="food_name" placeholder="최대20자" autocomplete="off"/>
						<form:errors path="food_name"></form:errors>
					</li>
					<li>
						<form:label path="food_price">식품가격</form:label>
						<form:input path="food_price" type="number" placeholder="최대9자리숫자" autocomplete="off"/>
						<form:errors path="food_price"></form:errors>
					</li>
					<li>
						<form:label path="food_quantity">재고수량</form:label>
						<form:input path="food_quantity" type="number" placeholder="최대9자리숫자" autocomplete="off"/>
						<form:errors path="food_quantity"></form:errors>
					</li>
					<li>
						<form:label path="food_content">식품설명</form:label>
						<form:textarea path="food_content" placeholder="내용을 입력해주세요" />
						<form:errors path="food_content"></form:errors>
					</li>
					<li><b>상품설명</b></li>
					<li>
						<form:textarea path="food_content"/>
						<form:errors path="food_content" cssClass="error-color"/>
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
			<div class="inner-bottom">
				<ul>
					<li>
						<label for="food_photo1_name">식품 메인 이미지</label>
						<input type="file" name="food_photo1_name" id="food_photo1_name" accept="image/gif,image/png,image/jpeg"></input>
					</li>
					<li>
						<label for="food_photo2_name">식품 상세 이미지</label>
						<input type="file" name="food_photo1_name" id="food_photo1_name" accept="image/gif,image/png,image/jpeg"></input>
					</li>
					<li>
						<label>표시 여부</label>
						<form:radiobutton path="food_status" value="1" id="food_status1"/>비활성화
						<form:radiobutton path="food_status" value="2" id="food_status2"/>활성화
					</li>
				</ul>
			</div>
			<div class="align-center">
				<form:button>등록하기</form:button>
				<input type="button" value="취소" onclick="location.href='fixCompFoodList.do'">
			</div>
		</div>
	</form:form>
	<!-- 상품 등록 폼 끝 -->
</div>
<!-- 메뉴/식품 등록 페이지 끝 -->