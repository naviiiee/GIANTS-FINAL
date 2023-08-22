<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 상품 구매 시작 -->
<!-- goods(goodsVO), option(goodsOptionVO),  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LYJ/cart.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LYJ/orderForm.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/goods_order_form.js"></script>
<style>

</style>
<div class="page-main">
	
	<form:form modelAttribute="orderVO" action="order.do" id="order_register">
	
		<h3>주문자 정보</h3> <!-- 굳이 넣어야할까? -->
		<hr size="1">
		<ul>
			<li>
				이름 <input type="text">
			</li>
			
			<li>
				이메일 <input type="email">
			</li>
			
			<li>
				연락처 <input type="text">
			</li>
		</ul>
		<br>
		<br>
		<br>
		
		<h3>배송정보</h3>
		<hr size="1">
		<br>
		<ul>
			<li>
				<form:label path="order_name">받는 사람</form:label>
				<form:input path="order_name"/>
				<input type="button" value="회원주소사용" id="member_address" class="default-btn"> <!-- 회원 가입 시 입력했던 정보 가져오기 -->
				<form:errors path="order_name" cssClass="error-color"/>      
			</li>
			<li>
				<label for="zipcode">우편번호</label>
				<form:input path="order_zipcode" id="zipcode" maxlength="10"/>
				<input type="button" onclick="execDaumPostcode()"
				            value="우편번호 찾기" class="default-btn"> 
				<form:errors path="order_zipcode" cssClass="error-color"/>     
			</li>
			<li>
				<label for="address1">주소</label>
				<form:input path="order_address1" id="address1" maxlength="30"/>
				<form:errors path="order_address1" cssClass="error-color"/>      
			</li>
			<li>
				<label for="address2">상세주소</label>
				<form:input path="order_address2" id="address2" maxlength="30"/>
				<form:errors path="order_address2" cssClass="error-color"/>      
			</li>
			<li>
				<form:label path="mem_phone">전화번호</form:label>
				<form:input path="mem_phone" maxlength="15" id="mem_phone"/>
				<form:errors path="mem_phone" cssClass="error-color"/>      
			</li>
			<li>
				<form:label path="order_message">남기실 말씀</form:label>
				<form:input path="order_message"/>
				<form:errors path="order_message" cssClass="error-color"/>      
			</li>
			
		</ul>	
		<br>
		<br>
		<br>
		<h3>포인트적용</h3><span>포인트는 100점 이상부터 사용가능합니다</span>
		<hr size="1">
			잔여포인트 : p   <input type="button" value="전액사용" id="point-btn">
			<br>
			<input type="text" value="포인트입력" id="point-input-btn">원  <input type="button" value="적용" id="point-use-btn">
		<br>
		<br>
		<br>
		<h3>주문 리스트</h3>
		<hr size="1">
		<br>
		 <table class="basic-table">
			<tr>
				<th>사진</th>
				<th>상품정보</th>
				<th>판매가</th>
				<th>수량</th>
				<th>적립</th>
				<th>합계</th>
			</tr>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/goods/goodsDetail.do?goods_num=${cart.goods_num}">
							<img src="${pageContext.request.contextPath}/goods/imageView.do?goods_num=${cart.goods_num}" width="80" height="80">
						</a>
					</td>
					<td>
							${goods_name}
					</td>
					<td class="align-center">
						<span class="goods-price" data-price="${goods_dprice}"><fmt:formatNumber value="${goods_dprice}"/>원</span>
					</td>
					
					<td class = "align-center">
						${order_quantity}
					</td>
					<td>
						${order_point}p
					</td>
					
					<td class="align-center">
						<div class="sub-total" data-total="${sub_total}">
						<fmt:formatNumber value="${sub_total}"/>원
						<br>
						</div>
					</td>					
					<c:if test="${goods_size!='옵션없음'}">
						<tr class="option-tr">
						    <td colspan="6"><span>⤷</span> <img src="${pageContext.request.contextPath}/images/btn_order_option.gif" alt="옵션" title="옵션">
						    <span>사이즈 : ${goods_size}</span>
						    </td>
						</tr>

					</c:if>
				</tr>
				<tr>
					<td colspan="5" class="align-right"><b>총구매금액</b></td>
					<td class="align-center"><span class="all-total" data-alltotal="${all_total}"><fmt:formatNumber value="${all_total}"/>원</span></td>
				</tr>
		</table>  
		
		<!-- 주문금액 + 배송비 - 사용포인트 = 결제금액, 하단에 5만원 이상 결제 시 무료배송 -->
		<div class="order-info">
			<div class="order-dprice">
			<h2>주문금액</h2>
			<p>
				<em class="em-highlight"><fmt:formatNumber value="${all_total}"/>원 
					<span id="operator"><img src="${pageContext.request.contextPath}/images/order-plus.png" width="30"></span>
				</em>
				</p>
			</div>
			
			
			<div class="order-dcount">
			<h2>배송비</h2>
			<p>
				<em class="em-highlight">
					<c:if test="${all_total >= 50000}">
						0원
					</c:if>
					<c:if test="${all_total<50000}">
						3,000원
					</c:if>
					<span id="operator"><img src="${pageContext.request.contextPath}/images/order-minus.png" width="30"></span>
				</em>
				</p>
			</div>
			
			<div class="order-use-point">
			<h2>사용포인트</h2>
			<p>
				<em class="em-highlight">원</em>
				</p>
			</div>
			<span id="operator"><img src="${pageContext.request.contextPath}/images/order-equals.png" width="30"></span>
			
			<div class="order-final-price">
			<h2>결제금액</h2>
				<p>
				<em class="em-highlight-result"><fmt:formatNumber value="${all_total}"/>원</em>
				</p>
			</div>
		</div>
		<span class="annot">5만원 이상 결제 시 무료배송입니다.</span>
		
		<br>
		
		<h3>결제수단</h3>
		<hr size="1">
		<li>
			<input type="radio" name="order_payment" id="payment1" value="1">통장입금
			<input type="radio" name="order_payment" id="payment2" value="2">카드결제                
		</li>
		
		<div class="align-center">
			<form:button class="default-btn">주문하기</form:button>
			<input type="button" value="주문취소" class="default-btn"
			 onclick="location.href='${pageContext.request.contextPath}/gorder/goods_cart.do'">
		</div>             
	</form:form>
</div>
<!-- 우편번호 검색 시작 -->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //(주의)address1에 참고항목이 보여지도록 수정
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //(수정) document.getElementById("address2").value = extraAddr;
                
                } 
                //(수정) else {
                //(수정)    document.getElementById("address2").value = '';
                //(수정) }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                //(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
                document.getElementById("address1").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- 상품 구매 끝 -->



