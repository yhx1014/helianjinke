<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path+ "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>币币贷</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=basePath%>/css/common.css" rel="stylesheet" />
<link href="<%=basePath%>/css/register.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
<script src="<%=basePath%>script/login.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>script/placeholders.min.js"></script>

</head>
<body background="imagets/background.jpeg">
	<!-- 导航栏 --><jsp:include page="head.jsp"></jsp:include>
	<!--注册-->
	<div class="wrap">
		<div class="tdbModule register">
			<div class="registerTitle">注册账户</div>
			<div class="registerLc1">
				<p class="p1">填写账户信息</p>
				<p class="p2">验证手机信息</p>
				<p class="p3">注册成功</p>
			</div>
			<div class="registerCont">
				<form action="<%=basePath%>/users/insert.do" method="post">
					<ul>
						<li><span class="dis">用户名:</span> <input type="text"
							onblur="return checkunickname();" name="unickname" id="userName"
							class="input _userName" maxlength="10" tabindex="1"> <span
							id="userNameAlt" data-info="6-10个字符，字母开头，字母、数字组成">6-10个字符，字母开头，字母、数字组成</span></li>
						<li><span class="dis">密码:</span> <input type="password"
							 onblur="return checkupassword();"
							 name="upassword" id="password" class="input _password"
							maxlength="16" tabindex="1"> <span id="passwordAlt"
							data-info="6-16个字符，英文、数字组成，区分大小写">6-16个字符，英文、数字组成</span></li>
						<li><span class="dis">确认密码:</span> <input type="password"
							name="repeatPassword"
							onblur="return checkupassword1();" id="repeatPassword"
							class="input _repeatPassword" maxlength="16" tabindex="1">
							<span id="repeatPasswordAlt" data-info="请再次输入密码">请再次输入密码</span></li>

						<li class="telNumber"><span class="dis">手机号码:</span> <input
							type="text" class="input _phoneNum" id="phone"
							onblur="return phone();"
							name="uphonenumber" tabindex="1" maxlength="11">
						<li class="agree"><input name="protocol" id="protocol"
							type="checkbox" value="" checked="checked"> 我同意《<a
							href="" target="_black">原力注册协议</a>》 <span id="protocolAlt"
							data-info="请查看协议">请查看协议</span></li>
						<li class="btn"><input type="submit" class="radius_Submit" /></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<!--网站底部-->
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
<!--custom switch-->
<!-- js placed at the end of the document so the pages load faster -->
<script src="<%=basePath%>assets/js/jquery.js"></script>
<script src="<%=basePath%>assets/js/bootstrap.min.js"></script>

<script class="include" type="text/javascript"
	src="<%=basePath%>assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="<%=basePath%>assets/js/jquery.scrollTo.min.js"></script>
<script src="<%=basePath%>assets/js/jquery.nicescroll.js" type="text/javascript"></script>

<!--common script for all pages-->
<script src="<%=basePath%>assets/js/common-scripts.js"></script>

<!--script for this page-->
<script src="<%=basePath%>assets/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="<%=basePath%>assets/js/evol-colorpicker.js"></script>

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
	src="<%=basePath%>assets/My97DatePickers/WdatePicker.js"></script>
<script type="text/javascript">
	function checkunickname() {
		var unickname = document.getElementById("userName").value;
		var k = new RegExp("^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$");
		if (unickname == "" || unickname == null) {
			alert("请输入名字");
			return false;
		}
		if (k.test(unickname) != true) {
			alert("名字不能含有非法字符");
			document.getElementById("userName").value = "";
			return false;
		}
		if (unickname.length < 6) {
			alert("用户名过短!!!");
			return false;
		}
		if (unickname.length > 10) {
			alert("用户名过长!!!");
			return false;
		}
		$.post('${pageContext.request.contextPath}/users/findByName.do', {
			"unickname" : unickname
		}, function(data) {
			var conent = data;
			if (conent == 2) {
				alert("用户名已经存在!!!");
				document.getElementById("userName").value = "";
				return false;
			}
		}, "json");
	}
	function checkupassword(){
		var password = document.getElementById("password").value;
		if (password == "" || password == null) {
			alert("请输入密码");
			return false;
		}
		if (password.length < 6) {
			alert("密码过短!!!");
			return false;
		}
		if (password.length > 16) {
			alert("密码过长!!!");
			return false;
		}
	}
	function checkupassword1(){
		var repeatPassword = document.getElementById("repeatPassword").value;
		var password = document.getElementById("password").value;
		if (repeatPassword == "" || repeatPassword == null) {
			alert("请输入密码");
			return false;
		}
		if (repeatPassword.length < 6) {
			alert("密码过短!!!");
			return false;
		}
		if (repeatPassword.length > 16) {
			alert("密码过长!!!");
			return false;
		}
		if(password!=repeatPassword){
			 window.alert("您输入的新密码与确认密码确认不一致"); 
			 return false; 
		}
	}
	function phone(){
		var phone = document.getElementById("phone").value;
		var e =/^1(3|4|5|7|8)\d{9}$/;
		if(phone.length!=11){
			alert("请输入11位的手机号码");
			return false; 
		}
		if(e.test(phone)==false){
			 alert("手机号码有误，请重填"); 
		     return false; 
		}
	}
	
</script>
</html>