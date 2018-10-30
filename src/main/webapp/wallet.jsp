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
    <title>币币袋</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/wallet.css"/>
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
            $("#coinqrcode").html("")
            $("#ctitle").text(ctype)
            $("div.deposit-error span").text(ctype)
            $("#coinQRCodeDlg h3").text(ctype + "充值")
            showDlg("coinQRCodeDlg")
            console.log(content)
            if (content !== "") {
                $("#coinAddress").text(content)
                new QRCode(document.getElementById("coinqrcode"), {
                    text: content,
                    width: 126,
                    height: 126,
                    colorDark: '#000000',
                    colorLight: '#ffffff',
                    correctLevel: QRCode.CorrectLevel.H
                })
            } else {
                $("#coinAddress").text("您的" + ctype + "地址不可用，请重试！")
                var Sqrcode = $("#coinqrcode").append("<i></i>");
                Sqrcode.children("i").addClass("error-qrcode")
            }
        }

        /**
         * 提现:输入地址
         * */
        function withdraw(ctype) {
            $("#withdrawDlg h3").text(ctype + "提现")
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
        )

    </script>
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
                    <li class="none"><span><em>账户总价值(USD)</em><i id="zhze"
                                                                 class="markicon"></i><span class="arrow-show1"
                                                                                            style="display: none;">可用余额+待收本息</span><span
                            class="icon-show1"
                            style="display: none;"></span></span> <span class="truemoney"><i
                            class="f26 fb">3000</i> 元</span></li>
                    <li><span><em>抵押物价值(USD)</em><i id="dsbx" class="markicon"></i><span
                            class="arrow-show2" style="display: none;">未到账的投资项目的本金、利息总额</span><span
                            class="icon-show2" style="display: none;"></span></span> <span
                            class="truemoney"><i class="f26 fb">2000</i>元</span></li>
                    <li><span><em>累计价值(USD)</em><i id="ljsy" class="markicon"></i><span
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
                                  onclick="qrcode('${result.type}','${result.address}')">充值</span>
                            <span href="javascript:void(0)"
                                  onclick="withdraw('${result.type}')">提现</span>
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