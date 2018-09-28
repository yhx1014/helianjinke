<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>币币袋</title>
	<link href="<%=basePath%>css/register.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/common.css" rel="stylesheet" />
	<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/detail.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="script/jquery.min.js"></script>
	<script type="text/javascript" src="script/common.js"></script>
	<script src="<%=basePath%>script/ablumn.js"></script>
	<script src="<%=basePath%>script/plugins.js"></script>
	<script src="<%=basePath%>script/detail.js"></script>
	<link href="http://localhost:8080/p2p/css/common.css" rel="stylesheet" />
	<link href="http://localhost:8080/p2p/css/register.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="http://localhost:8080/p2p//script/jquery.min.js"></script>
	<script type="text/javascript" src="http://localhost:8080/p2p//script/common.js"></script>
	<script src="http://localhost:8080/p2p//script/login.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
	function submit() {
		var fr = document.getElementById("fr");
		fr.onsubmit = "return true";
		fr.submit();
	}

	function investA() {
		var money = document.getElementById("amount").value;

		if (money > "${kymoney}") {
			alert("对不起,您的用户余额不足;无法完成投资!");
			return;
		}
		if (money > "${Product.ptotalmoney - Product.pmoney}") {//投资金额大于剩余可投金额
			alert("您输入的投资金额大于剩余可投金额!");
			return;
		}
		window.location.href = "investAdd.do?money=" + money;
	}

	function reckon() {//动态算出预期收益
		var money = document.getElementById("amount").value;
		var getm = parseInt(money) + (${Borrowmoney.pincome } * (${days} / 365) * money) / 100;
		var lm = parseFloat(getm).toFixed(2);
		if (isNaN(lm)) {
			lm = 0;
		}
		document.getElementById("sp").innerHTML = lm + "元";
	}

	function end() {
		//投资完返回此界面弹出提示
		if ("${end}" != null && "${end}" == "end") {
			alert("恭喜您,投资成功!");
		}
	}

	end();
