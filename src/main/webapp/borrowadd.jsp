<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<head>
	<title>币币袋</title>
	<link href="css/style.css" rel="stylesheet" />
	<link href="css/newstyle.css" rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="css/colorbox.css">
	<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css"  media="all">
	<link href="<%=basePath%>css/common.css" rel="stylesheet"/>
	<script src="<%=basePath%>layui/layui.js" charset="utf-8"></script>
	<style>
    	.applyc{ width:1200px; background:#fff; margin:13px auto;} 
		.applyc1{ padding:50px 38px 70px;}
	</style>
</head>

<body>
	 <jsp:include page="head.jsp"></jsp:include>
	 <div class="applyc">
     <div class="applyc1 clearfix">
     <form action="<%=basePath%>brower/insert.do" method="post">
		<div class="layui-form-item">
		    <label class="layui-form-label">质押币种</label>
		    <div class="layui-input-block">
		      <select style="lay-verify:required;" name="bmortgagetype">
		        <option value="0">BTC</option>
		        <option value="1">ETH</option>
		        <option value="2">USDT</option>
		      </select>
		    </div>
		 </div>
	     <div class="layui-form-item">
             <label class="layui-form-label">质押数量</label>
             <div class="layui-input-block">
             <input type="text" name="bmortgagecount" style="lay-verify:title;" autocomplete="off" placeholder="请输入数量" class="layui-input">
         </div>
        </div>
        <div class="layui-form-item">
		    <label class="layui-form-label">还款方式</label>
		    <div class="layui-input-block">
		      <select name="bpaytype" style="lay-verify:required;">
		        <option value="0">A</option>
		        <option value="1">B</option>
		        <option value="2">C</option>
		      </select>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <label class="layui-form-label">平台佣金</label>
		    <div class="layui-input-block">
		      <select name="bcommission" style="lay-verify:required;">
		        <option value="0">10</option>
		        <option value="1">20</option>
		      </select>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <label class="layui-form-label">借款币种</label>
		    <div class="layui-input-block">
		      <select name="btype" style="lay-verify:required;">
		        <option value="0">ETH</option>
		        <option value="1">BTC</option>
		      </select>
		    </div>
		 </div>
		 <div class="layui-form-item">
             <label class="layui-form-label">借款数量</label>
             <div class="layui-input-block">
             <input type="text" name="bcount" style="lay-verify:title;" autocomplete="off" placeholder="请输入数量" class="layui-input">
             </div>
         </div>
        <div class="layui-form-item">
		    <label class="layui-form-label">借款期限</label>
		    <div class="layui-input-block">
		      <select style="name:binterval;lay-verify:required;">
		        <option value="0">1</option>
		        <option value="1">2</option>
		        <option value="0">3</option>
		        <option value="1">4</option>
		      </select>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <label class="layui-form-label">借款利息</label>
		    <div class="layui-input-block">
		      <select name="brate" style="lay-verify:required;">
		        <option value="0">10</option>
		        <option value="1">20</option>
		        <option value="0">30</option>
		        <option value="1">40</option>
		      </select>
		    </div>
		 </div>
		 <button class="layui-btn layui-btn-primary">下一步骤</button>
	   </form>
     </div>
</div>
	<jsp:include page="bottom.jsp"></jsp:include>
</html>
