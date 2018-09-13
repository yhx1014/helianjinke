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
</head>
<body>
<!--关于我们-->
 
    <div class="text-nav">
      <ul class="clearfix">
        <!-- <li class="selected"> <a class="text-link" href="网站公告.html">网站公告</a> </li> -->
        <li> <a class="text-link" href="${pageContext.request.contextPath}/notice/notlist.do?ids=1">网站公告</a> </li>
        <li> <a class="text-link" href="${pageContext.request.contextPath}/notice/notlist.do?ids=2">媒体报道</a> </li>
        <li> <a class="text-link" href="${pageContext.request.contextPath}/introduce.jsp">公司简介</a> </li>
        <li> <a class="text-link" href="${pageContext.request.contextPath}/notice/notlist.do?ids=3">管理团队</a> </li>
        <li> <a class="text-link" href="${pageContext.request.contextPath}/notice/notlist.do?ids=4">合作伙伴</a> </li>
        <li> <a class="text-link" href="${pageContext.request.contextPath}/notice/notlist.do?ids=5">团队风采</a> </li>
        <li> <a class="text-link" href="${pageContext.request.contextPath}/policy.jsp">法律政策</a> </li>
        <li> <a class="text-link" href="${pageContext.request.contextPath}/statement.jsp">法律声明</a> </li>
        <li> <a class="text-link" href="${pageContext.request.contextPath}/postage.jsp">资费说明</a> </li>
        <li> <a class="text-link" href="${pageContext.request.contextPath}/recruit.jsp">招贤纳士</a> </li>
        <li> <a class="text-link" href="${pageContext.request.contextPath}/contact.jsp">联系我们</a> </li>
      </ul>
    </div>


 

</body>
</html>