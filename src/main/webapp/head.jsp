<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>
<head>
    <style>
        div.login-form {
            margin-top: 33px;
        }

        div.login-form a {
            color: #fff;
            margin: 0 6px;
        }

        div.login-form a:hover {
            color: #0d95dd
        }
    </style>
    <script>
        function keys() {
            var id = "${user.uid}";
            if (id != "") {
                location.href = "<%=basePath%>/query.do?id=${user.uid}";
            } else {
                alert("请先登入!");
                location.href = "<%=basePath%>/login.do";
            }
        }
    </script>
</head>
<body>
<div class="header min-width">
    <div class="container">
        <div class="fn-left logo">
            <a class="" href="<%=basePath%>/index">
                <img src="<%=basePath%>/images/logo.png" title="logo">
            </a>
        </div>
        <ul class="top-nav fn-clear">
            <li><a href="<%=basePath%>/index">首页</a></li>
            <li><a href="<%=basePath%>/invest">我要投资</a></li>
            <li><a href="<%=basePath%>/loan">我要借款</a></li>
            <li><a href="<%=basePath%>/assets">我的资产</a></li>
        </ul>

        <div class="fn-right login-form">
            <c:if test="${user.unickname==null }">
                <a href="<%=basePath%>/register.jsp" title="免费注册">免费注册</a>
                <a href="<%=basePath%>/login.jsp" class="js-login" title="登录">登录</a>
            </c:if>
            <c:if test="${user!=null }">
                <a href="#" onclick="keys();" title="名字">${user.unickname}</a>
                <a href="<%=basePath%>/users/exit" class="js-login" title="退出">退出</a>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>