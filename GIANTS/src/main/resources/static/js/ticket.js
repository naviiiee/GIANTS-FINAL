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
				if(param.result == 'logout') {
					alert('Login 후 이용가능');
					location.href='../member/login.do';
				} else if(param.result == 'success') {
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
				if(param.result == 'logout') {
					alert('Login 후 이용가능');
					location.href='../member/login.do';
				} else if(param.result == 'success') {
					$('.select-left').empty();
					
					let seat = $(this).attr('data-seat');
					let grade = param.seat.grade_num
					let block = param.seat.seat_block
					let row = param.seat.seat_row.split(',')
					let col = param.seat.seat_col.split(',')
					
					let row_length = row.length;
					let col_length = col.length;
					
					let seat_div = '<div class="seat-box">';
					seat_div += '<div class="ground"><h2>그라운드 방향</h2></div>';
					seat_div +=  '<div class="seat-check">';
					
					for(let i = 0; i < row_length; i++) {
						seat_div += '<div class="row-div">';
						seat_div += '<span>' + row[i] + '</span>';
						for(let j = 0; j < col_length; j++) {
							seat_div += '<input type="button" data-info="' + block + row[i] + col[j] + '" data-seatNum="' + seat + '" class="seat-btn gn' + grade
														 + '" data-block="' + block + '" data-grade="' + grade + '" data-row="' + row[i] + '" data-col="' + col[j] + '">';
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
	
	$(document).on('click', '.seat-btn', function() {
		let check_block = $(this).attr('data-block');
		let check_row = $(this).attr('data-row');
		let check_col = $(this).attr('data-col');
		let info = check_block + check_row + check_col;
		
		if($(this).hasClass('clicked')) { 
			$(this).removeClass('clicked');
			$(this).addClass('gn'+$(this).attr('data-grade'));
			$('#del'+$(this).attr('data-info')).remove();
		} else {
			$(this).removeClass('gn'+$(this).attr('data-grade'));
			$(this).addClass('clicked');
		
			let seat_info = '<tr class="seat-leng" id="del'+info+'"><td>';
			seat_info += '<img src="../images/grade' + $(this).attr('data-grade') + '.png"> ' + check_block + '블럭 ' + check_row + '행 ' + check_col + '번';
			/*
			seat_info += '<input type="hidden" name="seatB" class="seatB" value="' + check_block + '">';
			seat_info += '<input type="hidden" name="seatR" class="seatR" value="' + check_row + '">';
			seat_info += '<input type="hidden" name="seatC" class="seatC" value="' + check_col + '">';
			*/
			seat_info += '<input type="hidden" name="seat" value="' + check_block + '^' + check_row + '^' + check_col + '">';
			seat_info += '<input type="hidden" name="grade_num" value="' + $(this).attr('data-grade') + '">';
			seat_info += '</td></tr>';
			
			$('.seat-table').append(seat_info);
			
			if($('.seat-leng').length > 4) {
				alert('1인 최대 4매까지 예매가능');
				return;
			}
		}
	});
	
	$('#order_seat').submit(function() {
		// checkbox 유효성 검사
		if($('.seat-leng').length == 0) {
			alert('구매할 좌석을 선택하세요');
			return false;
		}
	});
	
	/* ---------------
	   선택한 좌석정보
	------------------ */
	let seat = $('.seat-info').text();
	let array = seat.split(' ');
	let leng = array.length - 1;
	let title = $('#grade_title').val();
	
	$('#seatInfo').empty();
	
	for(let i = 0; i < leng; i++) {
		let seatArr = array[i].split('^');
		
		let output = '<span class="seatQuantity">' + title + ' ' + seatArr[0] + '블록 ';
		output += seatArr[1] + '행 ';
		output += seatArr[2] + '번</span><br>';
		$('#seatInfo').append(output);
	}
	
	let quantity = $('.seatQuantity').length;
	let countSeat = '<input type="hidden" name="ticket_quantity" value="' + quantity + '" id="ticket_quantity">';
	
	$('#seatInfo').append(countSeat);
	
	// 선택좌석 금액
	let price = $('.price-total>td:nth-child(2)').text();
	$('.price-total>td:nth-child(2)').empty()
	$('.price-total').append((price * leng).toLocaleString() + '원');
	
	$('.group-btn').append('<input type="hidden" name="total_price" value="'+price * leng+'" class="totalPrice">')

});
