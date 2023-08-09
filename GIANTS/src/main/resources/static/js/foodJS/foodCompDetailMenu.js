$(function(){
	
	$(document).on('click','.food-info',function(){
		let classes = $(this).attr('class').length;
		if(classes == 10){
			return;
		}
		$('#food_number').val($(this).attr('data-food_num'));
		$('#frm_foodDetail').submit();
	});
	
});