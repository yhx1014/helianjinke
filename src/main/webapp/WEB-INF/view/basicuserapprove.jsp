<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script type="text/javascript">

		function on_submit(data){
			
			//获取积分
			var integral = document.getElementById("jf").value;
			//获取审核观点
			var viewpoint = document.getElementById("crviewpoint").value;
			//获取证件种类
			var crtype = document.getElementById("craiid").value;
			//获取用户ID
			var userid = document.getElementById("cruserid").value;
			//获取审核状态
			
			var ispass = "";
			if(data==1){
				ispass = "2";
			}else{
				ispass = "3";
			}
			//获取审核人员
			var auditor = document.getElementById("crauditor").value;
			//alert("integral:"+integral+"<--->viewpoint:"+viewpoint+"<--->:"+crtype+"<--->userid:"+userid+"<--->ispass:"+ispass+"<--->auditor:"+auditor);
			if(integral!=''){
				$.post('${pageContext.request.contextPath}/approve/updateInfoAudit.do',{"cruserid":userid,"craiid":crtype,"crviewpoint":viewpoint,"crintegral":integral,"crispass":ispass,"crauditor":auditor},function(data){
					 if(data==200){
						alert("审核成功");
						location.href = "${pageContext.request.contextPath}/approve/infoAuditByuser.do?cruserid="+userid+"&craiid="+crtype;
					 }else{
						 alert("审核失败");
					 }
				},"json");
			}else{
				alert("请输入积分");
			}


		}

</script>
<body>
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<!-- 内容开始 -->
			<div class="col-ld-15">
				<div >
					<h5>
						<i class="fa "></i>用户资料
					</h5>
					<div class="col-md-14">
					<form action="${pageContext.request.contextPath}/approve/infoAuditByuser.do" method="post"> 
						<button type="submit">查找</button>
						证件种类：
						<select name="craiid" id="craiid">
							<c:forEach items="${approve}" var="ap">
									<option value="${ap.aiid }" ${craiid == ap.aiid?'selected':''}>${ap.ainame }</option>
							</c:forEach>
						</select>
						<input type="hidden" name="cruserid" id="cruserid" value="${user.uid}"/>
						</form>
					</div><hr>
					<table class="table ">
						<tr align="center">
							<td colspan="10">
								用户名：${user.unickname }
							</td>
						</tr>
						<tr align="center">
							<td>ID</td>
							<td>用户名</td>
							<td>真实姓名</td>
							<td>证件种类</td>
							<td>认证图片</td>
							<td>跟踪审核</td>
							<td>认证审核</td>
							<td>审核观点</td>
							<td>上传时间</td>
							<td>状态</td>
						</tr>
						
						<c:if test="${empty certrecod }">
							<tr align="center">
							<td>${user.uid }</td>
							<td>${user.unickname }</td>
							<td>${user.uname }</td>
							<td colspan="7">暂无数据</td>
						</tr>
						</c:if>
						<c:if test="${ !empty certrecod }">
						<c:forEach items="${certrecod}" var="cr">
							<tr align="center">
							<td>${user.uid }</td>
							<td>${user.unickname }</td>
							<td>${user.uname }</td>
							<td>
								<c:if test="${user.uid == cr.cruserid}">
								${cr.crainame }
								</c:if>
							</td>
							<td>
								<c:if test="${user.uid == cr.cruserid}">
								
								<c:if test="${!empty cr.crviewpoint }">
									<img alt="" src="${cr.crimg }">
								</c:if>
								<c:if test="${empty cr.crviewpoint }">
									未上传
								</c:if>
								</c:if>
							</td>
							<td>
								<c:forEach items="${useraud}" var="ua">
								<c:if test="${user.uid == ua.userid}">
								${ua.uauditor}
								<input type="hidden" id="crauditor" name="crauditor" value="${ua.uauditor}"/>
								</c:if>
								</c:forEach>
							</td>
							<td>
								<c:forEach items="${useraud}" var="ua">
								<c:if test="${user.uid == ua.userid}">
								${ua.uauditor}
								
								</c:if>
								</c:forEach>
							</td>
							<td>
								<c:if test="${user.uid == cr.cruserid}">
								<c:if test="${!empty cr.crviewpoint }">
									${cr.crviewpoint }
								</c:if>
								<c:if test="${empty cr.crviewpoint }">
									无数据
								</c:if>
								</c:if>
							</td>
							<td>
								<c:if test="${user.uid == cr.cruserid}">
									<fmt:formatDate value="${cr.crupldate }" timeStyle="yyyy-MM-dd " />
								</c:if>
							</td>
							<td>
								<c:if test="${user.uid == cr.cruserid}">
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
							</td>
						</tr>
						</c:forEach>
						</c:if>
					</table>
					<hr >
				</div>
				<c:if test="${!empty certrecod}">
				<div class="col-ld-12" >
					该项证件所得信用积分为：<font color="red">
					<c:if test="${ !empty certrecod }">
						<c:forEach items="${certrecod}" var="cr">
						<c:if test="${user.uid == cr.cruserid}">
							<c:if test="${ !empty cr.crintegral }">
								${cr.crintegral }
							</c:if>
							<c:if test="${empty cr.crintegral }">
								0
							</c:if>
						</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${empty certrecod }">0</c:if>
					分</font><br /><br />
					
					信用积分：<input type="text" id="jf"  name="crintegral" required="required" > <font color="red">**提示：单项认证积分最高为20分，最低为0分</font>
					<br /><br /><br />
					审核观点：<textarea rows="4" cols="95" maxlength="500" required="required"  id="crviewpoint" name="crviewpoint"></textarea>
					<br />
					<div align="center">
					<button type="button" class="btn btn-ms fa" onclick="on_submit(1);">审核通过</button>
					<button type="button"  class="btn  btn-ms fa " onclick="on_submit(0);">审核不通过</button>
					</div>
					
				</div>
				</c:if>
				<!-- /content-panel -->
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
	<!-- 提交审核 -->
	
	
	<!-- 信用积分的JS 验证 -->			
<script type="text/javascript">
	var text = document.getElementById("jf");
	text.onkeyup = function(){
	this.value=this.value.replace(/\D/g,'');
	if(text.value>20){
	  text.value = 20;
	}
	if(text.value< 0){
		  text.value = 0;
		}
	}
</script>
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
