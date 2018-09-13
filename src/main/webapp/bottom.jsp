<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	</head>
<body>
<!--网站底部-->
<div id="footer" class="ft">
  <div class="ft-inner clearfix">
    <div class="ft-helper clearfix">
      <dl>
       	<dt>关于我们</dt>
        <dd>
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
	<script src="<%=basePath%>script/jquery.datetimepicker.js" type="text/javascript"></script>
	<script src="<%=basePath%>script/datepicker.js" type="text/javascript"></script>
</body>
</html>