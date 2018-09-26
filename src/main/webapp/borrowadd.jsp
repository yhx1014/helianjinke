<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<head>
	<title>币币袋</title>
	<link href="css/style.css" rel="stylesheet" />
	<link href="css/newstyle.css" rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="css/colorbox.css">
	<link href="<%=basePath%>css/common.css" rel="stylesheet" />
	<style>
    	.applyc{ width:1200px; background:#fff; margin:13px auto;} 
		.applyc1{ padding:50px 38px 70px;}
	</style>
</head>

<body>
	 <jsp:include page="head.jsp"></jsp:include>
<div class="applyc">
     <div class="applyc1 clearfix">你还好吗</div>
</div>
	<jsp:include page="bottom.jsp"></jsp:include>	
</body>
</html>
