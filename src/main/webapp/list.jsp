<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="ft"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>币币袋</title>
	<link href="<%=basePath %>css/common.css" rel="stylesheet" />
	<link href="<%=basePath %>css/index.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath %>css/detail.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="<%=basePath %>script/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>script/common.js"></script>
</head>

<script type="text/javascript">
	function Select(items,param){
		//按条件查询
		window.location.href="<%=basePath%>invest/investSel.do?item="+items+"&param="+param;
	}
</script>

<body>
  <jsp:include page="head.jsp"></jsp:include>
<!--列表-->
<div class="page-filter wrap">
  <div class="breadcrumbs"><a href="http://localhost:8080/p2p/index.jsp">首页</a>&gt;<span class="cur">散标投资列表</span></div>
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
                <li class="n1"><a id="post_type_" <c:if test="${biaoId == null}">class="active"</c:if> style="cursor:pointer;" onclick="Select('itemtype','-1');">不限</a></li>
                <c:forEach items="${biao }" var="biao">
                	<li class="n2"><a <c:if test="${biaoId==biao.id }">class="active"</c:if> style="cursor:pointer;" onclick="Select('itemtype','${biao.id}');" id="post_type_car${biao.id}">${biao.bname }</a></li>
                </c:forEach>
              </ul>
            </dd>
          </dl>
          <dl>
            <dt>年利率</dt>
            <dd>
              <ul id="rate">
                <li class="n1"><a <c:if test="${startR=='-1' || startR == null}">class="active"</c:if> id="borrow_interestrate_0" style="cursor:pointer;" onclick="Select('rate','-1');">不限</a></li>
                <li class="n2"><a <c:if test="${startR=='0' }">class="active"</c:if> id="borrow_interestrate_1" style="cursor:pointer" onclick="Select('rate','1');">12%以下</a> </li>
                <li class="n3"><a <c:if test="${startR=='12' }">class="active"</c:if> id="borrow_interestrate_2" style="cursor:pointer" onclick="Select('rate','2');">12%-14%</a> </li>
                <li class="n4"><a <c:if test="${startR=='14' }">class="active"</c:if> id="borrow_interestrate_3" style="cursor:pointer" onclick="Select('rate','3');">14%-16%</a> </li>
                <li class="n5"><a <c:if test="${startR=='16' }">class="active"</c:if> id="borrow_interestrate_4" style="cursor:pointer" onclick="Select('rate','4');">16%及以上</a> </li>
              </ul>
            </dd>
          </dl>
          <dl>
            <dt>期限</dt>
            <dd>
              <ul id="timel">
                <li class="n1"><a <c:if test="${startT=='-1' || startT == null}">class="active"</c:if> id="spread_month_0" style="cursor:pointer" onclick="Select('timelimit','-1');">不限</a> </li>
                <li class="n2"><a <c:if test="${startT=='0' }">class="active"</c:if> id="spread_month_1" style="cursor:pointer" onclick="Select('timelimit','1');">1月以下</a> </li>
                <li class="n3"><a <c:if test="${startT=='30' }">class="active"</c:if> id="spread_month_2" style="cursor:pointer" onclick="Select('timelimit','2');">1-3月</a> </li>
                <li class="n4"><a <c:if test="${startT=='90' }">class="active"</c:if> id="spread_month_3" style="cursor:pointer" onclick="Select('timelimit','3');">3-6月</a> </li>
                <li class="n5"><a <c:if test="${startT=='180' }">class="active"</c:if> id="spread_month_4" style="cursor:pointer" onclick="Select('timelimit','4');">6-12月</a> </li>
                <li class="n6"><a <c:if test="${startT=='360' }">class="active"</c:if> id="spread_month_5" style="cursor:pointer" onclick="Select('timelimit','5');">12月及以上</a> </li>
              </ul>
            </dd>
          </dl>
         <%--  <dl class="repayment">
            <dt>还款方式</dt>
            <dd>
              <ul id="rway">
                <li class="n1"><a <c:if test="${pway=='' || pway == null}">class="active"</c:if> id="repay_style_0" style="cursor:pointer" onclick="Select('repayway','-1');">不限</a></li>
                <li class="n2"><a <c:if test="${pway=='到期还本付息' }">class="active"</c:if> id="repay_style_1" style="cursor:pointer" onclick="Select('repayway','1');">到期还本付息</a> </li>
                <li class="n2"><a <c:if test="${pway=='按月付息,到期还本' }">class="active"</c:if> id="repay_style_2" style="cursor:pointer" onclick="Select('repayway','2');">按月付息,到期还本</a> </li>
                <li class="n2"><a <c:if test="${pway=='等额本息' }">class="active"</c:if> id="repay_style_3" style="cursor:pointer" onclick="Select('repayway','3');">等额本息</a> </li>
              </ul>
            </dd>
          </dl> --%>
        </div>
      </div>

    </div>
  </div>
  <div class="invest-list mrt30 clearfix">
    <div class="hd">
      <h3>投资列表</h3>
    </div>
    <div class="bd">
      <div class="invest-table clearfix">
        <div class="title clearfix">
          <ul>
            <li class="col-330">标题名称</li>
            <li class="col-180"><a href="javascript:url('order','account_up');" class="">借款金额</a> </li>
            <li class="col-110"><a href="javascript:url('order','apr_up');" class="">年利率</a> </li>
            <li class="col-150"><a href="javascript:url('order','period_up');" class="">截止期限</a> </li>
            <li class="col-150">还款方式</li>
            <li class="col-120"><a href="javascript:url('order','scale_up');" class="">借款进度</a></li>
            <li class="col-120-t">操作</li>
          </ul>
        </div>
        
        <!------------投资列表-------------->
        <c:forEach items="${list}" var="invest" varStatus="status">
        <div class="item">
          <ul>
            <li class="col-330 col-t">
            	<a href="investInfo.do?bmid=${invest.id}" target="_blank">
            		<i class="icon icon-xin" title="类型"></i>
            	</a>
            	<a class="f18" href="investInfo.do?bmid=${invest.id}" title="${invest.pname }" target="_blank"> ${ft:substring(invest.pname,0,8) } 
            	</a>
            </li>
            <li class="col-180"><span class="f20 c-333">${invest.ptotalmoney }</span>元</li>
            <li class="col-110 relative"><span class="f20 c-orange">${invest.pincome }%</span></li>
            <li class="col-150"><span class="f20 c-333"><fmt:formatDate value="${invest.pcount }" pattern="yyyy-MM-dd "/></span></li>
            <li class="col-150">${invest.pway }</li>
            <li class="col-120">
              <div class="circle">
                <div class="left progress-bar">
                  <div class="progress-bgPic progress-bfb<fmt:formatNumber value="${(invest.pmoney/invest.ptotalmoney)*10<1?1:(invest.pmoney/invest.ptotalmoney)*10}" pattern="#"/>">
                    <div class="show-bar"> <fmt:formatNumber value="${(invest.pmoney/invest.ptotalmoney)*(100)}" pattern="#.0" /> % </div><!-- pattern="#.00"表示规定必须保存2位小数，如果最多保存2位，使用 pattern="#.##" -->
                  </div>
                </div>
              </div>
            </li>
            <li class="col-120-2"> 
            	<a class="ui-btn btn-gray"  href="investInfo.do?bmid=${invest.id}"> 
            		<c:if test="${invest.pstate=='1' }">立即投标</c:if>
            		<c:if test="${invest.pstate=='2' }">募集完成</c:if>
            		<c:if test="${invest.pstate=='3' }">还款中</c:if>
            	</a> 
            </li><!-- -------onClick=test('${invest }');-----------investInfo.do"?bm=${invest }"-----------------------------注意此处是按照表中的字符串类型字段来判断的 -->
            
          </ul>
        </div>
         <!-- </form>  -->
        </c:forEach>
        <!------------投资列表-------------->
      </div>
      <div class="pagination clearfix mrt30"> <span class="page"><a href="investSel.do?currpage=1" onclick=""><!-- javascript:void(0); -->首页</a><a href="investSel.do?currpage=${currpages-1 }" onclick="">上一页</a><c:forEach begin="1" end="${totalpage }" step="1" varStatus="bindex">&nbsp;<a class="curr" onclick="" href="investSel.do?currpage=${bindex.count }">${bindex.count }</a></c:forEach><a href="investSel.do?currpage=${currpages+1 }" onclick="">下一页</a><a href="investSel.do?currpage=${totalpage }" onclick="">尾页</a>&nbsp;<em>共${totalpage }页&nbsp;</em></span>
<%--         <dl class="page-select">
          <dt><span>1</span><i class="icon icon-down"></i></dt>
          <dd style="display: none;">
            <ul name="nump" id="jsnump">
              <li><a href="##" onclick="page_jump(&quot;this&quot;1)">1</a></li>
              <li><a href="##" onclick="page_jump(&quot;this&quot;2)">2</a></li>
              <li><a href="##" onclick="page_jump(&quot;this&quot;3)">3</a></li>
            </ul>
          </dd>
        </dl> --%>
      </div>
    </div>
  </div>
</div>
<!-- 导航栏 --><jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
