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
<title>亿人网--联系我们</title>
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
        <h1 class="title">联系我们</h1>
        <p class="mt20 cn_line"> 如果您有任何意见或建议，欢迎通过邮件或电话联系我们。同时，欢迎您到我们公司参观或走访，来访前请先与我们的客服人员联系，我们将安排工作人员接见您的到来，感谢您对乐投贷的信任和支持！ </p>
        <div class="mt20 cn_line fl" style="width:50%;height:150px;"> <span style="line-height:34px;font-family:Microsoft YaHei;color:#0aaae1;font-size:24px;">工作时间</span><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客服热线: 400-848-6688<br>
          <span style="padding-left:20px;font-size:12px;color:#888;">（上午 9:00--12：00 下午 14：00--17：30）</span><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见、建议反馈邮箱：service@yirenbao.com </div>
        <div class="mt20 cn_line fl" style="width:50%;height:150px;"> <span style="line-height:34px;font-family:Microsoft YaHei;color:#0aaae1;font-size:24px;">商务合作部</span><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负责人：余先生<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系电话：400-848-6688<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电子邮箱：yuzhirong@yirenbao.com </div>
        <div class="mt20 cn_line fl" style="width:50%;height:150px;"> <span style="line-height:34px;font-family:Microsoft YaHei;color:#0aaae1;font-size:24px;">客户服务部</span><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负责人：赵小姐 <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系电话：400-848-6688 <br>
        </div>
        <div class="mt20 cn_line fl" style="width:50%;height:150px;"> <span style="line-height:34px;font-family:Microsoft YaHei;color:#0aaae1;font-size:24px;">外联事务部</span><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负责人：林小姐 <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系电话：400-848-6688<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电子邮箱：linyingying@yirenbao.com </div>
        <p></p>
      </div>
		</div>
  </div>
</div>
<!-- 导航栏 --><jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>