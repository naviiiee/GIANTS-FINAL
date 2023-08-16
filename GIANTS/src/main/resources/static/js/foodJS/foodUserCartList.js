$(function(){
	//장바구니 비우기 버튼
	$('.emptyCart').click(function(){
		emptyCart();
	});
	
	
	//장바구니 모두 비우기 함수
	function emptyCart(){
		$.ajax({
			url:'../../food/foodEmptyCart.do',
			type:'post',
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인이 필요한 기능입니다.');
				}else if(param.result == 'success'){
					alert('장바구니를 모두 비웠습니다.');
				}else{
					alert('장바구니 비우기 오류 발생');
				}
			},
			error:function(){
				alert('장바구니 비우기 - 네트워크 오류 발생');
			}
		});
	}
	
	//삭제 버튼을 클릭할 경우에 장바구니에서 아이템 삭제
	$(document).on('click','.del-choice',function(){
		let check = confirm("상품을 장바구니에서 삭제하시겠습니까?");
		let cnum = $(this).closest('td').find('.del-choice').val();
		if(check){
			$.ajax({
				url:'deleteOneCart.do',
				type:'post',
				data:{cart_num:cnum},
				dataType:'json',
				success:function(param){
					if(param.result == 'logout'){
						alert('로그인이 필요한 기능입니다.');
					}else if(param.result == 'success'){
						alert('삭제완료.\n목록을 다시 불러옵니다.');
						location.href="/food/fcart/foodUserCartList.do";
					}else{
						alert('식품 삭제 오류 발생');
					}
				},
				error:function(){
					alert('식품 삭제 - 네트워크 오류 발생');
				}
			});
		}else{
			alert("삭제 취소")
		}
	});
	
	//변경 버튼 submit
	$(document).on('click','.change-count',function(){
		let cnum = $(this).closest('td').find('input[type="number"]').val();
		let fnum = $(this).closest('td').find('input[type="hidden"]').val();
		let cartNum = $(this).val();
		$.ajax({
			url:'changeCartQuantity.do',
			type:'post',
			data:{cart_num:cartNum, f_cart_quantity:cnum, food_num:fnum},
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인이 필요한 기능입니다.');
				}else if(param.result == 'stopSell'){
					alert('현재 판매중지 상품입니다.');
					alert('상품을 장바구니에서 제거합니다.');
					$.ajax({
						url:'deleteOneCart.do',
						type:'post',
						data:{cart_num:cnum},
						dataType:'json',
						success:function(param){
							if(param.result == 'logout'){
								alert('로그인이 필요한 기능입니다.');
							}else if(param.result == 'success'){
								alert('삭제완료.\n목록을 다시 불러옵니다.');
								location.href="/food/fcart/foodUserCartList.do";
							}else{
								alert('식품 삭제 오류 발생');
							}
						},
						error:function(){
							alert('식품 삭제 - 네트워크 오류 발생');
						}
					});
				}else if(param.result == 'noQuantity'){
					alert('선택하신 수량이 재고수량보다 많습니다.');
					location.href="/food/fcart/foodUserCartList.do";
				}else if(param.result == 'success'){
					location.href="/food/fcart/foodUserCartList.do";
				}else{
					alert('수량 변경 오류 발생');
				}
			},
			error:function(){
				alert('수량 변경 - 네트워크 오류 발생');
			}
		});
	});
	
});













