<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>   
<html>
	<head>
		<title>币币袋</title>
		<link href="<%=basePath%>css/common.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/user.css"/>
	</head>
	<body>
		<jsp:include page="head.jsp"></jsp:include>	
	    <div class="w1200 personal">
		   <jsp:include page="left.jsp"></jsp:include>
	          <div class="personal-main">
		        <div class="pmain-profile">
	                <div class="pmain-user">
			          <div class="user-info user-info1">
			          	订单类型 (订单状态)<br/>
							"1.订单ID###"2.用户ID"###"3.用户电话号"###"4.用户邮箱
			          	<c:forEach items="${borrow}" var="item">
							<li>
								${item.id}"###"${item.buserid}"####"${item.brelname}"####"${item.bmailbox}"###"
							</li>
						</c:forEach>
	                   </div>
			          </div>
		          </div>
	      </div>
	  </div>
		 <jsp:include page="bottom.jsp"></jsp:include>	
	</body>
</html>