<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div id="footer" class="ft" style="display:none">
  <div class="ft-inner clearfix">
    <div class="ft-helper clearfix">
      <dl>
       	<dt>关于我们</dt>
        <dd>
        	<a href="#">管理团队</a>
        	<a href="#">管理团队</a>
        	<a href="#">管理团队</a>
        	<a href="#">管理团队</a>
        </dd>
      </dl>
      <dl>
        <dt>新手介绍</dt>
        <dd>
        <!-- /p2p/invest/investSel.do -->
        	<a href="#">我要投资</a>
        </dd>
      </dl>
      <dl>
        <dt>费率介绍</dt>
           <dd><a href="#">费率介绍</a></dd>
      </dl>
      <dl>
        <dt>加入我们</dt>
        <dd><a href="#">联系我们</a></dd>
      </dl>
    </div>
   
    <div class="ft-service">
      <dl>
        <dt><strong><p style="font-size:14px">服务时间</p></strong></dt>
        <dd>
             <p> 工作日 9:00-22:00 / 周六 9:00-18:00<br> </p>                      
        </dd>
      </dl>
    </div>
    <div class="ft-wap clearfix">
      <dl>
        <dt>官方二维码</dt>
        <dd><span class="icon-ft-erweima"><img src="<%=basePath%>/images/code.png" style="display: inline;"></span></dd>
      </dl>
    </div>
  </div>
  <div class="ft-record">
  <div class="ft-identity">©2018 原力协议  All rights reserved&nbsp;&nbsp;&nbsp;<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;北京市和链金科科技有限公司&nbsp;&nbsp;&nbsp;<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;<a target="_blank" href="">京ICP备88888888号-8</a></div>
  </div>
</div>

<style>
#bottom li{display:inline-block;height:60px;font-size:12px;width:200px;overflow:hidden;}
#bottom li:first-child{margin:0 300px 0 100px;background:url("http://localhost:8080/p2p/images/logo.png") no-repeat left center;}
#bottom span{color:#333;margin:0 6px;}
#bottom li.instr{padding:10px 0;height:40px;width:300px;}
#bottom li a,#bottom div{color:#fff;}
#bottom li div{height:20px;line-height:20px;}
#bottom li img{vertical-align:middle;}
#footer {padding:20px 0;}
</style>

<div id="footer" class="ft">
	<div class="ft-inner clearfix" style="border-bottom:none;">
		<ul id="bottom">
			<li></li>
			<li class="instr">
				<div>
					<a href="###">关于我们</a><span>|</span>
					<a href="###">新手介绍</a><span>|</span>
					<a href="###">费率介绍</a><span>|</span>
					<a href="###">加入我们</a>
				</div>
				<div>服务时间：9:00 -- 18:00   &nbsp;&nbsp;&nbsp;联系方式：010-8888888</div>
			</li>
			<li><img src="http://localhost:8080/p2p/images/logo.png" /></li>
		</ul>
		
		<div style="color:#fff;text-align:center;font-size:12px;">备案号,slfdjsldjfls基拉数据的备案号,slfdjsldjfls基拉数据的</div>
	</div>
</div>
<script src="<%=basePath%>script/jquery.datetimepicker.js" type="text/javascript"></script>
<script src="<%=basePath%>script/datepicker.js" type="text/javascript"></script>