<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/YHJ/member.css">
<!-- chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   <style>
        .hidden {
            display: none;
        }

        #salesTable {
            display: none;
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        #salesTable.show {
            display: block;
            opacity: 1;
        }
    </style>
    <script>
        function toggleTable() {
            var table = document.getElementById("salesTable");
            table.classList.toggle("show");
        }
    </script>

<div class="mypage-top2">
	<div class="mypage-top-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>매출관리</h2>
		<p>자이언츠 매출관리 입니다.</p>
		<br>

		<div class="align-center">
			<h1>2023년 총 매출</h1>
			<h1>
			<%-- 숫자가 아니라 String으로 받아옴 왜? --%>
			 ${order_revenue}원  </h1>
		</div>	 
			 <br>
			<div> <!-- 그래프 사용을 위해 변수 setting-->
					<c:set var="order_sale" value=""/>
					<c:set var="title_month" value=""/>
					<c:forEach var="sales" items="${monthList}" varStatus="status">
					
					<c:if test="${status.index==0}">
							<c:set var="title_month" value="${title_month  += sales.title_month}"/>
						</c:if>
						<c:if test="${status.index!=0}">
							<c:set var="title_month" value="${title_month  += ','}"/>
							<c:set var="title_month" value="${title_month  += sales.title_month}"/>
						</c:if>	
							
						<c:if test="${status.index==0}">
							<c:set var="order_sale" value="${order_sale  += sales.month_sale}"/>
						</c:if>
						<c:if test="${status.index!=0}">
							<c:set var="order_sale" value="${order_sale  += ','}"/>
							<c:set var="order_sale" value="${order_sale  += sales.month_sale}"/>
						</c:if>
					</c:forEach>
			</div> 	 
		
		<!-- 총 매출 그래프 시작--> 
		<div class="align-center">
			  <canvas id="myChart"  width="800" height="400"></canvas>
			<script>
			 const ctx = document.getElementById('myChart');
			 var title_month_order = [${title_month}];
			 var month_order_sale = [${order_sale}];
			  new Chart(ctx, {
			    type: 'line',
			    data: {
			      labels: title_month_order, //월
			      datasets: [{
			        label: '월매출',
			        data: month_order_sale, //월 별 판매량
			        borderWidth: 1
			      }]
			    },
			    options: {
			      scales: {
			        y: {
			          beginAtZero: true
			        },
			        
			      }
			    }
			  });
			</script>	
		</div>		
		<!-- 총 매출 그래프 끝-->
		
		
		
		<div>
		<h2 onclick="toggleTable()" style="cursor: pointer;">굿즈 상세 매출</h2>
	    <hr size="1">
	    <table class="basic-table hidden" id="salesTable">
			
			<tr>
				<th>순위</th>
				<th>상품명</th>
				<th>상품사진</th>
				<th>판매량</th>
				<th>합계</th>
				
			</tr>
			<!-- Controller에서 가공해서 받아와도 됨. (나중에 해보기) -->
			<!-- 배열 형태로 인식하기 위해서 문자열인 경우 따옴표를 붙여준다. varStatus로 index를 불러와서 조건을 체크 -->
			<c:set var="goods_name" value=""/>
			<c:set var="goods_quanitity" value=""/>
			<c:forEach var="order" items="${list}" varStatus="status">
			<c:if test="${status.index==0}">
				<c:set var="goods_name" value="${goods_name  += '\"'}"/>
				<c:set var="goods_name" value="${goods_name  += order.goods_name}"/>
				<c:set var="goods_name" value="${goods_name  += '\"'}"/>
			</c:if>
			<c:if test="${status.index!=0}">
				<c:set var="goods_name" value="${goods_name  += ','}"/>
				<c:set var="goods_name" value="${goods_name  += '\"'}"/>
				<c:set var="goods_name" value="${goods_name  += order.goods_name}"/>
				<c:set var="goods_name" value="${goods_name  += '\"'}"/>
			</c:if>
			<c:if test="${status.index==0}">
				<c:set var="goods_quanitity" value="${goods_quanitity  += order.order_quantity}"/>
			</c:if>
			<c:if test="${status.index!=0}">
				<c:set var="goods_quanitity" value="${goods_quanitity  += ','}"/>
				<c:set var="goods_quanitity" value="${goods_quanitity  += order.order_quantity}"/>
			</c:if>
			<tr>
				<td>
					${order.goods_rank}
				</td>
				<td>${order.goods_name}</td>
				<td>
					<img src="${pageContext.request.contextPath}/goods/imageView.do?goods_num=${order.goods_num}" width="80" height="80">
				</td>
				<td>
					 ${order.order_quantity}
				</td>
				
				<td>
					 ${order.goods_total_list}
				</td>
			
			</tr>
			
			</c:forEach>
			</table>
		</div>	
		<!-- 굿즈 별 판매량 그래프 -->
		<div class="align-center">
			  <canvas id="myChart"></canvas>
			<script>
			 const ctx = document.getElementById('myChart');
			 var goods_name_input = [${goods_name}];
			 var goods_buy_quantity = [${goods_quanitity}];
			 
			  new Chart(ctx, {
			    type: 'bar',
			    data: {
			      labels: goods_name_input, //goods_name
			      datasets: [{
			        label: '판매량',
			        data: goods_buy_quantity, //data에 order_quantity를 넣어주면 됨
			        borderWidth: 1
			      }]
			    },
			    options: {
			      scales: {
			        y: {
			          beginAtZero: true
			        }
			      }
			    }
			  });
			</script>	
		</div>		
		
		
		
		
		
		
		</div>
	</div> 
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	