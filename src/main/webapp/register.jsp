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
<title>币币贷</title>
	<link href="<%=basePath%>/css/common.css" rel="stylesheet" />
	<link href="<%=basePath%>/css/register.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="tdbModule register">
		 	<div class="registerTitle">注册</div>
			<div class="registerCont">
			  <form action="<%=basePath%>users/insert.do" method="post">
				  <ul>
					<li class="telNumber"><span class="dis">手机号码:</span> 
					    <input type="text" class="input _phoneNum" id="phone"
						onblur="return phone();" name="uphonenumber" tabindex="1" maxlength="11">
					</li>
					
					<li><span class="dis">短信验证码:</span> 
					<input type="text"
						 onblur="return checkyanzhengma();"
						 class="input _password"
						 maxlength="16" tabindex="1">
					</li>
					
					<li><span class="dis">密码:</span> 
						<input type="password"
						 onblur="return checkupassword();"
						 name="upassword" id="password" class="input _password"
						 maxlength="16" tabindex="1"> <span id="passwordAlt"
						 data-info="6-16个字符，英文、数字组成，区分大小写">6-16个字符，英文、数字组成</span>
					</li>
					
					<li><span class="dis">确认密码:</span> 
						<input type="password"
						name="repeatPassword"
						onblur="return checkupassword1();" id="repeatPassword"
						class="input _repeatPassword" maxlength="16" tabindex="1">
						<span id="repeatPasswordAlt" data-info="请再次输入密码">请再次输入密码</span>
					</li>
					
					<li class="agree"><input name="protocol" id="protocol"
						type="checkbox" value="" checked="checked"> 我已阅读并同意《<a
						href="" target="_black">服务协议</a>》
					</li>
					
					<li class="btn"><input type="submit" class="radius_Submit"/></li>
				</ul>
			  </form>
			</div>
		</div>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function checkupassword(){
		var password = document.getElementById("password").value;
		if (password == "" || password == null) {
			//alert("请输入密码");
			return false;
		}
		if (password.length < 6) {
			//alert("密码过短!!!");
			return false;
		}
		if (password.length > 16) {
			//alert("密码过长!!!");
			return false;
		}
	}
	function checkupassword1(){
		var repeatPassword = document.getElementById("repeatPassword").value;
		var password = document.getElementById("password").value;
		if (repeatPassword == "" || repeatPassword == null) {
			//alert("请输入密码");
			return false;
		}
		if (repeatPassword.length < 6) {
			//alert("密码过短!!!");
			return false;
		}
		if (repeatPassword.length > 16) {
			//alert("密码过长!!!");
			return false;
		}
		if(password!=repeatPassword){
			 //alert("您输入的新密码与确认密码确认不一致"); 
			 return false; 
		}
	}
	function phone(){
		var phone = document.getElementById("phone").value;
		var e =/^1(3|4|5|7|8)\d{9}$/;
		if(phone.length!=11){
			//alert("请输入11位的手机号码");
			return false; 
		}
		if(e.test(phone)==false){
			 //alert("手机号码有误，请重填"); 
		     return false; 
		}
	}
</script>
</html>