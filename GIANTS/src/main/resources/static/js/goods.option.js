$(function(){
	//상품 카테고리 선택시 상품 옵션 보이게
	$('#goods_category').click(function(){
		if($('#goods_category').val() == 1){
			$('.hasSize').show();
			$('.hasNoSize').hide();
		} else if($('#goods_category').val() > 1){
			$('.hasSize').hide();
			$('.hasNoSize').show();
		} else if($('#goods_category').val() < 1){
			$('.hasSize').hide();
			$('.hasNoSize').hide();
		}
	}); //end of goods_category click
});