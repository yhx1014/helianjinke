<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<html>
<head>
    <title>币币贷</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/wallet.css"/>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
    <%--<script src="<%=basePath%>layui/layui.js" charset="utf-8"></script>--%>
    <script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/user.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/qrcode.js"></script>
    <script type="text/javascript">
        /**
         * 充值:生成二维码
         * */
        function qrcode(ctype, content) {
            $("#coinqrcode").html("");
            $("#ctitle").text(ctype);
            $("div.deposit-error span").text(ctype);
            $("#coinQRCodeDlg h3").text(ctype + "充值");
            showDlg("coinQRCodeDlg");
            console.log(content);
            if (content !== "") {
                $("#coinAddress").text(content);
                new QRCode(document.getElementById("coinqrcode"), {
                    text: content,
                    width: 126,
                    height: 126,
                    colorDark: '#000000',
                    colorLight: '#ffffff',
                    correctLevel: QRCode.CorrectLevel.H
                })
            } else {
                $("#coinAddress").text("您的" + ctype + "地址不可用，请重试！");
                var Sqrcode = $("#coinqrcode").append("<i></i>");
                Sqrcode.children("i").addClass("error-qrcode")
            }
        }

        /**
         * 提现:输入地址
         * */
        function withdraw(ctype) {
            $("#withdrawDlg h3").text(ctype + "提现");
            showDlg("withdrawDlg")
        }

        /**
         * 显示、关闭模态框
         * */
        function showDlg(op) {
            $("body").append("<div id='mask'></div>");
            $("#mask").addClass("mask").css("display", "block");
            $("#" + op).css("display", "block");
        }

        function closeDlg(op) {
            $("#mask").css("display", "none");
            $("#" + op).css("display", "none");
        }

        /**
         * 保留8位小数
         * */

        $(document).ready(function () {
                $('.coin-amount span').each(function () {
                    return $(this).text(parseInt($(this).text()).toFixed(10))
                })
            }
        );
        /**
         * 截取【交易哈希】字符串长度
         * */

        $(document).ready(function () {
                $('a.tx_hashstr').each(function () {
                    return $(this).text($(this).text().substring(0, 20) + '...')
                })
            }
        );
        /**
         * 截取【目标地址】字符串长度
         * */

        $(document).ready(function () {
                $('span.end_point_str').each(function () {
                    return $(this).text('...' + $(this).text().substring(16))
                })
            }
        );
        $(document).ready(function () {
            $.ajax({
                url: "<%=basePath%>/getWallet",
                type: "GET",
                success: function (result) {
                    buildwallet(result);
                }
            })
        });
        <%--<c:forEach items="${walletlist}" var="wallet" varStatus="status">--%>
        <%--<tr>--%>
        <%--<td>${wallet.type}</td>--%>
        <%--<td>${wallet.totalCount}</td>--%>
        <%--<td>${wallet.type}</td>--%>
        <%--<td>${wallet.collateral}</td>--%>
        <%--<td>${wallet.balance}</td>--%>
        <%--<td>--%>
        <%--<button class="layui-btn layui-btn-sm" href="#"--%>
        <%--onclick="qrcode('${wallet.type}','${wallet.address}')"--%>
        <%--style="background: #423E9D">充值--%>
        <%--</button>--%>
        <%--<button class="layui-btn layui-btn-sm" href="#" onclick="withdraw('${wallet.type}')"--%>
        <%--style="background: #FFF">提现--%>
        <%--</button>--%>
        <%--</td>--%>
        <%--</tr>--%>
        <%--</c:forEach>--%>

        function buildwallet(data) {
            $("#wallet_table tbody").empty();
            $.each(data, function (index, item) {
                var type = $("<td></td>").append(item.type);
                var totalCount = $("<td></td>").append(item.totalCount);
                var collateral = $("<td></td>").append("总数量估值");
                var freeze = $("<td></td>").append("已冻结")
                var balance = $("<td></td>").append(item.balance);
                var topupbtn = $("<button></button>").append("充值").addClass("layui-btn layui-btn-sm");
                var withdrawbtn = $("<button></button>").append("提现").addClass("layui-btn layui-btn-sm");
                var buttontd = $("<td></td>").append(topupbtn).append(withdrawbtn);
                $("<tr></tr>").append(type)
                    .append(totalCount)
                    .append(collateral)
                    .append(freeze)
                    .append(balance)
                    .append(buttontd)
                    .appendTo("#wallet_table tbody");
            })
        }
    </script>
    <style type="text/css">
        .warp {
            width: 1100px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
        }
    </style>
