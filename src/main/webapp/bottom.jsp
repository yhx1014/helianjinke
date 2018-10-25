<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
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

    #bottom li {
        display: inline-block;
        height: 60px;
        font-size: 12px;
        width: 200px;
        overflow: hidden;
    }

    #bottom li:first-child {
        margin: 0 300px 0 100px;
        background: url("<%=basePath %>/images/logo.png") no-repeat left center;
    }

    #bottom span {
        color: #333;
        margin: 0 6px;
    }

    #bottom li.instr {
        padding: 10px 0;
        height: 40px;
        width: 300px;
    }

    #bottom li a, #bottom div {
        color: #fff;
    }

    #bottom li div {
        height: 20px;
        line-height: 20px;
    }

    #bottom li img {
        vertical-align: middle;
    }

    #footer {
        padding: 20px 0;
    }

    #bottom li {
        display: inline-block;
        height: 60px;
        font-size: 12px;
        width: 200px;
        overflow: hidden;
    }

    #bottom li:first-child {
        margin: 0 300px 0 100px;
        background: url("<%=basePath %>/images/logo.png") no-repeat left center;
    }

    #bottom span {
        color: #333;
        margin: 0 6px;
    }

    #bottom li.instr {
        padding: 10px 0;
        height: 40px;
        width: 300px;
    }

    #bottom li a, #bottom div {
        color: #fff;
    }

    #bottom li div {
        height: 20px;
        line-height: 20px;
    }

    #bottom li img {
        vertical-align: middle;
    }

    #footer {
        padding: 20px 0;
    }
</style>

<div id="footer" class="ft">
    <div class="ft-inner clearfix" style="border-bottom:none;">
        <ul id="bottom">
            <li></li>
            <li class="instr">
                <div>
                    <a href="###">关于我们</a><span>|</span>
                    <a href="###">新手介绍</a><span>|</span>
                    <a href="###">费率介绍</a><span>|</span>
                    <a href="###">加入我们</a>
                </div>
                <div>服务时间：9:00 -- 18:00 &nbsp;&nbsp;&nbsp;联系方式：010-8888888</div>
            </li>
            <li><img src="<%=basePath%>/images/logo.png"/></li>
        </ul>
        <div style="color:#fff;text-align:center;font-size:12px;">备案号:12345678900000000</div>
    </div>
</div>