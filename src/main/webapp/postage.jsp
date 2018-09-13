<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亿人网--资费说明</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=basePath%>css/common.css" rel="stylesheet" />
<link href="<%=basePath%>css/about.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
</head>
<body>
 <!-- 导航栏 --><jsp:include page="head.jsp"></jsp:include>


<!--关于我们-->
<div class="bg">
  <div class="contain" id="tabs" style="margin:0 auto;">
  
    <!--关于我们--><jsp:include page="my_ue.jsp"></jsp:include>
    
    <div class="text-box">
		<div class="text-content" id="text-content">
				<h1 class="title">资费说明</h1>
				<p class="mt10 cn_line">
					<strong>一、投资者居间服务费：</strong> <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 投资者在收回借款时，网站将相应收取居间服务费，居间服务费为借款利息的10%，从每期还款中直接扣除。<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 亿人宝郑重承诺：如投资者未能获得利息，亿人宝将启动“赔付宝”本息安全保障计划，按照《“赔付宝”资金使用规则》对投资者的本金及利息进行垫付，除居间服务费外，网站不向投资人收取其他费用。
				</p>
				<p>
					<br>
				</p>
				<p class="mt10 cn_line">
					<strong>二、充值费和取现费：</strong><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 充值费用：<span style="color:#e53333;">所有用户充值全部免费</span>。<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 提现费用：亿人宝不向平台会员收取任何提现费用，仅代为收取第三方平台（环迅支付）应缴纳的提现费用。 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;普通会员提现时按照额度，每笔收取提现金额的千分之三（0.3%），上不封顶。 <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#e53333;">亿人宝VIP会员缴纳年费后，将免费提现</span>，由亿人宝支付应向第三方平台（环迅支付）缴纳的提现费用。 
				</p>
				<p>
					<br>
				</p>
				<p class="mt10 cn_line">
					<strong>三、成为会员：</strong> <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 凡是在亿人宝平台注册的用户，自动成为亿人宝普通会员，<span style="color:#e53333;">普通会员免会员费。</span><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 普通会员可在缴纳会员费后升级为VIP会员，会员费每年为500元。 <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. VIP会员享受取现免费、优先办理业务、优先本金或本息垫付、月度电子对账单发送等服务。 <br>
				</p>
			</div>
		</div>
  </div>
</div>
<!-- 导航栏 --><jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>