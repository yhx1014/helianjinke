<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<div class="col-md-12 mt">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i>信用额度申请列表
					</h4>
					
					<div class="col-md-14">
					<form action="${pageContext.request.contextPath}/approve/limitApplyfor.do" method="post"> 
						<button type="submit">查找</button>
						用户名：<input type="text" name="clpuname" id="clpuname"/>
						申请时间：<input type="text" name="mindate" id="mindate" onclick="WdatePicker()" readonly="readonly"/>至<input type="text" name="maxdate" id="maxdate" onclick="WdatePicker({minDate:'#F{$dp.$D(\'mindate\')}'})" readonly="readonly"/>
						状态：
						<select name="clpstate" id="clpstate">
									<option value="" selected="selected">==请选择==</option>
									<option value="0">待审核</option>
									<option value="1">审核成功</option>
									<option value="1">审核失败</option>
						</select>
						</form>
					</div>
					<hr>
					
					<table class="table table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>用户名称</th>
								<th>用户账号</th>
								<th>原来额度</th>
								<th>申请额度</th>
								<th>申请时间</th>
								<th>跟踪审核</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<c:if test="${empty cps}">
							<tr align="center">
								<td colspan="9" align="center">
										没有找到你想要的数据
								</td>
							</tr>
						</c:if>
						<c:if test="${!empty cps}">
						<c:forEach items="${cps}" var="cp" varStatus="status">
							<tr>
								<td>
									${status.index+1}
								</td>
								<td>
									${cp.clpuname}
								</td>
								<td>${cp.clpubcid}</td>
								<td>${cp.clpporiginal}</td>
								<td>${cp.clpf}</td>
								<td><fmt:formatDate value="${cp.clpdate}"/></td>
								
								<td>${cp.clpauditor}</td>
								<td>
								<c:if test="${cp.clpstate=='0'}">
									待审核
								</c:if>
								<c:if test="${cp.clpstate=='1'}">
									审核成功
								</c:if>
								<c:if test="${cp.clpstate=='2'}">
									审核失败
								</c:if>
								</td>
								<td>
								<a href="javascript:;"  data-target="#${status.index+1}" data-toggle="modal">详情</a>
								</td>
							</tr>
							<!-- 弹出框· -->
							<div class="modal fade" id="${status.index+1}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							        <h4 class="modal-title" id="myModalLabel">申请详情</h4>
							      </div>
							      <div class="modal-body">
							        <div class="alert alert-info"><b><font><font>用户名称：</font></font></b><font>${cp.clpuname} </font></div>
							        <div class="alert alert-danger"><b><font><font>用户账号：</font></font></b><font><font>${cp.clpubcid}</font></font></div>
							        <div class="alert alert-success"><b><font><font>原来额度：</font></font></b><font><font>${cp.clpporiginal}</font></font></div>
							        <div class="alert alert-danger"><b><font><font>申请额度：</font></font></b><font><font> ${cp.clpf}</font></font></div>
							        <div class="alert alert-danger"><b><font><font>申请时间：</font></font></b><font><font> <fmt:formatDate value="${cp.clpdate}" pattern="yyyy-MM-dd HH:mm:ss" /></font></font></div>
							        <div class="alert alert-danger"><b><font><font>跟踪审核：</font></font></b><font><font> ${cp.clpauditor}</font></font></div>
							        <div class="alert alert-danger"><b><font><font>身份认证： </font></font></b><font><font>
							        	<c:if test="${empty cr}">
							        		未申请
							        	</c:if>
							        	<c:forEach items="${cr }" var="cr">
							        			<c:if test="${cp.clpuname == cr.crusername && cr.craiid==1}">
							        				<c:if test="${cr.crispass == '1' }">
														待审核
													</c:if>
													<c:if test="${cr.crispass == '2' }">
														审核通过
													</c:if>
													<c:if test="${cr.crispass == '3' }">
														审核失败
													</c:if>
							        			</c:if>
							        	</c:forEach>
							        
							        </font></font></div>
							        <div class="alert alert-danger"><b><font><font></font>收入认证：</font></b><font><font>
										
										
										<c:if test="${empty cr}">
							        		未申请
							        	</c:if>
							        	<c:set var="iscontain" value="true" /> 
							        	<c:forEach items="${cr}" var="cr">
							        			<c:if test="${cp.clpuname == cr.crusername && cr.craiid==5}">
							        				<c:if test="${cr.crispass == '1' }">
														待审核
													</c:if>
													<c:if test="${cr.crispass == '2' }">
														审核通过
													</c:if>
													<c:if test="${cr.crispass == '3' }">
														审核失败
													</c:if>
													<c:set var="iscontain" value="false" /> 
							        			</c:if>
							        	</c:forEach>
										<c:if test="${iscontain}">
										未提交
										</c:if>
									</font></font></div>
							        <div class="alert alert-danger"><b><font><font>状态： </font></font></b><font><font>
							        	<c:if test="${cp.clpstate=='0'}">
											待审核
										</c:if>
										<c:if test="${cp.clpstate=='1'}">
											审核成功
										</c:if>
										<c:if test="${cp.clpstate=='2'}">
											审核失败
										</c:if></font></font></div>
							      </div>
							      <div class="modal-footer">
							      <input type="hidden" id="clpid" value="${cp.clpid}"/>
							      <input type="hidden" id="clpubcid" value="${cp.clpubcid}"/>
							       <input type="hidden" id="clpf" value="${cp.clpf}"/>
							        <input type="hidden" id="clpporiginal" value="${cp.clpporiginal}"/>
							      	<c:if test="${cp.clpstate=='0'}">
											<button type="button" class="btn btn-default"  onclick="onsubt('1');">审核通过</button>
											<button type="button" class="btn btn-default"  onclick="onsubt('2');">审核不通过</button>
										</c:if>
										
							        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							      </div>
							    </div>
							  </div>
							 </div>
							</c:forEach>
							<tr align="center">
							<td colspan="9">
									
									<a href="${pageContext.request.contextPath}/approve/limitApplyfor.do?currpage=1&clpuname=${clpuname }&mindate=${mindate}&maxdate=${maxdate}&clpstate=${clpstate}" class="btn  ">首页</a>
									<a href="${pageContext.request.contextPath}/approve/limitApplyfor.do?currpage=${currpages-1}&clpuname=${clpuname }&mindate=${mindate}&maxdate=${maxdate}&clpstate=${clpstate}" class="btn  ">&lt;&lt;上一页</a>
									<a href="${pageContext.request.contextPath}/approve/limitApplyfor.do?currpage=${currpages+1}&clpuname=${clpuname }&mindate=${mindate}&maxdate=${maxdate}&clpstate=${clpstate}" class="btn "> 下一页&gt;&gt;</a>
									<a href="${pageContext.request.contextPath}/approve/limitApplyfor.do?currpage=${totalpage}&clpuname=${clpuname }&mindate=${mindate}&maxdate=${maxdate}&clpstate=${clpstate}" class="btn  "> 尾页</a>
									<font size="3">共<font
										color="red">${totalrow}</font>条数据，当前<font color="#0000ff">${currpages}</font><font
										color="red">/
										<c:if test="${totalpage!=0}">${totalpage}</c:if>
										<c:if test="${totalpage==0}">1</c:if>
										
										</font>页
									</font>
								</td>
						</tr>
						</c:if>
						
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
<script type="text/javascript">
	
	function onsubt(data){
		var clpid = document.getElementById("clpid").value;
		//alert(data+"    "+cardid);
		var clpporiginal = document.getElementById("clpporiginal").value;
		 var clpubcid = document.getElementById("clpubcid").value;
		var clpf = document.getElementById("clpf").value;
		$.post('${pageContext.request.contextPath}/approve/applyforApprove.do',{"clpid":clpid,"clpubcid":clpubcid,"clpporiginal":clpporiginal,"clpf":clpf,"clpstate":data},function(data){
			 if(data==200){
				alert("审核成功");
				location.href = "${pageContext.request.contextPath}/approve/limitApplyfor.do";
			 }else{
				 alert("审核失败");
			 }
		},"json");
		
	}
</script>

<script type="text/javascript"
	src="<%=basePath%>/assets/My97DatePickers/WdatePicker.js"></script>
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
</script>

<script>
	//custom select box

	$(function() {
		$('select.styled').customSelect();
	});
</script>
</html>
