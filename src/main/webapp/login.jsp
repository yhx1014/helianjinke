<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<title>币币袋</title>
		<link href="<%=basePath%>css/common.css" rel="stylesheet" />
		<link href="<%=basePath%>css/register.css" rel="stylesheet" type="text/css">
	</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>	
	<style>
		.registerCont #loginform  .input{padding-left:8px;width:400px;}
		#LonginForm a{display:inline;background:none;color:#0d95dd;font-size:14px;}
	</style>
	<div class="wrap">
		<form id="LonginForm" name="LonginForm" action="<%=basePath%>users/login.do" method="post">
			<div class="tdbModule loginPage">
				<div class="registerTitle">用户登录</div>
				<div class="registerCont">
					<ul id="loginform">
						<li class="error"><span id="prrintInfo" data-info=""><span>${status}</span></span>
						</li>
						<li><span class="dis">用户名：</span>
							<input class="input"
							type="text" onblur="" name="unickname" id="userName"
							maxlength="24" tabindex="1" autocomplete="off" placeholder="手机或邮箱" />
						</li>
						<li><span class="dis">密码：</span>
							<input class="input"
							type="password" name="upassword" id="password" maxlength="24"
							tabindex="1" autocomplete="off" placeholder="请输入密码" /> 
						</li>
						<li><span class="dis">验证码：</span>
						<input type="text"
							onkeyup="verify(this)" id="jpgVerify" style="width: 310px;"
							class="input" name="yzm" data-msg="验证码" maxlength="4"
							tabindex="1" autocomplete="off"> <img
							src="<%=basePath%>/images/code.jpg" id="yanzheng" alt="点击更换验证码" title="点击更换验证码"
							style="cursor: pointer;" class="valign" onclick="this.src=''";>
						</li>
						<li class="btn">
							<input type="submit" class="radius1" style="width:400px;" value="立即登录">
							<table width="400">
								<tr><td width="300">还没有账号？ <a href="###" target="_blank">立即注册</a></td>
								<td align="right"><a href="###" target="_blank">忘记密码?</a></td></tr>
							</table>
						</li>
					</ul>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>	
</body>
</html>
