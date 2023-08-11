<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 상품 상세 페이지 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/KOY/goodsDetail.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/goods.fav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/goods_cart.js"></script>

<div class="page-main">
	<div class="content-main">
		<c:if test="${!empty user && user.mem_auth == 9}">
		<div class="align-right">
			<input type="button" value="수정" onclick="location.href='goodsUpdate.do?goods_num=${goods.goods_num}'">
			<input type="button" value="삭제">
		</div>
		</c:if>
		<div>
			<input type="button" value="임시리뷰" onclick="location.href='writeReview.do'">
			<input type="button" value="임시문의" onclick="location.href='writeQna.do'">
		</div>
		<div class="goods-photo">
			<img src="${pageContext.request.contextPath}/goods/imageView.do?goods_num=${goods.goods_num}">
		</div>
		<div class="goods-info" ><br><br>
			<h3 class="goods-name">${goods.goods_name}</h3>
			<hr size="2" width="97%">
			<form id="goods_cart" method="post">
				<input type="hidden" name="goods_num" value="${goods.goods_num}" id="goods_num">
				<input type="hidden" name="goods_dprice" value="${goods.goods_price}" id="goods_price">
				
				
				<%--  <input type="hidden" name="goods_stock" id="goods_stock" value="${goods.goodsOptionVO.goods_stock }"> --%>
				<%-- <input type="hidden" name="goods_stock" value="${goods.goods_stock}" id="goods_stock"> 수량--%>
				<ul> <%-- <c:if test="${goods.goods_stock > 0}"> 수량 --%>
					<%-- <li>남은 수량 : <span><fmt:formatNumber value="${goods.goods_stock}"/></span></li> 수량--%>
					<%-- <li>조회수 : <fmt:formatNumber value="${goods.goods_hit}"/>회</li> --%>
					<li>
						상태 :  
						<c:if test="${goods.goods_status == 1}">판매중</c:if>
						<c:if test="${goods.goods_status == 2}">판매중지</c:if>
						<input type="hidden" name="goods_status" value="${goods.goods_status}" id="goods_status">
					</li>
					<li>
						카테고리 : 
						<c:if test="${goods.goods_category == 1}">유니폼</c:if>
						<c:if test="${goods.goods_category == 2}">모자</c:if>
						<c:if test="${goods.goods_category == 3}">응원도구</c:if>
						<c:if test="${goods.goods_category == 4}">기타</c:if>
					</li>
					<li>
						판매가 : <s><fmt:formatNumber value="${goods.goods_price}" type="number"/>원</s>
						 (<fmt:formatNumber value="${goods.goods_disc}" type="number"/>% 할인)
						<span style="font-size:30px;">
							<fmt:formatNumber value="${goods.goods_dprice}" type="number"/>원
						</span>
					</li>
					<li>
						평점 : 
						<span id="avg_star">★</span> (<span id="output_score">${avg_score}</span>) 소수점으로 표시해야됨
					</li>
				<c:if test="${goods.goods_status == 1}">
					<li>
						<li>
						    옵션 : 
						    <select id="optionSelect">
						        <option value="" class="align-center">===선택안함===</option>
						        <c:forEach var="option" items="${option}">
						            <option value="${option.goods_size}" data-stock="${option.goods_stock}">
						                ${option.goods_size} [재고 : ${option.goods_stock}]
						                
						            </option>
						            <input type="hidden" name="goods_size" id="goods_size" value="${option.goods_size }">
						    <input type="hidden" name="goods_stock" id="goods_stock" value="${option.goods_stock}">
						        </c:forEach>
						    </select>
						    
						</li>


						<script>
						    // 옵션 선택이 변경되었을 때 호출되는 함수
						    function updateHiddenInput() {
						        var optionSelect = document.getElementById("optionSelect");
						        var optNumInput = document.getElementById("opt_num");
						        
						        var selectedOption = optionSelect.options[optionSelect.selectedIndex];
						        var optNumValue = selectedOption.getAttribute("data-stock");
						        
						        optNumInput.value = optNumValue;
						    }
						
						    // 옵션 선택 변경 이벤트에 함수 연결
						    var optionSelect = document.getElementById("optionSelect");
						    optionSelect.addEventListener("change", updateHiddenInput);
						    
						    // 페이지 로드 시에도 최초 값 설정
						    updateHiddenInput();
						</script>
						
						<!--  -->
					</li>
					<%-- 
					<li>
						마킹리스트
						<select>
							<c:forEach var="player" items="playerVO">
							<option value="${player.player_num}">${player.player_num}번 ${player.player_name}</option>
							</c:forEach>
						</select>
					</li>
					--%>
					<li>
						수량 : 
						<input type="number" name="order_quantity" id="order_quantity">
						<img>
						<img>
					</li>
					
					<li>
						상품등록일 : ${goods.goods_regdate}
						<c:if test="${!empty goods.goods_mdate}"><br>최근수정일 : ${goods.goods_mdate}</c:if>
					</li>
				</c:if>
				</ul>
				
				<div class="goods-btns">
					<div id="goods_fav">
						<img id="fav_btn" data-num="${goods.goods_num}" src="${pageContext.request.contextPath}/images/nofav.png">
						<span>찜하기</span>
						<c:if test="${!empty user}">[<span id="output_fcount"></span>]</c:if>
						<c:if test="${empty user}"></c:if>
					</div>
					<c:if test="${goods.goods_status == 1}">
					<div id="goods_cart">
						<img id="cart_btn" data-num="${goods.goods_num}" src="${pageContext.request.contextPath}/images/cart.png" width="20">
						<span>장바구니</span>
					</div>
					<div id="goods_pay">	
						<img id="pay_btn" data-num="${goods.goods_num}" src="${pageContext.request.contextPath}/images/card.png" width="20">
						<span>바로구매</span>
					</div>
					</c:if>
					<c:if test="${goods.goods_status == 2}">
					<div id="sold-out">
						<span>SOLD OUT</span>
					</div>
					</c:if>
				</div>
				<ul>
					<li class="list-cart-btn">
						<input class="btn btn-cart" type="submit" value="장바구니">
					</li>
				</ul>
				<ul>
					<form id="directBuy" action="${pageContext.request.contextPath}/gorder/directOrderForm.do" method="POST">
						<!-- <input type="hidden" name="order_quantity" id="direct_quantity"> 수량 -->
						<input type="hidden" name="goods_num" value="${goods.goods_num}">
						<button class="btn btn-buy" type="submit">바로 구매</button>
					</form>
				</ul>
				<hr size="1" width="97%">
			</form>
		</div> <%-- end of goods-info --%>
		<div class="float-clear"></div>
		<div class="medium-nav">
			<nav>
				<ul>
					<li class="selected"><a href="#goods_content">상품상세정보</a>
					<li><a href="#goods_delivery">배송/교환 안내</a>
					<li><a href="#goods_review">상품후기</a>
					<li><a href="#goods_qna">상품문의</a>
				</ul>
			</nav>
		</div>
		<p>
		<div id="goods_content" class="goods-subinfo">
			${goods.goods_content}
		</div>
		<div class="medium-nav">
			<nav>
				<ul>
					<li><a href="#goods_content">상품상세정보</a>
					<li class="selected"><a href="#goods_delivery">배송/교환 안내</a>
					<li><a href="#goods_review">상품후기</a>
					<li><a href="#goods_qna">상품문의</a>
				</ul>
			</nav>
		</div>
		<div id="goods_delivery">
			<div class="deli-sub">
				<h3 class="del-title">*주문방법</h3>
				<ul>
					<li>각 코너를 클릭하셔서 들어갑니다.</li>
					<li>사진이나 상품명을 클릭하세요.</li>
					<li>'장바구니에 담기'를 클릭하세요.</li>
					<li>'장바구니에 넣었습니다' 메시지가 나오면, 주문상품을 확인한 후 '주문' 버튼을 클릭하세요.</li>
					<li>주문버튼을 누르면 '주문서'가 나옵니다.</li>
					<li>주문서를 작성 후 결제하면 주문이 완료됩니다.</li>
				</ul>
			</div>
			<div class="deli-sub">
				<h3 class="del-title">*상품배송</h3>
				<ul>
					<li>각 코너를 클릭하셔서 들어갑니다.</li>
					<li>주문하신 상품은 택배로 발송됩니다.</li>
					<li>주문하신 날로부터 3~7일 안에 받으실 수 있습니다.</li>
					<li>최종 주문 결제금액 기준 5만원 미만은 3,000원의 배송비가 청구되며 5만원 이상 주문 시 무료배송입니다.
						<br>(도서,산간,오지 일부 지역은 배송비가 추가될 수 있습니다.)</li>
				</ul>
			</div>
			<div class="deli-sub">
				<h3 class="del-title">*고객센터</h3>
				<ul>
					<li>반품처 : 서울특별시 강남구 역삼동 ****</li>
					<li>주문하신 상품은 택배로 발송됩니다.</li>
					<li>고객센터 : 070-1111-0000 (오전 10시 ~ 오후 5시 운영/토,일 및 공휴일 휴무)</li>
					<li>개인정보보호 담당자 : 홍길동 / 전화 : 051)000-0000 / 메일 : test@test.com</li>
				</ul>
			</div>
			<div class="deli-sub" style="height:350px;">
				<h3 class="del-title">*교환/반품</h3>
				<ul>
					<li>배송비 : 왕복 6,000원 (도서,산간,오지 일부 지역은 배송비가 추가될 수 있습니다.)</li>
					<li>상품 수령 후 7일 이내 교환/환불을 요청해야 합니다.</li>
					<li>
						교환/반품이 불가능한 경우
						<br>
						-반품 요청 기간(수령 후 7일 이내)이 경과한 경우<br>
						-상품을 사용(또는 착용, 착화) 혹은 훼손하여 재판매가 어려운 경우<br>
						-고객의 주문에 따라 개별적으로 생산된 상품의 경우(주문제작 상품 등)
					</li>
					<li>고객의 변심에 의한 교환 및 반품인 경우 배송비는 '소비자' 부담입니다.</li>
					<li>상품의 이상에 의한 교환 및 반품인 경우 배송비는 '판매자' 부담입니다.</li>
				</ul>
			</div>
		</div>
		<div class="medium-nav">
			<nav>
				<ul>
					<li><a href="#goods_content">상품상세정보</a>
					<li><a href="#goods_delivery">배송/교환 안내</a>
					<li class="selected"><a href="#goods_review">상품후기</a>
					<li><a href="#goods_qna">상품문의</a>
				</ul>
			</nav>
		</div>
		<div id="goods_review">
			<div class="align-right" style="margin:10px 23px 0 0;">
				<input type="button" value="리뷰작성" onclick="location.href='writeReview.do'">
			</div>
		<c:if test="${review_cnt == 0}">
		<span>작성된 리뷰가 없습니다.</span>
		</c:if>
		<c:if test="${review_cnt > 0}">
			<table class="detail-tb align-center">
				<tr>
					<th style="width:10%;">별점</th>
					<th>제목</th>
					<th style="width:13%;">작성자ID</th>
					<th style="width:12%;">등록일</th>
				</tr>
				<c:forEach var="review" items="${review}" varStatus="status">
				<tr>
					<td>
						<c:if test="${review.review_score == 5}">★★★★★(5)</c:if>
						<c:if test="${review.review_score == 4}">★★★★(4)</c:if>
						<c:if test="${review.review_score == 3}">★★★(3)</c:if>
						<c:if test="${review.review_score == 2}">★★(2)</c:if>
						<c:if test="${review.review_score == 1}">★(1)</c:if>
					</td>
					<td class="re-title" id="title${status.count}" style="cursor:pointer;">
						${review.review_title}
					</td>
					<td>${review.mem_num}</td>
					<td>${review.review_regdate}</td>
				</tr>
				<tr class="re-content" id="content${status.count}" style="display:none;">
					<td colspan="5">
						<c:if test="${!empty user && user.mem_num == review.mem_num}">
						<div class="align-right">
							<input type="button" value="수정" onclick="">
							<input type="button" value="삭제">
						</div>
						</c:if>
						<div class="align-left">${review.review_content}</div>
					</td>
				</tr>
				</c:forEach>
			</table>
			<div>${review_page}</div>
		</c:if>
		</div>
		<script>
			$(function(){
				$('.re-title').on('click', function(){
					let num = $(this).attr('id').substring(5);
					alert(num);
					if($('#content' + num).attr('style', 'display:none;')){
						$('#content' + num).show();
					} else{
						//$('#content' + num).css('display','none');
						$('#content' + num).hide();
					}
				});
			});
		</script>
		<div class="medium-nav">
			<nav>
				<ul>
					<li><a href="#goods_content">상품상세정보</a>
					<li><a href="#goods_delivery">배송/교환 안내</a>
					<li><a href="#goods_review">상품후기</a>
					<li class="selected"><a href="#goods_qna">상품문의</a>
				</ul>
			</nav>
		</div>
		<div id="goods_qna">
			<div class="align-right" style="margin:10px 23px 0 0;">
				<input type="button" value="상품문의" onclick="location.href='writeQna.do'">
			</div>
		<c:if test="${qna_cnt == 0}">
		<span>등록된 문의사항이 없습니다.</span>
		</c:if>
		<c:if test="${qna_cnt > 0}">
			<table class="detail-tb align-center">
				<tr>
					<th style="width:10%;">번호</th>
					<th>제목</th>
					<th style="width:13%;">작성자ID</th>
					<th style="width:10%;">등록일</th>
					<th style="width:13%;">처리상태</th>
				</tr>
				<c:forEach var="qna" items="${qna}">
				<tr>
					<td>${qna.qna_num}</td>
					<td>
						<a href="detailQna.do?qna_num=${qna.qna_num}">${qna.qna_title}</a>
					</td>
					<td>${qna.id}</td>
					<td>${qna.qna_regdate}</td>
					<td>
						<c:if test="${qna.qna_status == 1}">처리전</c:if>
						<c:if test="${qna.qna_status == 2}">답변완료</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
			<div>${qna_page}</div>
		</c:if>
		</div>
	</div> <%-- end of content-main --%>
</div>
<!-- 상품 상세 페이지 끝 -->