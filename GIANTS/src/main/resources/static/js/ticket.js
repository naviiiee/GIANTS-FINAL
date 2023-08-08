$(function() {
	// 좌석블록정보 등록 활성화
	$('#open_seatForm').click(function() {
		$('#seat_write').show();
	});
	
	// 좌석블록정보 취소
	$('#close_seatForm').click(function() {
		$('#seat_write').hide();
		location.reload();
	});
	
	$(document).on('click', '.closeForm', function() {
		$('.seatUpdate').hide();
		location.reload();
	});
	
	$('input[name="seat_row"]:checked && input[name="seat_col"]:checked').each(function() {
		let seat_row = $('input[name="seat_row"]:checked').length;
		let seat_col = $('input[name="seat_col"]:checked').length;
		let quantity = seat_row * seat_col;
	});
	
	// 좌석정보 등록
	$('#seat_write').submit(function(event) {
		// 유효성 검사
		if($('#seat_block').val().trim() == '0' || $('#seat_block').val().trim() == '') {
			$('#block_error').text('1부터 935이하의 값 입력');
			$('#seat_block').val('').focus();
			return false;
		}
		if($('input[name="seat_row"]:checked').length == 0) {
			$('#row_error').text('좌석행 선택 필수');
			return false;
		}
		if($('input[name="seat_col"]:checked').length == 0) {
			$('#col_error').text('좌석열 선택 필수');
			return false;
		}
		
		event.prevenDefault();
	});
	
	// 좌석정보 수정
	$(document).on('submit', '.seatUpdate', function(event) {
		// 유효성 검사
		if($('.seat-block').val().trim() == '0' || $('.seat-block').val().trim() == '') {
			$('.block-error').text('1부터 935이하의 값 입력');
			$('.seat-block').val('').focus();
			return false;
		}
		if($('input[name="seat_row"]:checked').length == 0) {
			$('.row-error').text('좌석행 선택 필수');
			return false;
		}
		if($('input[name="seat_col"]:checked').length == 0) {
			$('.col-error').text('좌석열 선택 필수');
			return false;
		}
		
		event.prevenDefault();
	});
	
	// 좌석 수정 UI
	$(document).on('click', '.seat-update', function() {
		$('#seat_write').hide();
		$('.seatform-update').empty();
		
		let seat_num = $('#seatNum').val();
		
		let output = '<form action="seatUpdate.do" class="seatUpdate" method="post">';
		output += '<input type="hidden" name="seat_num" id="seat_num" value="' + seat_num + '">';
		output += '<input type="hidden" name="grade_num" id="gradeNum" value="' + $('#grade_num').val() + '">';
		output += '<ul>';
		output += '<li>';
		output += '<label for="seat_block">블럭번호</label>';
		output += '<input type="number" name="seat_block" class="seat-block" value="'+$(this).attr('data-seatblock')+'">';
		output += '<span class="block-error error-color"></span>';
		output += '</li>';
		output += '<li>';
		output += '<label for="seat_row">좌석행</label>';
		output += '<input type="checkbox" value="selectRow" onclick="selectRow(this)">All';
		output += '<input type="checkbox" name="seat_row" value="A" onclick="checkselectRow()">A';
		output += '<input type="checkbox" name="seat_row" value="B" onclick="checkselectRow()">B';
		output += '<input type="checkbox" name="seat_row" value="C" onclick="checkselectRow()">C';
		output += '<input type="checkbox" name="seat_row" value="D" onclick="checkselectRow()">D';
		output += '<input type="checkbox" name="seat_row" value="E" onclick="checkselectRow()">E';
		output += '<span class="row-error error-color"></span>';
		output += '</li>';
		output += '<li>';
		output += '<label for="seat_col">좌석열</label>';
		output += '<input type="checkbox" value="selectCol" onclick="selectCol(this)">All';
		output += '<input type="checkbox" name="seat_col" value="1" onclick="checkselectCol()">1';
		output += '<input type="checkbox" name="seat_col" value="2" onclick="checkselectCol()">2';
		output += '<input type="checkbox" name="seat_col" value="3" onclick="checkselectCol()">3';
		output += '<input type="checkbox" name="seat_col" value="4" onclick="checkselectCol()">4';
		output += '<input type="checkbox" name="seat_col" value="5" onclick="checkselectCol()">5';
		output += '<span class="col-error error-color"></span>';
		output += '</li>';
		output += '<li>';
		output += '<input type="submit" value="수정" class="admin-btn small">';
		output += ' <input type="button" value="취소" class="closeForm default-btn small">';
		output += '</li>';
		output += '</ul>';
		output += '</form>';
		
		$('.seatform-update').append(output);
	});
});
