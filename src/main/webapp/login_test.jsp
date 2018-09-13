<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=basePath%>css/common.css" rel="stylesheet" />
<link href="<%=basePath%>css/register.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
<script src="<%=basePath%>script/login.js" type="text/javascript"></script>
</head>
<body>
	 <!-- 导航栏 --><jsp:include page="head.jsp"></jsp:include>	
	<!--注册-->
	<div class="wrap">
		<form id="LonginForm" name="LonginForm" action="<%=basePath%>/users/login.do" method="post">
			<div class="tdbModule loginPage">
				<div class="registerTitle">用户登录</div>
				<div class="registerCont">
					<ul>
						<li class="error"><span id="prrintInfo" data-info=""><span>${status}</span></span>
						</li>
						<li><span class="dis">用户名：</span><input class="input"
							type="text" onblur="userNameJy()" name="unickname" id="userName"
							maxlength="24" tabindex="1" autocomplete="off"> <a
							id="sssdfasdfas" href="#" class="blue">注册用户</a></li>
						<li><span class="dis">密码：</span><input class="input"
							type="password" name="upassword" id="password" maxlength="24"
							tabindex="1" autocomplete="off"> <a href="#" id="pawHide"
							class="blue">忘记密码</a></li>
						<li><span class="dis">验证码：</span><input type="text"
							onkeyup="verify(this)" id="jpgVerify" style="width: 166px;"
							class="input" name="yzm" data-msg="验证码" maxlength="4"
							tabindex="1" autocomplete="off"> <img
							src="<%=basePath%>/images/code.jpg" id="yanzheng" alt="点击更换验证码" title="点击更换验证码"
							style="cursor: pointer;" class="valign"> <a
							href="javascript:void(0);" onclick="changge();" class="blue">看不清？换一张</a>
						</li>
						<li class="btn"><input type="submit" class="radius1"
							value="立即登录" ></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
	 
	 <!-- 导航栏 --><jsp:include page="bottom.jsp"></jsp:include>	
</body>
</html>
