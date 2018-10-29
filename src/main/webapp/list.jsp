<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="ft" %>

<html>
<head>
    <title>币币袋</title>
    <link href="<%=basePath%>css/common.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/detail.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=basePath %>script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>script/common.js"></script>
    <script src="<%=basePath%>layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript">
        function Select(items, param) {
            location.href = "<%=basePath%>invest/investSel.do?item=" + items + "&param=" + param;
        }
    </script>
    <style>
        .warp {
            width: 1000px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;

        }

        .title-table {
            border-bottom: 1px solid #ddd;
            padding: 10px 0px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="warp">
    <div class="title-table">精选债权</div>
    <table class="layui-table" lay-even lay-size="lg" lay-skin="nob">
        <colgroup>
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">

        </colgroup>
        <thead>
        <tr>
            <th>借款标题</th>
            <th>借款总金额</th>
            <%--<th>还款方式</th>--%>
            <th>期限</th>
            <%--<th>抵押物</th>--%>
            <%--<th>借款／质押品价值</th>--%>
            <th>年利率</th>
            <th>截止时间</th>
            <%--<th>投标进度</th>--%>
            <th>操作</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="invest" varStatus="status">
            <tr>
                <td>
                    <a href="investInfo.do?bmid=${invest.id}" target="_blank">
                        <i class="icon icon-xin" title="类型"></i>
                    </a>
                    <a class="f18" href="investInfo.do?bmid=${invest.id}" title="${invest.btype}"
                       target="_blank">${invest.btype}</a></td>
                <td>${invest.bcount}</td>
                <td>${invest.brate}%</td>
                <td>${invest.binterval}</td>
                <td>${invest.id}</td>
                <td>
                    <a class="layui-btn layui-btn-sm" href="investInfo.do?bmid=${invest.id}"
                       style="background: #423E9D">
                        <c:if test="${invest.id !='1'}">立即投标</c:if>
                        <c:if test="${invest.id=='2'}">募集完成</c:if>
                        <c:if test="${invest.id=='3'}">还款中</c:if>
                    </a>
                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
    <div id="laypage" style="margin: 0 auto"></div>
    <script>
        layui.use('laypage', function () {
            var laypage = layui.laypage;

            //执行一个laypage实例
            laypage.render({
                elem: 'laypage',
                count: 50 //数据总数，从服务端得到
            });
        });
    </script>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
