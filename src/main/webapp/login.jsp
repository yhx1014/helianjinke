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
    <style>
        .wrap {
            width: 1200px;
            margin: 0 auto;
            clear: both;
            background: #fff;
            padding: 20px;
            height: 70vh;
        }

        .tdbModule {
            width: 400px;
            margin: 10vh auto;

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

        .login_submit {
            width: 386px;
            height: 40px;
            text-align: center;
            border: 1px solid #efefef;
            display: block;
            background: #DDE4EF;
            outline: none;
        }

        .login_submit:hover {
            background: #423E9D;
            color: #fff;
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="wrap">
    <form id="LonginForm" name="LonginForm" action="<%=basePath%>/login" method="post">
        <div class="tdbModule loginPage">
            <div class="registerTitle">用户登录</div>
            <div class="registerCont">
                <ul id="loginform">
                    <li><span id="prrintInfo" data-info=""><span>${status}</span></span>
                    </li>
                    <li><span class="dis">用户名：</span>
                        <input class="input"
                               type="text" onblur="" name="unickname" id="userName"
                               maxlength="24" tabindex="1" autocomplete="off" placeholder="手机或邮箱"/>
                    </li>
                    <li><span class="dis">密码：</span>
                        <input class="input"
                               type="password" name="upassword" id="password" maxlength="24"
                               tabindex="1" autocomplete="off" placeholder="请输入密码"/>
                    </li>
                    <%-- <li><span class="dis">验证码：</span>
                    <input type="text"
                        onkeyup="verify(this)" id="jpgVerify" style="width: 310px;"
                        class="input" name="yzm" data-msg="验证码" maxlength="4"
                        tabindex="1" autocomplete="off">
                        <img src="<%=basePath%>/images/code.jpg" id="yanzheng" alt="点击更换验证码"  title="点击更换验证码"
                        style="cursor: pointer;" class="valign" onclick="this.src='' " />
                    </li> --%>
                    <li class="btn">
                        <input type="submit" class="login_submit" style="margin-top: 16px" value="立即登录">
                        <%--<span class="login_submit" style="margin-top: 16px">立即登录</span>--%>
                        <table style="width:400px;">
                            <tr>
                                <td style="width:300px">还没有账号？ <a href="###" target="_blank">立即注册</a></td>
                                <td style="align:right;"><a href="###" target="_blank">忘记密码?</a></td>
                            </tr>
                        </table>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
