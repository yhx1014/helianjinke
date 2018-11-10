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
    <link href="<%=basePath%>/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/layui/css/layui.css" media="all">
    <script src="<%=basePath%>/js/vialdata.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=basePath%>/layui/layui.js"></script>

    <style>
        .wrap {
            width: 1200px;
            margin: 0 auto;
            clear: both;
            background: #fff;
            padding: 20px;
        }

        .tdbModule {
            width: 400px;
            margin: 10vh auto;

        }
        .registerTitle {
            font-size: 24px;
            padding-bottom: 10px;
            text-align: center;
        }

        .registerCont {
            line-height: 38px;
            margin-top: 16px;
        }
        .label{
            margin-left: 2px;
        }
        .regist_submit {
            width: 400px;
            background: #423E9D;
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="wrap">
    <div class="tdbModule register">
        <div class="registerTitle">登录</div>
        <div class="registerCont">
            <form class="layui-form" action="<%=basePath%>/login">
                <div class="layui-form-item">
                    <span class="label">账户名</span>
                    <input type="text" name="username" placeholder="账号为手机号码"
                           id="userphone"
                           lay-verify ='required|phone'
                           maxlength="11"
                           autocomplete="off" class="layui-input">
                </div>

                <div class="layui-form-item">
                    <span class="label">密码</span>
                    <input type="text" name="upassword" placeholder="请输入密码"
                           id="password"
                           lay-verify ='required|pass'
                           autocomplete="off" class="layui-input">
                </div>

                <div class="layui-form-item">
                    <span class="label">短信验证码</span>
                    <input type="text" name="verification" placeholder="请输入短信验证码"
                           id="verification"
                           lay-verify ='required'
                           autocomplete="off" class="layui-input">
                </div>

                <div class="layui-form-item">
                    <button class="layui-btn regist_submit" lay-submit lay-filter="*">立即登录</button>
                    <div>还没有账号？ <a href="<%=basePath%>/register">立即注册</a></div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script type="text/javascript">
    layui.use('form',function () {
        var form = layui.form;
        form.verify({
            pass:[
                /^[\S]{6,12}$/,
                '密码必须6-12位，且不能出现空格'
            ]
        })
    })
</script>
</body>
</html>