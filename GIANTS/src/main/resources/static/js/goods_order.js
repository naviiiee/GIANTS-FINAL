//------------------- 주문 유효성 체크 ----------------------
$(function(){
	$('#order_form').submit(function(){
		let items = document.querySelectorAll('input[type="text"]');
		 for(let i=0;i<items.length;i++){
			 
		    if(items[i].value.trim()==''){
				let label = document.querySelector('label[for="'+items[i].id+'"]');
				alert(label.textContent + ' 항목 필수 입력');
				items[i].value = '';
				items[i].focus();
				return false;
		    }
		}
		
		if($('input[type=radio]:checked').length<1){
			alert('결제 수단을 선택하세요!');
			return false;
		}
		
	});
});
//------------------ 구매 목록 검색 ----------------------
$(function(){
	$('#search_form').on('submit', function(){
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력하세요');
			$('#keyword').val('').focus();
			return false;
		}
		if($('#keyfield').val()==1 && isNan($('#keyword').val())){
			alert('주문번호는 숫자만 입력하세요');
			$('#keyword').val('').focus();
			return false;
		}
	})
})
//------------------ -장바구니 삭제 ----------------------
$(function(){
		$('.cart-del').on('click', function(){
			$.ajax({
				url : 'deleteCart.do',
				type : 'post',
				data : {cart_num:$(this).attr('data-cartnum')},
				dataType : 'json',
				success : function(param){
					if(param.result == 'logout') {
						alert('로그인 후 사용하세요!');
					} else if(param.result == 'success') {
						alert('선택하신 상품을 삭제했습니다.');
						location.href='list.do';
					} else {
						alert('장바구니 상품 삭제 오류 list.jsp로 오세요.');
					}
				},
				error : function(){
					alert('네트워크 오류 발생');
				}
			})
		})
		// 장바구니 상품 수량 변경 이벤트 연결
		$('.cart-modify').on('click', function(){
			let input_quantity = $(this).parent().find('input[name="order_quantity"]');
			if(input_quantity.val()==''){
				alert('수량을 입력하세요.');
				input_quantity.focus();
				return;
			}
			if(input_quantity.val() < 1){
				alert('상품의 최소 수량은 1입니다.'); // 태그에 명시한 변경전 value값을 읽어옴
				input_quantity.val(input_quantity.attr('value'));
				return;
			}
			
			// 서버와 통신
			$.ajax({
				url : 'modifyCart.do',
				type : 'post',
				data : {cart_num:$(this).attr('data-cartnum'),item_num:$(this).attr('data-itemnum'),order_quantity:input_quantity.val()},
				dataType : 'json',
				success : function(param){
					if(param.result == 'logout'){
						alert('로그인 후 사용하세요.');
					} else if(param.result == 'noSale') {
						alert('판매가 중지되었습니다.');
						location.href='list.do';
					} else if(param.result == 'noQuantity') {
						alert('상품의 수량이 부족합니다.');
						location.href='list.do';
					} else if(param.result == 'success') {
						alert('상품의 개수가 수정되었습니다.');
						location.href='list.do';
					} else {
						alert('장바구니 상품 개수 수정 오류 list.jsp로 오세요.');
					}
				},
				error : function(){
					alert('네트워크 오류 발생');
				}
			})
		})
	})	
//------------------ 주문 유효성 체크 ----------------------	
$(function(){
		//주문 유효성 체크
		$('#order_modify').submit(function(){
			// 배송대기일 경우만 조건체크
			if($('input[type=radio]:checked').val()==1){
				let items = document.querySelectorAll('input[type="text"]');
				 for(let i=0;i<items.length;i++){
				    if(items[i].value.trim()==''){
						let label = document.querySelector('label[for="'+items[i].id+'"]');
						alert(label.textContent + ' 항목 필수 입력');
						items[i].value = '';
						items[i].focus();
						return false;
				    }
				}
			} 
		}) 
		let origin_status = ${order.order_status};
		$('input[type=radio]').click(function(){
			if(origin_status == 1 && $('input[type=radio]:checked').val()!=1){
				$('input[type=text],textarea').parent().hide();
			} else {
				$('input[type=text],textarea').parent().show();
			}
		}) 
	});
\