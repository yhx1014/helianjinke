<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<title>币币袋</title>
	<link href="<%=basePath%>css/common.css" rel="stylesheet" />
	<link href="<%=basePath%>css/register.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
	<script src="<%=basePath%>script/login.js" type="text/javascript"></script>
</head>

<body>
	<!-- 导航栏 -->
	<jsp:include page="head.jsp"></jsp:include>
	
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
							maxlength="24" tabindex="1" autocomplete="off">  </li>
						<li><span class="dis">密码：</span><input class="input"
							type="password" name="upassword" id="password" maxlength="24"
							tabindex="1" autocomplete="off">  </li>
						<li class="btn"><input type="submit" class="radius1"
							value="立即登录" ></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
<!--网站底部-->
 <jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
