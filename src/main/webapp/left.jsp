<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>   

<html>
<body>
<div id="personal-left" class="personal-left">
      <ul>
        <li class="pleft-cur"><span><a href="query.do?id=${user.uid}"><i class="dot dot1"></i>个人中心</a></span></li>
        <li class=""><span><a href="queryinfo.do?id=${user.uid}"><i class="dot dot02"></i>我的订单</a> </span> </li>
      </ul>
    </div>
</body>
</html>