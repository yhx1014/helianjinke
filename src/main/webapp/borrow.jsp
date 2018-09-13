<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
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

</head>
<%! String dk=""; %>
<script type="text/javascript">
	function test(who){
//		alert("哈哈");
		if(who=='home'){
			document.getElementById("div").html="<span>房屋数量</span><input type='text' class='bor_inputbg03 input2'/><br/><br/><span>总价值</span><input type='text' class='bor_inputbg04 input2'/><br/>";
		}
		if(who=='car'){
			<%dk="car";%>
			alert("<%= dk %>"); 
//			window.location.reload();
			document.getElementById("div").html="<span>车辆数量</span><input type='text' class='bor_inputbg03 input2'/><br/><br/><span>总价值</span><input type='text' class='bor_inputbg04 input2'/><br/>";
		}
		if(who=='credit'){
			<%dk="credit";%>
<%--alert("<%= dk %>");--%>
			document.getElementById("div").html="<span>车辆数量</span><input type='text' class='bor_inputbg03 input2'/><br/><br/><span>总价值</span><input type='text' class='bor_inputbg04 input2'/><br/>";
		}
		if(who=='pay'){
			<%dk="pay";%>
			alert("<%= dk %>");
		}
	}
</script>

<body>
<!-- 导航栏 --><jsp:include page="head.jsp"></jsp:include>


<div class="bor_con_wper">
	  <div class="bor_con px1000">
	  	    <div class="bor_detail">
	  	    	   <h2 class="bor_detail_tit">
	  	    	   	  <span class="bor_decurspan" onclick="test('home');">房产抵押</span>
	  	    	   	  <span <c:if test="'<%=dk %>'=='home'">class="bor_decurspan"</c:if> onclick="test('car');">车辆抵押</span>
	  	    	   	  <span onclick="test('credit');">信用贷款</span>
	  	    	   	  <span onclick="test('pay');">零首付车贷</span>
	  	    	   </h2>
	  	    	   <div class="bor_detail_box">
	  	    	   	    <div class="bor_det_one clearfix pt30 pb30">
	  	    	   	    	  <div class="bor_det_onel fl">
	  	    	   	    	  	       <p class="bor_p1">中兴财富平台的借款功能旨在帮助借款用户以
										低成本获得借款。用户在需要资金时，可以将
										自有房产和车产作为抵押物，小油菜线下审核
										通过后，根据抵押物的价值融资。</p>
										<p class="bor_p2">中兴财富平台的借款功能旨在帮助借款用户以
										低成本获得借款。用户在需要资金时，可以将
										自有房产和车产作为抵押物，小油菜线下审核
										通过后，根据抵押物的价值融资。</p>
										<h3 class="bor_onel_tit"><span>申请条件</span></h3>
										<ul class="bor_onel_ul">
											 <li><img src="images/bor_pic01.png" alt=""/>年满18周岁以上的公民
											 </li>
											 <li><img src="images/bor_pic02.png" alt=""/>需要北京房产或车产抵押
											 </li>
											 <li><img src="images/bor_pic03.png" alt=""/>个人或企业银行征信记录良好
											 </li>
											 <li><img src="images/bor_pic04.png" alt=""/>
											  无现有诉讼记录
											 </li>
											 
										</ul>
										<h3 class="bor_onel_tit"><span>提交资料</span></h3>
										<ul class="bor_onel_ul">
											 <li>&nbsp;<img src="images/bor_pic05.png" alt=""/>省份证
											 </li>
											 <li><img src="images/bor_pic06.png" alt=""/>申请资料
											 </li>
											 <li><img src="images/bor_pic07.png" alt=""/>其他
											 </li>
											
											 
										</ul>
	  	    	   	    	  </div>  
	  	    	   	    	  <!-- end l -->
	  	    	   	    	  <div class="bor_det_oner fl">
	  	    	   	    	  	     <form>
	  	    	   	    	  	     	  <fieldset>
	  	    	   	    	  	     	  	   <div>
	  	    	   	    	  	     	  	   	   <label>申请人</label>
	  	    	   	    	  	     	  	   	   <input type=""/>
	  	    	   	    	  	     	  	   </div>
	  	    	   	    	  	     	  	   <div class="mt15">
	  	    	   	    	  	     	  	   	   <label>*借款金额</label>
	  	    	   	    	  	     	  	   	   <input type="" class="bor_inputbg01"/>
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
	  	    	   	    	  	     	  	   	   <label class="guarmethod_l fl">*担保方式</label>
	  	    	   	    	  	     	  	   	   <div class="fl" id="div">
