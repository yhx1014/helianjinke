<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>币币袋</title>
	<link href="<%=basePath %>css/common.css" rel="stylesheet"/>
	<link href="<%=basePath %>css/index.css" rel="stylesheet" type="text/css"/>
	<link href="<%=basePath %>css/detail.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="script/jquery.min.js"></script>
	<script type="text/javascript" src="script/common.js"></script>
	<script src="<%=basePath %>script/ablumn.js"></script>
	<script src="<%=basePath %>script/plugins.js"></script>
	<script src="<%=basePath %>script/detail.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/style.css"/>
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/all.js"></script>
	
	<%! String dk="";%>
	<script>
		function test(who){
			if(who=='home'){
				document.getElementById("div").html="<span>房屋数量</span><input type='text' class='bor_inputbg03 input2'/><br/><br/><span>总价值</span><input type='text' class='bor_inputbg04 input2'/><br/>";
			}
			if(who=='car'){
				<%dk="car";%>
				alert("<%= dk %>"); 
				document.getElementById("div").html="<span>车辆数量</span><input type='text' class='bor_inputbg03 input2'/><br/><br/><span>总价值</span><input type='text' class='bor_inputbg04 input2'/><br/>";
			}
			if(who=='credit'){
				<%dk="credit";%>
				document.getElementById("div").html="<span>车辆数量</span><input type='text' class='bor_inputbg03 input2'/><br/><br/><span>总价值</span><input type='text' class='bor_inputbg04 input2'/><br/>";
			}
			if(who=='pay'){
				<%dk="pay";%>
				alert("<%= dk %>");
			}
		}
	</script>
</head>


<body>
	<jsp:include page="head.jsp"></jsp:include>


<div class="bor_con_wper">
	  <div class="bor_con px1000">
	  	    <div class="bor_detail">
	  	    	   <h2 class="bor_detail_tit">
	  	    	   	  <span class="bor_decurspan" onclick="test('home');">房产抵押</span>
	  	    	   	  <span <c:if test="'<%=dk%>'=='home'">class="bor_decurspan"</c:if> onclick="test('car');">车辆抵押</span>
	  	    	   	  <span onclick="test('credit');">信用贷款</span>
	  	    	   	  <span onclick="test('pay');">零首付车贷</span>
	  	    	   </h2>
	  	    	   <div class="bor_detail_box">
	  	    	   	    <div class="bor_det_one clearfix pt30 pb30">
	  	    	   	    	  <div class="bor_det_onel fl">
	  	    	   	    	  	       <p class="bor_p1">币币袋平台的旨在帮助抵押用户以
										低成本获得借款。用户在需要资金时，可以将
										数字货币作为抵押物，审核通过后，根据抵押物的价值融资。</p>
										<p class="bor_p2">币币袋平台的旨在帮助抵押用户以
										低成本获得借款。用户在需要资金时，可以将数字货币作为抵押物，审核
										通过后，根据抵押物的价值融资。</p>
										<h3 class="bor_onel_tit"><span>申请条件</span></h3>
										<ul class="bor_onel_ul">
											 <li><img src="images/bor_pic01.png" alt=""/>年满18周岁以上的公民
											 </li>
											 <li><img src="images/bor_pic03.png" alt=""/>个人或企业银行征信记录良好
											 </li>
											 <li><img src="images/bor_pic04.png" alt=""/>无现有诉讼记录
											 </li>
											 
										</ul>
										<h3 class="bor_onel_tit"><span>提交资料</span></h3>
										<ul class="bor_onel_ul"><li>&nbsp;<img src="images/bor_pic05.png" alt=""/>身份证</li><li><img src="images/bor_pic06.png" alt=""/>申请资料</li></ul>
	  	    	   	    	  </div>
	  	    	   	    	  <div class="bor_det_oner fl">
    	   	    	            <form>
  	    	   	    	  	     	<fieldset>
  	    	   	    	  	     	 <div>
  	    	   	    	  	     	    <label>申请人</label>
  	    	   	    	  	     	    <input/>
  	    	   	    	  	     	 </div>
  	    	   	    	  	     	  	   <div class="mt15">
  	    	   	    	  	     	  	   	   <label>*借款额度</label>
  	    	   	    	  	     	  	   	   <input class="bor_inputbg01"/>
  	    	   	    	  	     	  	   </div>
                                              <div class="mt15">
  	    	   	    	  	     	  	   	   <label>*借款期限</label>
  	    	   	    	  	     	  	   	  <input type="" class="bor_inputbg02"/>
  	    	   	    	  	     	  	   </div>
  	    	   	    	  	     	  	   <div class="mt15">
  	    	   	    	  	     	  	   	   <label>*手机号码</label>
  	    	   	    	  	     	  	   	   <input type=""/>
  	    	   	    	  	     	  	   </div>
  	    	   	    	  	     	  	   <div class="mt15 guarmethod clearfix">
  	    	   	    	  	     	  	   	   <div class="fl" id="div">
  	    	   	    	  	     	  	   	   </div>
  	    	   	    	  	     	  	   	   	  <span>比特币数</span>
  	    	   	    	  	     	  	   	   	   <input type="text" class="bor_inputbg03 input2"/><br/><br/>
  	    	   	    	  	     	  	   	   	  <span>总价值</span>
  	    	   	    	  	     	  	   	   	  <input type="text" class="bor_inputbg04 input2"/><br/>
  	    	   	    	  	     	  	         </div>
  	    	   	    	  	     	  	   <div class="mt15">
  	    	   	    	  	     	  	   	   <label>借款用途</label>
  	    	   	    	  	     	  	   	   <select>
  	    	   	    	  	     	  	   	   	  <option>选择借款类别</option>
  	    	   	    	  	     	  	   	   	  <option>1</option>
  	    	   	    	  	     	  	   	   </select>
  	    	   	    	  	     	  	   </div>
  	    	   	    	  	     	  	    <div class="mt15">
  	    	   	    	  	     	  	   	   <label>*借款描述</label> 
  	    	   	    	  	     	  	   	   <textarea></textarea>
  	    	   	    	  	     	  	   	 
  	    	   	    	  	     	  	   </div>
  	    	   	    	  	     	  	   <div class="mt15">
  	    	   	    	  	     	  	   	   <label>*借款情况</label>
  	    	   	    	  	     	  	   	   <input type="radio" class="input3"/>
  	    	   	    	  	     	  	   	   普通借款
  	    	   	    	  	     	  	  	   <input type="radio" class="input3"/>
  	    	   	    	  	     	  	   	   紧急借款 
  	    	   	    	  	     	  	   </div>
  	    	   	    	  	     	  	   <div class="mt15">
  	    	   	    	  	     	  	   	   <label>*验证码</label>
  	    	   	    	  	     	  	   	   <input type="text" class="yanzheng"/>
  	    	   	    	  	     	  	   	   
  	    	   	    	  	     	  	   </div>
  	    	   	    	  	     	  	   <div class="mt30">
  	    	   	    	  	     	  	   	   <label></label>
  	    	   	    	  	     	  	   	   <a href="#" class="bor_btn">提交材料</a>
  	    	   	    	  	     	  	   </div>
  	    	   	    	  	     	  </fieldset>
	  	    	   	    	  	     </form>
	  	    	   	    	  </div>
	  	    	   	    </div>
	  	    	   </div>
	  	    </div>
	  </div>
</div>
<!--网站底部-->
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>