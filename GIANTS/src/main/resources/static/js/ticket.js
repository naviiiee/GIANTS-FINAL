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
		$.ajax({
			url:'selectedBlock.do',
			type:'post',
			data:{seat_num:$(this).attr('data-seat')},
			dataType:'json',
			success:function(param) {
				if(param.result == 'logout') { alert('Login 후 이용가능'); }
				else if(param.result == 'success') {
					$('.select-left').empty();
					
					let row = param.seat_row.split(',')
					let col = param.seat_col.split(',')
					
					let row_length = row.length;
					let col_length = col.length;
					
					/*
					let test = [];
					let selectedSeats = new Array();
					let selectedSeatsMap = [];
					const seatWrapper = document.querySelector(".seat-wrapper");
					let clicked = '';
					*/
					
					let seat_div = '<div class="seat-box">';
					seat_div += '<div class="ground"><h2>그라운드 방향</h2></div>';
					seat_div +=  '<div class="seat-check">';
					
					for(let i = 0; i < row_length; i++) {
						seat_div += '<div class="row-div">';
						seat_div += '<span>' + row[i] + '</span>';
						for(let j = 0; j < col_length; j++) {
							seat_div += '<input type="button" value="" data-row="'+row[i]+'" data-col="'+col[j]+'" class="seat-btn gn'+param.grade_num+'">';
						}
						seat_div += '</div>';
					}
					
					seat_div += '</div>';
						
					$('.select-left').append(seat_div);
				} else { alert('좌석 선택 오류 발생'); }
			},
			error:function() { alert('Network 오류 발생'); }
		});
	});
});