<%-- 	  	    	   	    	  	     	  	   	   <c:if test="<%=dk %>=='home'">
	  	    	   	    	  	     	  	   	   	  <span>房屋数量</span>
	  	    	   	    	  	     	  	   	   	  <input type="text" class="bor_inputbg03 input2"/><br/><br/>
	  	    	   	    	  	     	  	   	   </c:if>
	  	    	   	    	  	     	  	   	   <c:if test="<%=dk %>=='car'">
	  	    	   	    	  	     	  	   	   	  <span>车辆数量</span>
	  	    	   	    	  	     	  	   	   	  <input type="text" class="bor_inputbg03 input2"/><br/><br/>
	  	    	   	    	  	     	  	   	   </c:if>
	  	    	   	    	  	     	  	   	   <c:if test="<%=dk %>=='credit'">
	  	    	   	    	  	     	  	   	   	  <span>房屋数量</span>
	  	    	   	    	  	     	  	   	   	  <input type="text" class="bor_inputbg03 input2"/><br/><br/>
	  	    	   	    	  	     	  	   	   </c:if>
	  	    	   	    	  	     	  	   	   <c:if test="<%=dk %>=='pay'">
	  	    	   	    	  	     	  	   	   	  <span>房屋数量</span>
	  	    	   	    	  	     	  	   	   	  <input type="text" class="bor_inputbg03 input2"/><br/><br/>
	  	    	   	    	  	     	  	   	   </c:if> --%>
<!-- 	  	    	   	    	  	     	  	   	   	  <span>总价值</span>
	  	    	   	    	  	     	  	   	   	  <input type="text" class="bor_inputbg04 input2"/><br/> -->
	  	    	   	    	  	     	  	   	   </div>
	  	    	   	    	  	     	  	   	   
	  	    	   	    	  	     	  	   	   	  
	  	    	   	    	  	     	  	   	   	  <span>房屋数量</span>
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
	  	    	   	    <!-- end 房产抵押 -->
	  	    	   	    <div class="bor_det_one" style="display:none;">
	  	    	   	    	  2  
	  	    	   	    </div>
	  	    	   	    <!-- end  -->
	  	    	   	    <div class="bor_det_one" style="display:none;">
	  	    	   	    	 3
	  	    	   	    </div>
	  	    	   	    <!-- end  -->
	  	    	   	    <div class="bor_det_one" style="display:none;">
	  	    	   	    	 4
	  	    	   	    </div>
	  	    	   	    <!-- end  -->
	  	    	   </div>
	  	    </div>
	  </div>
</div>




<!--网站底部-->
<div id="footer" class="ft">
  <div class="ft-inner clearfix">
    <div class="ft-helper clearfix">
      <dl>
        <dt>关于我们</dt>
        <dd><a href="公司简介.html">公司简介</a><a href="管理团队.html">管理团队</a><a href="网站公告.html">网站公告</a></dd>
      </dl>
      <dl>
        <dt>相关业务</dt>
        <dd><a href="list.html">我要投资</a><a href="我要借款.html">我要借款</a></dd>
      </dl>
      <dl>
        <dt>帮助中心</dt>
        <dd><a href="帮助中心.html">新手入门</a><a href="个人中心首页.html">我的账户</a><a href="list.html">债权转让</a></dd>
      </dl>
      <dl>
        <dt>联系我们</dt>
        <dd><a href="联系我们.html">联系我们</a></dd>
      </dl>
    </div>
    <div class="ft-service">
      <dl>
        <dd>
          <p><strong>400-660-1268</strong><br/>
            工作日 9:00-22:00<br/>
            官方交流群:<em>12345678</em><br/>
            工作日 9:00-22:00 / 周六 9:00-18:00<br/>
          </p>
          <div class="ft-serv-handle clearfix"><a class="icon-hdSprite icon-ft-sina a-move a-moveHover" title="亿人宝新浪微博" target="_blank" href="#"></a><a class="icon-hdSprite icon-ft-qqweibo a-move a-moveHover" title="亿人宝腾讯微博" target="_blank" href="#"></a><a class="icon-ft-qun a-move a-moveHover" title="亿人宝QQ群" target="_blank" href="#"></a><a class="icon-hdSprite icon-ft-email a-move a-moveHover mrn" title="阳光易贷email" target="_blank" href="mailto:xz@yirenbao.com"></a></div>
        </dd>
      </dl>
    </div>
    <div class="ft-wap clearfix">
      <dl>
        <dt>官方二维码</dt>
        <dd><span class="icon-ft-erweima"><img src="images/code.png" style="display: inline;"/></span></dd>
      </dl>
    </div>
  </div>
  <div class="ft-record">
    <div class="ft-approve clearfix"><a class="icon-approve approve-0 fadeIn-2s" target="_blank" href="#"></a><a class="icon-approve approve-1 fadeIn-2s" target="_blank" href="#"></a><a class="icon-approve approve-2 fadeIn-2s" target="_blank" href="#"></a><a class="icon-approve approve-3 fadeIn-2s" target="_blank" href="#"></a></div>
    <div class="ft-identity">©2015 亿人宝 All rights reserved&nbsp;&nbsp;&nbsp;<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;安徽省亿人宝投资管理有限公司&nbsp;&nbsp;&nbsp;<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://www.miitbeian.gov.cn/">皖ICP备12345678号-1</a></div>
  </div>
</div>
</body>
</html>