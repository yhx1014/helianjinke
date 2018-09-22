<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<body>
<header>
<div class="header-top min-width">
    <div class="container fn-clear">
    	<c:if test="${globaluser.unickname==null }">
			<ul class="fn-right header-top-ul">
				<li>
					<div class="">
						<a href="register.jsp" class="c-orange" title="免费注册">免费注册</a>
					</div>
				</li>
				<li>
					<div class="">
						<a href="login.jsp" class="js-login" title="登录">登录</a>
					</div>
				</li>
			</ul>
		</c:if>
		
		<c:if test="${globaluser!=null }">
			<ul class="fn-right header-top-ul">
				<li>
					<div class="">
						<a href="<%=basePath%>query.do?id=${globaluser.uid}" class="c-orange" title="名字">${globaluser.unickname}</a>
					</div>
				</li>
				<li>
					<div class="">
						<a href="<%=basePath%>users/exit.do" class="js-login" title="退出">退出</a>
					</div>
				</li>
			</ul>
		</c:if>
    </div>
</div> 
<div class="header min-width">
    <div class="container">
      <div class="fn-left logo"> 
         <a class="" href="<%=basePath%>invest/recommendShow.do"> 
             <img src="<%=basePath%>images/logo.png"  title="logo"> 
         </a> 
      </div>
      <ul class="top-nav fn-clear">
        <li> <a href="<%=basePath%>invest/recommendShow.do">首页</a> </li>
        <li> <a href="<%=basePath%>invest/investSel.do" class="">我要投资</a> </li>
        <li> <a href="<%=basePath%>borrowadd.jsp" class="">我要借款</a> </li>
        <li class="top-nav-safe"> <a href="#" onclick="keys();">我的资产</a> </li>
      </ul>
    </div>
</div>
</header>

<script>
    function keys(){
		var id="${globaluser.uid}";
		if(id!=""){
			window.location.href="<%=basePath%>query.do?id=${globaluser.uid}";
		}else {
			alert("请先登入!");
			window.location.href="<%=basePath%>login.jsp";
		}
	}
</script>
</body>
</html>