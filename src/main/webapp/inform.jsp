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
<title>亿人网--网站公告</title>
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
				<h1 class="title">
				<c:if test="${idss==1}">网站公告</c:if>
				<c:if test="${idss==2}">媒体报道</c:if>
				<c:if test="${idss==3}">管理团队</c:if>
				<c:if test="${idss==4}">合作伙伴</c:if>
				<c:if test="${idss==5}">团队风采</c:if>
				</h1>
				<ul class="clearfix mt20 new-list">
				<c:forEach items="${list }" var="notice">
					<li class="clearfix list-item">
						<a href="${pageContext.request.contextPath}/notice/notget.do?ids=${notice.noticeid }">${notice.noticetitle }</a>
						<span>
							<fmt:formatDate value="${notice.noticelasttime }"/>
</span>
					</li>
				</c:forEach>
				</ul>
				<div class="page">
					<span class="count"></span>
					<div class="fr pages">
						<span data-page="1" class="currents">1</span>
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