</script>
<body>
	<!-- 导航栏 --><jsp:include page="head.jsp"></jsp:include>
	<!--信息详细-->
	<div class="item-detail wrap">
		<div class="breadcrumbs">
			<a href="index.html">首页</a>&gt; <a href="#">散标投资列表</a>&gt; <span
				class="cur">项目详情</span>
		</div>
		<div class="item-detail-head clearfix" data-target="sideMenu">
			<div class="hd">
				<i class="icon icon-che" title="车易贷"></i>
				<h2>${Borrowmoney.pname }</h2>
			</div>
			<div class="bd clearfix">
				<!--   <form id="fr" action="investAdd.do" method="post" onsubmit="return false"> -->
				<div class="data">
					<ul>
						<li><span class="f16">借款金额</span><br> <span
							class="f30 c-333" id="account">${Borrowmoney.ptotalmoney }元</span></li>
						<li class="relative"><span class="f16">年利率</span><br> <span
							class="f30 c-orange">${Borrowmoney.pincome }%</span></li>
						<li><span class="f16">借款期限</span><br> <span
							class="f30 c-333"><fmt:formatDate
									value="${Borrowmoney.pcount }" pattern="yyyy-MM-dd" /></span></li>
						<li><span class="c-888">借款编号：</span>${Borrowmoney.id}<%-- ${Borrowmoney.bserial } --%></li>
						<li><span class="c-888">发标日期：</span>
						<fmt:formatDate value="${Borrowmoney.ppublishtime }"
								pattern="yyyy-MM-dd" /></li>
						<li><span class="c-888">保障方式：</span>${Borrowmoney.psaveway }</li>
						<li><span class="c-888">还款方式：</span>${Borrowmoney.pway }</li>
						<li><span class="c-888">需还本息：</span> <%-- ${ } --%>元</li>
						<li><span class="c-888">借款用途：</span>${Borrowmoney.puse }</li>
						<li class="colspan"><span class="c-888 fl">投标进度：</span>
							<div class="progress-bar fl">
								<span
									style="width:${(Borrowmoney.pmoney/Borrowmoney.ptotalmoney)*(100)}%"></span>
							</div> <span class="c-green">${(Borrowmoney.pmoney/Borrowmoney.ptotalmoney)*(100)}%</span>
						</li>
						<li><span class="c-888">投资范围：</span> <span id="account_range">
								${Borrowmoney.prange } </span></li>
					</ul>
				</div>
				<!--   </form> -->

				<!--       <div class="mod-right mod-status">
        <div class="inner">
          <div class="text"> 待还本息：<span class="f24 c-333">40,400.00</span>元<br>
            剩余期限：<span class="f24 c-333">29天</span> <br>
            下期还款日： <span class="f20 c-333">2015-10-13</span> </div>
          <i class="icon icon-status icon-status1"></i> </div>
      </div> -->

				<div class="mod-right mod-status">
					<div class="inner">
						<p>
							<c:if test="${globaluser.uid == null }">
								可用余额：<span id="canUseSum">登录后可显示余额</span>
							</c:if>
							<c:if test="${globaluser.uid != null }">
								您的可用余额为:<span class="f24 c-333">${kymoney }</span>
							</c:if>
						</p>
					</div>
					<br />
					<div class="inner">
						<p>
							剩余可投：<span class="f24 c-333" id="investAmount"> <fmt:formatNumber
									value="${Product.ptotalmoney - Product.pmoney}"
									pattern="#,#00.00#" />元
							</span>
						</p>
						<br />
						<p class="rate">
							预期收益：<span class="f24 c-333" id="sp"></span>
						</p>
					</div>
					<br />
					<div class="inner">

						<input class="input _userName" maxlength="24" tabindex="1"
							type="text" placeholder="请输入投资金额" id="amount" onkeyup="reckon();"
							onblur="focusblur(this)" />
						<!--<input type="text" name="unickname" id="userName" class="input _userName" maxlength="24" tabindex="1" />-->
						<button type="button" id="pushAll">全投</button>
					</div>
					<div class="inner">
						<a
							href="calculator.html?repayWay=3&amp;annualRate=9.00&amp;time=5"
							class="icon icon-cal" id="calculator">详细收益明细</a>
					</div>
					<br /> <a class="ui-btn btn-gray" onclick="investA();">立即投标</a>
					<!-- -------onclick="submit();"-------添加数据到后台 -->
					<!-- 				<p class="agreement">点击按钮，即表示您已经阅读并认可《<a href="javascript:AgreeMent(0);">普金资本服务协议</a>》和《<a href="javascript:AgreeMent(1);">风险提示书</a>》，投资有风险，理财需谨慎。</p>
				<div id="productJump"></div> -->
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
									<c:forEach items="${Details }" var="dt">
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
										<li class="no"><i class="icon icon-4"></i>发布借款</li>
									</ul>
								</div>
								<div class="conclusion f16">
									结论：经风控部综合评估， <span class="c-orange">同意放款40,000.00元；</span> <i
										class="icon icon-status icon-status1"></i>
								</div>
							</dd>
						</dl>
						<dl class="item">
							<dt>
								<h3>权证信息</h3>
							</dt>
							<dd>
								<div class="warrant">
									<span class="f14 c-888">（注：为保护借款人的个人隐私信息，实物材料对部分信息进行了隐藏处理）</span>
									<div class="album" id="album">
										<div class="album-show">
											<div class="loading" style="display: none;"></div>
											<c:forEach items="${Details }" var="dt">
												<c:if test="${dt.dtype==2 }">
													<c:if test="${dt.dname!='' }">
														<img src="${dt.dname }" />
													</c:if>
												</c:if>
											</c:forEach>
										</div>
										<div class="album-thumb">
											<a href="javascript:;" class="btn btn-prev"></a> <a
												href="javascript:;" class="btn btn-next"></a>
											<div
												style="visibility: visible; overflow: hidden; position: relative; z-index: 2; left: 0px; width: 1070px;"
												class="container" id="albumThumb">
												<ul
													style="margin: 0px; padding: 0px; position: relative; list-style-type: none; z-index: 1; width: 1926px; left: 0px;">
													<c:forEach items="${Details }" var="dt">
														<c:if test="${dt.dtype==2 }">
															<li
																style="overflow: hidden; float: left; width: 164px; height: 108px;"><a
																class="small_img" id="${dt.dcontent }"><img
																	src="${dt.dcontent }"></a></li>
														</c:if>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</dd>
						</dl>
					</div>
				</div>
				<div class="ui-tab-item" style="display: none;">
					<div class="repayment-list">
						目前投标总额：<span class="c-orange"> ${tm }元</span>&nbsp;&nbsp; 目前收益总额：<span
							class="c-orange">${gm } 元</span>
						<table style="border:0;cellpadding:0;cellspacing:0;width:100%;">
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
									<td style="colspan:4;align:center;">
										<div style="align:center;">
											<span class="page"><a
												href="investInfo.do?currpage=1&bmid=${bmid }" onclick="">
													首页 </a><a
												href="investInfo.do?currpage=${currpages-1 }&bmid=${bmid }"
												onclick="">上一页</a> 
												<c:forEach begin="1" end="${totalpage }"
													step="1" varStatus="bindex">&nbsp;<a
														class="curr" onclick=""
														href="investInfo.do?currpage=${bindex.count }&bmid=${bmid }">${bindex.count }</a>
												</c:forEach>
												<a href="investInfo.do?currpage=${currpages+1 }&bmid=${bmid}" onclick="">下一页</a>
												<a href="investInfo.do?currpage=${totalpage }&bmid=${bmid}" onclick="">尾页</a>&nbsp;<em>共${totalpage }页&nbsp;</em></span>
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
						<table style="width:100%;border:0;cellspacing:0;cellpadding:0;">
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
