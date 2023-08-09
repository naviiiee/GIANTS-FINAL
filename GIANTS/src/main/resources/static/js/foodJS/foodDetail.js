$(function(){
	let price = Number($('.food-price').attr('data-price'));
	
	
	//수량이 변경될 때 마다 총 금액 및 hidden 값을 모두 변경
	$(document).on('change','#food_quantity',function(){
		changePriceAndTotal($(this).val(),price);
	});
	
	//값을 변경하는 함수
	function changePriceAndTotal(count,foodPrice){
		let total = count*foodPrice;
		
		//겉으로 보이는 총 가격 출력
		$('#food_total').text(function(){
			return Number(total).toLocaleString() + '원';
		});
		
		//hidden값 변경
		$('.fd-quantity').val(count);
		$('.fd-total').val(total);
	}
	
	changePriceAndTotal(1,price);
});