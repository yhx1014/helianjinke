<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="ft"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<html>
	<head>
		<link href="<%=basePath%>/css/common.css" rel="stylesheet"/>
		<link href="<%=basePath%>/css/index.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=basePath%>/script/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>/script/jquery.jcarousellite-1.0.1.js"></script>
		<script type="text/javascript" src="<%=basePath%>/script/common.js"></script>
		<script src="<%=basePath%>/script/index.js"></script>
		<title>币币袋</title>
	</head>
	<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="flexslider">
		<ul class="slides">
			<c:forEach items="${sy}" var="nots">
				<li style="background-image: url(${nots.noticepicture}); width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1; background-position: 50% 0px; background-repeat: no-repeat no-repeat;">
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<script src="${pageContext.request.contextPath}/script/jquery.flexslider-min.js"></script>
	
	<script>
		$(function() {
			$('.flexslider').flexslider({
				directionNav : true,
				pauseOnAction : false
			});
		});
	</script>
	
<script type="text/javascript">
	var gaintop;
	$(function() {
		gaintop = $(".login_float").css("top");
		$(".login_float").css("top", -695);
		$(".login_float").show();
		$(".login_float").animate({
			top : gaintop,
			opacity : 1
		}, 800);
		$(".login_float").animate({
			top : '-=12px',
			opacity : 1
		}, 200);
		$(".login_float").animate({
			top : gaintop,
			opacity : 1
		}, 200);
		$(".login_float").animate({
			top : '-=6px',
			opacity : 1
		}, 200);
		$(".login_float").animate({
			top : gaintop,
			opacity : 1
		}, 200);
		$(".login_float").animate({
			top : '-=2px',
			opacity : 1
		}, 100);
		$(".login_float").animate({
			top : gaintop,
			opacity : 1
		}, 100);
	});
