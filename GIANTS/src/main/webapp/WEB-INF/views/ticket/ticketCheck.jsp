<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 예매확인 --> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ticket.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>예매확인</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<div class="check-info">
		<%-- 왼쪽 절반 --%>
		<div class="select-left" style="background:#f1f1f1;">
			<div class="left-no1">
				<h2>수령방법</h2>
				<div class="back-white">
					<div id="border_text">현장수령</div>
				</div>
			</div>
			<div class="left-no2">
				<h2>주문자 정보</h2>
				<div class="back-white">
					<table class="order-info">
						<tr>
							<th>이름</th>
							<td>${seatVO.detailVO.mem_name}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${seatVO.detailVO.mem_phone}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${seatVO.detailVO.mem_email}</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="left-no3">
				<h2>예매자 확인</h2>
				<input type="checkbox" name="check_info" id="check_info1"> KBO리그 SAFE 캠페인에 동의합니다.<br>
				<input type="checkbox" name="check_info" id="check_info2"> 프로 스포츠 암표 매매 행위에 따른 제재사항에 동의합니다.
			</div>
		</div>
		<%-- 오른쪽 절반 --%>
		<div class="select-right">
			<div class="select-gameInfo">
				<hr width="100%" class="color-red" noshade>
				<div class="game-information">
					<h2>경기정보</h2>
					<div class="game-logo">
						<img src="${pageContext.request.contextPath}/images/giants.png"> VS <img src="${pageContext.request.contextPath}/images/${gameVO.game_team}.png">
					</div>	
					롯데 VS ${gameVO.game_team}<br>
					사직야구장<br>
					${gameVO.game_date} ${gameVO.game_time}<br>
				</div>
				<div class="ticketInfo">
					<h2>좌석정보</h2>
					<div id="seatInfo">
						<input type="hidden" name="title" id="grade_title" value="${gradeVO.title}">
						<c:forEach var="seat" items="${seatVO.seat_info}">
						<span class="seat-info">${seat} </span><br>
						</c:forEach>
					</div>
				</div>
				<div class="price-information">
					<table>
						<tr class="price-total">
							<td>결제금액</td>
							<td>
								<c:if test="${gameVO.game_state == 0}">${gradeVO.price_week}</c:if>
								<c:if test="${gameVO.game_state == 1}">${gradeVO.price_weekend}</c:if>
							</td>
						</tr>
					</table>
				</div>
				<hr width="100%" class="color-red" noshade>
				<div class="group-btn">
					<input type="hidden" name="check_num" value="${checkVO.check_num}" id="check_num">
					<input type="button" value="이전" class="default-btn big" onclick="location.href='ticketMain.do?game_num=${gameVO.game_num}'">
					<input type="button" value="결제" class="accept-btn big" onclick="requestPay()">
					<script>
					function requestPay() {
						// 구매할 좌석이 이미 예매된 좌석인지 확인하는 통신
						
						/* Portone 결제 API */
						var IMP = window.IMP;
					    IMP.init('imp67587482');  // 가맹점 식별코드
						
						if($('input[name=check_info]:checked').length != 2) {
							alert('예매자 확인은 필수사항');
							return false;
						}
						
						let totalPrice = document.getElementById('totalPrice').value;
						let ticket_quantity = document.getElementById('ticket_quantity').value;
						let ticket_num = 'T' + new Date().getTime();
						let check_num = document.getElementById('check_num').value;
						
						console.log(check_num);
						
					 	// IMP.request_pay(param, callback) 결제창 호출
					 	IMP.request_pay({
					 		pg:'kakaopay',
					 		pay_method:'card',
					 		merchant_uid:ticket_num,   // 주문번호
					 		name:'${gameVO.game_date} 롯데 VS ${gameVO.game_team} ${gameVO.game_time}',
					 		amount:totalPrice,	// 숫자 타입
					 		buyer_email:'${seatVO.detailVO.mem_email}',
					 		buyer_name:'${seatVO.detailVO.mem_name}',
					 		buyer_tel:'${seatVO.detailVO.mem_phone}'
					 	}, function(rsp) {
					 		if(rsp.success) {
					 			let msg = '결제가 완료되었습니다.';
					 			let result = {
					 				'ticket_num':ticket_num,
					 				'game_num':${gameVO.game_num},
					 				'grade_num':${seatVO.grade_num},
					 				'pay_method':'card',
					 				'seat_date':'${gameVO.game_date}',
					 				'ticket_quantity':ticket_quantity,
					 				'total_price':totalPrice,
					 				'pg':'kakaopay',
					 				'check_num':check_num,
					 				'title':'${gameVO.game_date} 롯데 VS ${gameVO.game_team} ${gameVO.game_time}'
					 			}
					 			console.log(result);
					 			
					 			$.ajax({
					 				url:'insertMPay.do',
					 				type:'post',
					 				contentType:'application/json',
					 				data:JSON.stringify(result),
					 				success: function (res) {
					 					alert('결제 성공!!');
					 					location.href=res;
					 				},
									error: function (err) { console.log(err); }
					 			}); 
					 		} else {
					 			let msg = '결제 실패\n';
					 			msg += 'ERROE : ' + rsp.error_msg;
					 		}
					 	});
					}
					</script>
				</div>	
			</div>
		</div>
	</div>
</div>