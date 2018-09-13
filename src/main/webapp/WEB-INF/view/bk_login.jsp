<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>登录--管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=basePath%>assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="<%=basePath%>assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="<%=basePath%>assets/css/style.css" rel="stylesheet">
    <link href="<%=basePath%>assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
   <!--  [if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif] -->
    <%--  //location.href="<%=basePath%>main.jsp"; --%>
    <script type="text/javascript" src="<%=basePath%>Jquery/jquery-1.7.2.min.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function(){
  			$("#bt").click(function(){
  				var user = document.getElementById("uid").value;
  				var password = document.getElementById("pwd").value;
  				$.post("user_L.do",{"uid":user,"pwd":password},function(date){
  					if(date=="0"){
  						alert("登陆失败！");
  					}else{
  						//alert("登陆成功！");
						
						location.href="menu_S.do";
  					}
  				});
  			});
  		});
  	</script>
  </head>

  <body>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  <div id="login-page">
	  	<div class="container">
	  	
		      <form class="form-login" id="fr" methods="post" action="index.html" onsubmit="return false">
		        <h2 class="form-login-heading">物流管理系统</h2>
		        <div class="login-wrap">
		            <input type="text" id="uid" class="form-control" placeholder="User ID" autofocus>
		            <br>
		            <input type="password" id="pwd" class="form-control" placeholder="Password">
		            <label class="checkbox">
		                <span class="pull-right">
		                    <a data-toggle="modal" href="login.html#myModal">忘记密码 ?  </a>
		
		                </span>
		            </label>
		            <button id="bt" class="btn btn-theme btn-block" href="index.html" type="submit"><i class="fa fa-lock"></i> 登录</button>
		            <hr>
		            
		            <div class="login-social-link centered">
		            <p>或者您也可以通过您的社交网络登录</p>
		               <!--  <button class="btn btn-facebook" type="submit"><i class="fa fa-facebook"></i> Facebook</button>
		                <button class="btn btn-twitter" type="submit"><i class="fa fa-twitter"></i> Twitter</button> -->
		            </div>
		            <div class="registration">
		               	 还没有帐户?<br/>
		                <a class="" href="#">
		                  	创建一个帐户
		                </a>
		            </div>
		
		        </div>
		
		          <!-- Modal -->
		          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">忘记密码?</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p>请输入ID,并与系统管理员联系</p>
		                          <input type="text" name="email" placeholder="用户ID" autocomplete="off" class="form-control placeholder-no-fix">
		
		                      </div>
		                      <div class="modal-footer">
		                          <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
		                          <button class="btn btn-theme" type="button">提交</button>
		                      </div>
		                  </div>
		              </div>
		          </div>
		          <!-- modal -->
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="<%=basePath%>assets/js/jquery.js"></script>
    <script src="<%=basePath%>assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="<%=basePath%>assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("img/6.jpg", {speed: 500});
    </script>


  </body>
</html>
