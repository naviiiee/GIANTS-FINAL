$(function() {
	// 좌석블록정보 등록 활성화
	$('#open_seatForm').click(function() {
		$('#seat_write').show();
		$('.seatUpdate').hide();
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
	
	/* ----- checkbox 설정 ----- */
	// checkbox[name=seat_row]
	// 전체
	$(document).on('click', '#check_row', function() {
		if($('#check_row').is(':checked')) {
			$('.seat-row').prop('checked', true);
			quantituSet();
		} else { $('.seat-row').prop('checked', false); }
	});
	
	// 개별
	$(document).on('click', '.seat-row', function() {
		if($('input[class="seat-row"]:checked').length == $('.seat-row').length) {
			$('#check_row').prop('checked', true);
		} else { $('#check_row').prop('checked', false); }
		
		if($('input[class="seat-col"]:checked').length > 0) { quantituSet(); }
	});
	
	// checkbox[name=seat_col]
	// 전체
	$(document).on('click', '#check_col', function() {
		if($('#check_col').is(':checked')) {
			$('.seat-col').prop('checked', true);
			quantituSet();
		} else { $('.seat-col').prop('checked', false); }
	});
	// 개별
	$(document).on('click', '.seat-col', function() {
		if($('input[class="seat-col"]:checked').length == $('.seat-col').length) {
			$('#check_col').prop('checked', true);
		} else { $('#check_col').prop('checked', false); }
		
		if($('input[class="seat-row"]:checked').length > 0) { quantituSet(); }
	});
	
	function quantituSet() {
		let seat_row = $('input[class="seat-row"]:checked').length;
		let seat_col = $('input[class="seat-col"]:checked').length;
		let quantity = seat_row * seat_col;
		
		$('#seat_quantity').attr('value', quantity);
	}
	
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
		output += '<input type="checkbox" value="selectRow" class="check-row">All';
		output += '<input type="checkbox" name="seat_row" value="A" class="seat-row2">A';
		output += '<input type="checkbox" name="seat_row" value="B" class="seat-row2">B';
		output += '<input type="checkbox" name="seat_row" value="C" class="seat-row2">C';
		output += '<input type="checkbox" name="seat_row" value="D" class="seat-row2">D';
		output += '<input type="checkbox" name="seat_row" value="E" class="seat-row2">E';
		output += '<span class="row-error error-color"></span>';
		output += '</li>';
		output += '<li>';
		output += '<label for="seat_col">좌석열</label>';
		output += '<input type="checkbox" value="selectCol" class="check-col">All';
		output += '<input type="checkbox" name="seat_col" value="1" class="seat-col2">1';
		output += '<input type="checkbox" name="seat_col" value="2" class="seat-col2">2';
		output += '<input type="checkbox" name="seat_col" value="3" class="seat-col2">3';
		output += '<input type="checkbox" name="seat_col" value="4" class="seat-col2">4';
		output += '<input type="checkbox" name="seat_col" value="5" class="seat-col2">5';
		output += '<span class="col-error error-color"></span>';
		output += '</li>';
		output += '<li>';
		output += '<label for="seat_quantity">좌석개수</label>';
		output += '<input type="number" name="seat_quantity" class="seat-quantity" value="">';
		output += '</li>';
		output += '<li>';
		output += '<input type="submit" value="수정" class="admin-btn small">';
		output += ' <input type="button" value="취소" class="closeForm default-btn small">';
		output += '</li>';
		output += '</ul>';
		output += '</form>';
		
		$('.seatform-update').append(output);
	});
	
	/* ----- checkbox 설정2 ----- */
	// checkbox[name=seat_row]
	// 전체
	$(document).on('click', '.check-row', function() {
		if($('.check-row').is(':checked')) {
			$('.seat-row2').prop('checked', true);
			quantituSet2();
		} else { $('.seat-row2').prop('checked', false); }
	});
	
	// 개별
	$(document).on('click', '.seat-row2', function() {
		if($('input[class="seat-row2"]:checked').length == $('.seat-row2').length) {
			$('.check-row').prop('checked', true);
		} else { $('.check-row').prop('checked', false); }
		
		if($('input[class="seat-col2"]:checked').length > 0) { quantituSet2(); }
	});
	
	// checkbox[name=seat_col]
	// 전체
	$(document).on('click', '.check-col', function() {
		if($('.check-col').is(':checked')) {
			$('.seat-col2').prop('checked', true);
			quantituSet2();
		} else { $('.seat-col2').prop('checked', false); }
	});
	// 개별
	$(document).on('click', '.seat-col2', function() {
		if($('input[class="seat-col2"]:checked').length == $('.seat-col2').length) {
			$('.check-col').prop('checked', true);
		} else { $('.check-col').prop('checked', false); }
		
		if($('input[class="seat-row2"]:checked').length > 0) { quantituSet2(); }
	});
	
	function quantituSet2() {
		let seat_row = $('input[class="seat-row2"]:checked').length;
		let seat_col = $('input[class="seat-col2"]:checked').length;
		let quantity = seat_row * seat_col;
		
		$('.seat-quantity').attr('value', quantity);
	}
});
