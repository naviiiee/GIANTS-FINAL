$(function(){
	//상품 카테고리 선택시 상품 옵션 보이게
	$('#goods_category').click(function(){
		if($('#goods_category').val() == 1){
			$('.hasSize').show();
			$('.hasNoSize').remove();
		} else if($('#goods_category').val() > 1){
			$('.hasSize').remove();
			$('.hasNoSize').show();
		} else if($('#goods_category').val() < 1){
			$('.hasSize').hide();
			$('.hasNoSize').hide();
		}
	}); //end of goods_category click
	
	$('#goods_price').on('keyup mouseup', function(){
		$('#goods_dprice').val($('#goods_price').val());
		$('#goods_disc').val(0);
	}); //end of goods_price
	
	$('#goods_disc').on('keyup mouseup', function(){
		let dprice = $('#goods_price').val() * (1 - $('#goods_disc').val()/100);
		$('#goods_dprice').val(dprice);
	}); //end of goods_price
	
});