</head>
<body>

<jsp:include page="head.jsp"></jsp:include>
<div class="alert-450" id="coinQRCodeDlg" style="display: none">
    <div class="alert-title">
        <h3></h3>
        <span class="alert-close" onclick="closeDlg('coinQRCodeDlg')"></span>
    </div>
    <div class="alert-main">
        <div id="addressContent">
            <div style="color: #999;font-size: 12px;">您的<span id="ctitle"></span>地址为</div>
            <div style=" font-size: 16px;" id="coinAddress"></div>
        </div>
        <div id="coinqrcode" style="width:126px ;margin:0 auto">

        </div>
        <div class="deposit-error">
            提示:禁止向<span></span>地址充值<span></span>之外的资产，任何<span></span>地址的非<span></span>资产将不可找回
        </div>
    </div>
</div>
<div class="alert-450" id="withdrawDlg" style="display: none">
    <div class="alert-title">
        <h3>提现</h3>
        <span class="alert-close" onclick="closeDlg('withdrawDlg')"></span>
    </div>
    <div class="alert-main">
        <div id="addressInput">
            <div style=" font-size: 16px;">请输入您要提现的地址：</div>
        </div>
        <div class="deposit-error">
            提示:请再三核对您的<span></span>地址！错误的地址将导致您的财产损失！
        </div>
    </div>
</div>

<div class="warp">
    <div class="wallet-title">
        <span>钱包</span>
    </div>
    <table id="wallet_table" class="layui-table" lay-even lay-size="lg" lay-skin="nob">
        <thead>
        <tr>
            <th>币种</th>
            <th>总数量</th>
            <th>总数量估值(USD)</th>
            <th>冻结数量</th>
            <th>可用数量</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%--<c:forEach items="${walletlist}" var="wallet" varStatus="status">--%>
        <%--<tr>--%>
        <%--<td>${wallet.type}</td>--%>
        <%--<td>${wallet.totalCount}</td>--%>
        <%--<td>${wallet.type}</td>--%>
        <%--<td>${wallet.collateral}</td>--%>
        <%--<td>${wallet.balance}</td>--%>
        <%--<td>--%>
        <%--<button class="layui-btn layui-btn-sm" href="#"--%>
        <%--onclick="qrcode('${wallet.type}','${wallet.address}')"--%>
        <%--style="background: #423E9D">充值--%>
        <%--</button>--%>
        <%--<button class="layui-btn layui-btn-sm" href="#" onclick="withdraw('${wallet.type}')"--%>
        <%--style="background: #FFF">提现--%>
        <%--</button>--%>
        <%--</td>--%>
        <%--</tr>--%>
        <%--</c:forEach>--%>
        </tbody>
    </table>
</div>
<div class="warp">
    <div class="wallet-title">
        <span>资产明细</span>
    </div>
    <table id="transactionLog" class="layui-table" lay-even lay-size="lg" lay-skin="nob">
        <thead>
        <tr>
            <th>交易时间</th>
            <th>币种</th>
            <th>数量</th>
            <th>类型</th>
            <th>状态</th>
            <th>目标地址</th>
            <th>交易哈希</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${txPageInfo.list}" var="transaction" varStatus="status">
            <tr>
                <td>${transaction.formatTime}</td>
                <td>${transaction.cType}</td>
                <td>${transaction.cCount}</td>
                <td>转入</td>
                <td><c:if test="${transaction.state==1}"><span>进行中</span></c:if>
                    <c:if test="${transaction.state==2}"><span>已完成</span></c:if></td>
                <td><span class="end_point_str">${transaction.toAddress}</span></td>
                <td><a class="tx_hashstr"
                       href="https://etherscan.io/tx/${transaction.transactionHash}">${transaction.transactionHash}</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="margin-bottom: 20px">
        <!--分页文字信息  -->
        <div id="page_info_area">
            当前第<span>${txPageInfo.pageNum}</span>页，共计<span>${txPageInfo.pages}</span>页
        </div>
        <!-- 分页条信息 -->
        <div id="page_nav_area">
            <div class="page_bar">
                <span><a href="<%=basePath%>/assets?pn=1">首页</a></span>
                <c:if test="${txPageInfo.hasPreviousPage}">
                    <span><a href="<%=basePath%>/assets?pn=${txPageInfo.pageNum-1}"><</a></span>
                </c:if>
                <c:forEach items="${txPageInfo.navigatepageNums }" var="page_Num">
                    <c:if test="${page_Num == txPageInfo.pageNum }">
                        <span><a href="#" class="active">${page_Num }</a></span>
                    </c:if>
                    <c:if test="${page_Num != txPageInfo.pageNum }">
                        <span><a href="<%=basePath%>/assets?pn=${page_Num}">${page_Num }</a></span>
                    </c:if>
                </c:forEach>
                <c:if test="${txPageInfo.hasNextPage}">
                    <span><a href="<%=basePath%>/assets?pn=${txPageInfo.pageNum+1}">> </a></span>
                </c:if>
                <span><a href="<%=basePath%>/assets?pn=${txPageInfo.endRow}">尾页</a></span>
            </div>
        </div>
    </div>
