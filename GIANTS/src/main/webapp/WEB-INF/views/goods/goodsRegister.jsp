<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 상품 등록폼 시작 -->
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
					<form:option value="1">유니폼</form:option>
					<form:option value="2">모자</form:option>
					<form:option value="3">응원도구</form:option>
					<form:option value="4">기타</form:option>
				</form:select>
			</li>
			<li>
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
				<form:label path="goods_dprice">판매금액</form:label>
				<form:input path="goods_dprice" readonly="true" value="${goods_price}"/>
			</li>
			<li>
				<form:label path="goods_content">상품설명</form:label>
				<form:textarea path="goods_content"/>
				<form:errors path="goods_content" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="goods_status">상태</form:label>
				<form:radiobutton path="goods_status" value="1"/>판매중
				<form:radiobutton path="goods_status" value="2"/>판매중단
				<form:errors path="goods_content" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="goods_photo">상품 썸네일 사진</form:label>
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