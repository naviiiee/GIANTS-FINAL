<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LHJ/commu.css">
<style>
.intoduce-title p{
	display: inline-block;
    font-size: 13px;
}
.title01{
	display:flex;
}


.title02{
    font-size: 50px;
    color: #333;
    font-weight: 900;
    line-height: 100%;
    letter-spacing: -1px;
    text-transform: uppercase;
}

.title02 span {
	margin-top: 5%;
    font-size: 24px;
    display: block;
}

.title03 {
	display:flex;
}

dd {
	margin-top:7%;
}

dt {
	margin-top:17%;
}

/*  
dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
*/

.sazik {
    height: 350px;
    float:right;
    margin-left:20%;
}
#photo1{
	margin-left:20%;
}

hr{
	margin-top:1%;
}

</style>  
 
<div class="page-main">
    <div class="introduce-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<div class="title01">
			<h2 style="margin-right:5%">소개</h2>
			<p>자이언츠의 사직구장 소개입니다.</p>
		</div>
		<hr size="0.05" width="100%" noshade>
	</div>
	<p class="title02">
		<span>모두가 함께 즐기는</span>
		사직 야구장
	</p>
	<div class="gap"></div>
	<div >
		<div class="title03" style="width:100%">
			<dl>
				<dt>위치</dt>
				<dd>부산광역시 동래구 사직로 45</dd>
				<hr size="0.03" width="140%" noshade>
				<dt>면적</dt>
				<dd>총 면적 : 50.301㎡</dd>
				<hr size="0.03" width="140%" noshade>
				<dt>시설</dt>
				<dd>관람석 22,990석</dd>
				<hr size="0.03" width="140%" noshade>
			</dl>
			<img src="${pageContext.request.contextPath}/images/사직야구장.png" class="sazik" width="700" height="500">
		</div>
		
	</div>
	
</div>
	
	