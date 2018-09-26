<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>   
<html>
	<head>
		<title>币币袋</title>
		<link href="<%=basePath%>css/common.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/user.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jquery.datetimepicker.css"/>
		<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
		<script src="<%=basePath%>script/user.js" type="text/javascript"></script>
	</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>	
    <div class="w1200 personal">
	    <jsp:include page="left.jsp"></jsp:include>
    	<div class="personal-main">
        <div class="pmain-profile">
        <div class="pmain-user">
          <div class="user-info user-info1">
            <ul>
              <li>用户名:<span>${user.unickname}</span></li>
              <li>电话号:<span>${user.uphonenumber}</span></li>
              <li>ETH地址:<span>${user.ethaddress}</span></li>
              <li>安全级别:<span><i class="safe-level"><i class="onlevel" style="width:40%;" ></i></i></span> <a href="#">[低]</a></li>
            </ul>
          </div>
        </div>
        <div class="pmain-money">
          <ul>
            <li class="none"><span><em>账户总额</em><i id="zhze" class="markicon"></i><span class="arrow-show1" style="display:none;">可用余额+待收本息</span><span class="icon-show1" style="display:none;"></span></span> <span class="truemoney"><i class="f26 fb">0.00 </i> 元</span> </li>
            <li><span><em>冻结余额</em><i id="dsbx" class="markicon"></i><span class="arrow-show2" style="display:none;">未到账的投资项目的本金、利息总额</span><span class="icon-show2" style="display:none;"></span></span> <span class="truemoney"><i class="f26 fb">0.00 </i>元</span> </li>
            <li><span><em>总负债金额</em><i id="ljsy" class="markicon"></i><span class="arrow-show3" style="display: none;">已到账的投资收益+未到账的投资收益</span><span class="icon-show3" style="display: none;"></span></span> <span class="truemoney"><i class="f26 fb c-pink">0.00 </i> 元</span> </li>
          </ul>
        </div>
    </div>
</div>
    	<div class="personal-main">
        <div class="pmain-profile">
        <div class="pmain-user">
          <div class="user-info user-info1">
            <ul>
              <li>用户名:<span>${user.unickname}</span></li>
              <li>电话号:<span>${user.uphonenumber}</span></li>
              <li>ETH地址:<span>${user.ethaddress}</span></li>
              <li>安全级别:<span><i class="safe-level"><i class="onlevel" style="width:40%;" ></i></i></span> <a href="#">[低]</a></li>
            </ul>
          </div>
        </div>
        <div class="pmain-money">
          <ul>
            <li class="none"><span><em>账户总额</em><i id="zhze" class="markicon"></i><span class="arrow-show1" style="display:none;">可用余额+待收本息</span><span class="icon-show1" style="display:none;"></span></span> <span class="truemoney"><i class="f26 fb">0.00 </i> 元</span> </li>
            <li><span><em>冻结余额</em><i id="dsbx" class="markicon"></i><span class="arrow-show2" style="display:none;">未到账的投资项目的本金、利息总额</span><span class="icon-show2" style="display:none;"></span></span> <span class="truemoney"><i class="f26 fb">0.00 </i>元</span> </li>
            <li><span><em>总负债金额</em><i id="ljsy" class="markicon"></i><span class="arrow-show3" style="display: none;">已到账的投资收益+未到账的投资收益</span><span class="icon-show3" style="display: none;"></span></span> <span class="truemoney"><i class="f26 fb c-pink">0.00 </i> 元</span> </li>
          </ul>
        </div>
    </div>
</div>
    	<div class="personal-main">
        <div class="pmain-profile">
        <div class="pmain-user">
          <div class="user-info user-info1">
            <ul>
              <li>用户名:<span>${user.unickname}</span></li>
              <li>电话号:<span>${user.uphonenumber}</span></li>
              <li>ETH地址:<span>${user.ethaddress}</span></li>
              <li>安全级别:<span><i class="safe-level"><i class="onlevel" style="width:40%;" ></i></i></span> <a href="#">[低]</a></li>
            </ul>
          </div>
        </div>
        <div class="pmain-money">
          <ul>
            <li class="none"><span><em>账户总额</em><i id="zhze" class="markicon"></i><span class="arrow-show1" style="display:none;">可用余额+待收本息</span><span class="icon-show1" style="display:none;"></span></span> <span class="truemoney"><i class="f26 fb">0.00 </i> 元</span> </li>
            <li><span><em>冻结余额</em><i id="dsbx" class="markicon"></i><span class="arrow-show2" style="display:none;">未到账的投资项目的本金、利息总额</span><span class="icon-show2" style="display:none;"></span></span> <span class="truemoney"><i class="f26 fb">0.00 </i>元</span> </li>
            <li><span><em>总负债金额</em><i id="ljsy" class="markicon"></i><span class="arrow-show3" style="display: none;">已到账的投资收益+未到账的投资收益</span><span class="icon-show3" style="display: none;"></span></span> <span class="truemoney"><i class="f26 fb c-pink">0.00 </i> 元</span> </li>
          </ul>
        </div>
    </div>
</div>
</div>
	 <jsp:include page="bottom.jsp"></jsp:include>	
</body>
</html>