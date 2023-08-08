$(function(){
	let form = $('#foodList_sort');
	
	//초기화
	let cboxes = $('.food-cbox');
	for(let i=0; i<cboxes.length; i++){
		if($('#comp_cate').val()==(i+1)){
			$(cboxes[i]).attr('class','food-cbox food-cbox-on');
		}
	}
	
	//상단 카테고리 작동 시작
	$(document).on('click','.food-cbox',function(){
		$('.food-cbox').attr('class','food-cbox');
		$(this).attr('class','food-cbox food-cbox-on');
		$('#comp_cate').val($(this).attr('data-comp_cate'))
		categoryListform(form);
	});
	//상단 카테고리 작동 끝
	
	function categoryListform(form){
		$(form).submit();
	}
	
	//별점 정렬
	$(document).on('change','#sort_select',function(){
		categoryListform(form);
	});
	
	//매장 상세정보 폼 호출
	$(function(){
		$(document).on('click','.f-list',function(){
			let comp_form = $(this).find('form');
			comp_form.submit();
		});
	});
	
	
	
});