<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>币币袋</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/user.css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>/css/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/user.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=basePath%>script/qrcode.js"></script>
    <script type="text/javascript">
        function qrcode(ele, content, cqrcode) {
            $("#" + cqrcode).html("");
            showDlg(ele);
            new QRCode(document.getElementById(cqrcode), {
                text: content,
                width: 126,
                height: 126,
                colorDark: '#000000',
                colorLight: '#ffffff',
                correctLevel: QRCode.CorrectLevel.H
            });
        }

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
        function slice_eight() {
            var amount = $('.coin-amount span').html()
            return $('.coin-amount span').html(parseInt(amount).toFixed(10))
        }

        $(function () {
                slice_eight();
            }
        )
    </script>
    <style type="text/css">
        .personal-wallet {
            margin-left: 10%;
            float: left;
            color: #848484;
            background: #fff;
            padding: 0 30px 30px;
            font-size: 14px;
        }

        .personal-wallet h3 {
            position: relative;
            font-size: 18px;
            color: #333;
            border-bottom: 1px solid #DCDCDC;
            width: 880px;
            padding-top: 25px;
            height: 35px;
        }

        .personal-wallet h3 i {
            position: absolute;
            left: 0;
            bottom: -1px;
            border-bottom: 2px solid #28A7E1;
            padding-bottom: 10px;
        }

        .wallet-BTC {
            background: #f5f8fc;
            border: 1px solid #e6edf4;
            color: #112443;
            width: 220px;
            height: 235px;
            float: left;
            margin: 15px 15px;
            /*box-shadow: inset 0 1px 0 rgba(255, 255, 255, .15), 0 1px 5px rgba(0, 0, 0, .075);*/
        }

        .wallet-BTC:hover {
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, .15), 0 1px 5px rgba(0, 0, 0, .075);
        }

        .wallet-BTC h1 {
            font-size: 20px;
            font-weight: inherit;
            text-align: center;
            color: #999;
            font-size: 20px;
            padding: 10px 0px 0px 0px;
        }

        .coin-amount {
            text-align: center;
            font-size: x-large;
            color: #3974b1;
            font-size: 28px;

        }

        .coin-amount span {
            line-height: 154px;
        }

        .coin-operate {
            height: 15%;
        }

        .coin-operate span {
            text-align: center;
            font-size: large;
            width: 50%;
            float: left;
            line-height: 43px;
        }

        .operate-btn span:hover {
            background: #233c63;
            color: #f7f7f7;
        }
    </style>
</head>
<body>

<jsp:include page="head.jsp"></jsp:include>
<div class="alert-450" id="ethQRCodeDlg" style="display: none">
    <div class="alert-title">
        <h3>ETH充值</h3>
        <span class="alert-close" onclick="closeDlg('ethQRCodeDlg')"></span>
    </div>
    <div class="alert-main">
        <div id="addressContent">您的ETH地址为：${ethAddress}</div>
    </div>
    <div class="alert-main">
        <div id="ethqrcode"></div>
    </div>
</div>
<div class="wbgcolor">
    <div class="w1200 personal">
        <div class="personal-wallet">
            <div>
                <h3>
                    <i>我的钱包</i>
                </h3>
            </div>
            <div class="pmain-money">
                <ul>
                    <li class="none"><span><em>账户总额</em><i id="zhze"
                                                           class="markicon"></i><span class="arrow-show1"
                                                                                      style="display: none;">可用余额+待收本息</span><span
                            class="icon-show1"
                            style="display: none;"></span></span> <span class="truemoney"><i
                            class="f26 fb">3000</i> 元</span></li>
                    <li><span><em>待收本息</em><i id="dsbx" class="markicon"></i><span
                            class="arrow-show2" style="display: none;">未到账的投资项目的本金、利息总额</span><span
                            class="icon-show2" style="display: none;"></span></span> <span
                            class="truemoney"><i class="f26 fb">2000</i>元</span></li>
                    <li><span><em>累计收益</em><i id="ljsy" class="markicon"></i><span
                            class="arrow-show3" style="display: none;">已到账的投资收益+未到账的投资收益</span><span
                            class="icon-show3" style="display: none;"></span></span> <span
                            class="truemoney"><i class="f26 fb c-pink">1500</i>
								元</span></li>
                </ul>
            </div>
            <c:forEach items="${walletlist}" var="result">
                <div class="wallet-BTC">
                    <div class="wallet-title">
                        <h1>${result.type}</h1>
                    </div>
                    <div class="coin-amount">
                        <span>${result.totalcount}</span>
                    </div>
                    <div class="coin-operate">
                        <div class="operate-btn">
                            <span href="javascript:void(0)"
                                  onclick="qrcode('ethQRCodeDlg','${ethAddress}','ethqrcode')">充值</span><span>提现</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>