<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>币币袋</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=basePath%>/css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/user.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/jquery.datetimepicker.css" />
<script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/script/common.js"></script>
<script src="<%=basePath%>/script/user.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<style type="text/css">
.personal-wallet {
	margin-left: 13%;
	float: left;
	color: #848484;
	background: #fff;
	padding: 0 30px 30px;
	font-size: 14px;
}

.personal-wallet h3 {
	position: relative;
	font-size: 18px;
	color: #333;
	border-bottom: 1px solid #DCDCDC;
	width: 880px;
	padding-top: 25px;
	height: 35px;
}

.personal-wallet h3 i {
	position: absolute;
	left: 0;
	bottom: -1px;
	border-bottom: 2px solid #28A7E1;
	padding-bottom: 10px;
}

.wallet-BTC, .wallet-ETH, .wallet-USDT {
	background: #f6dc6a;
	width: 30%;
	height: 287px;
	float: left;
	margin: 15px 15px;
}

.wallet-BTC h1, .wallet-ETH h1, .wallet-USDT h1 {
	font-size: xx-large;
	font-weight: inherit;
}

.wallet-title {
	height: 15%;
}

.coin-amount {
	background: #deedef;
	text-align: center;
	font-size: xx-large;
	height: 70%;
}

.coin-operate {
	height: auto;
}

.coin-operate span {
	margin-top:10px;
	text-align: center;
	font-size: large;
	width: 50%;
	float: left;
}

.operate-btn {

}
</style>
</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrapper wbgcolor">
		<div class="w1200 personal">
			<div class="personal-wallet">
				<div>
					<h3>
						<i>我的钱包</i>
					</h3>
				</div>
				<div class="pmain-money">
					<ul>
						<li class="none"><span><em>账户总额</em><i id="zhze"
								class="markicon"></i><span class="arrow-show1"
								style="display: none;">可用余额+待收本息</span><span class="icon-show1"
								style="display: none;"></span></span> <span class="truemoney"><i
								class="f26 fb">0.00 </i> 元</span></li>
						<li><span><em>待收本息</em><i id="dsbx" class="markicon"></i><span
								class="arrow-show2" style="display: none;">未到账的投资项目的本金、利息总额</span><span
								class="icon-show2" style="display: none;"></span></span> <span
							class="truemoney"><i class="f26 fb">0.00 </i>元</span></li>
						<li><span><em>累计收益</em><i id="ljsy" class="markicon"></i><span
								class="arrow-show3" style="display: none;">已到账的投资收益+未到账的投资收益</span><span
								class="icon-show3" style="display: none;"></span></span> <span
							class="truemoney"><i class="f26 fb c-pink">0.00 </i> 元</span></li>
					</ul>
				</div>
				<div class="wallet-BTC">
					<div class="wallet-title">
						<h1>BTC</h1>
					</div>
					<div class="coin-amount">
						<span>3.00000000</span>
					</div>
					<div class="coin-operate">
						<div class="operate-btn">
							<span>充值</span><span>提现</span>
						</div>
					</div>
				</div>
				<div class="wallet-ETH">
					<div class="wallet-title">
						<h1>ETH</h1>
					</div>
					<div class="coin-amount">
						<span>3.00000000</span>
					</div>
					<div class="coin-operate">
						<div class="operate-btn">
							<span>充值</span><span>提现</span>
						</div>
					</div>
				</div>
				<div class="wallet-USDT">
					<div class="wallet-title">
						<h1>USDT</h1>
					</div>
					<div class="coin-amount">
						<span>3.00000000</span>
					</div>
					<div class="coin-operate">
						<div class="operate-btn">
							<span>充值</span><span>提现</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>