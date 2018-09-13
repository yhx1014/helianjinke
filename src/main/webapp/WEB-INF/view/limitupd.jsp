<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
    	function manage(){
    		var lis=$("input:checkbox");
			for(var i=0;i<3;i++){
				lis[i].checked=true;
			}
    	}
    	function manage1(){
			var lis=$("input:checkbox");
			for(var i=0;i<3;i++){
				lis[i].checked=false;
			}
    	}
    	function caiwu(){
    		var lis=$("input:checkbox");
			for(var i=3;i<9;i++){
				lis[i].checked=true;
			}
    	}
    	function caiwu1(){
    		var lis=$("input:checkbox");
			for(var i=3;i<9;i++){
				lis[i].checked=false;
			}
    	}
    	function renzhengxiang(){
    		var lis=$("input:checkbox");
			for(var i=9;i<14;i++){
				lis[i].checked=true;
			}
    	}
    	function renzhengxiang1(){
    		var lis=$("input:checkbox");
			for(var i=9;i<14;i++){
				lis[i].checked=false;
			}
    	}
    	
    	function jiedai(){
    		var lis=$("input:checkbox");
			for(var i=14;i<24;i++){
				lis[i].checked=true;
			}
    	}
    	function jiedai1(){
    		var lis=$("input:checkbox");
			for(var i=14;i<24;i++){
				lis[i].checked=false;
			}
    	}
    	
    </script>
    <script>
	function sub(){
		document.getElementById("frm").submit();
	}
