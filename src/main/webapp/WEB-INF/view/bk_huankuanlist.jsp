<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<script src="<%=basePath%>assets/js/jquery.js"></script>
<script src="<%=basePath%>assets/js/jquery.datetimepicker.js"></script>
<script src="<%=basePath%>assets/js/chart-master/Chart.js"></script>
<script src="<%=basePath%>assets/My97DatePickers/WdatePicker.js"></script>


<!--   时间插件  -->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/css/jquery.datetimepicker.css"/>
<script src="<%=basePath%>assets/js/jquery.js"></script>
<script src="<%=basePath%>assets/js/jquery.datetimepicker.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-daterangepicker/date.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.datetimepicker.min.js"></script>


<script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
	src="<%=basePath%>assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="<%=basePath%>assets/js/jquery.scrollTo.min.js"></script>
<script src="<%=basePath%>assets/js/jquery.nicescroll.js"
	type="text/javascript"></script>
<script src="<%=basePath%>assets/js/common-scripts.js"></script>
<script src="<%=basePath%>assets/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="<%=basePath%>assets/js/bootstrap-switch.js"></script>
<script src="<%=basePath%>assets/js/jquery.tagsinput.js"></script>

<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>

<script src="<%=basePath%>assets/js/form-component.js"></script>

</head>

<body>
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<!-- 内容开始 -->
			<div class="showback">
				<h4>
					<i class="fa fa-angle-right"></i> 待还款查询
				</h4>
				<!-- 页面内容 -->
				<form:form id="inputForm" modelAttribute="domain"
					class="form-horizontal tasi-form"
					action="${pageContext.request.contextPath}/biao/save.do"
					method="post">
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
							<th class="numeric">利率</th>
							<th class="numeric">期限</th>
							<th class="numeric">筹标期限</th>
							<th class="numeric">状态</th>
							<th class="numeric">推荐标的</th>
							<th class="numeric">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list" varStatus="status">
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
								<td><c:if test="${list.brate eq null}">
								0
								</c:if>
									<c:if test="${list.brate !=null}">
								 ${list.brate}
								</c:if> %</td>
								<td>${list.btimelimit}</td>
								<td>${list.blimit}</td>
								<td><c:if test="${list.bstate==0}">提交申请未处理</c:if> <c:if
										test="${list.bstate==1}">后台审核通过</c:if> <c:if
										test="${list.bstate==2}">审核失败</c:if> <c:if
										test="${list.bstate==3}">已还款</c:if></td>
								<td>${list.brecommend}</td>
								<td><a href="javascript:;" data-target="#${status.index+1}"
									data-toggle="modal">查看</a>
									<a href="${pageContext.request.contextPath}/brower/tohuankuanupd.do?id=${list.id}" >还款</a>
								</td>
							</tr>
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
												<b><font><font>利率&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>${list.brate}%</font></font>
											</div>
											<div class="alert alert-info">
												<b><font><font>期限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>${list.btimelimit}</font></font>
											</div>
											<div class="alert alert-info">
												<b><font><font>筹标期限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></font></b><font><font>${list.blimit}</font></font>
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
								href="#"
								class="btn btn-success btn-ms ">首页</a> <a
								href="#"
								class="btn btn-success btn-ms ">&lt;&lt;上一页</a> <a
								href="#"
								class="btn btn-success btn-ms "> 下一页&gt;&gt;</a> <a
								href="#"
								class="btn btn-success btn-ms "> 尾页</a> 当前<font color="#0000ff">1</font><font
									color="red">/1</font>页
							</font></td>
						</tr>
					</tbody>

				</table>

				</form:form>
				<!-- 页面内容 -->
			</div>
			<!-- 内容结束 -->
		</section>
	</section>
	<!-- /MAIN CONTENT -->
</body>



<script>
	$(function() {
		$('select.styled').customSelect();
	});
</script>
</html>
