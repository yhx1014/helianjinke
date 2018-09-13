<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>币币袋</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/user.css" />
<link rel="stylesheet" type="text/css"
	href="css/jquery.datetimepicker.css" />
<script type="text/javascript" src="script/jquery.min.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script src="script/user.js" type="text/javascript"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath}/js/jquery-1.8.3.js
"></script>
</head>
<script>
$(document).ready(function(){
	$("#chkAll").click(function(){
		var ch = document.getElementsByName("chkSon");
		if (document.getElementsByName("chkAll")[0].checked == true) {
			for (var i = 0; i < ch.length; i++) {
				ch[i].checked = true;
			}
		} else {
			for (var i = 0; i < ch.length; i++) {
				ch[i].checked = false;
			}
		}
		
	});
	var subChk = $("input[name='chkSon']")
	subChk.click(function() {
		$("#chkAll").prop("checked", subChk.length == subChk.filter(":checked").length ? true:false);
	});
	$("#del_model").click(function(){
		var checkedNum=$("input[name='chkSon']:checked").length;
		if(checkedNum == 0) {
			alert("请选择至少一项！");
			return;
		}
		// 批量选择
		if(confirm("确定要删除所选项目？")) {
			var checkedList = new Array();
			$("input[name='chkSon']:checked").each(function() {
			checkedList.push($(this).val());
			});
			$.ajax({
				type: "POST",
				url: "batchDeletes.do",
				data: {'delitems':checkedList.toString()},
				success: function(result) {
				$("[name ='chkSon']:checkbox").attr("checked", false);
					window.location.reload();
				}
			});
		}
	});
});
</script>
<body>
	<header> <!-- 导航栏 --><jsp:include page="head.jsp"></jsp:include>
	</header>
	<!--个人中心-->
	<div class="wrapper wbgcolor">
		<div class="w1200 personal">
			<div class="credit-ad">
				<img src="images/clist1.jpg" width="1200" height="96">
			</div>
			<div id="personal-left" class="personal-left">
				<ul>
					<!-- 导航栏 --><jsp:include page="left.jsp"></jsp:include>
				</ul>
			</div>
			<label id="typeValue" style="display: none;"> </label>
			<div class="personal-main">
				<div class="personal-xtxx">
					<h3>
						<i>系统消息</i>
					</h3>
					<form id="form" name="form" method="post" action="">
						<input type="hidden" name="form" value="form"> <span
							id="form:dataTable"> <script type="text/javascript">
								//<![CDATA[
								$(function() {
									$("#pxtxx-list li")
											.click(
													function() {
														var changeStatusTag = false;
														if ($(this)
																.children(
																		"span")
																.hasClass(
																		"pxtxx-newmail")) {
															$(this)
																	.children(
																			"span")
																	.removeClass(
																			"fb");
															$(this)
																	.children(
																			"span.pxtxx-newmail")
																	.removeClass(
																			"pxtxx-newmail")
																	.addClass(
																			"pxtxx-mail");
															changeStatusTag = true;
														}
														$(this)
																.children(
																		".pxtxx-notice")
																.show();
														$(this)
																.siblings()
																.children(
																		".pxtxx-notice")
																.css("display",
																		"none");
														if (changeStatusTag) {
															$(this).children(
																	"a")
																	.click();
															$(this).click();
														}
													});
								});

								//]]>
							</script>
							<div id="pxtxx-tab" class="pxtxx-tab">
								
								<ul>
									<li class="on"><input type="button"
										style="color: #3333ff; padding: 5px 22px; display: block;"
										title="刪除" id="del_model" value="删除"/></li>
								</ul>
								<span class="xxsz" style="display: none;">消息设置</span>
							</div>
							<div class="pxtxx-title">
								<span class="pxtxx-check">
									<input type="checkbox" name="chkAll" id="chkAll" style="margin-left: -740px; margin-top: 15px;"  title="全选"/>
								<span class="pxtxx-type ml46">消息标题</span> 
								<span class="pxtxx-con">内容</span> 
								<span class="pxxtx-date">执行时间</span>
							</div>
							<div id="pxtxx-list" class="pxtxx-list">
								<ul>
									
										<c:forEach items="${list}" var="dope">
											<li>
												<span class="pxtxx-check">
													<input type="checkbox" name="chkSon" id="chkSon" style="margin-left: -740px;" value="${dope.did}"/>
												</span>
												<span class="pxtxx-type ml46">${dope.dtitle}</span>
												<span class="pxtxx-con">${dope.details}</span>
												<span class="pxxtx-date"><fmt:formatDate
														value="${dope.dtime}" pattern="yyyy-MM-dd"></fmt:formatDate>
												</span>
											</li>
										</c:forEach>
									
								</ul>
							</div>
						</span>

					</form>
				</div>
				<center>
					<div class="btn-group" align="center">
						共${totalPage}/${currpage}页    <a href="<%=basePath%>queryDope.do?currpage=1">首页</a>
						<a href="<%=basePath%>queryDope.do?currpage=${currpage-1}">上一页</a>
							<c:forEach begin="1" end="${totalPage}" var="i">
	  							<font size="1"><a href="<%=basePath%>queryDope.do?currpage=${i}">${i}</a></font>
	  						</c:forEach>
						<a href="<%=basePath%>queryDope.do?currpage=${currpage-1}">下一页</a>
						     <a href="<%=basePath%>queryDope.do?currpage=${totalPage}">末页</a>
					</div>
				</center>
			</div>

			<div class="clear"></div>
		</div>

	</div>

	<!--网站底部-->
	<div id="footer" class="ft">
		<div class="ft-inner clearfix">
			<div class="ft-helper clearfix">
				<dl>
					<dt>关于我们</dt>
					<dd>
						<a href="公司简介.html">公司简介</a><a href="管理团队.html">管理团队</a><a
							href="网站公告.html">网站公告</a>
					</dd>
				</dl>
				<dl>
					<dt>相关业务</dt>
					<dd>
						<a href="list.html">我要投资</a><a href="我要借款.html">我要借款</a>
					</dd>
				</dl>
				<dl>
					<dt>帮助中心</dt>
					<dd>
						<a href="帮助中心.html">新手入门</a><a href="个人中心首页.html">我的账户</a>
					</dd>
				</dl>
				<dl>
					<dt>联系我们</dt>
					<dd>
						<a href="联系我们.html">联系我们</a>
					</dd>
				</dl>
			</div>
			<div class="ft-service">
				<dl>
					<dd>
						<p>
							<!-- <strong>工作时间</strong><br> 工作日 9:00-22:00<br> -->
							官方交流群:<em>12345678</em><br> 工作日 9:00-22:00 / 周六 9:00-18:00<br>
						</p>
						<!-- <div class="ft-serv-handle clearfix">
							<a class="icon-hdSprite icon-ft-sina a-move a-moveHover"
								title="亿人宝新浪微博" target="_blank" href="#"></a><a
								class="icon-hdSprite icon-ft-qqweibo a-move a-moveHover"
								title="亿人宝腾讯微博" target="_blank" href="#"></a><a
								class="icon-ft-qun a-move a-moveHover" title="亿人宝QQ群"
								target="_blank" href="#"></a><a
								class="icon-hdSprite icon-ft-email a-move a-moveHover mrn"
								title="阳光易贷email" target="_blank" href="mailto:xz@yirenbao.com"></a>
						</div> -->
					</dd>
				</dl>
			</div>
			<div class="ft-wap clearfix">
				<dl>
					<dt>官方二维码</dt>
					<dd>
						<span class="icon-ft-erweima"><img src="images/code.png"
							style="display: inline;"></span>
					</dd>
				</dl>
			</div>
		</div>
		<div class="ft-record">
			<!-- <div class="ft-approve clearfix">
				<a class="icon-approve approve-0 fadeIn-2s" target="_blank" href="#"></a><a
					class="icon-approve approve-1 fadeIn-2s" target="_blank" href="#"></a><a
					class="icon-approve approve-2 fadeIn-2s" target="_blank" href="#"></a><a
					class="icon-approve approve-3 fadeIn-2s" target="_blank" href="#"></a>
			</div> -->
			<div class="ft-identity">
				©2018 币币袋 All rights reserved&nbsp;&nbsp;&nbsp;
				<span class="color-e6">|</span>&nbsp;&nbsp;&nbsp;币币袋投资管理有限公司&nbsp;&nbsp;&nbsp;<span
					class="color-e6">|</span>&nbsp;&nbsp;&nbsp;<a target="_blank"
					href="http://www.miitbeian.gov.cn/">京ICP备12345678号-1</a>
			</div>
		</div>
	</div>
	<script src="script/jquery.datetimepicker.js" type="text/javascript"></script>
	<script src="script/datepicker.js" type="text/javascript"></script>
</body>
</html>