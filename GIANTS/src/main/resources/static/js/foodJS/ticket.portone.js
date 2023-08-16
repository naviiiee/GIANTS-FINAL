function payment(pg_provider, mode, payment_method) {
	IMP.init('imp67587482');	// 가맹점 식별코드
	let pg_mid;
	
	if(pg_provider == 'inicis') {
		if(mode == 'test') { pg_mid = 'INIBillTst'; }
	} else if(pg_provider == 'tossPayments') {
		if(mode == 'test') { pg_mid = 'iamporttest_3'; }
	} else if(pg_provider == 'kakaoPay') {
		if(mode == 'test') { pg_mid = 'TC0ONETIME'; }
	}
	
	alert(pg_mimd);
	
	const data = {
		pg:pg_mid,
		pay_method:payment_method,
		merchant_uid:'',	// 주문번호
		name:'',	// 상품명
		amount: '',	// 금액
		buyer_email: '',
		buyer_name:'',
		buyer_tel:'',
	};
	
	IMP.request_pay(data, response => {
		alert('callback! : ' + JSON.stringify(response));
		
		$.ajax({
			url:'/payment/callback_receive',
			method:'post',
			headers:{'Content-Type':'application/json'},
			data:JSON.stringify(response)
		}).done(function(data) {
			alert('Please, Check your payment result page!!');
		});
	});
}