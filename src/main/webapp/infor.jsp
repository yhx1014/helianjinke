<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<html>
<head>
	<title>币币袋</title>
	<link href="<%=basePath%>css/common.css" rel="stylesheet" />
	<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/detail.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/register.css" rel="stylesheet" type="text/css" />	
	<script src="<%=basePath%>script/jquery.min.js"></script>
	<script src="<%=basePath%>script/common.js"></script>
	<script src="<%=basePath%>script/plugins.js"></script>
	<script src="<%=basePath%>script/detail.js"></script>
	<script src="<%=basePath%>script/login.js"></script>
</head>

<script type="text/javascript">
	function submit() {
		var fr = document.getElementById("fr");
		fr.onsubmit = "return true";
		fr.submit();
	}

	function investA() {
		var money = document.getElementById("amount").value;
		window.location.href = "investAdd.do?money=" + money;
	}

	function end() {
		if ("${end}" != null && "${end}" == "end") {
			alert("恭喜,投资成功!");
		}
	}
	end();
</script>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="item-detail wrap">
		<div class="breadcrumbs">
			<a href="index.html">首页</a>&gt; <a href="#">散标投资列表</a>&gt; 
			<span class="cur">项目详情</span>
		</div>
		<div class="item-detail-head clearfix" data-target="sideMenu">
