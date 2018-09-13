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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=basePath%>/css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/user.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/jquery.datetimepicker.css"/>
<script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/script/common.js"></script>
<script src="<%=basePath%>/script/user.js" type="text/javascript"></script>
</head>
<body><header>
 <!-- 导航栏 --><jsp:include page="head.jsp"></jsp:include>
</header>
<!--个人中心-->
<div class="wrapper wbgcolor">
  <div class="w1200 personal">
    <div class="credit-ad"><img src="images/clist1.jpg" width="1200" height="96"></div>
    <!-- 导航栏 --><jsp:include page="left.jsp"></jsp:include>
   <div class="personal-main">
      <div class="personal-money">
        <h3><i>资金记录</i></h3>
        <form id="form" name="form" method="post" action="">
          <div class="money-choose"> <span class="money-date1">操作类型</span>
            <div id="typeboxstyle" class="select-date"> <span class="select-title" style="display:inline-block;height:25px;line-height:20px;">全部</span>
              <ul>
                <li>全部</li>
                <li value="ti_balance">转入到余额</li>
                <li value="to_balance">从余额转出</li>
                <li value="to_frozen">从冻结金额中转出</li>
                <li value="freeze">冻结</li>
                <li value="unfreeze">解冻</li>
              </ul>
            </div>
            <span class="money-date2">查询时间</span>
            <div id="select-date" class="select-date"> <span class="select-title" style="display:inline-block;height:25px;line-height:20px;">全部</span>
              <ul>
                <li value="0d">今天</li>
                <li value="1w">最近一周</li>
                <li value="1m">一个月</li>
                <li value="6m">六个月</li>
                <li>全部</li>
              </ul>
            </div>
            <button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only btn-sx"><span class="ui-button-text ui-c">筛选</span></button>
            <button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only btn-dc"><span class="ui-button-text ui-c">导出</span></button>
          </div>
          <span id="form:dataTable">
          <div class="personal-moneylist">
            <div class="pmain-contitle"> <span class="pmain-title1 fb">交易时间</span> <span class="pmain-title2 fb">交易类型</span> <span class="pmain-title3 fb">交易金额</span> <span class="pmain-title4 fb">余额</span> <span class="pmain-title5 fb">备注</span> </div>
            <ul>
              <li><span class="pmain-title1 pmain-height">2015-10-20</span><span class="pmain-title2 pmain-height">债权转让</span><span class="pmain-title3 pmain-height">10.00</span><span class="pmain-title4 pmain-height">10.00</span><span class="pmain-title5 pmain-height">备注</span></li>
              <li><span class="pmain-title1 pmain-height">2015-10-20</span><span class="pmain-title2 pmain-height">债权转让</span><span class="pmain-title3 pmain-height">10.00</span><span class="pmain-title4 pmain-height">10.00</span><span class="pmain-title5 pmain-height">备注</span></li>
              <li><span class="pmain-title1 pmain-height">2015-10-20</span><span class="pmain-title2 pmain-height">债权转让</span><span class="pmain-title3 pmain-height">10.00</span><span class="pmain-title4 pmain-height">10.00</span><span class="pmain-title5 pmain-height">备注</span></li>
              <li><span class="pmain-title1 pmain-height">2015-10-20</span><span class="pmain-title2 pmain-height">债权转让</span><span class="pmain-title3 pmain-height">10.00</span><span class="pmain-title4 pmain-height">10.00</span><span class="pmain-title5 pmain-height">备注</span></li>
              <li><span class="pmain-title1 pmain-height">2015-10-20</span><span class="pmain-title2 pmain-height">债权转让</span><span class="pmain-title3 pmain-height">10.00</span><span class="pmain-title4 pmain-height">10.00</span><span class="pmain-title5 pmain-height">备注</span></li>
              <li><span class="pmain-title1 pmain-height">2015-10-20</span><span class="pmain-title2 pmain-height">债权转让</span><span class="pmain-title3 pmain-height">10.00</span><span class="pmain-title4 pmain-height">10.00</span><span class="pmain-title5 pmain-height">备注</span></li>
              <li><span class="pmain-title1 pmain-height">2015-10-20</span><span class="pmain-title2 pmain-height">债权转让</span><span class="pmain-title3 pmain-height">10.00</span><span class="pmain-title4 pmain-height">10.00</span><span class="pmain-title5 pmain-height">备注</span></li>
              <!-- <div style=" width:760px;height:200px;padding-top:100px; text-align:center;color:#d4d4d4; font-size:16px;"> <img src="images/nondata.png" width="60" height="60"><br>
                <br>
                暂无资金记录</div>-->
            </ul>
          </div>
          </span>
        </form>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>
<!--网站底部-->
<jsp:include page="bottom.jsp"></jsp:include>	</body>
</html>
