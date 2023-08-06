$(function(){
	//해당 삭품 삭제
	$(document).on('click','.del-food',function(){
		let check = confirm('상품을 삭제 하시겠습니까?');
		if(!check){
			return;
		}
		const num = $(this).attr('data-num');
		let frId = '#del_form_' + num;
		//console.log('폼 네임 확인하기 : ' + frId);
		
		$(frId).submit();
	});
});