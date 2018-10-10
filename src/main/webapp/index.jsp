<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="ft"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
	<head>
		<link href="<%=basePath%>css/common.css" rel="stylesheet"/>
		<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>script/jquery.jcarousellite-1.0.1.js"></script>
		<script src="<%=basePath%>script/index.js"></script>
		<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
		<title>币币袋</title>
		<style>
			#scrollDiv {
				width: 400px;
				height: 30px;
				line-height: 30px;
				overflow: hidden;
			}
			#scrollDiv li {
				height: 30px;
				padding-left: 10px;
			}
		</style>

		<script type="text/javascript">
			//上下滚动
			function AutoScroll(obj) {
				$(obj).find("ul:first").animate({
					marginTop : "-25px"
				}, 500, function() {
					$(this).css({
						marginTop : "0px"
					}).find("li:first").appendTo(this);
				});
			}
			$(document).ready(function() {
				var myar = setInterval('AutoScroll("#scrollDiv")', 3000);
				$("#scrollDiv").hover(function() {
					clearInterval(myar);
				}, function() {
					myar = setInterval('AutoScroll("#scrollDiv")', 3000)
				}); 
			});
		</script>
		<script src="${pageContext.request.contextPath}/script/jquery.flexslider-min.js"></script>
		<script>
			$(function() {
				//判断最新公告是否为空,为空加载通知
				var list = "${listss}";
				if (list == "") {
					window.location = "${pageContext.request.contextPath}/notice/banner.do";
				}
	
				$('.flexslider').flexslider({
					directionNav : true,
					pauseOnAction : false
				});
	
				//产品列表滚动
				var pLength = $('.pListContentBox > li').length;
				var cishu = pLength - 4;
				var n = 0;
				$('.pListContentBox').css({
					'width' : pLength * 245 + 'px'
				});
				if (pLength > 4) {
					$('.pListRight').addClass('curr');
				}
				$('.pListRight').on('click', function() {
					if (cishu > 0) {
						n++;
						cishu--;
						$('.pListContentBox').animate({
							'left' : '-' + n * 244 + 'px'
						}, 500);
						if (cishu == 0) {
							$('.pListRight').removeClass('curr');
						}
						if (n > 0) {
							$('.pListLeft').addClass('curr');
						}
					}
				});
				$('.pListLeft').on('click', function() {
					if (n > 0) {
						n--;
						cishu++;
						$('.pListContentBox').animate({
							'left' : '-' + n * 244 + 'px'
						}, 500);
						if (n == 0) {
							$('.pListLeft').removeClass('curr');
						}
						if (cishu > 0) {
							$('.pListRight').addClass('curr');
						}
					}
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
</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="flexslider">
		<ul class="slides">
			<c:forEach items="${sy}" var="nots">
				<li style="background-image: url(${nots.noticepicture}); 
					width: 100%; float:left; margin-right: -100%; position: relative; 
					opacity: 0; display: block; z-index: 1; background-position: 50% 0px; 
					background-repeat: no-repeat no-repeat;">
                    <a href="http://${nots.noticecontent }" target="_blank"></a> 
				</li>
			</c:forEach>
		</ul>
	</div>
	<div class="main clearfix mrt30" data-target="sideMenu">
		<div class="wrap">
			<div class="page-left fn-left">
			    <c:if test="${biaoList.size()>0 }">
					<c:forEach items="${biaoList}" var="biao">
						<div class="mod-borrow mrt20">
							<div class="hd">
								<h2 class="pngbg">
									<i class="icon icon-yyyz"></i>
									    ${biao.bname}
								</h2>					
							</div>
							<div class="bd">
								<div class="des">
									<span class="fn-left">期限1-12月，收益更高</span>
									<a href="<%=basePath%>invest/investSel.do" class="fn-right">查看更多&gt;&gt;</a>
								</div>
								
								<div class="borrow-list">
									<ul>
										<c:forEach items="${proList}" var="pro">
											<c:if test="${pro.btype == biao.id}">
												<li>
													<div class="title">
														<a target="_blank">
															<i class="icon icon-che"></i>
														</a>
														${pro.btype}
													</div>
													<table style="width:100%;border:0;cellpadding:0;cellspacing:0;">
														<tbody>
															<tr>
																<td style="width:260;">借款数量
																    <span class="f24 c-333">
																        ${pro.bcount}
																    </span>
																</td>
																
																<td style="width:165;">年利率
																	<span
																		class="f24 c-orange relative">${pro.brate}% 
																	</span>
																</td>
																
																<td style="width:180;align:center">截至期限${pro.binterval}</td>
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
		</div>
	</div>
	<div class="page-right fn-right" style="top: 0px;"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</html>