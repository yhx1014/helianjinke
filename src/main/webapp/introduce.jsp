<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亿人网--公司简介</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=basePath%>css/common.css" rel="stylesheet" />
<link href="<%=basePath%>css/about.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
</head>
<body>
 <!-- 导航栏 --><jsp:include page="head.jsp"></jsp:include>


<!--关于我们-->
<div class="bg">
  <div class="contain" id="tabs" style="margin:0 auto;">
  
    <!--关于我们--><jsp:include page="my_ue.jsp"></jsp:include>
    
    <div class="text-box">
			<div class="text-content" id="text-content">
        <h1 class="title">公司简介</h1>
        <p class="mt20 cn_line"> 亿人宝（www.yirenbao.com）为安徽省亿人宝投资管理有限公司旗下的互联网金融服务平台，创办于2015年。安徽省亿人宝投资管理有限公司是经工商行政管理局批准，专业从事“金融服务”业务的公司。<br>
        </p>
        <p class="cn_line mt20"> 亿人宝（www.yirenbao.com）作为安徽省内实行真正资金第三方托管的互联网金融平台，旨在利用互联网技术，创新金融产品与服务，为大众投资者提供安全、稳健、平民化的理财途径，为中小微企业及创业个人提供快速、便捷、低成本的融资渠道。通过互联网与传统金融相结合，扶持中小微企业成长，助力地方实体经济，推动金融创新。<br>
        </p>
        <p class="cn_line mt20"> 在互联网金融发展迅猛的今天，亿人宝经营团队凭借在银行业多年的从业经验，坚持走差异化路线，立足本土市场，突出行业特色，坚持信贷投向与当地最具潜力的产业和最有发展前景的实业挂钩。通过完善的信用评估及风控体系，亿人宝真正做到安全、透明、专业，在使信贷业务长期、稳健、可持续发展的同时，让“大众金融快捷定制”的目标得以实现。 </p>
      </div>
		</div>
  </div>
</div>
<!-- 导航栏 --><jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>