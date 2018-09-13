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
<script type="text/javascript">
	function check_crauditor(xb) {
		var auditoridList = new Array();
		var auditornameList = new Array();
		var useridList = new Array();
		var usernameList = new Array();
		var auditor="";
		var userid="";
		var auditorid="";
		var username="";
		$("input[name='userid']").each(function(){
			//alert($(this).val());
			useridList.push($(this).val());
		});
		$("input[name='username']").each(function(){
			//alert($(this).val());
			usernameList.push($(this).val());
		});
		
// 		alert(cruseridList.length);
	    $("select[name='crauditor']").each(function(){
	        //显示下拉框中已选文本值 ，同上
	        //alert("审核人ID=="+$(this).find('option:selected').val());
	        auditoridList.push($(this).find('option:selected').val());
	        auditornameList.push($(this).find('option:selected').text());
	        //alert("=================================");
	    }); 
// 	    alert("useridListlength=="+useridList.length);
// 	    alert("usernameListlength=="+usernameList.length);
// 	    alert("auditornameListlength=="+auditornameList.length);
// 	    alert("auditoridListlength=="+auditoridList.length);
	    
	    $.each(auditornameList,function(n,value) {
		    if(n==xb){
		    	//alert(n+' '+value);
		    	if(value!="==请选择=="){
				    auditor=value;
				}
		    	
			}         
	     });
	    
	    $.each(useridList,function(m,value1) {
		    if(m==xb){
// 		    	alert(m+' '+value1);
		    	userid=value1;
			}         
	     });
	    $.each(auditoridList,function(x,value2) {
		    if(x==xb){
		    	//alert(n+' '+value);
		    	if(value2!=""){
			    	auditorid=value2;
				}
		    	
			}         
	     });
	    $.each(usernameList,function(y,value3) {
		    if(y==xb){
		    	//alert(n+' '+value);
		    	username = value3
		    	
			}         
	     });
//     		alert(userid+"  "+username+"  "+auditorid+"  "+auditor);
		if(auditorid=='' && auditor==''){
			alert("请选择审核人");
			return false;
		}else{
			$.post('${pageContext.request.contextPath}/approve/affirmCrauditor.do',{"uauditor":auditor,"userid":userid,"uauditorid":auditorid,"username":username},function(data){
				 if(data==200){
					alert("添加成功");
					location.href = "${pageContext.request.contextPath}/approve/newuserInfoList.do";
				 }else{
					 alert("添加失败");
				 }
			},"json");
		}
	    
	}
</script>

</head>

<body>
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<!-- 内容开始 -->
			<div class="col-md-12">
				<div class="content-panel">
					<h4>
						<i class="fa "></i>新用户认证资料
					</h4>
					<hr>
					<form id="frm1" name="frm1" action="${pageContext.request.contextPath}/approve/affirmCrauditor.do" method="post">
					<table class="table table-striped table-advance table-hover">
						<thead>
							<tr>
								<th>序号</th>
								<th>用户名</th>
								<th>信用积分</th>
								<th>待审核资料</th>
								<th>分配</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach items="${users}" var="u" varStatus="subscript">
							
								<tr>
									<td>${u.uid}
									<input type="hidden" name="userid" value="${u.uid}"/>
									</td>
									<td>${u.unickname}
									<input type="hidden" name="username" value="${u.unickname}"/>
									</td>
									<td>
										<c:if test="${cr==null}">
											0
										</c:if>
										<c:if test="${cr!=null}">
											<c:forEach items="${cr}" var="c">
												<c:if test="${u.uid==c.cruserid}">
													${c.crintegral }
												</c:if>
											</c:forEach>
										</c:if>
									</td>
									<td>
										<c:if test="${cr==null}">
											0
										</c:if>
										<c:if test="${cr!=null}">
											<c:forEach items="${cr}" var="c">
												<c:if test="${u.uid==c.cruserid}">
													${c.checkpend }
												</c:if>
											</c:forEach>
										</c:if>
									</td>
									
									<td>
									<select name="crauditor" id="crauditor" required="required">
										<option value="" selected="selected">==请选择==</option>
										<c:forEach items="${employees}" var="emp">
											<option value="${emp.eid}">${emp.ename}</option>
										</c:forEach>
									</select>
									</td>
									<td>
									<button type="button" class="btn btn-primary btn-mg " onclick="check_crauditor(${subscript.index});">确定审核人员</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</form>
				</div>
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