</div>
<%--<div class="wbgcolor">--%>
<%--<div class="w1200 personal">--%>
<%--<div class="personal-wallet">--%>
<%--<div>--%>
<%--<h3>--%>
<%--<i>我的钱包</i>--%>
<%--</h3>--%>
<%--</div>--%>
<%--<div class="pmain-money">--%>
<%--<ul>--%>
<%--<li class="none"><span><em>账户总价值(USD)</em><i id="zhze"--%>
<%--class="markicon"></i><span class="arrow-show1"--%>
<%--style="display: none;">可用余额+待收本息</span><span--%>
<%--class="icon-show1"--%>
<%--style="display: none;"></span></span> <span class="truemoney"><i--%>
<%--class="f26 fb">3000</i> 元</span></li>--%>
<%--<li><span><em>抵押物价值(USD)</em><i id="dsbx" class="markicon"></i><span--%>
<%--class="arrow-show2" style="display: none;">未到账的投资项目的本金、利息总额</span><span--%>
<%--class="icon-show2" style="display: none;"></span></span> <span--%>
<%--class="truemoney"><i class="f26 fb">2000</i>元</span></li>--%>
<%--<li><span><em>累计价值(USD)</em><i id="ljsy" class="markicon"></i><span--%>
<%--class="arrow-show3" style="display: none;">已到账的投资收益+未到账的投资收益</span><span--%>
<%--class="icon-show3" style="display: none;"></span></span> <span--%>
<%--class="truemoney"><i class="f26 fb c-pink">1500</i>--%>
<%--元</span></li>--%>
<%--</ul>--%>
<%--</div>--%>
<%--<c:forEach items="${walletlist}" var="result">--%>
<%--<div class="wallet-BTC">--%>
<%--<div class="wallet-title">--%>
<%--<h1>${result.type}</h1>--%>
<%--</div>--%>
<%--<div class="coin-amount">--%>
<%--<span>${result.totalcount}</span>--%>
<%--</div>--%>
<%--<div class="coin-operate">--%>
<%--<div class="operate-btn">--%>
<%--<span href="javascript:void(0)"--%>
<%--onclick="qrcode('${result.type}','${result.address}')">充值</span>--%>
<%--<span href="javascript:void(0)"--%>
<%--onclick="withdraw('${result.type}')">提现</span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</c:forEach>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="wallet-record">--%>
<%--<div style="padding: 10px 0px 10px 10px">资产明细</div>--%>
<%--<table class="layui-table" lay-skin="nob" lay-even>--%>
<%--<colgroup>--%>
<%--<col>--%>
<%--</colgroup>--%>
<%--<thead>--%>
<%--<tr>--%>
<%--<th>订单编号</th>--%>
<%--<th>借款总金额</th>--%>
<%--<th>借款期限</th>--%>
<%--<th>抵押物</th>--%>
<%--<th>最小投资金额</th>--%>
<%--<th>年利率</th>--%>
<%--<th>截止时间</th>--%>
<%--<th>投标进度</th>--%>
<%--<th>操作</th>--%>

<%--</tr>--%>
<%--</thead>--%>
<%--<tbody>--%>
<%--<tr>--%>
<%--<td>质押金额</td>--%>
<%--<td>1341</td>--%>
<%--<td>质押金额</td>--%>
<%--<td>1341</td>--%>
<%--<td>质押金额</td>--%>
<%--<td>1341</td>--%>
<%--<td>质押金额</td>--%>
<%--<td>1341</td>--%>
<%--<td>质押金额</td>--%>
<%--</tr>--%>
<%--</tbody>--%>
<%--</table>--%>
<%--<div id="laypage" style="margin: 0 auto"></div>--%>
<%--</div>--%>
<%--</div>--%>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>