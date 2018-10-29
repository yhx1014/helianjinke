<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<head>
    <title>币币袋</title>
    <link href="css/style.css" rel="stylesheet"/>
    <link href="css/newstyle.css" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="css/colorbox.css">
    <link rel="stylesheet" href="<%=basePath%>layui/css/layui.css" media="all">
    <link href="<%=basePath%>css/common.css" rel="stylesheet"/>
    <script src="<%=basePath%>layui/layui.js" charset="utf-8"></script>
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
    <form action="<%=basePath%>brower/insert.do" method="post" class="layui-form">
        <div class="order-title">创建借款订单</div>
        <div class="layui-row">
            <div class="layui-col-md6">
                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">质押币种</label>
                    <div class="layui-input-block">
                        <select lay-verify="required" name="bmortgagetype">
                            <option value="0">BTC</option>
                            <option value="1">ETH</option>
                            <option value="2">USDT</option>
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
                        <select name="bpaytype" style="lay-verify:required;">
                            <option value="0">A</option>
                            <option value="1">B</option>
                            <option value="2">C</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">平台佣金</label>
                    <div class="layui-input-block">
                        <select name="bcommission" style="lay-verify:required;">
                            <option value="0">10</option>
                            <option value="1">20</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="layui-col-md6">

                <div class="layui-form-item re-heigth">
                    <label class="layui-form-label">借款币种</label>
                    <div class="layui-input-block">
                        <select name="btype" style="lay-verify:required;">
                            <option value="0">ETH</option>
                            <option value="1">BTC</option>
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
                            <option value="0">1</option>
                            <option value="1">2</option>
                            <option value="0">3</option>
                            <option value="1">4</option>
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
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
