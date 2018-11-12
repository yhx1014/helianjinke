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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/layui/css/layui.css" media="all">
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

        .layui-form-item label {
            margin-left: 2px;
        }

        .regist_submit {
            width: 400px;
            background: #423E9D;
        }

        .verifybtn {
            display: inline-block;
            width: 100px;
            height: 38px;
            background: #423E9D;
            float: left;
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp"/>
<div class="wrap">
    <div class="tdbModule register">
        <div class="registerTitle">登录</div>
        <div class="registerCont">
            <form class="layui-form" action="<%=basePath%>/login">
                <div class="layui-form-item">
                    <label for="userphonename">账户名</label>
                    <input type="number" name="username" placeholder="账号为手机号码"
                           lay-verify='required|phone'
                           id="userphonename"
                           maxlength="11"
                           autocomplete="off" class="layui-input">
                </div>

                <div class="layui-form-item">
                    <label for="userpassword">密码</label>
                    <input type="password" name="upassword" placeholder="请输入密码"
                           id="userpassword"
                           lay-verify='required|pass'
                           autocomplete="off" class="layui-input">
                </div>

                <div class="layui-form-item">
                    <label for="smscaptcha">短信验证码</label>
                    <div><input type="text" name="verification" placeholder="请输入短信验证码"
                                id="smscaptcha"
                                lay-verify='required'
                                autocomplete="off" class="layui-input" style="float: left;width: 300px">
                        <span class="layui-btn verifybtn" disabled="true">获取验证码</span></div>
                </div>

                <div class="layui-form-item">
                    <button class="layui-btn regist_submit" lay-submit lay-filter="*">立即登录</button>
                    <div>还没有账号？ <a href="<%=basePath%>/register">立即注册</a></div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"/>
<script type="text/javascript">
    layui.use('form', function () {
        var form = layui.form;
        form.verify({
            pass: [
                /^[\S]{6,12}$/,
                '密码必须6-12位，且不能出现空格'
            ]
        })
    })
</script>
</body>
</html>