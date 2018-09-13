<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=basePath%>css/common.css" rel="stylesheet" />
<link href="<%=basePath%>css/register.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
</head>
<body>
 <!-- 导航栏 --><jsp:include page="head.jsp"></jsp:include>

<!--注册-->
<div class="wrap">
  <div class="tdbModule register">
    <div class="registerTitle">注册账户</div>
    <div class="registerLc3">
      <p class="p1">填写账户信息</p>
      <p class="p2">验证手机信息</p>
      <p class="p3">注册成功</p>
    </div>
    <div class="registerCont">
      <ul>
        <li class="scses"> ${unickname }， 注册成功！<a class="blue" href="#" target="_blank">欢迎注册...</a></li>
        
        <li class="rz"><a href="#" class="btn">立即开通</a>
        
        <a href="#" class="blue">进入我的账户</a></li>
      </ul>
    </div>
  </div>
</div>
<!--网站底部-->
 <jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>