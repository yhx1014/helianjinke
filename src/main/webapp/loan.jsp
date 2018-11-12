<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<!DOCTYPE html>
<html>
<head>
    <title>币币贷</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/colorbox.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/common.css"/>
    <script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/coinprice.js"></script>
    <script type="text/javascript" src="<%=basePath%>/layui/layui.js"></script>
    <style>
        .applyc {
            width: 900px;
            background: #fff;
            margin: 23px auto;
            padding: 20px 30px;
        }

        .order-title {
            border-bottom: 1px solid #ddd;
            padding: 8px;
            margin-bottom: 50px;
        }

        .re-heigth {
            margin-bottom: 48px;
        }

        .btn-next {
            background: #423E9D;
            margin-left: 46%;
            width: 96px;
        }

        .alert-title {
            background: #fff;
            border-bottom: none;
        }

        .alert-content {
            width: 450px;
            text-align: center;
        }

        div.alert-content {
            float: left;
            padding: 40px 0 27px;
        }

        .alert-content-info {
            line-height: 30px;
            margin: 0 90px;
            text-align: left;
        }

        .alert-content-info span {
            float: right;
        }

        .alert-content label {
            margin-right: 10px;
        }

        .alert-content input {
            width: 320px;
        }

        .confirm-btn {
            width: 160px;
            background: #423E9D;
            border: none;
            outline: none;
            color: #fff;
            line-height: 30px;
            font-size: 14px;
        }

        .success-tip {
            padding: 36px 0 20px 0;
            text-align: center;
        }

        .success-tip img {
            width: 50px;
        }

        .success-tip .text-success {
            font-size: 18px;
            color: #423E9D;
            line-height: 40px;
            padding-top: 20px;
        }
    </style>
    <script>
        var _priceJSON;
        var _coinPrice = new Array();
        var _USDTPrice;
        var _ETHPrice;
        var _BTCPrice;
        $(document).ready(
            $.ajax({
                type: "GET",
                url: "<%=basePath%>/getCoinPrice",
                success: function (data) {
                    $.each(data, function (index, item) {
                        _coinPrice.push(item.price);
                    });
                    _USDTPrice = _coinPrice[0];
                    _ETHPrice = _coinPrice[1];
                    _BTCPrice = _coinPrice[2];
                    new Coin(_BTCPrice / _USDTPrice);
                }
            })
        );

        function calculateRatio(rate) {
            new Coin(rate);
        }

        function form_submit() {
            $("#confirmDlg").css("display", "none");
            $("#confirmPwdDlg").css("display", "block");
        }

        function pwd_submit() {
            $("#borrowingform").submit();
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

        layui.use('form', function () {
            var form = layui.form;
            form.on('submit(loan_btn_next)', function (data) {
                var resultJson = data.field;
                console.log(JSON.stringify(data.field));
                showDlg('confirmDlg');
                return false;
            });
            form.on('select(collateralTypes)', function (data) {
                if (data.value == "BTC") {
                    calculateRatio(_BTCPrice / _USDTPrice);
                } else if (data.value == "ETH") {
                    calculateRatio(_ETHPrice / _USDTPrice);
                }
            });
            form.verify({
//                check: [
//                    /^[+]{0,1}(\d+)$/,  //正则表达式
//                    '余额不足，请充值'  //提示信息
//                ]
                borrowCount: function (value) {
                    if (parseFloat(value) > 5000) {
                        return '借款数目不得大于5000！'
                    }
                }
            });
        });
    </script>
</head>

<body>
<jsp:include page="head.jsp"/>
<div class="applyc clearfix">
    <form action="<%=basePath%>/addloan" method="post" class="layui-form" id="borrowingform">
        <div class="order-title">创建借款订单</div>
        <div class="layui-row">
            <div class="layui-col-md6">
                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label" for="collateralType">质押币种</label>
                    <div class="layui-input-block">
                        <select id="collateralType" name="collateralType" lay-filter="collateralTypes">
                            <option value="BTC" selected>BTC</option>
                            <option value="ETH">ETH</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">质押数量</label>
                    <div class="layui-input-block">
                        <input type="number" lay-verify="required" name="collateralCount"
                               autocomplete="off" data-attr='coin' id="collateralCount"
                               placeholder="请输入数量" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">还款方式</label>
                    <div class="layui-input-block">
                        <select name="paytype">
                            <option value="S01">还本付息一次结清</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">质押率</label>
                    <div class="layui-input-block">
                        <select name="pledgeRatio">
                            <option value="65%">65%</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="layui-col-md6">

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">借款币种</label>
                    <div class="layui-input-block">
                        <select name="borrowType">
                            <option value="USDT" selected>USDT</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">借款数量</label>
                    <div class="layui-input-block">
                        <input type="number" lay-verify="borrowCount" name="borrowCount" autocomplete="off"
                               data-attr='coin' id="borrowCount"
                               placeholder="请输入数量" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">借款期限</label>
                    <div class="layui-input-block">
                        <select name="loanterm">
                            <option value="7">7天</option>
                            <option value="14">14天</option>
                            <option value="30">30天</option>
                            <option value="60">60天</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">年化收益</label>
                    <div class="layui-input-block">
                        <select name="annualizedRate" style="lay-verify:required;">
                            <option selected="selected" value="0.03%">0.03%</option>
                            <option value="0.05%">0.05%</option>
                            <option value="0.07%">0.07%</option>
                            <option value="0.09%">0.09%</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <button type="button" onclick="" lay-submit class="layui-btn btn-next" lay-even=""
                style="margin-bottom: 30px" lay-filter="loan_btn_next">
            下一步
        </button>
    </form>
</div>
<jsp:include page="bottom.jsp"/>
<div class="alert-450" id="confirmPwdDlg" style="display: none">
    <div class="alert-title">
        <h3>交易密码</h3>
        <span class="alert-close" onclick="closeDlg('confirmDlg')"></span>
    </div>
    <div class="alert-main">
        <form id="dealPswForm" class="alert-content">

            <div>
                <label for="deal_psw">交易密码</label>
                <input type="password" id="deal_psw" name="deal_psw"/>
            </div>

            <div>
                <span id="warning-span"></span>
            </div>
            <div style="padding-top: 20px;margin-top: 40px">
                <button type="button" id="confirmBtn" onclick="pwd_submit()" class="confirm-btn">
                    确定
                </button>
            </div>
        </form>
    </div>
</div>
<div class="alert-450" id="confirmDlg" style="display: none">
    <div class="alert-title">
        <h3>确认信息</h3>
        <span class="alert-close" onclick="closeDlg('confirmDlg')"></span>
    </div>
    <div class="alert-main">
        <div class="alert-content">
            <div class="alert-content-info">
                <div>
                    <label for="deal_psw">已抵押</label>
                    <span>122343</span>
                </div>
                <div>
                    <label for="deal_psw">需要借款</label>
                    <span>124353</span>
                </div>
                <div>
                    <label for="deal_psw">支付利息</label>
                    <span>122343</span>
                </div>
                <div>
                    <label for="deal_psw">手续费</label>
                    <span>122343</span>
                </div>
                <div>
                    <label for="deal_psw">借款周期</label>
                    <span>122343</span>
                </div>
                <div>
                    <label for="deal_psw">累计到账</label>
                    <span>122343</span>
                </div>
                <div>
                    <label for="deal_psw">共计</label>
                    <span>122343</span>
                </div>
            </div>
            <div style="padding-top: 20px;margin-top: 40px">
                <button type="button" onclick="confirmPwdDlg()" class="confirm-btn">
                    确定
                </button>
            </div>
        </div>
    </div>
</div>
<%--成功提示--%>
<div class="alert-300" id="successDlg" style="display:none">
    <div class="success-tip">
        <img src="<%=basePath%>/images/success.png">
        <div class="text-success">发布成功</div>
        <div>恭喜您，借款发布成功</div>
        <div style="border-top: 1px solid #ddd;padding-top: 20px;margin-top: 40px">
            <button class="confirm-btn" onclick="closeDlg('successDlg')">返回</button>
        </div>
    </div>
</div>
</body>
</html>
