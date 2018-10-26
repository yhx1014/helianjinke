<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <title>币币贷</title>
    <link href="<%=basePath%>/css/common.css" rel="stylesheet"/>
</head>
<style type="text/css">
    .wrap {
        width: 1200px;
        margin: 0 auto;
        clear: both;
        background: #fff;
        padding: 20px
    }

    .tdbModule {
        width: 400px;
        margin: 0 auto;
    }

    .registerTitle {
        font-size: 20px;
        border-bottom: 1px solid #aaa;
        padding-bottom: 10px;
        text-align: center;
    }

    .registerCont {
        line-height: 38px;
        margin-top: 16px;
    }

    .input {
        width: 386px;
        height: 36px;
        margin-bottom: 4px;
        padding-left: 10px;
        outline: none;
    }

    .regist_submit {
        width: 386px;
        height: 40px;
        text-align: center;
        border: 1px solid #efefef;
        display: block;
        background: #DDE4EF;
        outline: none;
    }

    .regist_submit:hover {
        background: #423E9D;
        color: #fff;
    }
</style>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="wrap">
    <div class="tdbModule register">
        <div class="registerTitle">注册</div>
        <div class="registerCont">
            <form action="<%=basePath%>users/insert.do" method="post">
                <ul>
                    <li class="telNumber">
                        <div class="">用户名</div>
                        <input type="text" class="input username" id="phone"
                               onblur="return phone();" name="unickname" tabindex="1" maxlength="11">
                    </li>

                    <li class="telNumber">
                        <div class="dis">手机号码</div>
                        <input type="text" class="input _phoneNum" id="phone"
                               onblur="return phone();" name="uphonenumber" tabindex="1" maxlength="11">
                    </li>

                    <li>
                        <div class="dis">短信验证码</div>
                        <input type="text"
                               onblur="return checkyanzhengma();"
                               class="input _password"
                               maxlength="16" tabindex="1">
                    </li>

                    <li>
                        <div class="dis">密码</div>
                        <input type="password"
                               onblur="return checkupassword();"
                               name="upassword" id="password" class="input _password"
                               maxlength="16" tabindex="1"
                               placeholder="6-16个字符，英文、数字组成"
                        >
                    </li>

                    <li><span class="dis">确认密码</span>
                        <input type="password"
                               name="repeatPassword"
                               onblur="return checkupassword1();" id="repeatPassword"
                               class="input _repeatPassword" maxlength="16" tabindex="1" placeholder="请再次输入密码">
                    </li>

                    <li class="agree"><input name="protocol" id="protocol"
                                             type="checkbox" value="" checked="checked"> 我已阅读并同意《<a href=""
                                                                                                    target="_black">服务协议</a>》
                    </li>
                    <li class="btn"><input type="submit" class="regist_submit" style="margin-top: 16px"/></li>
                </ul>
            </form>
        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">
    function checkupassword() {
        var password = document.getElementById("password").value;
        if (password == "" || password == null) {
            return false;
        }
        if (password.length < 6) {
            return false;
        }
        if (password.length > 16) {
            return false;
        }
    }

    function checkupassword1() {
        var repeatPassword = document.getElementById("repeatPassword").value;
        var password = document.getElementById("password").value;
        if (repeatPassword == "" || repeatPassword == null) {
            return false;
        }
        if (repeatPassword.length < 6) {
            return false;
        }
        if (repeatPassword.length > 16) {
            return false;
        }
        if (password != repeatPassword) {
            return false;
        }
    }

    function phone() {
        var phone = document.getElementById("phone").value;
        var e = /^1(3|4|5|7|8)\d{9}$/;
        if (phone.length != 11) {
            return false;
        }
        if (e.test(phone) == false) {
            return false;
        }
    }
</script>
</html>