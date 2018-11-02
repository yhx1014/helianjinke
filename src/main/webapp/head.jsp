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
            var id = "${globaluser.uid}";
            if (id != "") {
                location.href = "<%=basePath%>/query.do?id=${globaluser.uid}";
            } else {
                alert("请先登入!");
                location.href = "<%=basePath%>/login.jsp";
            }
        }
    </script>
</head>
<body>
<div class="header min-width">
    <div class="container">
        <div class="fn-left logo">
            <a class="" href="<%=basePath%>/recommendShow.do">
                <img src="<%=basePath%>/images/logo.png" title="logo">
            </a>
        </div>
        <ul class="top-nav fn-clear">
            <li><a href="<%=basePath%>/recommendShow.do">首页</a></li>
            <li><a href="<%=basePath%>/invest.do" class="">我要投资</a></li>
            <li><a href="<%=basePath%>/loan/getLoan.do" class="">我要借款</a></li>
            <li class="top-nav-safe"><a href="<%=basePath%>/assets/wallet.do">我的资产</a></li>
        </ul>

        <div class="fn-right login-form">
            <c:if test="${globaluser.unickname==null }">
                <a href="<%=basePath%>/register.jsp" title="免费注册">免费注册</a>
                <a href="<%=basePath%>/login.jsp" class="js-login" title="登录">登录</a>
            </c:if>
            <c:if test="${globaluser!=null }">
                <a href="#" onclick="keys();" title="名字">${globaluser.unickname}</a>
                <a href="<%=basePath%>/users/exit.do" class="js-login" title="退出">退出</a>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>