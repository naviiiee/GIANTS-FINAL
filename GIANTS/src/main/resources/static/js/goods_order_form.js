$(function(){
	/*==========================
	 * 회원 주소 읽기(배송지 지정)
     *==========================*/
	$('#member_address').click(function(){
		//서버와 통신
		$.ajax({
			url:'../gorder/getMemberAddress.do',
			type:'get',
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 해야 회원 주소를 읽어올 수 있습니다.');
				}else if(param.result == 'success'){
					$('#zipcode').val(param.zipcode);
					$('#address1').val(param.address1);
					$('#address2').val(param.address2);
					$('#mem_phone').val(param.phone);
				}else{
					alert('회원 주소 읽기 오류');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
	
	
	
	
	
	
	
	
	
	
	
	
});