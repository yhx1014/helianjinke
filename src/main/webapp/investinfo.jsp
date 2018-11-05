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
    <title>币币贷</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/detail.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=basePath %>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>/script/common.js"></script>
    <script type="text/javascript" src="<%=basePath %>/script/user.js"></script>
    <script type="text/javascript" src="<%=basePath%>/layui/layui.js"></script>
    <style>
        #page_info_area {
            padding-left: 30px;
            color: #999;
        }

        #page_nav_area {
            width: 100%;
            height: 40px;
            text-align: center;
            margin: 0 auto;
        }

        #page_nav_area .page_bar {
            display: inline-block;
        }

        #page_nav_area .page_bar span a {
            display: inline-block;
            width: 30px;
            height: 30px;
            margin: 10px;
            line-height: 30px;
        }

        #page_nav_area .page_bar span a:hover {
            color: #423E9D;
        }

        #page_nav_area a.active {
            background: #DDE4EF;
            border-radius: 15px;
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, .15), 0 1px 5px rgba(0, 0, 0, .075);

        }

        .warp {
            width: 1100px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;

        }

        .invest-title {
            border-bottom: 1px solid #ddd;
            padding: 10px 0px;
            margin-bottom: 20px;
            position: relative;
        }

        .invest-txt {
            line-height: 28px;
            padding: 20px 0px;
        }

        .arrow-show {
            position: absolute;
            right: 16px;
            display: block;
            padding: 0 12px;
            height: 30px;
            border: 1px solid #FBF3D1;
            background: #FFFBE9;
            font-size: 12px;
            line-height: 30px;
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="warp">

    <div class="invest-title">
        <span>精选标的</span>
        <span style="float: right">出借人适当性管理告知<i id="notice" class="markicon"></i><span
                class="arrow-show" style="display: none;">已到账的投资收益+未到账的投资收益</span></span>
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
                <td>${invest.formatTime}</td>
                <td>
                    <a class="layui-btn layui-btn-sm" href="<%=basePath%>/investDetail?bid=${invest.id}"
                       style="background: #423E9D">立即出借
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="margin-bottom: 20px">
        <!--分页文字信息  -->
        <div id="page_info_area">
            当前第<span>${pageInfo.pageNum}</span>页，共计<span>${pageInfo.pages}</span>页
        </div>
        <!-- 分页条信息 -->
        <div id="page_nav_area">
            <div class="page_bar">
                <span><a href="/invest?pn=1">首页</a></span>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <span><a href="/invest?pn=${pageInfo.pageNum-1}"><</a></span>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                    <c:if test="${page_Num == pageInfo.pageNum }">
                        <span><a href="#" class="active">${page_Num }</a></span>
                    </c:if>
                    <c:if test="${page_Num != pageInfo.pageNum }">
                        <span><a href="/invest?pn=${page_Num}">${page_Num }</a></span>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <span><a href="/invest?pn=${pageInfo.pageNum+1}">> </a></span>
                </c:if>
                <span><a href="/invest?pn=${pageInfo.endRow}">尾页</a></span>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
