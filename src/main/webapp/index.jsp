<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="ft" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/jquery.jcarousellite-1.0.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/index.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>/layui/layui.js" charset="utf-8"></script>
    <title>币币贷</title>
    <style>

        #scrollDiv li {
            height: 30px;
            padding-left: 10px;
        }

        .first {
            margin-top: -100px;

        }

        .first-content {
            width: 100%;
            margin: 0 auto;
        }

        .first-content img {
            width: 100%;
        }

        .second {
            background: #fff;
            padding: 50px;
        }

        .second-content {
            width: 80%;
            margin: 0 auto;
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, .15), 0 1px 5px rgba(0, 0, 0, .075);
            padding: 10px;
        }

        .third {
        }

        .third-content {
            width: 100%;
            margin: 0 auto;
        }

        .third-content img {
            width: 100%;
        }

        .fourth {
            margin: 0 auto;
            padding: 90px 0;
            background: #fff;
            position: relative;
        }

        .fourth-content {
            width: 62%;
            margin: 0 auto;
            /*position: relative;*/
        }

        .fourth::after {
            content: '';
            display: inline-block;
            width: 100%;
            height: 40%;
            background: #DDE4EF;
            top: 29%;
            position: absolute;

        }

        .fourth-content img {
            width: 100%;
            position: relative;
            z-index: 1;
        }

        .fifth {
            width: 100%;
            /*height: 300px;*/
            margin: 0 auto;
        }

        .fifth-content {
        }

        .fifth-content img {
            width: 100%;
            border: none;
        }
    </style>
</head>

<body>
<div style="opacity: 0.7">
    <jsp:include page="head.jsp"></jsp:include>
</div>
<section class="first">
    <div class="first-content">
        <img src="<%=basePath%>/images/first-bg.png" style="display: inline;">
    </div>
</section>
<section class="second">
    <div class="second-content">
        <div style="padding: 10px;border-bottom: 1px solid #ddd">
            <span>精选标的</span>
            <span style="float: right"><a href="<%=basePath%>/invest" class="">更多</a></span>
        </div>
        <table class="layui-table" lay-skin="nob" lay-even>
            <colgroup>
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>借款编号</th>
                <th>借款总金额</th>
                <th>还款方式</th>
                <th>期限</th>
                <th>抵押资产</th>
                <th>质押率</th>
                <th>年化收益</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="invest" varStatus="status">
                <tr>
                    <td>${invest.id}</td>
                    <td>${invest.borrowCount}${invest.borrowType}</td>
                    <td>${invest.paytype}</td>
                    <td>${invest.loanterm}</td>
                    <td>${invest.collateralCount}${invest.collateralType}</td>
                    <td>${invest.pledgeRatio}</td>
                    <td>${invest.annualizedRate}</td>
                    <td>${invest.createtime}</td>
                    <td>
                        <a class="layui-btn layui-btn-sm" href="<%=basePath%>/investDetail?bid=${invest.id}"
                           style="background: #423E9D">立即出借
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</section>
<section class="third">
    <div class="third-content">
        <img src="<%=basePath%>/images/third-bg.png" style="display: inline;">
    </div>
</section>
<section class="fourth">
    <div class="fourth-content">
        <img src="<%=basePath%>/images/four-bg.png" style="display: inline;">
    </div>
</section>
<section class="fifth">
    <div class="fifth-content">
        <img src="<%=basePath%>/images/fifth-bg.png" style="display: inline;">
    </div>
</section>
<div class="page-right fn-right" style="top: 0px;"></div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>