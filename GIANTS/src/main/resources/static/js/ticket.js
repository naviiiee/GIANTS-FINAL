$(function() {
	$('.grade_title').click(function() {
		$.ajax({
			url:'../ticket/selectedGrade.do',
			type:'post',
			data:{grade_num:$(this).attr('data-grade')},
			dataType:'json',
			success:function(param) {
				$(param.list).each(function(index, item) {
					let output = '<td>' + item.seat_block + '</td>';
					output += '<td>' + item.seat_quantity + '</td>';
					
					$('.seat-selected').append(output);
				});
			},
			error:function() { alert('Network 오류 발생'); }
		});
	});
});
