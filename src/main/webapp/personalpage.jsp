<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>   
<html>
	<head>
		<title>币币袋</title>
		<link href="<%=basePath%>css/common.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/user.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jquery.datetimepicker.css"/>
		<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
		<script src="<%=basePath%>script/user.js" type="text/javascript"></script>
		<style type="text/css">
		
		</style>
	</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>	
    <div class="w1200 personal">
	   <jsp:include page="left.jsp"></jsp:include>
       <div class="personal-main">
	        <div class="pmain-profile">
		        <div class="pmain-user">
		          <div class="user-info user-info1">
		          	基本资料
		            <ul>
		              <li>用户名:<span>${user.unickname}</span></li>
		              <li>电话号:<span>${user.uphonenumber}</span></li>
		              <li>ETH地址:<span>${user.ethaddress}</span></li>
		            </ul>
		          </div>
		        </div>
	        </div>
      </div>
    	<div class="personal-main">
        <div class="pmain-profile" >
        <div class="pmain-user">
          <div class="user-info user-info1">
          	安全设置
            <ul>
              <li>手机绑定:<span>${user.umailbox}</span></li>
              <li>邮箱绑定:<span>${user.uphonenumber}</span></li>
              <li>登录密码:<span>${user.upassword}</span></li>
              <li>资金密码:<span>${user.upwd_zd}</span></li>
</ul>
          </div>
        </div>
    </div>
</div>
    	<div class="personal-main">
        <div class="pmain-profile">
        <div class="pmain-user">        <div class="user-info user-info1">
                     身份认证
            <ul>
              <li>初级实名认证:<span>${user.unickname}</span></li>
              <li>高级实名认证:<span>${user.uphonenumber}</span></li>
            </ul>
          </div>
        </div>
    </div>
</div>
</div>
	 <jsp:include page="bottom.jsp"></jsp:include>	
</body>
</html>