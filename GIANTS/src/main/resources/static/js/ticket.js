$(function() {
	// 좌석블록정보 등록 활성화
	$('#open_seatForm').click(function() {
		$('#seat_write').show();
	});
	
	// 좌석블록정보 취소
	$('#close_seatForm').click(function() {
		$('#seat_write').hide();
		location.reload();
	})
	
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
});