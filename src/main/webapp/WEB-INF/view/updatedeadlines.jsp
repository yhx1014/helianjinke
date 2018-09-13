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
						<i class="fa fa-angle-right"></i> 标种设置
					</h4>
					<hr>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>标主</th>
								<th>产品名称</th>
								<th>产品描述</th>
								<th>发布时间</th>
								<th>筹款结束时间</th>
								<th>利率</th>
								<th>还款方式</th>
								<th>还款结束时间</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="list" varStatus="status">
							<tr>
								<td>
									${status.index+1}
								</td>
								<td><c:forEach items="${users}" var="u">
										<c:if test="${list.pproduce==u.uid}">
											${u.unickname}
										</c:if>
									</c:forEach>
								</td>
								<td>${list.pname}</td>
								<td>${list.pdesc}</td>
								<td><fmt:formatDate value="${list.ppublishtime}"/></td>
								<td><fmt:formatDate value="${list.ptime}"/></td>
								<td>${list.pincome}%</td>
								<td>${list.pway}</td>
								<td><fmt:formatDate value="${list.pcount}"/></td>
								
								<td>
								<c:if test="${list.pstate=='1'}">
									筹资中
								</c:if>
								<c:if test="${list.pstate=='2'}">
									筹资完成
								</c:if>
								<c:if test="${list.pstate=='3'}">
									筹资失败
								</c:if>
								</td>
								<td>
								<c:if test="${list.pstate=='1'}">
									<a href="javascript:;" data-target="#a${status.index}" data-toggle="modal">修改</a>丨
								</c:if>
								<a href="javascript:;"  data-target="#${status.index+1}" data-toggle="modal">详情</a>
								
								</td>
							</tr>
							<!--  详情弹出框-->
							<div class="modal fade" id="${status.index+1}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							        <h4 class="modal-title" id="myModalLabel">标详情</h4>
							      </div>
							      <div class="modal-body">
							        <div class="alert alert-info"><b><font><font>标主</font></font></b>
							        <font><font><c:forEach items="${users}" var="u">
										<c:if test="${list.pproduce==u.uid}">
											${u.unickname}
										</c:if>
									</c:forEach></font></font></div>
							        <div class="alert alert-danger"><b><font><font>项目名称：</font></font></b><font><font>${list.pname}</font></font></div>
							        <div class="alert alert-success"><b><font><font>项目描述：</font></font></b><font><font>${list.pdesc}   </font></font></div>
							        <div class="alert alert-danger"><b><font><font>年利率：</font></font></b><font><font> ${list.pincome } %</font></font></div>
							        <div class="alert alert-danger"><b><font><font>发布时间：</font></font></b><font><font> <fmt:formatDate value="${list.ppublishtime}" pattern="yyyy-MM-dd HH:mm:ss" /></font></font></div>
							        <div class="alert alert-danger"><b><font><font>募集资金：</font></font></b><font><font> ${list.ptotalmoney} 元</font></font></div>
							        <div class="alert alert-danger"><b><font><font>需还利息：</font></font></b><font><font> ${list.prateben} 元</font></font></div>
							        <div class="alert alert-danger"><b><font><font>已募集资金： </font></font></b><font><font>${list.pmoney }   元</font></font></div>
							        <div class="alert alert-danger"><b><font><font></font>募集进度：</font></b><font><font>${list.progress} %  </font></font></div>
							        <div class="alert alert-danger"><b><font><font>募集范围：</font></font></b><font><font>${list.prange }   </font></font></div>
							        <div class="alert alert-danger"><b><font><font>筹款结束时间：</font></font></b><font><font><fmt:formatDate value="${list.ptime}" pattern="yyyy-MM-dd HH:mm:ss" /> </font></font></div>
							        <div class="alert alert-danger"><b><font><font>还款结束时间：</font></font></b><font><font><fmt:formatDate value="${list.pcount}" pattern="yyyy-MM-dd HH:mm:ss" /></font></font></div>
							        <div class="alert alert-danger"><b><font><font>保障措施： </font></font></b><font><font>   ${list.psaveway} </font></font></div>
							        <div class="alert alert-danger"><b><font><font>状态： </font></font></b><font><font>
							        	<c:if test="${list.pstate=='1'}">
											筹资中
										</c:if>
										<c:if test="${list.pstate=='2'}">
											筹资完成
										</c:if>
										<c:if test="${list.pstate=='3'}">
											筹资失败
										</c:if></font></font></div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							      </div>
							    </div>
							  </div>
							 </div>
	                         <!-- 详情弹出框结束 -->
							<!-- 修改弹出框 -->
							<div class="modal fade" id="a${status.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							        <h4 class="modal-title" id="myModalLabel">标详情</h4>
							      </div>
							      <div class="modal-body">
							        <div class="alert alert-danger"><b><font><font>标主名称：</font></font></b><font><font>
									<font><c:forEach items="${users}" var="u">
										<c:if test="${list.pproduce==u.uid}">
											${u.unickname}
										</c:if>
									</c:forEach>
									</font></font></div>
							        <div class="alert alert-danger"><b><font><font>产品名称：</font></font></b><font><font> ${list.pname } </font></font></div>
							        <div class="alert alert-success"><b><font>年利率百分比：</font></b> <input type="text" id="rate" class="form-control" required="required"></div>
							        <div class="alert alert-success"><b><font>筹款结束时间：</font></b> 
							        <input type="hidden" id="did" class="form-control" value="${list.id}" />
							        <input type="hidden" id="raisebegin" class="form-control" value="${list.ppublishtime}" />
							        <input type="text" id="raiseend" class="form-control" onclick="WdatePicker({minDate:'#F{$dp.$D(\'raisebegin\')}'})" readonly="readonly" required="required">
							        </div>
							        
							        <div class="alert alert-success"><b><font>还款结束时间：</font></b> <input type="text" id="refunds" class="form-control" onclick="WdatePicker({minDate:'#F{$dp.$D(\'raiseend\')}'})" readonly="readonly" required="required"></div>
							        
							      </div>
							      <div class="modal-footer">
							       <button type="button" class="btn btn-default" onclick="onsubt();">修改</button>
							        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							      </div>
							    </div>
							  </div>
							 </div>
							
						</c:forEach>

						</tbody>
						<tbody>
						<tr align="center">
							<td colspan="19">
									<a href="${pageContext.request.contextPath}/elseset/productAll.do?currpage=1" class="btn btn-success btn-ms ">首页</a>
									<a href="${pageContext.request.contextPath}/elseset/productAll.do?currpage=${currpages-1}" class="btn btn-success btn-ms ">&lt;&lt;上一页</a>
									<a href="${pageContext.request.contextPath}/elseset/productAll.do?currpage=${currpages+1}" class="btn btn-success btn-ms "> 下一页&gt;&gt;</a>
									<a href="${pageContext.request.contextPath}/elseset/productAll.do?currpage=${totalpage}" class="btn btn-success btn-ms "> 尾页</a>
									<font size="3">共<font
										color="red">${totalrow}</font>条数据，当前<font color="#0000ff">${currpages}</font><font
										color="red">/${totalpage}</font>页
									</font>
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
<script type="text/javascript">
	
	function onsubt(){
		var rates = document.getElementById("rate").value;
		var raiseends = document.getElementById("raiseend").value;
		
		var refunds = document.getElementById("refunds").value;
		
		var did = document.getElementById("did").value;

		if(rates !='' && raiseends !='' && refunds !=''){
			if (confirm("是否确定修改")) {
				$.post('${pageContext.request.contextPath}/elseset/updateProduct.do',{"id":did,"pincome":rates,"ptime":raiseends,"pcount":refunds},function(data){
					 if(data==200){
						alert("审核成功");
						location.href = "${pageContext.request.contextPath}/elseset/productAll.do";
					 }else{
						 alert("审核失败");
					 }
				},"json");
			} else {
				
			}
		}else{
			if(rates ==''){
				alert("请输入新的利率");
			}
			if(raiseends==''){
				alert("请输入新的筹款结束时间");
			}
			if(refunds==''){
				alert("请输入新的还款时间");
			}
		}
		
	}
</script>
<script type="text/javascript">
	var text = document.getElementById("rate");
	text.onkeyup = function(){
	this.value=this.value.replace(/\D/g,'');
	if(text.value > 100){
		  text.value = 100;
		}
	
	if(text.value< 0){
		  text.value = 0;
		}
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
