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
				<h1 class="title">管理团队</h1>
				<p class="mt20 cn_line">
				亿人宝以金融创新基因吸引了来自国内五百强知名企业的业界精英，目前团队成员年轻朝气、充满活力，热爱新事物，勇于接受新挑战，团队成员有信心和决心，要用人人共享的理念在金融改革的浪潮中乘风破浪，要为普通大众创造财富增值的机会，为诚信经营者提供高效便捷的金融服务。 
				</p>
				<c:forEach items="${list}" var="list">
				<div style="padding:20px 0;border-bottom:1px dashed #dbdbdb" class="clearfix">
					<div class="img fl" style="width:130px;">
						<img src="${list.noticepicture }" height="160px" width="120px">
					</div>
					<div class="fl" style="width:790px;margin-left:20px;">
						<p>
							<span style="font-size:18px;color:#0aaae1;">${list.noticetitle }</span>
						</p>
						<p style="font-size:16px;line-height:32px;color:#595757">
							${list.noticecontent}  
						</p>
					</div>
				</div>
			</c:forEach>
				<h1 class="title">组织机构</h1><br>
				<p>
					<img src="<%=basePath%>images/org.png" alt="亿人宝-组织机构" title="亿人宝-组织机构">
				</p>
			</div>
		</div>

  </div>
</div>


<!-- 导航栏 --><jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>