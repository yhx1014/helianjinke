<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">


			<!-- 内容开始 -->
			<div class="showback">
				<table class="table table-bordered table-striped table-condensed">
					<thead>
						<tr>
							<th class="numeric">序号</th>
							<th class="numeric">用户名</th>
							<th class="numeric">真实姓名</th>
							<th class="numeric">通过认证数量</th>
							<th class="numeric">标的类型</th>
							<th class="numeric">借款标题</th>
							<th class="numeric">借款金额</th>
							<th class="numeric">状态</th>
							<th class="numeric">推荐标的</th>
							<th class="numeric">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page}" var="list" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td>${list.busername}</td>
								<td>${list.brelname}</td>
								<td>${list.bpass}</td>
								<td><c:forEach items="${bList}" var="li">
										<c:if test="${li.id==list.btype}">${li.bname}</c:if>
									</c:forEach></td>
								<td>${list.btitle}</td>
								<td>${list.bmoney}</td>
								<td><c:if test="${list.bstate==0}">提交申请未处理</c:if> <c:if
										test="${list.bstate==1}">后台审核通过</c:if> <c:if
										test="${list.bstate==2}">审核失败</c:if> <c:if
										test="${list.bstate==3}">已还款</c:if></td>
								<td>${list.brecommend}</td>
								<td><a href="javascript:;" data-target="#${status.index+1}"
									data-toggle="modal">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="<%=request.getContextPath()%>/brower/borqr.do?ids=${list.id}"
									data-toggle="modal">通过</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
									href="<%=request.getContextPath()%>/brower/audit.do?id=${list.id}&status=0"
									data-target="" data-toggle="modal">不通过</a></td>
							</tr>
							<%-- <%=request.getContextPath()%>/brower/audit.do?id=${list.id}&status=1 --%>
							<!-- 弹出框 -->
							<div class="modal fade" id="${status.index+1}" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">借款详情</h4>
										</div>
										<div class="modal-body">

											<div class="alert alert-success">
												<b><font><font>用户名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>
														${list.busername}</font></font>
											</div>
											<div class="alert alert-info">
												<b><font><font>真实姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>${list.brelname}</font></font>
											</div>
											<div class="alert alert-info">
												<b><font><font>手机号码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>${list.bpass}</font></font>
											</div>
											<div class="alert alert-info">
												<b><font><font>标ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>${list.btype}</font></font>
											</div>
											<div class="alert alert-info">
												<b><font><font>借款标题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>${list.btitle}</font></font>
											</div>
											<div class="alert alert-info">
												<b><font><font>借款金额&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>${list.bmoney}</font></font>
											</div>

											<div class="alert alert-info">
												<b><font><font>状态&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>
														<c:if test="${list.bstate==0}">提交申请未处理</c:if> <c:if
															test="${list.bstate==1}">后台审核通过</c:if> <c:if
															test="${list.bstate==2}">审核失败</c:if> <c:if
															test="${list.bstate==3}">已还款</c:if>
												</font></font>
											</div>
											<div class="alert alert-info">
												<b><font><font>所在区域&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>${list.brecommend}</font></font>
											</div>
											<div class="alert alert-info">
												<b><font><font>类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font><c:forEach
															items="${bList}" var="li">
															<c:if test="${li.id==list.btype}">${li.bname}</c:if>
														</c:forEach> </font></font>
											</div>
											<div class="alert alert-info">
												<b><font><font>备注1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>${list.beizhu1}</font></font>
											</div>
											<div class="alert alert-info">
												<b><font><font>备注2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>${list.beizhu2}</font></font>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">关闭</button>
										</div>
									</div>
								</div>
							</div>
							<!--  -->
						</c:forEach>
						<tr align="center">
							<td colspan="13"><a
								href="${pageContext.request.contextPath}/brower/check.do?currpage=1"
								class="btn btn-success btn-ms ">首页</a> <a
								href="${pageContext.request.contextPath}/brower/check.do?currpage=${currpages-1}"
								class="btn btn-success btn-ms ">&lt;&lt;上一页</a> <a
								href="${pageContext.request.contextPath}/brower/check.do?currpage=${currpages+1}"
								class="btn btn-success btn-ms "> 下一页&gt;&gt;</a> <a
								href="${pageContext.request.contextPath}/brower/check.do?currpage=${totalpage}"
								class="btn btn-success btn-ms "> 尾页</a> <font size="3">共<font
									color="red">${totalrow}</font>条数据，当前<font color="#0000ff">${currpages}</font><font
									color="red">/${totalpage}</font>页
							</font></td>
						</tr>
					</tbody>

				</table>
			</div>
			<!-- /content-panel -->



			<!-- 内容结束 -->
		</section>
	</section>
	<!-- /MAIN CONTENT -->
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

