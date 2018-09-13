<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="<%=basePath%>assets/css/select2.min.css" rel="stylesheet">
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
<script src="<%=basePath%>assets/js/chart-master/Chart.js"></script>
<script src="<%=basePath%>assets/My97DatePickers/WdatePicker.js"></script>

<script type="text/javascript" charset="utf-8"
	src="<%=basePath%>view/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=basePath%>view/Ueditor/ueditor.all.min.js">
	
</script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="<%=basePath%>view/Ueditor/lang/zh-cn/zh-cn.js"></script>
<!--   时间插件  -->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/css/jquery.datetimepicker.css" />
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
	<script type="text/javascript">
		$(document).ready(
				function() {
					var myDate = new Date();
					myDate.getYear(); //获取当前年份(2位)
					myDate.getFullYear(); //获取完整的年份(4位,1970-????)
					myDate.getMonth() + 1; //获取当前月份(0-11,0代表1月)
					myDate.getDate(); //获取当前日(1-31)
					myDate.getDay(); //获取当前星期X(0-6,0代表星期天)
					myDate.getTime(); //获取当前时间(从1970.1.1开始的毫秒数)
					myDate.getHours(); //获取当前小时数(0-23)
					myDate.getMinutes(); //获取当前分钟数(0-59)
					myDate.getSeconds(); //获取当前秒数(0-59)
					myDate.getMilliseconds(); //获取当前毫秒数(0-999)
					myDate.toLocaleDateString(); //获取当前日期

					var mytime = myDate.getFullYear() + "-"
							+ (myDate.getMonth() + 1) + "-" + myDate.getDate()
							+ " " + myDate.getHours() + ":"
							+ myDate.getMinutes(); //获取当前时间
					$("#ptime").val(mytime);
					$("#ppublishtime").val(mytime);
					$("#pcount").val(mytime);

				});
	</script>
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<!-- 内容开始 -->
			<div class="showback">
				<h4>
					<i class="fa fa-angle-right"></i> 添加投标
				</h4>
				<!-- 页面内容 -->
				<form:form id="inputForm" modelAttribute="domain"
					class="form-horizontal tasi-form"
					action="${pageContext.request.contextPath}/product/save.do"
					method="post" enctype="multipart/form-data">
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">预期年化收益<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="pincome" path="pincome"
								cssClass="form-control input-sm" maxlength="11" />

						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">项目期限<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="ptime" path="ptime"
								cssClass="form-control input-sm" maxlength="11" readonly="true"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" />

						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2  control-label"> 类型：</label>
						<div class="col-sm-5">
							<select class="form-control" name="btype"><option value="请选择">请选择</option>
								<c:forEach var="list" items="${blist}">
									<option >${list.bname}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">还款方式<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="pway" path="pway"
								cssClass="form-control input-sm" maxlength="11" />

						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">借款期限<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="pcount" path="pcount"
								cssClass="form-control input-sm" maxlength="11" readonly="true"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"  />

						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">投资进度<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="progress" path="progress"
								cssClass="form-control input-sm" maxlength="11" />

						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">投资进度<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="progress" path="progress"
								cssClass="form-control input-sm" maxlength="11" />

						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">保障方式<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="psaveway" path="psaveway"
								cssClass="form-control input-sm" maxlength="11" />

						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">需还本息<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="prateben" path="prateben"
								cssClass="form-control input-sm" maxlength="11" />

						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="inputSuccess">发布时间<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="ppublishtime" path="ppublishtime"
								cssClass="form-control input-sm" readonly="true"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" />
						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="pname">产品名称<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="pname" path="pname"
								cssClass="form-control input-sm" maxlength="11" />
						</div>
					</div>

					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="ptotalmoney">募集资金<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="ptotalmoney" path="ptotalmoney"
								cssClass="form-control input-sm" maxlength="11" />

						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="prate">投资范围<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="prange" path="prange"
								cssClass="form-control input-sm" maxlength="11" />

						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="puse">资金用途<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="puse" path="puse"
								cssClass="form-control input-sm" maxlength="11" />

						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="pinway">状态<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="pstate" path="pstate"
								cssClass="form-control input-sm" maxlength="11" />

						</div>
					</div>

					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="psource">封面<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<input type="file" name="pictures"
								cssClass="form-control input-sm" />
						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="pproduce">标主ID<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="pproduce" path="pproduce"
								cssClass="form-control input-sm" maxlength="11" />
						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="pproduce">保障措施<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="psafe" path="psafe"
								cssClass="form-control input-sm" maxlength="11" />
						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="pdesc">项目描述<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="pdesc" path="pdesc"
								cssClass="form-control input-sm" maxlength="11" />
						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="psafe">保障措施<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="psafe" path="psafe"
								cssClass="form-control input-sm" maxlength="11" />
						</div>
					</div>

					<%-- 
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="details.dname">详情标题<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="details.dname" path="details.dname"
								cssClass="form-control input-sm" maxlength="11" />
							 
						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="details.dcontent">详情内容<font
							color="red"> *</font></label>
						<div class="col-lg-5">
							<form:input id="details.dcontent" path="details.dcontent"
								cssClass="form-control input-sm" maxlength="11" />
						</div>
					</div>
					<div class="form-group has-success">
						<label class="col-sm-2 control-label col-lg-2" for="details.dtype">详情类型<font
							color="red"> *</font></label>
						<div class="col-lg-5">
						<select class="form-control" name="details.dtype"><option>请选择</option>
									<option value="0">借款人信息模块</option>
									<option value="1">风控步骤模块</option>
									<option value="2">图片信息模块</option>
							</select>
						</div>
					</div> --%>
					<br />
					<br />
					<button type="submit" class="btn btn-primary btn-lg btn-block">点击提交</button>

				</form:form>
				<!-- 页面内容 -->
			</div>
			<!-- 内容结束 -->
		</section>
	</section>
	<!-- /MAIN CONTENT -->
</body>




<script>
<!-- 实例化编辑器 -->
	var ue = UE.getEditor('pdesc', {
		toolbars : [
				[ 'fullscreen', 'source', 'undo', 'redo' ],
				[ 'bold', 'italic', 'underline', 'fontborder', 'strikethrough',
						'superscript', 'subscript', 'removeformat',
						'formatmatch', 'autotypeset', 'blockquote',
						'pasteplain', '|', 'forecolor', 'backcolor',
						'insertorderedlist', 'insertunorderedlist',
						'selectall', 'cleardoc' ] ],
		initialStyle : 'p{line-height:30px;font-size: 20px;}'//设置默认字体大小 行高等
	});

	$(function() {
		$('select.styled').customSelect();
	});
</script>
</html>