</script>
</head>
<body>
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<!--main content start-->
	<section id="main-content"> <section class="wrapper">

	<!-- 内容开始 -->
	<div class="col-md-12 mt">
		<div class="content-panel">
			<form action="<%=basePath%>limit/upd.do" method="post" name="frm">
				<%
					List lists=(List)request.getAttribute("listss");
				%>
				<input type="hidden" name="eid" value="${eid }">
				<h4 style="padding-bottom: 0px;">管理组</h4>
				
				
				&nbsp;&nbsp;&nbsp;&nbsp;<input  class="btn btn-success" type="button" onclick="manage()" value="全选" />
				&nbsp;&nbsp;<input class="btn btn-primary" type="button"
					onclick="manage1()" value="取消全选" /> <br />&nbsp;&nbsp; <input type="checkbox"
					value="1" name="inp" id="inp" <% if (lists.contains("1")) {%>
					checked="checked" <%}%>> 部门管理
				&nbsp;&nbsp; <input type="checkbox"
					value="2" name="inp" id="inp" <% if (lists.contains("2")) {%>
					checked="checked" <%}%>> 员工管理
				&nbsp;&nbsp;
				<input type="checkbox"
					value="3" name="inp" id="inp" <%if (lists.contains("3")) {%>
					checked="checked" <%}%>> 用户管理
				<h4>财务管理</h4>
				&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-success" type="button" onclick="caiwu()" value="全选" />
				&nbsp;&nbsp;<input type="button"
					onclick="caiwu1()" class="btn btn-primary" value="取消全选" /> <br />
					&nbsp;&nbsp; <input type="checkbox"
					value="4" name="inp" <%if (lists.contains("4")) {%>
					checked="checked" <%}%>> 提现管理
				&nbsp;&nbsp; <input type="checkbox"
					value="5" name="inp" <%if (lists.contains("5")) {%>
					checked="checked" <%}%>> 银行卡管理
				&nbsp;&nbsp; <input type="checkbox"
					value="6" name="inp" <%if (lists.contains("6")) {%>
					checked="checked" <%}%>> 充值记录
				&nbsp;&nbsp; <input type="checkbox"
					value="7" name="inp" <%if (lists.contains("7")) {%>
					checked="checked" <%}%>> 手续费记录
				&nbsp;&nbsp; <input type="checkbox"
					value="8" name="inp" <%if (lists.contains("8")) {%>
					checked="checked" <%}%>> 交易记录
				&nbsp;&nbsp; <input type="checkbox"
					value="9" name="inp" <%if (lists.contains("9")) {%>
					checked="checked" <%}%>> 借贷信息列表
					
					

				<h4>认证项管理</h4>
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-success" onclick="renzhengxiang()" value="全选" />

				&nbsp;&nbsp;<input type="button"
					onclick="renzhengxiang1()" class="btn btn-primary" value="取消全选" /> <br /> &nbsp;&nbsp; <input
					type="checkbox" value="10" name="inp" <%if (lists.contains("10")) {%>
					checked="checked" <%}%>> 信用额度申请 &nbsp;&nbsp; <input
					type="checkbox" value="11" name="inp"
					<%if (lists.contains("11")) {%> checked="checked" <%}%>>
				新用户认证资料 &nbsp;&nbsp; <input type="checkbox" value="12" name="inp"
					<%if (lists.contains("12")) {%> checked="checked" <%}%>>
				用户资料认证 &nbsp;&nbsp; <input type="checkbox" value="13" name="inp"
					<%if (lists.contains("13")) {%> checked="checked" <%}%>>
				认证资料统计 &nbsp;&nbsp; <input type="checkbox" value="14" name="inp"
					<%if (lists.contains("14")) {%> checked="checked" <%}%>>
				认证项设置
				<h4>借贷管理</h4>
				&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-success" type="button" onclick="jiedai()" value="全选" />

				&nbsp;&nbsp;<input type="button"
					onclick="jiedai1()" class="btn btn-primary" value="取消全选" /> <br />
				
				
				 &nbsp;&nbsp; <input type="checkbox"
					value="15" name="inp" <%if (lists.contains("15")) {%>
					checked="checked" <%}%>> 投标列表&nbsp;&nbsp;
				<input type="checkbox"
					value="16" name="inp" <%if (lists.contains("16")) {%>
					checked="checked" <%}%>> 添加投标&nbsp;&nbsp;
				<input type="checkbox"
					value="17" name="inp" <%if (lists.contains("17")) {%>
					checked="checked" <%}%>> 标种列表&nbsp;&nbsp;
				<input type="checkbox"
					value="18" name="inp" <%if (lists.contains("18")) {%>
					checked="checked" <%}%>> 添加标种
				&nbsp;&nbsp;<input type="checkbox"
					value="19" name="inp" <%if (lists.contains("19")) {%>
					checked="checked" <%}%>> 所有借款
				&nbsp;&nbsp;
				<input type="checkbox"
					value="20" name="inp" <%if (lists.contains("20")) {%>
					checked="checked" <%}%>> 待审核借款<br>
				&nbsp;&nbsp;
				<input type="checkbox"
					value="21" name="inp" <%if (lists.contains("21")) {%>
					checked="checked" <%}%>> 招标中的借款
				&nbsp;&nbsp;
				&nbsp;&nbsp;<input type="checkbox"
					value="22" name="inp" <%if (lists.contains("22")) {%>
					checked="checked" <%}%>> 还款
				&nbsp;&nbsp;<input type="checkbox"
					value="23" name="inp" <%if (lists.contains("23")) {%>
					checked="checked" <%}%>> 满标借款
				&nbsp;&nbsp;
				<input type="checkbox"
					value="24" name="inp" <%if (lists.contains("24")) {%>
					checked="checked" <%}%>> 还款方式
				&nbsp;&nbsp;

				<h4>权限管理</h4>
				&nbsp;&nbsp; <input
					type="checkbox" value="100" name="inp"
					<%if (lists.contains("100")) {%> checked="checked" <%}%>>
				权限管理
				<br />
				
			<!-- 	<button onClick="sub();" type="submit" class="btn btn-primary btn-lg btn-block"><font><font class=""> 保存</font></font>
				
				</button> -->
				
				
				
				&nbsp;&nbsp;&nbsp;&nbsp;<button onClick="sub();" class="btn btn-success" type="submit">
					 保存
				</button>&nbsp;&nbsp;
				<a href="javascript:history.go(-1)" style="text-decoration: none;"><button class="btn btn-primary">返回</button></a>
			</form>

		</div>
	</div>
	<!-- 内容结束 --> </section> </section>
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
</html>