<script type="text/javascript"
	src="<%=basePath%>My97DatePickers/WdatePicker.js"></script>
<script type="text/javascript">
	function jsdate() {
		var b = document.getElementsByName("qj.endtime");
		var s = document.getElementsByName("qj.startime");

		var bd = b[0].value;
		var sd = s[0].value;

		var arr = bd.split("-");
		var oldtime = new Date(arr[0], arr[1], arr[2]);
		var oldtimes = oldtime.getTime();

		var arrt = sd.split("-");
		var newtime = new Date(arrt[0], arrt[1], arrt[2]);
		var newtimes = newtime.getTime();

		var input = document.getElementById("in");

		if (b[0].value != "" && s[0].value != "") {
			if (newtimes > oldtimes) {
				confirm("MDZZ");
				return;
			} else {
				var diff = oldtimes - newtimes;
				var days = diff / (1000 * 60 * 60 * 24);
				input.value = days;
			}
		}
	}

	function zfs() {
		var zf = document.getElementById("zf").value;
		if (zf.length > 30) {
			alert("发布内容请控制在20字以内");
			document.getElementById("zf").focus();
		}
	}

	function as() {
		var yg = document.getElementById("yg").value;
		var sz = "";
		sz = yg.split(";");
		var dx = document.getElementById("dx").value;
		var dxid = document.getElementById("dxid").value;
		document.getElementById("dx").value = dx + ";" + sz[1];
		document.getElementById("dxid").value = dxid + ";" + sz[0];

	}
</script>

<script>
	function getTime() {
		var today = new Date();
		var h = today.getHours();
		var m = today.getMinutes();
		var s = today.getSeconds();
		// add a zero in front of numbers<10
		m = checkTime(m);
		s = checkTime(s);
		document.getElementById('showtime').innerHTML = h + ":" + m + ":" + s;
		t = setTimeout(function() {
			getTime()
		}, 500);
	}

	function checkTime(i) {
		if (i < 10) {
			i = "0" + i;
		}
		return i;
	}
</script>
<script type="text/javascript">
	function b3() {
		var currdate = new Date();
		var predate = new Date(currdate.getTime() - 0 * 24 * 60 * 60 * 1000)
				.toLocaleDateString();
		var pre = predate.replace("/", "-");
		var pre = pre.replace("/", "-");
		document.getElementById("d12").value = pre;

		var nextdate = new Date(currdate.getTime() + 3 * 24 * 60 * 60 * 1000)
				.toLocaleDateString();
		var next = nextdate.replace("/", "-");
		var next = next.replace("/", "-");
		document.getElementById("d13").value = next;

	}
</script>
<script type="text/javascript">
	function b4() {
		var currdate = new Date();
		var predate = new Date(currdate.getTime() - 0 * 24 * 60 * 60 * 1000)
				.toLocaleDateString();
		var pre = predate.replace("/", "-");
		var pre = pre.replace("/", "-");
		document.getElementById("d12").value = pre;

		var nextdate = new Date(currdate.getTime() + 7 * 24 * 60 * 60 * 1000)
				.toLocaleDateString();
		var next = nextdate.replace("/", "-");
		var next = next.replace("/", "-");
		document.getElementById("d13").value = next;

	}
</script>

<script type="text/javascript">
	function b5() {
		var currdate = new Date();
		var predate = new Date(currdate.getTime() - 0 * 24 * 60 * 60 * 1000)
				.toLocaleDateString();
		var pre = predate.replace("/", "-");
		var pre = pre.replace("/", "-");
		document.getElementById("d12").value = pre;

		var nextdate = new Date(currdate.getTime() + 30 * 24 * 60 * 60 * 1000)
				.toLocaleDateString();
		var next = nextdate.replace("/", "-");
		var next = next.replace("/", "-");
		document.getElementById("d13").value = next;

	}
</script>

<script>
	//custom select box

	$(function() {
		$('select.styled').customSelect();
	});
</script>
</html>
