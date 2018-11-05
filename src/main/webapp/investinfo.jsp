<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="ft" %>

<html>
<head>
    <title>币币袋</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/detail.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=basePath %>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>/script/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>/layui/layui.js"></script>
    <style>
        .warp {
            width: 1000px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;

        }

        .invest-title {
            border-bottom: 1px solid #ddd;
            padding: 10px 0px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="warp">
    <div class="invest-title">
        <h3>精选债权</h3>
        <span>出借人适当性管理告知<i></i></span>
    </div>
    <div class="invest-txt">
        <span>币币贷精选标主要是针对城市白领，
            工薪阶层等人群的出借服务。工薪精英人群有较高的教育背景、
            稳定的经济收入以及良好的信用意识。币币贷依托多年来积累的信
            用审核分析技术，针对白领人群的资金使用情况及还款能立进行多
            方面审核，向出借人推荐通过审核的借款人。</span>
    </div>
</div>
<div class="warp">
    <table class="layui-table" lay-even lay-size="lg" lay-skin="nob">
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
                    <a class="layui-btn layui-btn-sm" href="<%=basePath%>/investDetail.do?bid=${invest.id}"
                       style="background: #423E9D">立即出借
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <!--分页文字信息  -->
        <div id="page_info_area">

        </div>
        <!-- 分页条信息 -->
        <div id="page_nav_area">

        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>