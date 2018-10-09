<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>币币袋</title>
<link href="<%=basePath%>css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/user.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/jquery.datetimepicker.css" />
<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
<script src="<%=basePath%>script/user.js" type="text/javascript"></script>
<style type="text/css">
.hr2 {
	height: 2px;
	border: none;
	border-top: 1px solid #000;
}

.table-tr {
	display: table-row;
	width: 100%;
	height: 40px;
}

.table-th {
	width: 40%;
	display: table-cell;
}

.table-td {
	width: 30%;
	color: #999;
	display: table-cell;
}

.table-last {
	text-align: right;
	width: 30%;
	display: table-cell;
}

.user-title {
	
}

.user-title span {
	font-size: initial;
	font-weight: bold;
}

.user-icon {
	width: 30px;
	height: 20px;
	margin-right: 3px; 
	display : inline-block;
	background-image: url(images/bor_pic01.png);
	display: inline-block;
}

.security-setting-icon {
	width: 30px;
	height: 20px;
	margin-right: 3px;
	display: inline-block;
	background-image: url(images/bor_pic07.png)
}

.identity-auth-icon {
	width: 30px;
	height: 20px;
	margin-right: 3px;
	display: inline-block;
	background-image: url(images/bor_pic05.png)
}
</style>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="w1200 personal">
		<jsp:include page="left.jsp"></jsp:include>
		<div class="personal-main">
			<div class="pmain-profile">
				<div class="pmain-user">
					<div class="user-title">
						<i class="user-icon"></i> <span>基本资料</span>
						<hr />
					</div>
					<div class="user-info">
						<div class="table-tr">
							<div class="table-th">UID</div>
							<div class="table-td">TDKNSK394230203</div>
							<div class="table-last">
								<span><a>更换</a></span>
							</div>
						</div>
						<div class="table-tr">
							<div class="table-th">手机号</div>
							<div class="table-td">+86 123****456</div>
							<div class="table-last">
								<span><a>更改</a></span>
							</div>
						</div>
						<div class="table-tr">
							<div class="table-th">邮箱</div>
							<div class="table-td">1234***26@qq.com</div>
							<div class="table-last">
								<span><a>更改</a></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="personal-main">
			<div class="pmain-profile">
				<div class="pmain-user">
					<div class="user-title">
						<i class="security-setting-icon"></i> <span>安全设置</span>
						<hr />
					</div>
					<div class="user-info">
						<div class="table-tr">
							<div class="table-th">手机绑定</div>
							<div class="table-td">+86 123****456</div>
							<div class="table-last">
								<span><a>更换手机号</a></span>
							</div>
						</div>
						<div class="table-tr">
							<div class="table-th">邮箱绑定</div>
							<div class="table-td">1234***26@qq.com</div>
							<div class="table-last">
								<span><a>更改</a></span>
							</div>
						</div>
						<div class="table-tr">
							<div class="table-th">登录密码</div>
							<div class="table-td">1234***26@qq.com</div>
							<div class="table-last">
								<span><a>更改</a></span>
							</div>
						</div>
						<div class="table-tr">
							<div class="table-th">资金密码</div>
							<div class="table-td">1234***26@qq.com</div>
							<div class="table-last">
								<span><a>更改</a></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="personal-main">
			<div class="pmain-profile">
				<div class="pmain-user">
					<div class="user-title">
						<i class="identity-auth-icon"></i><span>身份认证</span>
						<hr />
					</div>
					<div class="user-info">
						<div class="table-tr">
							<div class="table-th">初级实名认证</div>
							<div class="table-td">未认证</div>
							<div class="table-last">
								<span><a>认证</a></span>
							</div>
						</div>
						<div class="table-tr">
							<div class="table-th">高级实名认证</div>
							<div class="table-td">未认证</div>
							<div class="table-last">
								<span><a>认证</a></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>