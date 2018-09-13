<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>DASHGUM - FREE Bootstrap Admin Template</title>

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="<%=basePath%>assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="<%=basePath%>assets/css/style.css" rel="stylesheet">
<link href="<%=basePath%>assets/css/style-responsive.css"
	rel="stylesheet">

<script src="<%=basePath%>assets/js/chart-master/Chart.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/My97DatePickers/WdatePicker.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript">
	function findother(){
		var uname = $('#uname').val();
		var zname = $('#zname').val();
		var yyy = $('#yyy').val();
		var yyyy = $('#yyyy').val();
		if (yyy > yyyy) {
			alert("第二个日期不能小于第一个日期");
		} else {
			location.href = "trade.do?uname=" + uname + "&yyy=" + yyy
					+ "&yyyy=" + yyyy + "&zname=" + zname;
		}
	}
	
</script>
</head>

<body>
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<section id="main-content">
		<section class="wrapper">
			<div class="content-panel">
				<h3>
					&nbsp; &nbsp;<i class="fa fa-angle-right"></i><a href="trade.do">交易记录</a> 
				</h3>
				<br> &nbsp; &nbsp; &nbsp; 
				用户名：<input type="text"  id="uname">
				 &nbsp; &nbsp;&nbsp; 
				真实姓名：<input type="text" id="zname">
				 <br> <br>
				 &nbsp; &nbsp; &nbsp; 
				提交时间：<input type="text" readonly="readonly" id="yyy" class="Wdate"	onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})">--
				<input type="text" readonly="readonly" id="yyyy" class="Wdate"	onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})">
				 &nbsp; &nbsp;&nbsp; 
				 <button type="button" class="btn btn-default btn-danger"	onclick="findother()">搜索</button>
				 <br> <br>
				 

				<div class="row clearfix">
					<div class="col-md-12 column">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>编号</th>
									<th>用户名</th>
									<th>真实姓名</th>
									<th>交易金额</th>
									<th>什么交易</th>
									<th>时间</th>
									<th>备注</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${lts }" var="w" varStatus="i">
									<tr>
										<td>${i.index+1}</td>
										<td>${w.uname }</td>
										<td>${w.zname }</td>
										<td>${w.jymoney }</td>
										<td>${w.what }</td>
										<td><fmt:formatDate value="${w.jytime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td>${w.other }</td>
									</tr>
								</c:forEach>	
							</tbody>			
					</table>
					&nbsp; &nbsp;&nbsp; 第${currpages }页/总${totalpage }页<br><br>
				&nbsp; &nbsp;&nbsp;	<ul class="pagination">
				<li>
					 <a href="trade.do?currpage=1&uname=${uname }&zname=${zname}&yyy=${yyy}&yyyy=${yyyy}">首页</a>
				</li>
				<li>
					 <a href="trade.do?currpage=${currpages-1 }&uname=${uname }&zname=${zname}&yyy=${yyy}&yyyy=${yyyy}">上一页</a>
				</li>
				<c:forEach begin="1" end="${totalpage }" varStatus="i">
								<li><a
									href="trade.do?currpage=${i.index}&uname=${uname }&zname=${zname}&yyy=${yyy}&yyyy=${yyyy}">${i.index}</a>
								</li>
							</c:forEach>
				<li>
					 <a href="trade.do?currpage=${currpages+1}&uname=${uname }&zname=${zname}&yyy=${yyy}&yyyy=${yyyy}">下一页</a>
				</li>
				<li>
					 <a href="trade.do?currpage=${totalpage}&uname=${uname }&zname=${zname}&yyy=${yyy}&yyyy=${yyyy}">尾页</a>
				</li>
			</ul>
					</div>
				</div>
			</div>
			
		</section>
	</section>

</body>

<!--custom switch-->
<!-- js placed at the end of the document so the pages load faster -->
<script src="<%=basePath%>assets/js/jquery.js"></script>
<script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
	src="<%=basePath%>assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="<%=basePath%>assets/js/jquery.scrollTo.min.js"></script>
<script src="<%=basePath%>assets/js/jquery.nicescroll.js"
	type="text/javascript"></script>


<!--common script for all pages-->
<script src="<%=basePath%>assets/js/common-scripts.js"></script>

<!--script for this page-->
<script src="<%=basePath%>assets/js/jquery-ui-1.9.2.custom.min.js"></script>

<!--custom switch-->
<script src="<%=basePath%>assets/js/bootstrap-switch.js"></script>

<!--custom tagsinput-->
<script src="<%=basePath%>assets/js/jquery.tagsinput.js"></script>

<!--custom checkbox & radio-->

<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-daterangepicker/date.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>

<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>


<script src="<%=basePath%>assets/js/form-component.js"></script>


<script>
	//custom select box

	$(function() {
		$('select.styled').customSelect();
	});
</script>
</html>