<%-- 			<div class="hd">
				<i class="icon icon-che" title="车易贷"></i>
				<h2>${Borrowmoney.pname }</h2>
			</div> --%>
			<div class="bd clearfix">
				<div class="data">
					<ul>
						<li><span class="f16">借币数量</span><br> 
						<span class="f30 c-333" id="account">${Borrowmoney.ptotalmoney }元</span></li>
						<li class="relative"><span class="f16">年利率</span><br> 
						<span class="f30 c-orange">${Borrowmoney.pincome }%</span></li>
						<li><span class="f16">借币期限</span><br> <span
							class="f30 c-333"><fmt:formatDate
							value="${Borrowmoney.pcount }" pattern="yyyy-MM-dd" /></span></li>
						<li><span class="c-888">发标日期：</span>
						<fmt:formatDate value="${Borrowmoney.ppublishtime }"
								pattern="yyyy-MM-dd"/></li>
						<li><span class="c-888">保障方式：</span>${Borrowmoney.psaveway }</li>
						<li><span class="c-888">还款方式：</span>${Borrowmoney.pway }</li>
						<li><span class="c-888">需还本息：</span> <%-- ${ } --%></li>
						<li><span class="c-888">借款用途：</span>${Borrowmoney.puse }</li>
						<li class="colspan"><span class="c-888 fl">投标进度：</span>
							<div class="progress-bar fl">
								<span
									style="width:${(Borrowmoney.pmoney/Borrowmoney.ptotalmoney)*(100)}%">
								</span>
							</div> 
							    <span class="c-green">
							    	<fmt:formatNumber value="${(Borrowmoney.pmoney/Borrowmoney.ptotalmoney)*(100)}" pattern="#.##"/>%</span>
						</li>
						<li><span class="c-888">投资范围：</span> <span id="account_range">
								${Borrowmoney.prange } </span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="item-detail-body clearfix mrt30 ui-tab">
			<div class="ui-tab-nav hd">
				<i class="icon-cur" style="left: 39px;"></i>
				<ul>
					<li class="nav_li active" id="nav_1"><a href="javascript:;">借款信息</a></li>
					<li class="nav_li" id="nav_2"><a href="javascript:;">投资记录</a>
						<i class="icon icon-num1" style="margin-left: -15px;"> <span
							id="tender_times">23</span> <em></em>
					</i></li>
					<li class="nav_li" id="nav_3"><a href="javascript:;">还款列表</a></li>
				</ul>
			</div>
			<div class="bd">
				<div class="ui-tab-item active" style="display: block;">
					<div class="borrow-info">
						<dl class="item">
							<dt>
								<h3>借款人介绍</h3>
							</dt>
							<dd>
								<div class="text">
									<c:forEach items="${Details }" var="dt">
										<c:if test="${dt.dtype==0 }">
											<p class="MsoNormal"
												style="margin-left: 0cm; text-indent: 0cm;">${dt.dname }：</p>
											<p class="MsoNormal"
												style="margin-left: 0cm; text-indent: 0cm;">
												${dt.dcontent }</p>
										</c:if>
									</c:forEach>
								</div>
							</dd>
						</dl>
						<dl class="item">
							<dt>
								<h3>审核信息</h3>
							</dt>
							<dd>
								<div class="verify clearfix">
									<ul>
		       							<li><i class="icon icon-4"></i><br> 身份证</li>
										<li><i class="icon icon-5"></i><br> 户口本</li>
										<li><i class="icon icon-6"></i><br> 结婚证</li>
										<li><i class="icon icon-7"></i><br> 工作证明</li>
										<li><i class="icon icon-8"></i><br> 工资卡流水</li>
										<li><i class="icon icon-9"></i><br> 收入证明</li>
										<li><i class="icon icon-10"></i><br> 征信报告</li>
										<li><i class="icon icon-11"></i><br> 亲属调查</li>

									</ul>
								</div>
							</dd>
                        </dl>
						<dl class="item">
							<dt>
								<h3>风控步骤</h3>
							</dt>
							<dd>
								<div class="text">
									<c:forEach items="${Details}" var="dt">
										<c:if test="${dt.dtype==1 }">
											<p class="MsoNormal"
												style="margin-left: 0cm; text-indent: 0cm;">${dt.dname }：${dt.dcontent }
											</p>
										</c:if>
									</c:forEach>
								</div>
								<div class="step clearfix">
									<ul>
										<li><i class="icon icon-1"></i>资料审核</li>
										<li><i class="icon icon-2"></i>实地调查</li>
										<li><i class="icon icon-3"></i>资产评估</li>
									</ul>
								</div>
								<div class="conclusion f16">
									结论：经风控部综合评估， <span class="c-orange">同意放款40,000.00元；</span> 
								</div>
							</dd>
						</dl>
					</div>
				</div>
				<div class="ui-tab-item" style="display: none;">
					<div class="repayment-list">
						目前投标总额：<span class="c-orange"> ${tm }元</span>&nbsp;&nbsp; 目前收益总额：<span
							class="c-orange">${gm } 元</span>
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tbody>
								<tr>
									<th>投标人</th>
									<th>投标金额</th>
									<th>投标时间</th>
									<th>投标类型</th>
                                </tr>
							</tbody>
							<tbody id="repayment_content">
								<c:if test="${record.size() > 0 }">
									<c:forEach items="${record }" var="record">
										<tr>
											<td>${fn:substring(record.uname,0,1)}
												<c:forEach begin="1" end="${fn:length(fn:substring(record.uname,1,fn:length(record.uname)))}" step="1">
												*
												</c:forEach>
											</td>
											<td><span class="c-orange">￥${record.inmoney }</span></td>
											<td><fmt:formatDate value="${record.indate }"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td><c:forEach items="${biao }" var="b">
													<c:if test="${record.type == b.id }">${b.bname }</c:if>
												</c:forEach></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${record.size() <= 0 }">
									<tr>
										<td colspan="4">此标暂无投资信息!</td>
									</tr>
								</c:if>
							</tbody>
							<tfoot>
								<tr class="page-outer">
									<td colspan="4" align="center">
										<div align="center">
											<span class="page"><a
												href="investInfo.do?currpage=1&bmid=${bmid }" onclick="">
													首页 </a><a
												href="investInfo.do?currpage=${currpages-1 }&bmid=${bmid }"
												onclick="">上一页</a> <c:forEach begin="1" end="${totalpage }"
													step="1" varStatus="bindex">&nbsp;<a
														class="curr" onclick=""
														href="investInfo.do?currpage=${bindex.count }&bmid=${bmid }">${bindex.count }</a>
												</c:forEach><a
												href="investInfo.do?currpage=${currpages+1 }&bmid=${bmid }"
												onclick="">下一页</a><a
												href="investInfo.do?currpage=${totalpage }&bmid=${bmid }"
												onclick="">尾页</a>&nbsp;<em>共${totalpage }页&nbsp;</em></span>
										</div>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
				<div class="ui-tab-item" style="display: none;">
					<div class="repayment-list">
						已还本息：<span class="c-orange">0.00元</span>&nbsp;&nbsp; 待还本息：<span
							class="c-orange">40,400.00元</span>&nbsp;&nbsp;(待还本息因算法不同可能会存误差，实际金额以到账金额为准！)
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<th>合约还款日期</th>
									<th>期数</th>
									<th>应还本金</th>
									<th>应还利息</th>
									<th>应还本息</th>
									<th>还款状态</th>
								</tr>
								<tr>
									<td>2015-10-13</td>
									<td>1</td>
									<td>40,000.00元</td>
									<td>400.00元</td>
									<td>40,400.00元</td>
									<td>还款中</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--网站底部-->
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
