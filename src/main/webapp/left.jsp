<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>

<div id="personal-left" class="personal-left">
    <ul>
        <li><span><a href="<%=basePath%>/profile"><i class="dot dot1"></i>个人中心</a></span></li>
        <li><span><a href="<%=basePath%>/orders"><i class="dot dot02"></i>我的订单</a> </span></li>
    </ul>
</div>
