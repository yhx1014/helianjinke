<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path+ "/";
%>

<!DOCTYPE html>
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
				    <li class="telNumber"><span class="dis">用户名:</span> 
					    <input type="text" class="input _phoneNum" id="phone"
						onblur="return phone();" name="unickname" tabindex="1" maxlength="11">
					</li>
				  
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
						 maxlength="16" tabindex="1"> 
						 <span id="passwordAlt" data-info="6-16个字符，英文、数字组成，区分大小写">6-16个字符，英文、数字组成</span>
					</li>
					
					<li><span class="dis">确认密码:</span> 
						<input type="password"
						name="repeatPassword"
						onblur="return checkupassword1();" id="repeatPassword"
						class="input _repeatPassword" maxlength="16" tabindex="1">
						<span id="repeatPasswordAlt" data-info="请再次输入密码">请再次输入密码</span>
					</li>
					
					<li class="agree"><input name="protocol" id="protocol"
						type="checkbox" value="" checked="checked"> 我已阅读并同意《<a href="" target="_black">服务协议</a>》
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
			return false;
		}
		if (password.length < 6) {
			return false;
		}
		if (password.length > 16) {
			return false;
		}
	}
	function checkupassword1(){
		var repeatPassword = document.getElementById("repeatPassword").value;
		var password = document.getElementById("password").value;
		if (repeatPassword == "" || repeatPassword == null) {
			return false;
		}
		if (repeatPassword.length < 6) {
			return false;
		}
		if (repeatPassword.length > 16) {
			return false;
		}
		if(password!=repeatPassword){
			 return false; 
		}
	}
	function phone(){
		var phone = document.getElementById("phone").value;
		var e =/^1(3|4|5|7|8)\d{9}$/;
		if(phone.length!=11){
			return false; 
		}
		if(e.test(phone)==false){
		     return false; 
		}
	}
</script>
</html>