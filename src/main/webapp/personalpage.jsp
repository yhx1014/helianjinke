<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
<title>币币袋</title>
<link href="<%=basePath%>css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/user.css" />
<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
<script type="text/javascript" src="<%=basePath%>script/user.js"></script>
<script type="text/javascript" src="<%=basePath%>script/qrcode.js"></script>
<script type="text/javascript">
	function qrcode(ele,content,cqrcode) {
		$("#"+cqrcode).html("");
		showDlg(ele);
		new QRCode(document.getElementById(cqrcode), {
			text : content,
			width : 126,
			height : 126,
			colorDark : '#000000',
			colorLight : '#ffffff',
			correctLevel : QRCode.CorrectLevel.H
		});
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
	function reload() {
		window.location.reload();
	}
	$(document).ready(
			function() {
				$("#changeMobileBtn").click(
						function() {
							$.ajax({
								url : "${APP_PATH}/users/updateuphone/"
										+ $(this).attr('edit-id') + ".do",
								type : "POST",
								data : $("#changeMobileForm").serialize(),
								success : function(result) {
									console.log(result);
									alert('手机号修改成功！');
									closeDlg('changeMobileDlg');
									reload();
								}
							});
						})
			});
	$(document).ready(
			function() {
				$("#changeEmailBtn").click(
						function() {
							$.ajax({
								url : "${APP_PATH}/users/umailbox/"
										+ $(this).attr('edit-id') + ".do",
								type : "POST",
								data : $("#changeEmailForm").serialize(),
								success : function(result) {
									console.log(result);
									alert('邮箱修改成功！');
									closeDlg('changeEmailDlg');
									reload();
								}
							});
						})
			});
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
	border-bottom: 1px solid #000;
}

.user-title span {
	font-size: initial;
	font-weight: bold;
}

.user-icon {
	width: 30px;
	height: 20px;
	margin-right: 3px;
	display: inline-block;
	background-image: url(images/bor_pic01.png);
	display: inline-block;
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
</style>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="alert-450" id="ethQRCodeDlg" style="display: none">
		<div class="alert-title">
			<h3>ETH地址</h3>
			<span class="alert-close" onclick="closeDlg('ethQRCodeDlg')"></span>
		</div>
		<div class="alert-main">
			<div id="ethqrcode"></div>
		</div>
	</div>
	<div class="alert-450" id="btcQRCodeDlg" style="display: none">
		<div class="alert-title">
			<h3>BTC地址</h3>
			<span class="alert-close" onclick="closeDlg('btcQRCodeDlg')"></span>
		</div>
		<div class="alert-main">
			<div id="btcqrcode"></div>
		</div>
	</div>
	<div class="alert-450" id="changeMobileDlg" style="display: none">
		<div class="alert-title">
			<h3>修改手机号</h3>
			<span class="alert-close" onclick="closeDlg('changeMobileDlg')"></span>
		</div>
		<div class="alert-main">
			<form id="changeMobileForm">
				<div>
					<span>原手机号：</span><span>${user.uphonenumber}</span>
				</div>
				<div>
					<label for="uphone_new">新手机号：</label><input type="text"
						id="uphone_new" name="uphonenumber" />
				</div>
				<div>
					<button type="button" id="changeMobileBtn" edit-id="${user.uid}">确认</button>
				</div>
			</form>
		</div>
	</div>
	<div class="alert-450" id="changeEmailDlg" style="display: none">
		<div class="alert-title">
			<h3>修改邮箱</h3>
			<span class="alert-close" onclick="closeDlg('changeEmailDlg')"></span>
		</div>
		<div class="alert-main">
			<form id="changeEmailForm">
				<div>
					<span>当前邮箱：</span><span>${user.umailbox}</span>
				</div>
				<div>
					<label for="uphone_new">新邮箱：</label><input type="text"
						id="email_new" name="umailbox" />
				</div>
				<div>
					<span id="warning-span"></span>
				</div>
				<div>
					<button type="button" id="changeEmailBtn" edit-id="${user.uid}">确认</button>
				</div>
			</form>
		</div>
	</div>
	<div class="w1200 personal">
		<jsp:include page="left.jsp"></jsp:include>
		<div class="personal-main">
			<div class="pmain-profile">
				<div class="pmain-user">
					<div class="user-title">
						<i class="user-icon"></i> <span>基本资料</span>
					</div>
					<div class="user-info">
						<div class="table-tr">
							<div class="table-th">UID</div>
							<div class="table-td">TDKNSK3942302${user.uid}</div>
						</div>
						<div class="table-tr">
							<div class="table-th">用户名</div>
							<div class="table-td">${user.unickname}</div>
							<div class="table-last">
								<span><a>更改</a></span>
							</div>
						</div>
						<div class="table-tr">
							<div class="table-th">手机号</div>
							<div class="table-td">${user.uphonenumber}</div>
							<div class="table-last">
								<span><a href="javascript:void(0)"
									onclick="showDlg('changeMobileDlg')">更改</a></span>
							</div>
						</div>
						<div class="table-tr">
							<div class="table-th">邮箱</div>
							<div class="table-td">${user.umailbox}</div>
							<div class="table-last">
								<span><a href="javascript:void(0)"
									onclick="showDlg('changeEmailDlg')">更改</a></span>
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
						<i class="security-setting-icon"></i> <span>资产信息</span>
					</div>
					<div class="user-info">
						<div class="table-tr">
							<div class="table-th">ETH地址</div>
							<div class="table-td" id="ethAddress">${user.ethaddress}</div>
							<div class="table-last">
								<span><a href="javascript:void(0)"
									onclick="qrcode('ethQRCodeDlg',getElementById('ethAddress').innerHTML,'ethqrcode')">查看二维码</a></span>
							</div>
						</div>
						<div class="table-tr">
							<div class="table-th">BTC地址</div>
							<div class="table-td"  id="btcaddress">${user.btcaddress}</div>
							<div class="table-last">
								<span><a href="javascript:void(0)"
									onclick="qrcode('btcQRCodeDlg',getElementById('btcaddress').innerHTML,'btcqrcode')">查看二维码</a></span>
							</div>
						</div>
						<div class="table-tr">
							<div class="table-th">登录密码</div>
							<div class="table-td">${user.upassword}</div>
							<div class="table-last">
								<span><a>更改</a></span>
							</div>
						</div>
						<div class="table-tr">
							<div class="table-th">资金密码</div>
							<div class="table-td">${user.upwd_zd}</div>
							<div class="table-last">
								<span><a>更改</a></span>
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
								<span><a>认证</a></span>
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
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>