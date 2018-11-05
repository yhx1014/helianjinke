<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>

<head>
    <title>币币袋</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/colorbox.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/common.css"/>
    <script type="text/javascript" src="<%=basePath%>/layui/layui.js"></script>
    <style>
        .applyc {
            width: 900px;
            background: #fff;
            margin: 14px auto;
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
            display: inline-block;
            height: 38px;
            line-height: 38px;
            padding: 0 18px;
            color: #fff;
            white-space: nowrap;
            text-align: center;
            font-size: 14px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
            opacity: 0.8;
            background: #423E9D;
            margin-left: 46%;
            width: 96px;
        }
    </style>
    <script>
        //Demo
        layui.use('form', function () {
            var form = layui.form();

            //监听提交
            form.on('submit(formDemo)', function (data) {
                layer.msg(JSON.stringify(data.field));
                return false;
            });
        });
    </script>
</head>

<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="applyc clearfix">
    <form action="" method="post" class="layui-form">
        <div class="order-title">创建借款订单</div>
        <div class="layui-row">
            <div class="layui-col-md6">
                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">质押币种</label>
                    <div class="layui-input-block">
                        <select lay-verify="required" name="bmortgagetype">
                            <option value="0">BTC</option>
                            <option value="1">ETH</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">质押数量</label>
                    <div class="layui-input-block">
                        <input type="text" name="bmortgagecount" style="lay-verify:title;" autocomplete="off"
                               placeholder="请输入数量" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">还款方式</label>
                    <div class="layui-input-block">
                        <select lay-verify="required" name="bmortgagetype">
                            <option value="0">还本付息</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">平台佣金为</label>
                    <div class="layui-input-block">
                        <select lay-verify="required" name="bmortgagetype">
                            <option value="0">1%</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="layui-col-md6">

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">借款币种</label>
                    <div class="layui-input-block">
                        <select name="btype" style="lay-verify:required;">
                            <option value="0">USDT</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">借款数量</label>
                    <div class="layui-input-block">
                        <input type="text" name="bcount" style="lay-verify:title;" autocomplete="off"
                               placeholder="请输入数量" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">借款期限</label>
                    <div class="layui-input-block">
                        <select style="name:binterval;lay-verify:required;">
                            <option value="0">7天</option>
                            <option value="1">14天</option>
                            <option value="0">30天</option>
                            <option value="1">60天</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">借款利息</label>
                    <div class="layui-input-block">
                        <select name="brate" style="lay-verify:required;">
                            <option value="0">10</option>
                            <option value="1">20</option>
                            <option value="0">30</option>
                            <option value="1">40</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <button class="layui-btn btn-next" style="margin-bottom: 30px">下一步</button>
    </form>
</div>
<div class="applyc clearfix">
    <form action="<%=basePath%>/toloan" method="post">
        <div>
            <label>质押币种</label>
            <div>
                <select name="collateralType">
                    <option selected="selected" value="BTC">BTC</option>
                    <option value="ETH">ETH</option>
                </select>
            </div>
        </div>
        <div>
            <label>借款币种</label>
            <div>
                <select name="borrowType">
                    <option selected="selected" value="USDT">USDT</option>
                    <option value="EOS">EOS</option>
                </select>
            </div>
        </div>
        <div>
            <label>质押数量</label>
            <div>
                <select name="collateralCount">
                    <option selected="selected" value="100">100</option>
                    <option value="200">200</option>
                    <option value="300">300</option>
                    <option value="400">400</option>
                </select>
            </div>
        </div>
        <div>
            <label>借款数量</label>
            <div>
                <select name="borrowCount">
                    <option selected="selected" value="60">60</option>
                    <option value="120">120</option>
                    <option value="180">180</option>
                    <option value="240">240</option>
                </select>
            </div>
        </div>
        <div>
            <label>借款期限</label>
            <div>
                <select name="loanterm">
                    <option selected="selected" value="7">7天</option>
                    <option value="14">14天</option>
                    <option value="30">30天</option>
                    <option value="60">60天</option>
                </select>
            </div>
        </div>
        <div>
            <label>还款方式</label>
            <div>
                <select>
                    <option selected="selected">还本付息</option>
                </select>
            </div>
        </div>
        <div>
            <label>质押率</label>
            <div>
                <select name="pledgeRatio">
                    <option selected="selected" value="65%">65%</option>
                </select>
            </div>
        </div>
        <div>
            <label>年化收益</label>
            <div>
                <select name="annualizedRate">
                    <option selected="selected" value="0.03%">0.03%</option>
                    <option value="0.05%">0.05%</option>
                    <option value="0.07%">0.07%</option>
                    <option value="0.09%">0.09%</option>
                </select>
            </div>
        </div>
        <button class="btn-next" type="submit">提交</button>
    </form>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
