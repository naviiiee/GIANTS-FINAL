$(function(){
	
	$(document).on('click','.food-info',function(){
		$('#food_number').val($(this).attr('data-food_num'));
		$('#frm_foodDetail').submit();
	});
	
});