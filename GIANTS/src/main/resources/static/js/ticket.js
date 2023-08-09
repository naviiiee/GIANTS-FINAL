$(function() {	
	/* --------------------
	   등급 클릭시 Block 노출
	-------------------- */
	$('.grade_title').click(function() {
		$.ajax({
			url:'selectedGrade.do',
			type:'post',
			data:{grade_num:$(this).attr('data-grade')},
			dataType:'json',
			success:function(param) {
				if(param.result == 'logout') { alert('Login 후 이용가능'); }
				else if(param.result == 'success') {
					$('.block-table').empty();
					let block_info = '<table class="block-table">';
						block_info += '<tr>';
						block_info += '<th>블록번호</th>';
						block_info += '<th>잔여석</th>';
						block_info += '</tr>';
						
					$(param.list).each(function(index, item) {
						block_info += '<tr data-seat="' + item.seat_num + '" class="selected-block">';
						block_info += '<td>' + item.seat_block + '</td>';
						block_info += '<td>' + item.seat_quantity + '</td>';
						block_info += '</tr>';
					});
					
					block_info += '</table>';
						
					$('.select-block').append(block_info);
				} else { alert('좌석 선택 오류 발생'); }
			},
			error:function() { alert('Network 오류 발생'); }
		});
	});
	
	/* -------------------------
	   Block 클릭시 seat 정보 호출
	------------------------- */
	$(document).on('click', '.selected-block', function() {
		
	});
});
