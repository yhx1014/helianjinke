<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="ft"%>

<html>
	<head>
		<title>币币袋</title>
		<link href="<%=basePath%>css/common.css" rel="stylesheet" />
		<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css"/>
		<link href="<%=basePath%>css/detail.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="<%=basePath %>script/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>script/common.js"></script>
		<script type="text/javascript">
			function Select(items,param){
				location.href="<%=basePath%>invest/investSel.do?item="+items+"&param="+param;
			}
		</script>
	</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
<div class="page-filter wrap">
  <div class="breadcrumbs"><span class="cur">投资列表</span></div>
  <div class="invest-filter" data-target="sideMenu">
    <div class="filter-inner clearfix">
      <div class="filter-item">
        <div class="hd">
        	<h3>筛选投资项目</h3>
        </div>
        <div class="bd">
          <dl>
            <dt>项目类型</dt>
            <dd>
              <ul id="items">
                <li class="n1">
                <a id="post_type_" <c:if test="${biaoId == null}">class="active"</c:if> style="cursor:pointer;" onclick="Select('itemtype','-1');">不限</a>
                </li>
                <c:forEach items="${biao}" var="biao">
                	<li class="n2">
                		<a <c:if test="${biaoId==biao.id }">class="active"</c:if> style="cursor:pointer;" onclick="Select('itemtype','${biao.id}');" id="post_type_car${biao.id}">${biao.bname }</a>
                	</li>
                </c:forEach>
              </ul>
            </dd>
          </dl>
	         <dl>
	           <dt>年利率</dt>
		           <dd>
		             <ul id="rate">
		               <li class="n1"><a <c:if test="${startR=='-1' || startR == null}">class="active"</c:if> id="borrow_interestrate_0" style="cursor:pointer;" onclick="Select('rate','-1');">不限</a></li>
		               <li class="n2"><a <c:if test="${startR=='0' }">class="active"</c:if> id="borrow_interestrate_1" style="cursor:pointer" onclick="Select('rate','1');">0.1%-10%</a> </li>
		               <li class="n3"><a <c:if test="${startR=='12' }">class="active"</c:if> id="borrow_interestrate_2" style="cursor:pointer" onclick="Select('rate','2');">12%-14%</a> </li>
		             </ul>
		           </dd>
	         </dl>
	        <dl>
            	<dt>期限</dt>
	            <dd>
	              <ul id="timel">
	                <li class="n1"><a <c:if test="${startT=='-1' || startT == null}">class="active"</c:if> id="spread_month_0" style="cursor:pointer" onclick="Select('timelimit','-1');">不限</a> </li>
	                <li class="n2"><a <c:if test="${startT=='0' }">class="active"</c:if> id="spread_month_1" style="cursor:pointer" onclick="Select('timelimit','1');">0-1月</a> </li>
	                <li class="n3"><a <c:if test="${startT=='30' }">class="active"</c:if> id="spread_month_2" style="cursor:pointer" onclick="Select('timelimit','2');">1-3月</a> </li>
	                <li class="n4"><a <c:if test="${startT=='90' }">class="active"</c:if> id="spread_month_3" style="cursor:pointer" onclick="Select('timelimit','3');">3-6月</a> </li>
	              </ul>
	            </dd>
           </dl>
        </div>
      </div>
    </div>
  </div>
  <div class="invest-list mrt30 clearfix">
    <div class="hd">
      <h3>展现投资列表</h3>
    </div>
    <div class="bd">
      <div class="invest-table clearfix">
        <div class="title clearfix">
          <ul>
            <li class="col-330">名称</li>
            <li class="col-180"><a href="javascript:url('order','account_up');" class="">借款数量</a> </li>
            <li class="col-110"><a href="javascript:url('order','apr_up');" class="">利率</a> </li>
            <li class="col-150"><a href="javascript:url('order','period_up');" class="">还款日期</a> </li>
            <li class="col-120-t">操作</li>
          </ul>
        </div>
        
        <c:forEach items="${list}" var="invest" varStatus="status">
	        <div class="item">
	          <ul>
                <li class="col-330 col-t">
	            	<a href="investInfo.do?bmid=${invest.id}" target="_blank">
	            		<i class="icon icon-xin" title="类型"></i>
	            	</a>
                    <a class="f18" href="investInfo.do?bmid=${invest.id}" title="${invest.btype}" target="_blank">${invest.btype}</a>
	            </li> 
	           
	            <li class="col-180"><span class="f20 c-333">${invest.bcount}</span></li>
	            <li class="col-110 relative"><span class="f20 c-orange">${invest.brate}%</span></li>
	            <li class="col-150"><span class="f20 c-333">${invest.binterval}</span></li>
	            <li class="col-150"><span class="f20 c-333">${invest.id}</span></li>
	            <li class="col-120-2"> 
	            	<a class="ui-btn btn-gray"  href="investInfo.do?bmid=${invest.id}">
	            		<c:if test="${invest.id !='1'}">立即投标</c:if>
	            		<c:if test="${invest.id=='2'}">募集完成</c:if>
	            		<c:if test="${invest.id=='3'}">还款中</c:if>
	            	</a> 
	            </li>
	          </ul>
	        </div>
        </c:forEach>
      </div>
      <div class="pagination clearfix mrt30"> 
          <span class="page">
          	<a href="investSel.do?currpage=1" onclick="">首页</a>
          	<a href="investSel.do?currpage=${currpages-1}" onclick="">上一页</a>
          	
          <c:forEach begin="1" end="${totalpage }" step="1" varStatus="bindex">&nbsp;
          	<a class="curr" onclick="" href="investSel.do?currpage=${bindex.count }">${bindex.count }</a>
          </c:forEach>
          <a href="investSel.do?currpage=${currpages+1}" onclick="">下一页</a>
          <a href="investSel.do?currpage=${totalpage}" onclick="">尾页</a>&nbsp;
          <em>共${totalpage }页&nbsp;</em>
          </span>
      </div>
    </div>
  </div>
</div>
    <jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
