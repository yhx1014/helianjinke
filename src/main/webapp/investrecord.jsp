<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="ft" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>币币袋</title>
	<link href="<%=basePath%>css/common.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/user.css" />
	<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
	<script src="<%=basePath%>script/user.js" type="text/javascript"></script>
</head>

<body>
<jsp:include page="head.jsp"></jsp:include>

<!--个人中心-->
<div class="wrapper wbgcolor">
  <div class="w1200 personal">
	<jsp:include page="left.jsp"></jsp:include>
    <style type="text/css">
		.invest-tab .on  a{color:#fff;}
	</style>
    <div class="personal-main">
      <div class="personal-investnote">
        <h3><i>投资记录</i></h3>
        <div class="investnote-money"> <span><b class="fb">累计投资</b><br/>
          <i><fmt:formatNumber value="${tm == null ? '0.00' : tm }" pattern="#.##"/></i> 元 </span> <span><b class="fb">累计收益</b><br/>
          <i class="c-pink"><fmt:formatNumber value="${gm == null ? '0.00' : gm }" pattern="#.##"/></i> 元 </span> <span><b class="fb">待收本金</b><br/>
          <i><fmt:formatNumber value="${tm == null && thm == null ? '0.00' : (tm - thm)}" pattern="#.##"/></i> 元 </span> <span class="none"><b class="fb">待收收益</b><br/>
          <i><fmt:formatNumber value="${gtm == null && gm == null ? '0.00' : (gtm - gm)}" pattern="#.##"/></i> 元 </span> </div>
        <form id="form" name="form" method="post" action="">
          <script type="text/javascript">clearPage = function() {PrimeFaces.ab({source:'form:j_idt82',formId:'form',process:'form:j_idt82',params:arguments[0]});}</script>
          <span id="form:dataTable">
          <div class="invest-tab">
            <ul>
              <li class="on"><span><a href="#" title="投标中">已投标 </a> </span> </li>
              <li><a href="#" title="回款中">回款中 </a> </li>
              <li><a href="#" title="已结束">已结束 </a> </li>
            </ul>
          </div>
          
          <c:if test="${record.size() <= 0 }"><!-- 无投资记录 -->
          	<div style=" width:760px;height:200px;padding-top:100px; text-align:center;color:#d4d4d4; font-size:16px;">
			<img src="<%=basePath %>images/nondata.png" width="60" height="60" />
			<br/><br/>
			暂无投资记录</div>
          </c:if>
          
          <c:if test="${record.size() > 0 }">
          <div class="investnote-list">
            <div class="investnote-contitle"> 
            	<span class="investnote-w1 fb">标题</span> 
            	<span class="investnote-w2 fb">类型</span> 
            	<span class="investnote-w3 fb">利率</span> 
            	<span class="investnote-hbw4 fb">截止期限</span> 
            	<span class="investnote-hbw5 fb">还款方式</span> 
            	<span class="investnote-hbw6 fb">金额</span> 
            </div>
            <ul>
            	<c:forEach items="${record }" var="recordList" varStatus="idnum">
              		<li>
              			<span class="investnote-w1" title="${recordList.title }">${ft:substring(recordList.title,0,8) }</span>
              			<span class="investnote-w2">
              				<c:forEach items="${biao }" var="b">
              					<c:if test="${recordList.type == b.id }">${b.bname }</c:if>
<%--               					<c:if test="${recordList.type != b.id }">${recordList.instyle }</c:if>
 --%>              				</c:forEach>
              			</span>
              			<span class="investnote-w3">${recordList.interest }%</span>
              			<span class="investnote-hbw4">${recordList.replaydate }</span> <%-- <fmt:formatDate value="${recordList.replaydate }" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
              			<span class="investnote-hbw5">${recordList.profitmodel }</span> 
              			<span class="investnote-hbw6">${recordList.inmoney }</span> 
              		</li>
				</c:forEach>
					<li>
					
						<div align="center"> <span class="page"><a href="investRecord.do?currpage=1" onclick=""><!-- javascript:void(0); -->首页</a><a href="investRecord.do?currpage=${currpages-1 }" onclick="">上一页</a><c:forEach begin="1" end="${totalpage > 6 ? 6 : totalpage}" step="1" varStatus="bindex">&nbsp;<a class="curr" onclick="" href="investRecord.do?currpage=${bindex.count }">${bindex.count }</a></c:forEach><a href="investRecord.do?currpage=${currpages+1 }" onclick="">下一页</a><a href="investRecord.do?currpage=${totalpage }" onclick="">尾页</a>&nbsp;<em>共${totalpage }页&nbsp;</em></span></div>
					
					</li>
            </ul>
          </div>
          </c:if>
          
          </span>
        </form>
      </div>
    </div>
    <div class="clear">
    </div>
  </div>
</div>
<!--网站底部-->
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>

