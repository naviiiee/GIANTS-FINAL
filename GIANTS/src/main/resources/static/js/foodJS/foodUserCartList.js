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
	
});













