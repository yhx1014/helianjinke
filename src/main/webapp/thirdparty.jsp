<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>  
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>币币袋</title>
	<link href="<%=basePath%>css/common.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/user.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jquery.datetimepicker.css"/>
	<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
	<script src="<%=basePath%>script/user.js" type="text/javascript"></script>
</head>
<body>
    <jsp:include page="head.jsp"></jsp:include>	
	<div class="wrapper wbgcolor">
  	<div class="w1200 personal">
    <jsp:include page="left.jsp"></jsp:include>	
    <style>
				a.hqyzm{ float:left; background:#ea524a; width:125px; height:35px; line-height:35px; font-size:14px; margin-left:6px; text-align:center; color:#fff; border-radius:2px;}
				a.hqyzm:hover{color:#fff;background:#ff8882;}
				a.hqyzmAfter{float:left; background:#c0c0c0; width:125px; height:35px; line-height:35px; font-size:14px; margin-left:6px; text-align:center; color:#fff; border-radius:2px;}
	</style>
	
	<input id="investorValiCodeError" type="hidden" name="investorValiCodeError">
     <div class="personal-main">
      <div class="personal-pay">
        <script type="text/javascript">
			           //验证所有
			           function checkActiveEmailAll()
			           {
			        	   checkactiveEmailFormEmail();
			        	   var emailErrorFlag=$("#activeEmailemailErrorDiv").text()=="";
			        	   return emailErrorFlag;
			           }
		</script>
	<script type="text/javascript">
    	if(window.ActiveXObject)
	    {
	        var browser=navigator.appName 
	        var b_version=navigator.appVersion 
	        var version=b_version.split(";"); 
	        var trim_Version=version[1].replace(/[ ]/g,""); 
	        if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE7.0") 
	        { 
	        	$("#form\\:sendAuthCodeBtn2").css("display","block");
	        	$("#form\\:sendAuthCodeBtn").css("display","none");
	        } 
        }
        function sCode2(){
        	var mobile = $("#form\\:mobileNumber").val();
        	var mobileRegex="^1[3|4|5|7|8][0-9]{9}$";
        	var mobilePattern = new RegExp(mobileRegex);
  				var mobileFlag=mobilePattern.test(mobile);
  				
  				if(!mobileFlag){
  					return;
  				}
  				
        	$("#sendCode").hide();
			$("#sendCodeGrey").show();
			if(flag && $("#sendCode").is(":hidden")){
				return;
			}
			flag = true;
			timer("sendAuthCodeBtn1", {
				"count" : 60,
				"animate" : true,
				initTextBefore : "后可重新操作",
				initTextAfter : "秒",
				callback:function(){
					$("#sendCode").show();
					$("#sendCodeGrey").hide();
					flag = false;
				}
			}).begin();
        }
        var ua = navigator.userAgent; 
		if(ua.indexOf("Windows NT 5")!=-1) { 
		    if(window.ActiveXObject)
		    {
		        var browser=navigator.appName 
		        var b_version=navigator.appVersion 
		        var version=b_version.split(";"); 
		        var trim_Version=version[1].replace(/[ ]/g,""); 
		        if(browser=="Microsoft Internet Explorer" && (trim_Version=="MSIE8.0" || trim_Version=="MSIE7.0")) 
		        { 
		        	$("#form\\:sendAuthCodeBtn2").css("display","block");
	        		$("#form\\:sendAuthCodeBtn").css("display","none");
		        } 
	        }
		}

		var second = 0;
              var internal;
		    </script>
    </div>
    <div class="clear"></div>
  </div>
</div>
 <!--网站底部-->
	 <!-- 导航栏 --><jsp:include page="bottom.jsp"></jsp:include>	
	<script src="<%=basePath%>script/jquery.datetimepicker.js" type="text/javascript"></script>
	<script src="<%=basePath%>script/datepicker.js" type="text/javascript"></script>
</body>
</html>
