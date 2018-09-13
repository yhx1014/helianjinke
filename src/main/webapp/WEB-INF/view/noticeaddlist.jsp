<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="ft" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript">
	function ongaib() {
		var va=document.getElementById("ong").value;
			window.location.href="<%=basePath%>notice/notlists.do?ids="+va;
	}

</script>
<body>
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<!-- 内容开始 -->
			<div class="col-md-12 mt">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i>公告列表
						<select onchange="ongaib();" id="ong">
							<option value="">选择分类</option>
							<option value="1">网站公告</option>
							<option value="2">媒体报道</option>
							<option value="3">管理团队</option>
							<option value="4">合作伙伴</option>
							<option value="5">团队风采</option>
						</select>
					</h4>
					<hr>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>公告标题</th>
								<th>公告类型</th>
								<th>公告内容</th>
								
								<th>公告最后修改时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="list" varStatus="status">
							<c:if test="${list.noticetype!='6' }">
							<tr >
								<td  data-target="#${list.noticeid }" data-toggle="modal" >
								${ft:substring(list.noticetitle,0,9) }...</td>
								<td data-target="#${list.noticeid }" data-toggle="modal">
									<c:if test="${list.noticetype=='1' }">网站公告</c:if>
									<c:if test="${list.noticetype=='2' }">媒体报道</c:if>
									<c:if test="${list.noticetype=='3' }">管理团队</c:if>
									<c:if test="${list.noticetype=='4' }">合作伙伴</c:if>
									<c:if test="${list.noticetype=='5' }">团队风采</c:if>
								</td>
								<td data-target="#${list.noticeid }" data-toggle="modal">
								${ft:substring(list.noticecontent,0,30) }...
								</td>
								<td data-target="#${list.noticeid }" data-toggle="modal">
									<fmt:formatDate value="${list.noticelasttime }"/></td>
								<td>
								<a href="<%=basePath%>notice/sgetno.do?ids=${list.noticeid}">修改</a>
								&nbsp;&nbsp;
								<a href="<%=basePath%>notice/notdel.do?ids=${list.noticeid}&isd=${list.noticetype}">删除</a>
								</td>
							</tr>
							</c:if>
 							<!-- 弹出框 -->
							<div class="modal fade" id="${list.noticeid }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							        <h4 class="modal-title" id="myModalLabel">通知详情</h4>
							      </div>
							      <div class="modal-body">
							        <div class="alert alert-danger"><b><font><font>通知标题: </font></font></b><font><font>${list.noticetitle }</font></font></div>
							        <div class="alert alert-info"><b><font><font>通知发布内容: </font></font></b><font><font>${list.noticecontent }</font></font></div>
							        <div class="alert alert-success"><b><font><font>图片: </font></font></b><font><font> </font><img alt="${list.noticetitle }" src="${list.noticepicture }" width="112" height="148"></font></div>
							        <div class="alert alert-danger"><b><font><font>通过类型: </font></font></b>
							        	<font><font>
											<c:if test="${list.noticetype=='1' }">网站公告</c:if>
											<c:if test="${list.noticetype=='2' }">媒体报道</c:if>
											<c:if test="${list.noticetype=='3' }">管理团队</c:if>
											<c:if test="${list.noticetype=='4' }">合作伙伴</c:if>
											<c:if test="${list.noticetype=='5' }">团队风采</c:if>
										</font></font>
									</div>
							        <div class="alert alert-info"><b><font><font>最后修改时间: </font></font></b><font><font><fmt:formatDate value="${list.noticelasttime }"/></font></font></div>
							        
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							      </div>
							    </div>
							  </div>
							 </div>
	                         <!--  -->
		
						</c:forEach>

						</tbody>
						<tbody>
						<tbody>
							<tr>
								<td colspan="7" align="center">
									<div class="btn-group" align="center">
										<button type="button" class="btn btn-default">
											<font><font>首页</font></font>
											<tton>
											<button type="button" class="btn btn-default">
												<font><font>1</font></font>
												<tton>
												
													<button type="button" class="btn btn-default">
														<font><font>末页</font></font>
														<tton>
									</div>
								</td>

							</tr>
						</tbody>

					</table>
				</div>
				<!-- --/content-panel ---->
			</div>
			<!-- 内容结束 -->
		</section>
		<! --/wrapper -->
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
