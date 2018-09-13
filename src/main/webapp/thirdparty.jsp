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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>p2p网贷平台</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="<%=basePath%>css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/user.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/jquery.datetimepicker.css"/>
<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
<script src="<%=basePath%>script/user.js" type="text/javascript"></script>
</head>
<body>
 <!-- 导航栏 --><jsp:include page="head.jsp"></jsp:include>	
<!--个人中心-->
<div class="wrapper wbgcolor">
  <div class="w1200 personal">
    <div class="credit-ad"><img src="<%=basePath%>images/clist1.jpg" width="1200" height="96"></div>
    <!-- 导航栏 --><jsp:include page="left.jsp"></jsp:include>	
    <style>
		        /*获取验证码*/
				a.hqyzm{ float:left; background:#ea524a; width:125px; height:35px; line-height:35px; font-size:14px; margin-left:6px; text-align:center; color:#fff; border-radius:2px;}
				a.hqyzm:hover{color:#fff;background:#ff8882;}
				/*获取验证码后在倒计时中的样式*/
				a.hqyzmAfter{float:left; background:#c0c0c0; width:125px; height:35px; line-height:35px; font-size:14px; margin-left:6px; text-align:center; color:#fff; border-radius:2px;}
	   </style>
    <script type="text/javascript">
			//<![CDATA[
			    var flag = false;
				function sCode(xhr, status, args, args2) {
					if (!args.validationFailed) {
						$("#sendCode").hide();
						$("#sendCodeGrey").show();
						/* if(flag && $("#sendCode").is(":hidden")){
							return;
						} */
						flag = true;
						var mobileNumber = $("#form\\:mobileNumber").val().replace(/(^\s*)|(\s*$)/g,"");
						if("dx" == args2){
							$("#mobileMsg").html(mobileNumber.substring(0,3) + "****" + mobileNumber.substring(7,11));
							$("#authCodeMsg").css({"display": ""});
							$("#authCodeMsg2").css({"display": "none"});
						}else if("yy" == args2){
							$("#mobileMsg2").html(mobileNumber.substring(0,3) + "****" + mobileNumber.substring(7,11));
							$("#authCodeMsg").css({"display": "none"});
							$("#authCodeMsg2").css({"display": ""});
						}
						timer("sendAuthCodeBtn1", {
							"count" : 60,
							"animate" : true,
							initTextBefore : "后可重新操作",
							initTextAfter : "秒",
							callback:function(){
								$("#sendCode").show();
								$("#sendCodeGrey").hide();
								flag = false;
								$("#authCodeMsg").css({"display": "none"});
								$("#authCodeMsg2").css({"display": "none"});
							}
						}).begin();
					}
				}
				 
		       $(document).ready(function(){
		  			var investorValiCodeError = $("#investorValiCodeError").val();
		  			if(investorValiCodeError.length > 0){
		  				$("#form\\:formauthCode_message").remove();
		  	   			var $span = $("<span id=form\:formauthCode_message class=error>"+investorValiCodeError+"</span>");
		  	   			$("#authCodeErrorDiv").append($span);
		  			}
		  	   });
		          
		          
		          
	         function showSpan(op)
	         {
					$("body").append("<div id='mask'></div>");
					$("#mask").addClass("mask").css("display","block");
		
					$("#"+op).css("display","block");
			 }

			function displaySpan(op){
					$("#mask").css("display","none");
					$("#"+op).css("display","none");
			}
			//]]>
		</script>
    <input id="investorValiCodeError" type="hidden" name="investorValiCodeError">
    <div class="personal-main">
      <div class="personal-pay">
        <h3><i>开通第三方账户</i></h3>
        <form id="thirdform" name="thirdform" action="<%=basePath%>insertucertnum.do" method="post" enctype="application/x-www-form-urlencoded">
          <input type="hidden" name="id" id="id" value="${globaluser.uid}">
          <div class="pay-notice">
            <p>开通账户的信息将提交至<a href="http://www.sumapay.com/" target="_blank">币币袋</a>网站执行，</p>
            <!-- <p><a href="http://www.sumapay.com/" target="_blank">丰付支付</a>系统将为您分配唯一用户ID（格式为：TG_用户名），并与您亿人宝账户自动绑定，您无需修改和记忆。 </p> -->
          </div>
          <div class="pay-form">
          <c:if test="${globaluser.uname==null}">
            <h6>请输入您的身份证信息</h6>
            <ul>
              <li>
                <label for="realname">真实姓名</label>
                <input type="text" name="uname" id="uname" class="pay-txt" maxlength="16"  placeholder="您的真实姓名">
                <div id="realnameErrorDiv"></div>
              </li>
              <li>
                <label for="idCard">身份证号</label>
                <input type="text" name="ucardid" id="ucardid" class="pay-txt" maxlength="18" placeholder="您的身份证号">
                <div id="idCardErrorDiv">
                  <p style="margin-top:10px;">身份证信息认证后将不可修改，请您仔细填写</p>
                </div>
              </li>
            </ul>
            </c:if>
            <c:if test="${globaluser.uname!=null}">
            <h6>身份证已绑定</h6>
            <ul>
              <li>
                <label for="email">真实姓名</label>
                <input type="hidden" name="uname" id="uname" value="${globaluser.uname}">
                <label id="form:email"> ${globaluser.uname}</label>
              </li>
              <li>
                <label for="email">身份证号</label>
                <input type="hidden" name="ucardid" id="ucardid" value="${globaluser.ucardid}">
                <label id="form:email"> ${globaluser.ucardid}</label>
              </li>
            </ul>
            </c:if>
            <c:if test="${globaluser.umailbox==null}">
            <h6>请输入您的邮箱</h6>
            <ul>
              <li>
                <label for="email">邮箱</label>
                <input type="text" name="umailbox" id="umailbox" class="pay-txt" maxlength="18" placeholder="您的邮箱">
                
              </li>
            </ul>
            </c:if>
            <c:if test="${globaluser.umailbox!=null}">
            <h6>邮箱已绑定</h6>
            <ul>
              <li>
                <label for="email">邮箱</label>
                <input type="hidden" name="umailbox" id="umailbox" value="${globaluser.umailbox}">
                <label id="form:email"> ${globaluser.umailbox}</label>
              </li>
            </ul>
            </c:if>
            <c:if test="${globaluser.uphonenumber==null}">
            <h6>请输入您的手机号</h6>
            <ul>
              <li>
                <label for="phone">手机号</label>
                <input type="text" name="uphonenumber" id="uphonenumber" class="pay-txt" maxlength="18" placeholder="您的手机号">
              </li>
              
            </ul>
            </c:if>
            <c:if test="${globaluser.uphonenumber!=null}">
            <h6>手机号已绑定</h6>
            <ul>
              <li>
                <label for="email">手机号</label>
                <input type="hidden" name="uphonenumber" id="uphonenumber" value="${globaluser.uphonenumber}">
                <label id="form:email"> ${globaluser.uphonenumber}</label>
              </li>
            </ul>
            </c:if>
            <c:if test="${globaluser.ucertnumber==null}">
            <ul>
           	 	<li>
                <label for="phone">交易密码</label>
                <input type="password" name="upwd_zd" id="upwd_zd" class="pay-txt" maxlength="18" placeholder="您的交易密码">
              </li>
            	<li>
                <input type="submit" name="" value="开户" style="border:none;" class="btn-paykh">
              </li>
              </ul>
            </c:if>
            <c:if test="${globaluser.ucertnumber!=null}">
            	<h3><i>已绑定第三方账户</i></h3>
            </c:if>
          </div>
        </form>
        <script type="text/javascript">
			           
			           //验证所有
			           function checkActiveEmailAll()
			           {
			        	   checkactiveEmailFormEmail();
			        	   var emailErrorFlag=$("#activeEmailemailErrorDiv").text()=="";
			        	   return emailErrorFlag;
			           }
		</script>
        <div class="pay-tipcon"> 1、为切实保障投资人的利益。<br>
          2、该信息一经设置，无法修改，请慎重选择。为了确保您可以顺利提现，请确认您拥有一张使用该身份证开户的有效储蓄卡。<br>
          3、币币袋平台将最大限度的尊重和保护您的个人隐私，详情请阅读<a href="#" target="_blank">《币币袋隐私条款》</a>。<br></div>
      </div>
      <script type="text/javascript">
				//<![CDATA[
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
                
		        //]]>
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
