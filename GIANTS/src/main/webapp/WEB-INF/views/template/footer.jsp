<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
#footer{
	width:750px;
	margin:30px auto;
	position:relative;
}
.footer-top img{ margin-right:5px; }
.footer-top li{
	float:left;
	margin:0 15px 10px 15px;
}
.footer-address{
	clear:both;
    background:url(../images/ico_foot_loc.png) 0 4px no-repeat;
    margin-left:15px;
    padding-left:23px;
}
.footer-address span {
    padding-right:12px;
}
.footer-address strong {
    font-weight:600;
    color:#dd0330;
    display:inline-block;
    background:#fff;
    padding:0 10px;
    border-radius:3px;
}
</style>

<div id="footer">
	<div class="footer-top">
		<ul>
			<li>
				<img src="${pageContext.request.contextPath}/images/ico_foot_link.png">
				개인정보처리방침
			</li>
			<li>|</li>
			<li>영상정보처리기기 운영·관리 방침</li>
			<li>|</li>
			<li>이메일주소무단수집거부</li>
			<li>|</li>
			<li>이용약관</li>
		</ul>
	</div>
	<p class="footer-address">
		<span>(주)롯데자이언츠 대표 : 이강훈</span><span>사업자등록번호 : 607-81-19196</span><span>부산광역시 동래구 사직로 45</span><br>		
		<span style="display:inline-block; margin-top:7px;">티켓판매대행사 : (주)대홍기획</span>
		<span>사업자등록번호 : 821-88-01030</span><span>대표자명 : 홍성현</span><span>주소 : 서울시 중구 통일로 10</span><br>
		<strong>티켓콜센터. (051) 852-1982 (분실물 처리)</strong>
		<strong style="display:inline-block; font-size:11px; margin-top:18px;">COPYRIGHT (C) 2015 LOTTE GIANTS. ALL RIGHTS RESERVED.</strong>
	</p>
</div>

<!-- footer E -->