</script>
	<div class="main clearfix mrt30" data-target="sideMenu">
		<div class="wrap">
			<div class="page-left fn-left">
				<div class="mod-borrow">
					<div class="hd">
						<h2 class="pngbg"><i class="icon icon-ttyx"></i>推荐项目</h2>
						<div class="fn-right f14 c-888">
							常规发标时间每天<span class="c-555">10:00，13:00和20:00</span>，其余时间根据需要随机发
						</div>
					</div>
					<div class="bd">
						<div class="des">
							<span class="fn-left">期限1-29天，期限短，收益见效快</span><a
								href="<%=basePath%>/invest/investSel.do" class="fn-right">查看更多&gt;&gt;</a>
						</div>
						<div class="borrow-list">
							<ul>
								<c:forEach items="${tjlist }" var="invest" varStatus="status">
									<li>
										<div class="title">
											<a target="_blank"><i class="icon icon-zhai"
												title="${invest.ptype }"></i></a><a
												href="investInfo.do?bmid=${invest.id }" class="f18"
												title="${invest.pname }" target="_blank">${invest.pname }
											</a>
										</div>
										<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<tbody>
												<tr>
													<td width="260">借款金额<span class="f24 c-333">${invest.ptotalmoney }<!-- 10000.00 --></span>元
													</td>
													<td width="165">年利率<span class="f24 c-orange">${invest.pincome }%<!-- 10.70% -->
													</span></td>
													<td width="180" align="center">截止期限<span
														class="f24 c-333"><fmt:formatDate
																value="${invest.ptime}" pattern="yyyy-MM-dd" /></span>
													</td>
													<td><div class="circle">
															<div class="left progress-bar">
																<div
																	class="progress-bgPic progress-bfb<fmt:formatNumber value="${(invest.pmoney/invest.ptotalmoney)*10<1?1:(invest.pmoney/invest.ptotalmoney)*10}" pattern="#"/>">
																	<div class="show-bar">
																		<fmt:formatNumber
																			value="${(invest.pmoney/invest.ptotalmoney)*100}"
																			pattern="#" />
																		%
																	</div>
																</div>
															</div>
														</div></td>
													<td align="right">
														<c:if test="${invest.pstate=='1' }">
																<a class="ui-btn btn-gray"
																	href="investInfo.do?bmid=${invest.id }">立即投标</a>
														</c:if> 
														<c:if test="${invest.pstate=='2' }">
																<a class="ui-btn btn-gray"
																	href="investInfo.do?bmid=${invest.id }">还款中</a>
														</c:if>
													</td>
												</tr>
											</tbody>
										</table>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			    <c:if test="${biaoList.size() > 0 }"> 
					<c:forEach items="${biaoList }" var="biao">
						<div class="mod-borrow mrt20">
							<div class="hd">
								<h2 class="pngbg">
									<i class="icon icon-yyyz"></i>${biao.bname }
								</h2>
								<div class="fn-right f14 c-888">
									参与人次：<span class="c-555">61.37万次</span>&nbsp;&nbsp;&nbsp;平均满标时间：<span
										class="c-555">1小时24分11秒</span>
								</div>
							</div>
							<div class="bd">
								<div class="des">
									<span class="fn-left">期限1-12月，收益更高</span><a
										href="<%=basePath %>invest/investSel.do" class="fn-right">查看更多&gt;&gt;</a>
								</div>
								<div class="borrow-list">
									<ul>
										<c:forEach items="${proList }" var="pro">
											<c:if test="${pro.ptype == biao.id }">
												<li>
													<div class="title">
														<a target="_blank"><i class="icon icon-che"
															title="车易贷"></i></a>
															<a href="investInfo.do?bmid=${pro.id }"
															class="f18" title="毕先生宝马320汽车质押贷款10万元" target="_blank">${pro.pname}</a>
													</div>
													<table width="100%" border="0" cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td width="260">借款金额<span class="f24 c-333">${pro.ptotalmoney}</span>元
																</td>
																<td width="165">年利率<span
																	class="f24 c-orange relative">${pro.pincome}% 
																</span></td>
																<td width="180" align="center">截至期限<span
																	class="f24 c-333"><fmt:formatDate
																			value="${pro.ptime}" pattern="yyyy-MM-dd" /></span>
																</td>
																<td><div class="circle">
																		<div class="left progress-bar">
																			<!-- (pro.pmoney/pro.ptotalmoney) -->
																			<div
																				class="progress-bgPic progress-bfb<fmt:formatNumber value="${(pro.pmoney/pro.ptotalmoney)*10<1?1:(pro.pmoney/pro.ptotalmoney)*10}" pattern="#"/>">
																				<div class="show-bar">
																					<fmt:formatNumber
																						value="${(pro.pmoney/pro.ptotalmoney)*100}"
																						pattern="#" />
																				</div>
																			</div>
																		</div>
																	</div>
																</td>
																<td align="right">
																	<c:if test="${pro.pstate=='2' }">
																		<a class="ui-btn btn-gray"
																			href="investInfo.do?bmid=${pro.id }">还款中</a>
																	</c:if> <c:if test="${pro.pstate=='1' }">
																		<a class="ui-btn btn-gray"
																			href="investInfo.do?bmid=${pro.id }">立即投标</a>
																	</c:if> <c:if test="${pro.pstate=='3' }">
																		<a class="ui-btn btn-gray"
																			href="investInfo.do?bmid=${pro.id }">已失效</a>
																	</c:if> <c:if test="${pro.pstate=='4' }">
																		<a class="ui-btn btn-gray"
																			href="investInfo.do?bmid=${pro.id }">已筹完</a>
																	</c:if>
																</td>
															</tr>
														</tbody>
													</table>
												</li>
											</c:if>  
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="page-right fn-right" style="top: 0px;">
			</div>
		</div>
	</div>
	<!--网站底部-->
	<jsp:include page="bottom.jsp"></jsp:include>
</html>