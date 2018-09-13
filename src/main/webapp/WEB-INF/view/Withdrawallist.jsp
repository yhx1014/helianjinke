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
	function findother() {
		var wname = $('#wname').val();
		var yyy = $('#yyy').val();
		var yyyy = $('#yyyy').val();
		var wstatu = $('#wstatu').val();
		if (yyy > yyyy) {
			alert("第二个日期不能小于第一个日期");
		} else {
			location.href = "wlist.do?wname=" + wname + "&yyy=" + yyy
					+ "&yyyy=" + yyyy + "&wstatu=" + wstatu;
		}

	}
	function only(id) {
		$.post("ajax.do", {
			"id" : id
		}, function(date) {
			//alert(date.uname);
			//var jsonObj = $.parseJSON(date);
			//alert(jsonObj.txmoney);
			$('#u1').html(date.uname);
			$('#u2').html(date.txmoney);
			$('#u3').html(date.zname);
			$('#u4').html(date.txbank);
			$('#u5').html(date.txnum);
			$('#u6').html(date.txmoney);
			$('#u7').html(date.dzmoney);
			$('#u8').html(date.sxf);
			var d = new Date(date.txtime);
			$('#u9').html(d.toLocaleDateString());
			$('#u11').html(date.shwho);
			var ds = new Date(date.shtime);
			$('#u10').html(ds.toLocaleDateString());
			$('#u12').html(date.nothing);
			if (date.statu == 0) {
				$('#u13').html("失败");
			} else if (date.statu == 1) {
				$('#u13').html("已提现");
			} else if (date.statu == 2) {
				$('#u13').html("转账中");
			} else if (date.statu == 3) {
				$('#u13').html("审核中");
			}

			$('#spanid').click();
		});
	}
	function zhuan(wid){
		var gg = null;
		var msg = "转账成功?\n\n请确认！";
		if (confirm(msg)==true){
			gg=1;
		}else{
			gg=0;
		}
		location.href="zhuans.do?gg="+gg+"&wid="+wid;
	}
	function shens(wid){
		var gg = null;
		var msg = "审核通过?\n\n请确认！";
		if (confirm(msg)==true){
			gg=2;
		}else{
			gg=0;
		}
		location.href="shen.do?gg="+gg+"&wid="+wid;
	}
</script>
</head>

