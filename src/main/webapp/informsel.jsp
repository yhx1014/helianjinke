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

<div class="bg">
  <div class="contain" id="tabs" style="margin:0 auto;">
<!--左导航栏--><jsp:include page="my_ue.jsp"></jsp:include>
 
    <div class="text-box">
			<div class="text-content" id="text-content">
				<header class="article-header">
					<div class="article-title"><a href="#">${notice.noticetitle }</a></div>
					<div class="article-meta">
						<span class="item"><fmt:formatDate value="${notice.noticelasttime }"/></span>
						<span class="item">分类：
							<a rel="category tag" href="#">媒体报道</a>
						</span>
						<span class="item post-views">官方消息</span>
					</div>
				</header>
				<article class="article-content">
					<p style="text-align: center;"><br></p>
					<p style="text-align: center;">
						<img width="900px" height="400px" src="${notice.noticepicture }" >
					</p>
					<p style="padding-top: 10px; list-style-type: none; margin-top: 0px; margin-bottom: 0px; outline: invert none medium; list-style-image: none; text-indent: 2em; color: rgb(51, 51, 51); font-family: ''; font-size: 14px; font-style: normal; font-variant: normal; line-height: 25.2000007629395px; white-space: normal;">
					 ${notice.noticecontent }
					</p>
					<p></p>				
				</article>
				
			</div>
		</div>
  </div>
</div>


<!-- 导航栏 --><jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>