<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>   

<html>
<body>
<div id="personal-left" class="personal-left">
      <ul>
        <li class="pleft-cur"><span><a href="query.do?id=${user.uid}"><i class="dot dot1"></i>账户总览</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="">资金记录</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="<%=basePath%>invest/investRecord.do">投资记录</a></span></li>
        <li><span><a style="font-size:14px;text-align:center;width:115px;padding-right:35px;" href="">回款计划</a></span></li>
        <li class=""><span><a href="<%=basePath%>thirdparty.jsp"><i class="dot dot02"></i>身份证信息</a> </span> </li>
        <c:if test="${globaluser.ucertnumber==null}">
        <li><span><a href="<%=basePath%>Payno.jsp"><i class="dot dot03"></i>充值</a></span></li>
        <li class=""><span><a href="<%=basePath%>Withdrawno.jsp"><i class="dot dot04"></i>提现</a></span></li>
        </c:if>
        <c:if test="${globaluser.ucertnumber!=null}">
        <li><span><a href="pay.jsp"><i class="dot dot03"></i>充值</a></span></li>
        <li class=""><span><a href="<%=basePath%>withdraw.do?id=${user.uid}"><i class="dot dot04"></i>提现</a></span></li>
        </c:if>
        <li style="position:relative;" class=""> <span> <a href="<%=basePath %>queryDope.do"><i class="dot dot08"></i>系统信息 </a> </span> </li>
        <li class=""><span><a href="<%=basePath%>find.do?id=${user.uid}"><i class="dot dot09"></i>账户设置</a></span></li>
      </ul>
    </div>
</body>
</html>