<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/layui/layui.js"></script>
</head>
<style type="text/css">
    .wrap {
        width: 1200px;
        margin: 0 auto;
        clear: both;
        background: #fff;
        padding: 20px;
    }

    .tdbModule {
        width: 400px;
        margin: 4vh auto;
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

    .label {
        margin-left: 2px;
    }

    .regist_submit {
        width: 400px;
        background: #423E9D;
    }

    .agree {
        width: 10px;
        height: 10px;
    }
</style>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="wrap">
    <div class="tdbModule register">
        <div class="registerTitle">注册</div>
        <div class="registerCont">
            <form action="/user/toRegister" class="layui-form" type="post">
                <div class="layui-form-item">
                    <span class="label">手机号码</span>
                    <input type="number" name="username" placeholder="请输入手机号"
                           id="userphone"
                           lay-verify='required|phone'
                           maxlength="11"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <span class="label">短信验证码</span>
                    <input type="text" name="" placeholder="请输入短信验证码"
                           id="verification"
                           lay-verify='required'
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <span class="label">密码</span>
                    <input type="password" name="password" placeholder="请输入密码"
                           id="password"
                           lay-verify='required|pass'
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <span class="label">确认密码</span>
                    <input type="password" name="" placeholder="请再次输入密码"
                           id="repassword"
                           lay-verify='required|confirmpass'
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn regist_submit" lay-submit lay-filter="*">注册</button>
                    <div><input name="" id="protocol"
                                class="agree"
                                type="checkbox" checked>
                        我已阅读并同意《<a href="" target="_black">服务协议</a>》
                    </div>
                </div>
            </form>
            <%--<form class="layui-form">--%>
            <%--<ul>--%>
            <%--<li class="telNumber">--%>
            <%--<div class="">用户名</div>--%>
            <%--<input type="text" class="input username" id="username"--%>
            <%--lay-verify="required"--%>
            <%--onblur="return phone();" name="unickname" tabindex="1" maxlength="11">--%>
            <%--</li>--%>

            <%--<li class="telNumber">--%>
            <%--<div class="dis">手机号码</div>--%>
            <%--<input type="text" class="input _phoneNum" id="userphone"--%>
            <%--lay-verify="required|phone"--%>
            <%--onblur="return phone();" name="uphonenumber" tabindex="1" maxlength="11">--%>
            <%--</li>--%>

            <%--<li>--%>
            <%--<div class="dis">短信验证码</div>--%>
            <%--<input type="text"--%>
            <%--onblur="return checkyanzhengma();"--%>
            <%--class="input _password"--%>
            <%--maxlength="16" tabindex="1">--%>
            <%--</li>--%>

            <%--<li>--%>
            <%--<div class="dis">密码</div>--%>
            <%--<input type="password"--%>
            <%--onblur="return checkupassword();"--%>
            <%--name="upassword" id="password" class="input _password"--%>
            <%--maxlength="16" tabindex="1"--%>
            <%--placeholder="6-16个字符，英文、数字组成"--%>
            <%-->--%>
            <%--</li>--%>

            <%--<li><span class="dis">确认密码</span>--%>
            <%--<input type="password"--%>
            <%--name="repeatPassword"--%>
            <%--onblur="return checkupassword1();" id="repeatPassword"--%>
            <%--class="input _repeatPassword" maxlength="16" tabindex="1" placeholder="请再次输入密码">--%>
            <%--</li>--%>

            <%--<li class="agree"><input name="protocol" id="protocol"--%>
            <%--type="checkbox" value="" checked="checked"> 我已阅读并同意《<a href=""--%>
            <%--target="_black">服务协议</a>》--%>
            <%--</li>--%>
            <%--<li class="btn"><button type="submit" class="regist_submit" style="margin-top: 16px" lay-submit>提交</button></li>--%>
            <%--</ul>--%>
            <%--</form>--%>
        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">
    layui.use('form', function () {
        var form = layui.form
        form.verify({
            pass: [
                /^[\S]{6,12}$/,
                '密码必须6-12位，且不能出现空格'
            ],
            confirmpass: function () {
                var password = document.getElementById('password').value
                var repassword = document.getElementById('repassword').value
                if (password !== repassword) {
                    return '输入密码不一致'
                }
            }
        })
    })
</script>
</html>