<body>
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<section id="main-content">
		<section class="wrapper">
			<div class="content-panel">
				<h3>
					&nbsp; &nbsp;<i class="fa fa-angle-right"></i> 提现管理
				</h3>
				<br> &nbsp; &nbsp; &nbsp; <a href="wlist.do"><button
						type="button" class="btn btn-default">全部提现</button></a> &nbsp; &nbsp;
				&nbsp; <a href="wlist.do?btn=3"><button type="button"
						class="btn btn-default btn-primary">待审核的提现</button></a> &nbsp; &nbsp;
				&nbsp; <a href="wlist.do?btn=2"><button type="button"
						class="btn btn-default btn-info">转账中的提现</button></a> &nbsp; &nbsp;
				&nbsp; <a href="wlist.do?btn=1"><button type="button"
						class="btn btn-default btn-success">成功的提现</button></a> &nbsp; &nbsp;
				&nbsp; <a href="wlist.do?btn=0"><button type="button"
						class="btn btn-default btn-warning">失败的提现</button></a> <br> <br>
				&nbsp; &nbsp; &nbsp;
				<button type="button" class="btn btn-default btn-danger"
					onclick="findother()">查找</button>
				&nbsp; <a href="putexcel.do"><button type="button"
						class="btn btn-default btn-inverse">导出excel</button></a> &nbsp; 用户名：<input
					type="text" style="width: 170px" id="wname">&nbsp; 提交时间：<input
					type="text" readonly="readonly" id="yyy" class="Wdate"
					onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})">
				&nbsp;<input type="text" readonly="readonly" id="yyyy" class="Wdate"
					onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})">
				状态：<select id="wstatu">
					<option value="">请选择</option>
					<option value="0">失败</option>
					<option value="1">已提现</option>
					<option value="2">转账中</option>
					<option value="3">审核中</option>
				</select>
				<div class="row clearfix">
					<div class="col-md-12 column">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>编号</th>
									<th>用户名</th>
									<th>真实姓名</th>
									<th>提现账号</th>
									<th>提现银行</th>
									<th>提现金额</th>
									<th>到账金额</th>
									<th>手续费</th>
									<th>提现时间</th>
									<th>转账时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${wdlist }" var="w" varStatus="i">
									<tr>
										<td>${i.index+1}</td>
										<td>${w.uname }</td>
										<td>${w.zname }</td>
										<td>${w.txnum }</td>
										<td>${w.txbank }</td>
										<td>${w.txmoney }</td>
										<td>${w.dzmoney }</td>
										<td>${w.sxf }</td>
										<td><fmt:formatDate value="${w.txtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td><fmt:formatDate value="${w.zztime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td><c:if test="${w.statu=='0' }">失败</c:if> <c:if
												test="${w.statu=='1' }">已提现</c:if> <c:if
												test="${w.statu=='2' }">转账中</c:if> <c:if
												test="${w.statu=='3' }">审核中</c:if></td>
										<td><c:if test="${w.statu=='0' }">
												<a id="mod" onclick="only('${w.wID}');" role="button"
													class="btn" data-toggle="modal">查看</a>
											</c:if> <c:if test="${w.statu=='1' }">
												<a id="mod" onclick="only('${w.wID}');" role="button"
													class="btn" data-toggle="modal">查看</a>
											</c:if> <c:if test="${w.statu=='2' }"><a onclick="zhuan('${w.wID}')">转账</a></c:if> <c:if
												test="${w.statu=='3' }"><a onclick="shens('${w.wID}')">审核</a></c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						&nbsp;&nbsp;&nbsp;&nbsp;总计：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提现总额：${suntxmoney }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;到账金额:${sumdzmoney}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手续费：${sumsxf}
						<br> <br> &nbsp;&nbsp;&nbsp;&nbsp; 共有${totalrow }条数据&nbsp;&nbsp;&nbsp;&nbsp;第${currpages }页/共${totalpage }页
						<br> &nbsp;&nbsp;&nbsp;&nbsp;

						<ul class="pagination">
							<li><a
								href="wlist.do?currpage=1&btn=${btn }&wname=${wname}&yyy=${yyy}&yyyy=${yyyy}&wstatu=${wstatu}">
									首页&nbsp;</a></li>
							<li><a
								href="wlist.do?currpage=${currpages-1 }&btn=${btn }&wname=${wname}&yyy=${yyy}&yyyy=${yyyy}&wstatu=${wstatu}">上一页</a>
							</li>
							<c:forEach begin="1" end="${totalpage }" varStatus="i">
								<li><a
									href="wlist.do?currpage=${i.index }&btn=${btn }&wname=${wname}&yyy=${yyy}&yyyy=${yyyy}&wstatu=${wstatu}">${i.index}</a>
								</li>
							</c:forEach>

							<li><a
								href="wlist.do?currpage=${currpages+1 }&btn=${btn }&wname=${wname}&yyy=${yyy}&yyyy=${yyyy}&wstatu=${wstatu}">下一页</a>
							</li>
							<li><a
								href="wlist.do?currpage=${totalpage }&btn=${btn }&wname=${wname}&yyy=${yyy}&yyyy=${yyyy}&wstatu=${wstatu}">
									&nbsp;尾页</a></li>
						</ul>

					</div>
				</div>
			</div>
			<!-- 遮罩窗体 -->
			<div class="modal fade" id="modal-container-291322" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								提现查看 <a id="mods " href="#modal-container-291322" role="button"
									class="btn" data-toggle="modal"><span id="spanid"></span></a>
							</h4>
						</div>
						<div class="modal-body">
							<h4>提现</h4>
							<h5>
								用户名：<font id="u1" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								可用余额：<font id="u2" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								开户名：<font id="u3" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								提现支行：<font id="u4" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								提现账号：<font id="u5" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								提现总额：<span id="u6" style="color: blue; font-size: 20px"></span>
							</h5>
							<h5>
								到账总额：<font id="u7" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								费率：<font id="u8" style="color: blue; font-size: 20px"></font>
								状态：<font id="u13" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								添加时间 ：<font id="u9" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								审核时间：<font id="u10" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								审核人：<font id="u11" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								审核备注：<font id="u12" style="color: blue; font-size: 20px"></font>
							</h5>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
						</div>
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
