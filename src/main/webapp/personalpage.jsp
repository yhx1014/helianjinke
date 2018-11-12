<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<html>
<head>
    <title>币币袋</title>
    <link href="<%=basePath%>/css/common.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/common.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/user.js"></script>
    <script type="text/javascript" src="<%=basePath%>/script/qrcode.js"></script>
    <script type="text/javascript">
        function showDlg(op) {
            $("body").append("<div id='mask'></div>");
            $("#mask").addClass("mask").css("display", "block");
            $("#" + op).css("display", "block");
        }

        function closeDlg(op) {
            $("#mask").css("display", "none");
            $("#" + op).css("display", "none");
        }

        function reload() {
            window.location.reload();
        }

        $(document).ready(
            function () {
                $("#changeMobileBtn").click(
                    function () {
                        $.ajax({
                            url: "<%=basePath%>/users/updateuphone/"
                            + $(this).attr('edit-id'),
                            type: "POST",
                            data: $("#changeMobileForm").serialize(),
                            success: function (result) {
                                console.log(result);
                                alert('手机号修改成功！');
                                closeDlg('changeMobileDlg');
                                reload();
                            }
                        });
                    })
            });
        $(document).ready(
            function () {
                $("#changeEmailBtn").click(
                    function () {
                        $.ajax({
                            url: "<%=basePath%>/users/umailbox/"
                            + $(this).attr('edit-id'),
                            type: "POST",
                            data: $("#changeEmailForm").serialize(),
                            success: function (result) {
                                console.log(result);
                                alert('邮箱修改成功！');
                                closeDlg('changeEmailDlg');
                                reload();
                            }
                        });
                    })
            });
        $(document).ready(
            function () {
                $("#personal-left li:last").removeClass("pleft-cur");
                $("#personal-left li:first").addClass("pleft-cur");
            }
        )
    </script>
    <style type="text/css">
        .table-tr {
            display: table-row;
            width: 100%;
            height: 40px;
        }

        .table-th {
            width: 40%;
            display: table-cell;
        }

        .table-td {
            width: 30%;
            color: #999;
            display: table-cell;
        }

        .table-last {
            text-align: right;
            width: 30%;
            display: table-cell;
        }

        .user-title {
            padding-bottom: 8px;
            border-bottom: 1px solid #ccc;
        }

        .user-title span {
            font-size: initial;
        }

        .user-icon {
            width: 30px;
            height: 20px;
            margin-right: 3px;
            display: inline-block;
            background-image: url(images/bor_pic01.png);
        }

        .security-setting-icon {
            width: 30px;
            height: 20px;
            margin-right: 3px;
            display: inline-block;
            background-image: url(images/bor_pic07.png)
        }

        .identity-auth-icon {
            width: 30px;
            height: 20px;
            margin-right: 3px;
            display: inline-block;
            background-image: url(images/bor_pic05.png)
        }

        .alert-450 {
            position: absolute;
            top: 25%;
            left: 50%;
            z-index: 100;
            float: left;
            margin-left: -225px;
            width: 450px;
            background: #fff;
            padding-bottom: 20px;
            /*box-shadow:0 0 3px #E1E1E1;*/
        }

        .alert-title {
            background: none;
            border-bottom: none;
        }

        .alert-main {
            text-align: center;
            font-size: 14px;
            width: 100%;
            line-height: 30px;
        }

        .mask {
            background: #000;
            opacity: 0.3;
        }

        .alert-content {
            text-align: left;
            margin: 0 34px;
            line-height: 44px;
        }

        .alert-content label {
            display: inline-block;
            width: 84px;
            text-align: right;
            padding-right: 10px;
        }

        .alert-content input {
            width: 270px;
        }

        .verify-btn {
            display: inline-block;
            width: 90px;
            height: 34px;
            line-height: 34px;
            background: #423E9D;
            color: #fff;
            text-align: center;
            font-size: 12px;
        }

        .sbumit-btn {
            width: 180px;
            background: #423E9D;
            margin-left: 100px;
            border: none;
            outline: none;
            color: #fff;
            line-height: 30px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp"/>

<%--设置邮箱内容--%>
<div class="alert-450" id="changeEmailDlg" style="display: none">
    <div class="alert-title">
        <h3>设置邮箱</h3>
        <span class="alert-close" onclick="closeDlg('changeEmailDlg')"></span>
    </div>
    <div class="alert-main">
        <form id="changeEmailForm" class="alert-content">
            <div>
                <label for="email_new">邮箱</label>
                <input type="text" id="email_new" name="email_new"/>
            </div>
            <div>
                <label for="verify_phone">邮箱验证码</label>
                <input type="text" id="verify_phone" name="verify_phone" style="width: 176px"/>
                <span class="verify-btn">获取验证码</span>
            </div>
            <div style="border-top: 1px solid #ddd;padding-top: 20px;margin-top: 40px">
                <button type="button" id="changePhoneBtn" edit-id="${user.uid}" class="sbumit-btn">确认</button>
            </div>
        </form>
    </div>
</div>

<%--绑定手机号--%>
<div class="alert-450" id="bindMobileDlg" style="display: none">
    <div class="alert-title">
        <h3>手机绑定</h3>
        <span class="alert-close" onclick="closeDlg('bindMobileDlg')"></span>
    </div>
    <div class="alert-main">
        <form id="changePhoneForm" class="alert-content">
            <div>
                <label for="curr_phone">当前手机号</label>
                <input type="text" id="curr_phone" name="phone_new"/>
            </div>
            <div>
                <label for="phone_new">手机号</label>
                <input type="text" id="phone_new" name="phone_new"/>
            </div>
            <div>
                <label for="check_phone">手机验证码</label>
                <input type="text" id="check_phone" name="check_phone" style="width: 176px"/>
                <span class="verify-btn">获取验证码</span>
            </div>

            <%--<div>--%>
            <%--<span id="warning-span"></span>--%>
            <%--</div>--%>
            <div style="border-top: 1px solid #ddd;padding-top: 20px;margin-top: 40px">
                <button type="button" id="changeEmailBtn" edit-id="${user.uid}" class="sbumit-btn">提交</button>
            </div>
        </form>
    </div>
</div>
<%--修改手机号--%>
<div class="alert-450" id="changeMobileDlg" style="display: none">
    <div class="alert-title">
        <h3>修改手机号</h3>
        <span class="alert-close" onclick="closeDlg('changeMobileDlg')"></span>
    </div>
    <div class="alert-main">
        <form id="changeMobileForm" class="alert-content">
            <%--<div>--%>
            <%--<label>原手机号</label><span>${user.uphonenumber}</span>--%>
            <%--</div>--%>
            <div>
                <label for="confirm_phone">手机验证码</label>
                <input type="text" id="confirm_phone" name="confirm_phone" style="width: 176px"/>
                <span class="verify-btn">获取验证码</span>
            </div>
            <div>
                <label for="psw_login">登录密码</label>
                <input type="text" id="psw_login" name="psw_login"/>
            </div>
            <div>
                <label for="mobile_new">新手机号码</label>
                <input type="text" id="mobile_new" name="mobile_new"/>
            </div>
            <div>
                <label for="verify_newphone">手机验证码</label>
                <input type="text" id="verify_newphone" name="verify_newphone" style="width: 176px"/>
                <span class="verify-btn">获取验证码</span>
            </div>
            <div style="border-top: 1px solid #ddd;padding-top: 20px;margin-top: 40px">
                <button type="button" id="changeMobileBtn" edit-id="${user.uid}" class="sbumit-btn">确认</button>
            </div>
        </form>
    </div>
</div>
<%--修改登陆密码--%>
<div class="alert-450" id="changeLoginDlg" style="display: none">
    <div class="alert-title">
        <h3>修改登录密码</h3>
        <span class="alert-close" onclick="closeDlg('changeLoginDlg')"></span>
    </div>
    <div class="alert-main">
        <form id="changeLoginForm" class="alert-content">
            <%--<div>--%>
            <%--<span>当前邮箱：</span><span>${user.umailbox}</span>--%>
            <%--</div>--%>
            <div>
                <label for="psw_old">原密码</label>
                <input type="text" id="psw_old" name="psw_old"/>
            </div>
            <div>
                <label for="psw_new">新密码</label>
                <input type="text" id="psw_new" name="psw_new"/>
            </div>
            <div>
                <label for="confirm_psw">确认新密码</label>
                <input type="text" id="confirm_psw" name="confirm_psw"/>
            </div>
            <%--<div>--%>
            <%--<span id="warning-span"></span>--%>
            <%--</div>--%>
            <div style="border-top: 1px solid #ddd;padding-top: 20px;margin-top: 40px">
                <button type="button" id="changeLoginBtn" edit-id="${user.uid}" class="sbumit-btn">确认</button>
            </div>
        </form>
    </div>
</div>
<%--修改资金密码内容--%>
<div class="alert-450" id="changePayPswDlg" style="display: none">
    <div class="alert-title">
        <h3>设置支付密码</h3>
        <span class="alert-close" onclick="closeDlg('changePayPswDlg')"></span>
    </div>
    <div class="alert-main">
        <form id="changePayForm" class="alert-content">
            <%--<div>--%>
            <%--<span>当前邮箱：</span><span>${user.umailbox}</span>--%>
            <%--</div>--%>
            <div>
                <label for="payPsw_new">新密码</label>
                <input type="text" id="payPsw_new" name="payPsw_new"/>
            </div>
            <div>
                <label for="payPsw_again">确认新密码</label>
                <input type="text" id="payPsw_again" name="payPsw_again"/>
            </div>
            <%--<div>--%>
            <%--<span id="warning-span"></span>--%>
            <%--</div>--%>
            <div style="border-top: 1px solid #ddd;padding-top: 20px;margin-top: 40px">
                <button type="button" id="PayPswBtn" edit-id="${user.uid}" class="sbumit-btn">确认</button>
            </div>
        </form>
    </div>
</div>
<%--初级实名认证--%>
<div class="alert-450" id="primeryAuthenticDlg" style="display: none">
    <div class="alert-title">
        <h3>初级实名认证</h3>
        <span class="alert-close" onclick="closeDlg('primeryAuthenticDlg')"></span>
    </div>
    <div class="alert-main">
        <form id="primeryAuthenticForm" class="alert-content">
            <%--<div>--%>
            <%--<span>当前邮箱：</span><span>${user.umailbox}</span>--%>
            <%--</div>--%>
            <div>
                <label for="nationality">国籍</label>
                <input type="text" id="nationality" name="nationality"/>
            </div>
            <div>
                <label for="name">姓名</label>
                <input type="text" id="name" name="name"/>
            </div>
            <div>
                <label for="certificate_type">证件类型</label>
                <input type="text" id="certificate_type" name="certificate_type"/>
            </div>
            <div>
                <label for="certificate_code">证件号码</label>
                <input type="text" id="certificate_code" name="certificate_code"/>
            </div>
            <%--<div>--%>
            <%--<span id="warning-span"></span>--%>
            <%--</div>--%>
            <div style="border-top: 1px solid #ddd;padding-top: 20px;margin-top: 40px">
                <button type="button" id="primeryAuthentic" edit-id="${user.uid}" class="sbumit-btn">确认</button>
            </div>
        </form>
    </div>
</div>
<%--个人资料展示页面--%>
<div class="w1200 personal">
    <jsp:include page="left.jsp"/>
    <div class="personal-main">
        <div class="pmain-profile">
            <div class="pmain-user">
                <div class="user-title">
                    <i class="user-icon"></i> <span>基本资料</span>
                </div>
                <div class="user-info">
                    <div class="table-tr">
                        <div class="table-th">UID</div>
                        <div class="table-td">FOR${user.uid}</div>
                    </div>
                    <%--<div class="table-tr">--%>
                    <%--<div class="table-th">用户名</div>--%>
                    <%--<div class="table-td">${user.unickname}</div>--%>
                    <%--<div class="table-last">--%>
                    <%--<span><a>更改</a></span>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <div class="table-tr">
                        <div class="table-th">手机号</div>
                        <div class="table-td">${user.phonenumber}</div>
                        <%--<div class="table-last">--%>
                        <%--<span><a href="javascript:void(0)"--%>
                        <%--onclick="showDlg('changeMobileDlg')">更改</a></span>--%>
                        <%--</div>--%>
                    </div>
                    <div class="table-tr">
                        <div class="table-th">邮箱</div>
                        <div class="table-td">${user.mailbox}</div>
                        <div class="table-last">
								<span><a href="javascript:void(0)"
                                         onclick="showDlg('changeEmailDlg')">去设置</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="personal-main">
        <div class="pmain-profile">
            <div class="pmain-user">
                <div class="user-title">
                    <i class="security-setting-icon"></i> <span>安全设置</span>
                </div>
                <div class="user-info">
                    <div class="table-tr">
                        <div class="table-th">手机绑定</div>
                        <div class="table-td">${user.password}</div>
                        <div class="table-last">
                            <span><a href="javascript:void(0)"
                                     onclick="showDlg('bindMobileDlg')">绑定</a></span>
                            <%--需要JSP判断显示哪个按钮--%>
                            <%--<span><a href="javascript:void(0)"--%>
                            <%--onclick="showDlg('changeMobileDlg')">修改</a></span>--%>
                        </div>
                    </div>
                    <div class="table-tr">
                        <div class="table-th">邮箱绑定</div>
                        <div class="table-td">${user.mailbox}</div>
                        <div class="table-last">
                            <span><a>设置</a></span>
                        </div>
                    </div>
                    <div class="table-tr">
                        <div class="table-th">登录密码</div>
                        <div class="table-td">${user.password}</div>
                        <div class="table-last">
                            <span><a href="javascript:void(0)"
                                     onclick="showDlg('changeLoginDlg')">修改</a></span>
                        </div>
                    </div>
                    <div class="table-tr">
                        <div class="table-th">资金密码</div>
                        <div class="table-td">${user.assetsPwd}</div>
                        <div class="table-last">
                            <span><a href="javascript:void(0)"
                                     onclick="showDlg('changePayPswDlg')">修改</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="personal-main">
        <div class="pmain-profile">
            <div class="pmain-user">
                <div class="user-title">
                    <i class="identity-auth-icon"></i><span>身份认证</span>
                </div>
                <div class="user-info">
                    <div class="table-tr">
                        <div class="table-th">初级实名认证</div>
                        <div class="table-td">未认证</div>
                        <div class="table-last">
                           <span><a href="javascript:void(0)"
                                    onclick="showDlg('primeryAuthenticDlg')">认证</a></span>
                        </div>
                    </div>
                    <div class="table-tr">
                        <div class="table-th">高级实名认证</div>
                        <div class="table-td">未认证</div>
                        <div class="table-last">
                            <span><a>认证</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"/>
</body>
</html>