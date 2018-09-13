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
		$.post("bajax.do", {
			"id" : id
		}, function(date) {
			
		
			$('#u1').html(date.brelname);
			$('#u2').html(date.bpass);
			$('#u3').html(date.btype);
			$('#u4').html(date.btitle);
			$('#u5').html(date.bmoney);
			$('#u6').html(date.brate);
			$('#u7').html(date.btimelimit);
			$('#u8').html(date.blimit);
			$('#u9').html(date.brecommend);
			$('#u10').html(date.bleixing);
			if(date.bleixing==0){
				$('#u10').html("车贷");
			}else if(date.bleixing==1){
				$('#u10').html("房贷");
			}
			$('#u11').html(date.beizhu1);
			$('#u12').html(date.beizhu2);
		

			if (date.bstate == 0) {
				$('#u13').html("提交申请未处理");
			} else if (date.bstate == 1) {
				$('#u13').html("后台审核通过(未还款)");
			} else if (date.bstate == 2) {
				$('#u13').html("审核失败");
			} else if (date.bstate == 3) {
				$('#u13').html("已还款");
			}

			$('#spanid').click();
		});
	}
	
</script>
</head>

<body>
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<section id="main-content">
		<section class="wrapper">
			<div class="content-panel">
				<h3>
					&nbsp; &nbsp;<i class="fa fa-angle-right"></i> 借贷信息列表
				</h3>
				
				<div class="row clearfix">
					<div class="col-md-12 column">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>编号</th>
									<th>真实姓名</th>
									<th>手机号码</th>
									<th>公司名称</th>
									<th>借款金额</th>
									<th>利率</th>
									<th>期限</th>
									<th>所在区域</th>
									<th>类型</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${wdlist }" var="w" varStatus="i">
									<tr>
										<td>${i.index+1}</td>
										<td>${w.brelname }</td>
										<td>${w.bpass }</td>
										<td>${w.btitle }</td>
										<td>${w.bmoney }</td>
										<td>${w.brate }</td>
										<td>${w.btimelimit }</td>
										<td>${w.brecommend }</td>
										<td><c:if test="${w.bleixing==0 }">车贷</c:if><c:if test="${w.bleixing==1 }">房贷</c:if> </td>
										<td><c:if test="${w.bstate==0 }">提交申请未处理</c:if>
										<c:if test="${w.bstate==1 }">后台审核通过(未还款)</c:if>
										<c:if test="${w.bstate==2 }">审核失败</c:if>
										<c:if test="${w.bstate==3 }">已还款</c:if></td>
										<td><a onclick="only('${w.id}')">查看</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						、<br> &nbsp;&nbsp;&nbsp;&nbsp; 共有${totalrow }条数据&nbsp;&nbsp;&nbsp;&nbsp;第${currpages }页/共${totalpage }页
						<br> &nbsp;&nbsp;&nbsp;&nbsp;

						<ul class="pagination">
							<li><a
								href="hjyList.do?currpage=1">
									首页&nbsp;</a></li>
							<li><a
								href="hjyList.do?currpage=${currpages-1 }">上一页</a>
							</li>
							<c:forEach begin="1" end="${totalpage }" varStatus="i">
								<li><a
									href="hjyList.do?currpage=${i.index }">${i.index}</a>
								</li>
							</c:forEach>

							<li><a
								href="hjyList.do?currpage=${currpages+1 }">下一页</a>
							</li>
							<li><a
								href="hjyList.do?currpage=${totalpage }">
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
								借贷信息列表 <a id="mods " href="#modal-container-291322" role="button"
									class="btn" data-toggle="modal"><span id="spanid"></span></a>
							</h4>
						</div>
						<div class="modal-body">
							
							<h5>
								真实姓名：<font id="u1" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								手机号码：<font id="u2" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								标ID(发布标ID)：<font id="u3" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								公司名称：<font id="u4" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								借款金额 ：<font id="u5" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								利率 ：<span id="u6" style="color: blue; font-size: 20px"></span>
							</h5>
							<h5>
								期限：<font id="u7" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								筹标期限：<font id="u8" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								所在区域 ：<font id="u9" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								类型(车贷,房贷)：<font id="u10" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								备注1(房屋面积or车辆品牌)：<font id="u11" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								备注2(房龄/所属车型)：<font id="u12" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								状态：<font id="u13" style="color: blue; font-size: 20px"></font>
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
