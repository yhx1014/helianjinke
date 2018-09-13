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
	function findother(){
		var uname = $('#uname').val();
		var zflx = $('#zflx').val();
		var statu = $('#statu').val();
		var yyy = $('#yyy').val();
		var yyyy = $('#yyyy').val();
		if (yyy > yyyy) {
			alert("第二个日期不能小于第一个日期");
		} else {
			location.href = "rech.do?uname=" + uname + "&yyy=" + yyy
					+ "&yyyy=" + yyyy + "&zflx=" + zflx+"&statu="+statu;
		}
	}
	
	function look(uname,zname,czlx,lsh,czmoney,fl,dzmoney,cztime,statu){
		$('#u1').html(uname);
		$('#u2').html(zname);
		$('#u3').html(czlx);
		$('#u4').html(lsh);
		$('#u6').html(czmoney);
		$('#u7').html(fl);
		$('#u8').html(dzmoney);
		var d = new Date(cztime);
		$('#u5').html(d.toLocaleDateString());
		$('#u9').html(statu);
		$('#spanid').click();
	}
	</script>

</head>

<body>
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<section id="main-content">
		<section class="wrapper">
			<div class="content-panel">
				<h3>
					&nbsp; &nbsp;<i class="fa fa-angle-right"></i> 充值记录
				</h3>
				<br> &nbsp; &nbsp; &nbsp; 
				用户名：<input type="text"  id="uname">
				 
				 &nbsp; &nbsp; &nbsp; 
				提交时间：<input type="text" readonly="readonly" id="yyy" class="Wdate"	onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})">--
				<input type="text" readonly="readonly" id="yyyy" class="Wdate"	onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})">
				 &nbsp; &nbsp;&nbsp; 
				 <select id="zflx">
				 	<option value="">请选择</option>
				 	<option value="环迅支付">环迅支付</option>
				 	<option value="固付宝">固付宝</option>
				 	<option value="线下充值">线下充值</option>
				 	<option value="手工充值">手工充值</option>
				 	<option value="奖励充值">奖励充值</option>
				 </select>
				 <select id="statu">
				 	<option value="">请选择</option>
				 	<option value="成功">成功</option>
				 	<option value="失败">失败</option>
				 </select>
				 <button type="button" class="btn btn-default btn-danger"	onclick="findother()">查找</button>
				 <br> <br>
				 

				<div class="row clearfix">
					<div class="col-md-12 column">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>编号</th>
									<th>用户名</th>
									<th>真实姓名</th>
									<th>充值类型</th>
									<th>流水号</th>
									<th>充值金额</th>
									<th>费率</th>
									<th>到账金额</th>
									<th>充值时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${lrc }" var="w" varStatus="i">
									<tr>
										<td>${i.index+1}</td>
										<td>${w.uname }</td>
										<td>${w.zname }</td>
										<td>${w.czlx }</td>
										<td>${w.lsh }</td>
										<td>${w.czmoney }</td>
										<td>${w.fl }</td>
										<td>${w.dzmoney }</td>
										<td><fmt:formatDate value="${w.cztime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td>${w.statu }</td>
										<td><a onclick="look('${w.uname }','${w.zname }','${w.czlx }','${w.lsh }','${w.czmoney }','${w.fl }','${w.dzmoney }','${w.cztime }','${w.statu }');">查看</a></td>
									</tr>
								</c:forEach>	
							</tbody>			
					</table>
					
					&nbsp; &nbsp;&nbsp; 总计&nbsp; &nbsp;&nbsp; 充值总额：${czmoneyre }&nbsp; &nbsp;&nbsp; 到账总额：${dzmoneyre }<br><br>
					&nbsp; &nbsp;&nbsp; 共有${totalrow }条数据， <a href="putexcelr.do"><button type="button"
						class="btn btn-default btn-inverse">导出excel</button></a> <br>
					<br>&nbsp; &nbsp;&nbsp; 第${currpages }页/总${totalpage }页<br><br>&nbsp; &nbsp;&nbsp; 
					<ul class="pagination">
				<li>
					 <a href="rech.do?currpage=1&uname=${uname }&yyy=${yyy}&yyyy=${yyyy}&statu=${statu}&zflx=${zflx}">首页</a>
				</li>
				<li>
					 <a href="rech.do?currpage=${currpages-1 }&uname=${uname }&yyy=${yyy}&yyyy=${yyyy}&statu=${statu}&zflx=${zflx}">上一页</a>
				</li>
				<c:forEach begin="1" end="${totalpage }" varStatus="i">
								<li><a
									href="rech.do?currpage=${i.index}&uname=${uname }&yyy=${yyy}&yyyy=${yyyy}&statu=${statu}&zflx=${zflx}">${i.index}</a>
								</li>
							</c:forEach>
				<li>
					 <a href="rech.do?currpage=${currpages+1}&uname=${uname }&yyy=${yyy}&yyyy=${yyyy}&statu=${statu}&zflx=${zflx}">下一页</a>
				</li>
				<li>
					 <a href="rech.do?currpage=${totalpage}&uname=${uname }&yyy=${yyy}&yyyy=${yyyy}&statu=${statu}&zflx=${zflx}">尾页</a>
				</li>
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
								银行卡详情显示 <a id="mods " href="#modal-container-291322" role="button"
									class="btn" data-toggle="modal"><span id="spanid"></span></a>
							</h4>
						</div>
						<div class="modal-body">
							
							<h5>
								用户名：<font id="u1" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								真实姓名：<font id="u2" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								充值类型：<font id="u3" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								流水号：<font id="u4" style="color: blue; font-size: 20px"></font>
							</h5>
							
							<h5>
								添加时间：<span id="u5" style="color: blue; font-size: 20px"></span>
							</h5>
							<h5>
								充值总额：<font id="u6" style="color: blue; font-size: 20px"></font>
								费率：<font id="u7" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								到账总额：<font id="u8" style="color: blue; font-size: 20px"></font>
							</h5>
							<h5>
								状态：<font id="u9" style="color: blue; font-size: 20px"></font>
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
