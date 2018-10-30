<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>币币袋</title>
    <link rel="stylesheet" href="<%=basePath%>/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/detail.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/plugins.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/detail.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/login.js"></script>
    <script type="text/javascript" src="<%=basePath%>/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript">
        function submit() {
            var fr = document.getElementById("fr");
            fr.onsubmit = "return true";
            fr.submit();
        }

        function investA() {
            var money = document.getElementById("amount").value;
            window.location.href = "investAdd.do?money=" + money;
        }

        function end() {
            if ("${end}" != null && "${end}" == "end") {
                alert("恭喜,投资成功!");
            }
        }

        end();
    </script>
    <style>
        .warp {
            width: 1000px;
            margin: 0 auto;
            min-height: 740px;
        }

        .warp-content {
            /*border: 1px solid #000;*/
            background: #fff;
            padding: 10px;
        }

        .warp-content span {
            display: block;
        }

        .warp-content span:nth-child(1) {
            font-size: 24px;
            margin-bottom: 6px;
        }

        .warp-content span:nth-child(2) {
            color: #999;

        }

        .order {
            border-bottom: 1px solid #ccc;
            padding: 8px 0px;
            margin-bottom: 30px;
        }

    </style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="warp">
    <div style="padding: 14px 2px">
        <sapn>我要投资</sapn> &gt; <span>项目详情</span></div>
    <div class="layui-row layui-col-space20">
        <div class="layui-col-md8">
            <div class="warp-content">
                <div class="order">No.1234565432</div>
                <div class="layui-row" style="margin: 40px 0px 40px 6px;">
                    <div class="layui-col-md3">
                        <span class="">3600USDT</span>
                        <span>借款总金额</span>
                    </div>
                    <div class="layui-col-md3">
                        <span>25%</span>
                        <span>借款总金额</span>
                    </div>
                    <div class="layui-col-md3">
                        <span>12个月</span>
                        <span>借款期限</span>
                    </div>
                    <div class="layui-col-md3">
                        <span>36%IMG</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="warp-content" style="padding: 28px 20px 20px 20px">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <div class="layui-row">
                            <div class="layui-col-md10">
                                <input type="text" name="" placeholder="最少投资份额为贷款金额的10%" autocomplete="off"
                                       class="layui-input">
                            </div>
                            <div class="layui-col-md2">
                                <div style="font-size: 16px;padding-left: 8px;line-height: 38px">BCH</div>
                            </div>
                        </div>
                        <input type="radio" name="xieyi" value="是" title="投资协议">
                        <button class="layui-btn" lay-submit lay-filter="*"
                                style="background:#423E9D;width: 280px;margin-top: 20px">我要投资
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="warp-content" style="margin-top: 30px">
        <div class="order">标的详情</div>
        <table class="layui-table" lay-skin="nob" lay-even>
            <colgroup>
                <col width="50">
                <col width="200">
            </colgroup>
            <thead>
            <tr>
                <th>借款金额</th>
                <th>1234</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>质押金额</td>
                <td>1341</td>
            </tr>
            <tr>
                <td>借款价值／质押价值</td>
                <td>2016-11-29</td>
            </tr>
            <tr>
                <td>借款期限／还款方式</td>
                <td>2016-11-29</td>
            </tr>
            <tr>
                <td>最小收款单元</td>
                <td>2016-11-29</td>
            </tr>
            <tr>
                <td>借款发起时间</td>
                <td>2016-11-29</td>
            </tr>
            <tr>
                <td>募集截止日期</td>
                <td>2016-11-29</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<!--网站底部-->
<jsp:include page="bottom.jsp"></jsp:include>
<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</body>
</html>
