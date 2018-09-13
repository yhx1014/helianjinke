<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
<title>亿人网--媒体报道</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=basePath%>css/common.css" rel="stylesheet" />
<link href="<%=basePath%>css/about.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
</head>
<body>
 <!-- 导航栏 --><jsp:include page="head.jsp"></jsp:include>


<!--关于我们-->
<div class="bg">
  <div class="contain" id="tabs" style="margin:0 auto;">
  
    <!--关于我们--><jsp:include page="my_ue.jsp"></jsp:include>
    
    <div class="text-box">
			<div class="text-content" id="text-content">
				<h1 class="title">媒体报道</h1>
				<ul class="clearfix mt20 new-list">
				<c:forEach items="${list }" var="notice">
					<li class="clearfix list-item">
						<a href="${notice.noticeid }">${notice.noticetitle }</a>
						<span>
							<fmt:formatDate value="${notice.noticelasttime }"/>
						</span>
					</li>
				</c:forEach>
				</ul>
				<div class="page">
					<span class="all">共有163条信息</span>
					<span class="count"></span>
					<div class="fr pages">
						<span data-page="1" class="currents">1</span>
						<a data-page="2" href="#">2</a>
						<a data-page="3" href="#">3</a>
						<a data-page="4" href="#">4</a>
						<a data-page="5" href="#">5</a>
						<a data-page="6" href="#">6</a>
						<span>...</span>
						<a data-page="16" href="#">16 </a>
						<a data-page="17" href="#">17 </a>
						<a data-page="2" class="next" href="#">下一页</a>
						<a data-page="17" class="last" href="#">尾页</a>
					</div>
				</div>
			</div>
		</div>
  </div>
</div>
<!-- 导航栏 --><jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>