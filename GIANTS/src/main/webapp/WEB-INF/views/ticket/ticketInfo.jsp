<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 요금안내 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/price.css">
<div class="ticket-body">
	<div class="ticket-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif">
		<h2>요금안내</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<div class="align-right">
		<input type="button" value="티켓예매" onclick="location.href='ticketMain.do'" class="accept-btn big">
	</div>
	<div class="price-info">
		<div class="price-left">
			<div class="info-left">
				<img src="${pageContext.request.contextPath}/images/square.png">
				<b>일반석</b><br>
				<hr width="100%" class="color-red" noshade>
				<table>
					<tr>
						<th>좌석명칭</th><th>주중</th><th>주말</th>
					</tr>
					<tr>
						<td>내야상단석</td><td>13,000￦</td><td>17,000￦</td>
					</tr>
					<tr>
						<td>중앙상단석</td><td>10,000￦</td><td>12,000￦</td>
					</tr>
					<tr>
						<td>외야석</td><td>8,000￦</td><td>10,000￦</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="price-right">
			<div class="info-right">
				<img src="${pageContext.request.contextPath}/images/square.png">
				<b>특별석</b><br>
				<hr width="100%" class="color-red" noshade>
				<table>
					<tr>
						<th>좌석명칭</th><th>주중</th><th>주말</th>
					</tr>
					<tr>
						<td>중앙탁자석</td><td>40,000￦</td><td>55,000￦</td>
					</tr>
					<tr>
						<td>와이드탁자석</td><td>30,000￦</td><td>45,000￦</td>
					</tr>
					<tr>
						<td>응원탁자석</td><td>30,000￦</td><td>45,000￦</td>
					</tr>
					<tr>
						<td>내야탁자석</td><td>25,000￦</td><td>35,000￦</td>
					</tr>
					<tr>
						<td>3루단체석</td><td>25,000￦</td><td>30,000￦</td>
					</tr>
					<tr>
						<td>로케트배터리존</td><td>30,000￦</td><td>40,000￦</td>
					</tr>
					<tr>
						<td>내야필드석</td><td>15,000￦</td><td>20,000￦</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="refunt-info"></div>
</div>
