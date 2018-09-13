﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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

<title>后台</title>

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="<%=basePath%>assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="<%=basePath%>assets/css/style.css" rel="stylesheet">
<link href="<%=basePath%>assets/css/style-responsive.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<%
		List list = (List) session.getAttribute("listlimit");
	%>
	<section id="container">
		<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
		<!--header start-->
		<header class="header black-bg">
			<div class="sidebar-toggle-box">
				<div class="fa fa-bars tooltips" data-placement="right"
					data-original-title="Toggle Navigation"></div>
			</div>
			<!--logo start-->
			<a href="<%=basePath%>log/tologin.do" class="logo"><b>后台管理系统</b></a>
			
			<div class="top-menu">
				<ul class="nav pull-right top-menu">
					<li><a class="logout" href="<%=basePath%>employee/exit.do">退出登录</a></li>
				</ul>
			</div>
			<!-- <div class="top-menu">
				<ul class="nav pull-right top-menu">
					<li><a class="logout"
						href="javascript:location.replace('lock_screen.jsp')">锁屏</a></li>
				</ul>
			</div> -->
		</header>
		<!--header end-->

		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu" id="nav-accordion">

					<p class="centered">
						<a href="#"><img
							src="<%=basePath%>assets/img/ui-sam.jpg" class="img-circle"
							width="60"></a>
					</p>
					<h5 class="centered">${globalemp.ename }</h5>

					<li class="mt"><a href="<%=basePath%>log/tologin.do"> <i
							class="fa fa-dashboard"></i> <span>首页</span>
					</a></li>

					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-desktop"></i> <span>管理组</span>
					</a>
						<ul class="sub">
							<li>
								<%
									if (list.contains("1")) {
								%> <a href="<%=basePath%>dept/findall.do">部门管理</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("2")) {
								%> <a href="<%=basePath%>employee/list.do">员工管理</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("3")) {
								%> <a href="<%=basePath%>users/list.do">用户管理</a> <%
 	}
 %>
							</li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-desktop"></i> <span>网站内容管理</span>
					</a>
						<ul class="sub">
							<li><a href="<%=basePath%>notice/toadd.do">添加网站通知</a></li>
							<li><a href="<%=basePath%>notice/notlists.do">查询网站通知</a></li>
							<li><a href="<%=basePath%>notice/addtupian.do">添加网站首页图片</a></li>
							<li><a href="<%=basePath%>notice/toaddlisttupian.do?ids=6">查询首页图片</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-desktop"></i> <span>财务管理</span>
					</a>
						<ul class="sub">
							<li>
								<%
									if (list.contains("4")) {
								%> <a href="<%=basePath%>wd/wlist.do">提现管理</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("5")) {
								%> <a href="<%=basePath%>bc/bankcard.do">银行卡管理</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("6")) {
								%> <a href="<%=basePath%>rc/rech.do">充值记录</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("7")) {
								%> <a href="<%=basePath%>pa/poundage.do">手续费记录</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("8")) {
								%> <a href="<%=basePath%>td/trade.do">交易记录</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("9")) {
								%> <a href="<%=basePath%>brower/hjyList.do">借贷信息列表</a> <%
 	}
 %>
							</li>
						</ul></li>

					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-desktop"></i> <span>借贷管理</span>
					</a>
						<ul class="sub">
							<li>
								<%
									if (list.contains("15")) {
								%><a href="<%=basePath%>/product/list.do">»投标列表</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("16")) {
								%><a href="<%=basePath%>/product/input.do">»添加投标</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("17")) {
								%><a href="<%=basePath%>/biao/list.do">»标种列表</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("18")) {
								%><a href="<%=basePath%>/biao/input.do">»添加标种</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("19")) {
								%><a href="<%=basePath%>/brower/qurey.do">»所有借款</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("20")) {
								%><a href="<%=basePath%>/brower/check.do">»待审核的借款</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("21")) {
								%><a href="<%=basePath%>/product/list.do?status=ing">»招标中的借款</a>
								<%
									}
								%>
							</li>
							<li>
								<%
									if (list.contains("22")) {
								%><a href="<%=basePath%>/brower/tohk.do">»还款</a> <%
 	}
 %>
							</li>
							<li>
								<%
									if (list.contains("23")) {
								%><a href="<%=basePath%>/product/list.do?status=over">»满标借款</a>
								<%
									}
								%>
							</li>
							<li>
								<%
									if (list.contains("24")) {
								%><a href="<%=basePath%>/product/list.do?status=way">»还款方式</a> <%
 	}
 %>
							</li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-cogs"></i> <span>认证项管理</span>
					</a>
						<ul class="sub">
							<li>
								<%
									if (list.contains("10")) {
								%> <a
								href="${pageContext.request.contextPath}/approve/limitApplyfor.do">»信用额度申请</a>
								<%
									}
								%>
							</li>
							<li>
								<%
									if (list.contains("11")) {
								%> <a
								href="${pageContext.request.contextPath}/approve/newuserInfoList.do">»新用户认证资料</a>
								<%
									}
								%>
							</li>
							<li>
								<%
									if (list.contains("12")) {
								%> <a
								href="${pageContext.request.contextPath}/approve/basicInfoApprove.do">»用户资料认证</a>
								<%
									}
								%>
							</li>
							<li>
								<%
									if (list.contains("13")) {
								%> <a
								href="${pageContext.request.contextPath}/approve/approveStatistics.do">»认证资料统计</a>
								<%
									}
								%>
							</li>
							<li>
								<%
									if (list.contains("14")) {
								%> <a
								href="${pageContext.request.contextPath}/approve/traverseApproves.do">»认证项设置</a>
								<%
									}
								%>
							</li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-cogs"></i> <span>权限管理</span>
					</a>
						<ul class="sub">
							<li>
								<%
									if (list.contains("100")) {
								%><a href="<%=basePath%>limit/findlist.do">权限列表</a>
								<%
									}
								%>
							</li>
						</ul></li>
				</ul>

			</div>

		</aside>
		<!--sidebar end-->

		<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
		<!--main content start-->
		<!-- /MAIN CONTENT -->

		<!--main content end-->
		<!--footer start-->
		<footer class="site-footer">
			<div class="text-center">
				2014 - Alvarez.is <a href="http://www.mycodes.net/" target="_blank">Դ��֮��</a>
				<a href="blank.html#" class="go-top"> <i class="fa fa-angle-up"></i>
				</a>
			</div>
		</footer>
		<!--footer end-->
	</section>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
	<script class="include" type="text/javascript"
		src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="assets/js/jquery.scrollTo.min.js"></script>
	<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


	<!--common script for all pages-->
	<script src="assets/js/common-scripts.js"></script>

	<!--script for this page-->

	<script>
		//custom select box

		$(function() {
			$('select.styled').customSelect();
		});
	</script>

</body>
</html>

