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
					
					let seat_div = '<div class="seat-box">';
					seat_div += '<div class="ground"><h2>그라운드 방향</h2></div>';
					seat_div +=  '<div class="seat-check">';
					
					for(let i = 0; i < row_length; i++) {
						seat_div += '<div class="row-div">';
						seat_div += '<span>' + row[i] + '</span>';
						for(let j = 0; j < col_length; j++) {
							seat_div += '<input type="button" value="'+row[i]+col[j]+'" data-block="'+param.seat_block+'" data-grade="'+param.grade_num+'" data-row="'+row[i]+'" data-col="'+col[j]+'" class="seat-btn gn'+param.grade_num+'">';
						}
						seat_div += '</div>';
					}
					
					seat_div += '</div>';
						
					$('.select-left').append(seat_div);
				} else { alert('블록 선택 오류 발생'); }
			},
			error:function() { alert('Network 오류 발생'); }
		});
	});
	
	$(document).on('click', '.seat-btn', function(e) {
		let seat_block = $(this).attr('data-block');
		let check_row = $(this).attr('data-row');
		let check_col = $(this).attr('data-col');
		
		let info = seat_block + check_row + check_col;
		
		let selectedSeats = new Array();
		let clicked = '';
		
		//중복방지 함수
		selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);
		
		if($(this).hasClass('clicked')) {
			$(this).removeClass('clicked');
			$(this).addClass('gn'+$(this).attr('data-grade'));
			
			clicked = document.querySelectorAll('.clicked');
			selectedSeats.splice(selectedSeats.indexOf(info), 1);
			clicked.forEach((data) => { selectedSeats.push(data.value); });
		} else {
			$(this).removeClass('gn'+$(this).attr('data-grade'));
			$(this).addClass('clicked');
			
			clicked = document.querySelectorAll('.clicked');
			clicked.forEach((data) => { selectedSeats.push(data.value); });
		
			let seat_info = '<tr class="seat-leng"><td>' + seat_block + '블럭 ' + check_row + '행 ' + check_col + '열';
			//seat_info += '<input type="hidden" name="seat_num" class="seatN" value="' + param.seat_num + '">';
			seat_info += '<input type="hidden" name="seat_row" class="seatR" value="' + check_row + '">';
			seat_info += '<input type="hidden" name="seat_col" class="seatC" value="' + check_col + '">';
			seat_info += '</td></tr>';
			
			$('.seat-table').append(seat_info);
			
			if($('.seat-leng').length > 4) {
				alert('1인 최대 4매까지 예매가능');
				return;
			}
		}
		
	});
});
