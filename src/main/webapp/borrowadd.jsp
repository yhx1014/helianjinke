<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>币币袋</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="css/style.css" rel="stylesheet" />
	<link href="css/newstyle.css" rel="stylesheet" />
	<link type="text/css" rel="stylesheet" href="css/colorbox.css">
	<link rel="shortcut icon" href="/statics/home/images/favicon.ico" type="image/x-icon"/>
	<link href="<%=basePath%>css/common.css" rel="stylesheet" />
	<link href="<%=basePath%>css/register.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=basePath%>script/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>script/common.js"></script>
	<script src="<%=basePath%>script/login.js" type="text/javascript"></script>
</head>

<body>
	 <!-- 导航栏 -->
	 <jsp:include page="head.jsp"></jsp:include>	
	 <!--注册-->
	

<style>
body{ background:#f3f3f3; }
.applycon{ background:#f3f3f3; }
.applyc{ width:1200px; background:#fff; margin:13px auto; /*padding:15px;*/ }
.applyc1{ padding:50px 38px 70px; }
.applyc2{ padding:52px 157px 35px; background:#f5fbfe; }
.applyc2 .applyc2l,.applyc2 .applyc2r{ width:442px; text-align:center; font-size:14px; line-height:32px; vertical-align:middle; }
.applyc2 .applyc2l{ border-right:1px solid #ccc; }
.applyc2 .applyc2l h3,.applyc2 .applyc2r h3{ height:50px; line-height:45px; font-size:24px; color:#fff; font-weight:bold; background:url(images/borrow_img1.png) no-repeat center top; }
.applyc3{ padding:45px 100px 65px; background:#fff; }
.applyc3 h3{ width:100%; text-align:center; height:50px; line-height:45px; font-size:24px; color:#fff; font-weight:bold; background:url(images/borrow_img1.png) no-repeat center top; }
.applyc3 ul{ margin:45px 0 55px; }
.applyc3 ul li{ float:left; }
.applyc3 ul .rad{ width:141px; height:141px; font-weight:bold; font-size:24px; color:#fff; line-height:141px; vertical-align:middle; text-align:center; background:url(images/rad.png) no-repeat center;  }
.applyc3 ul .arrow{ width:30px; height:141px; background:url(images/irrow.png) no-repeat center; }
.applyc3 a{ display:block; width:200px; margin:0 auto; height:45px; line-height:45px; vertical-align:middle; text-align:center; font-size:20px; color:#fff; background:#ffa269; border-radius:10px; font-weight:bold; }
.applyc4{ padding:55px 45px; text-align:center; background:#f5fbfe; }
.applyc4 h3{ width:100%; text-align:center; height:50px; line-height:45px; margin-bottom:15px; font-size:24px; color:#fff; font-weight:bold; background:url(images/borrow_img1.png) no-repeat center top; }
.applyc4 p{ font-size:14px; height:35px; line-height:35px; vertical-align:middle; }
.nzx_fgs_titlen{ background:#5fb4e5; }
#nzx_fgs table tr td{ height:32px; }
.nzx_fgs{ width:90%; margin:0 auto; }
#nzx_fgs_title th{ background:#f5fbfe; color:#999; }
#nzx_fgs .nzx_fgs_title td{ background:#f5fbfe; }
#nzx_fgs .nzx_fgs_titlen td{ color:#fff; }
.applyform h3{ width:350px; text-align:center; height:50px; line-height:45px; margin-bottom:15px; font-size:24px; color:#fff; font-weight:bold; background:url(images/borrow_img1.png) no-repeat center top; }
.appstyle{ margin-bottom:35px; margin-left:75px;}
.appstyle a{ display:block; width:90px; height:35px; border:1px solid #ff9852; line-height:35px; vertical-align:middle; text-align:center; font-size:18px; color:#ff9852; font-weight:bold; margin-right:10px; border-radius:50px; float:left; }
#appstyle .appon{ background:#ff9852; color:#fff; }
.apform .trline32{ height:32px; margin-bottom:10px; }
.apform table tr td{ height:44px; line-height:44px; vertical-align:middle; font-size:15px; }
.applyBtn,.applyBtnenterprize{ display:block; width:240px; height:47px; line-height:47px; vertical-align:middle; text-align:center; font-size:22px; color:#fff; background:#ff9852; font-weight:bold; border-radius:5px; }
.applyBtn:hover,.applyBtnenterprize:hover{ background:#ff6d10; color:#fff; }
.apform .w100{ width:100px; text-align:right; display:block; margin-right:10px; }
.appinput{ width:160px; padding:0 5px; height:30px; line-height:30px; vertical-align:middle; text-align:left; border:1px solid #ccc; }
.apform .w120{ width:85px; text-align:center; }
.appinputimg1{ width:140px; padding:0 25px 0 5px; background:url(images/yuan.png) no-repeat 150px center; }
.appinputimg2{ width:115px; padding:0 50px 0 5px; background:url(images/pinfm.png) no-repeat 125px center; }
.appinputimg3{ width:140px; padding:0 25px 0 5px; background:url(images/year.png) no-repeat 150px center; }
.myselect{ color:#999; }

#divselect{width:172px; position:relative; z-index:10000; }
#divselect cite{width:130px; height:32px; line-height:32px; margin:6px 0; display:block; color:#999; cursor:pointer; font-style:normal;  padding-left:10px; padding-right:30px; text-align:left; border:1px solid #ccc; }
#divselect ul{ width:150px; border-left:1px solid #ccc; border-right:1px solid #ccc; border-bottom:1px solid #ccc; border-top:1px solid #fff; background-color:#ffffff; position:absolute; z-index:20000; margin-top:-7px; margin-left:0px; display:none; padding:8px 10px; }
#divselect ul li{ height:32px; line-height:32px;}
#divselect ul li a{ display:block; height:32px; color:#999; text-decoration:none; }
#divselect ul li a:hover{ color:#38b6ff; } 
.w250{ width:25%; text-align:center; }.w500{ width:50%; text-align:center; }
</style>


<div class="applycon">
  <div class="applyc">
     <div class="applyc1 clearfix">
	   <div class="applyimg fl mr30"><img src="picture/map.png" /></div>
	 </div>
  </div>
  
</div>
<script type="text/javascript">
function key(i) {
	
	var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
	
		if (i==0) {
			
			
			var appname=$("#appname").val();
			var appusername=$("#appusername").val();
			var appuserphone=$("#appuserphone").val();
			var appusermoney=$("#appusermoney").val();
			var beizhu1=$("#beizhu1").val();
			var beizhu2=$("#beizhu2").val();
			if (appname.length == 0 ){
			    window.alert('公司名称不能为空');
			    return false;
			}else if (appusername.length == 0 ){
			    window.alert('姓名不能为空');
			    return false;
			}
			 
			var dq=$("#provincenews").val();
			  $.post("brower/toaddborr.do", {
				     btitle:appname,
				   	 brelname:appusername,
				   	 bpass:appuserphone,
				   	 bmoney:appusermoney,
				   	 brecommend:dq,
				   	 bleixing:i,
					 beizhu1:beizhu1,
					 beizhu2:beizhu2
			  }, function(data) {
				 
			  }, "json");
			  alert("申请成功!保存手机通畅,请等待工作人员答复");
		}else if (i==1) {
			var appname=$("#appnames").val();
			var appusername=$("#apphusernames").val();
			var appuserphone=$("#apphuserphones").val();
			var appusermoney=$("#apphusermoneys").val();
			var beizhu1=$("#beizhu1s").val();
			var beizhu2=$("#beizhu2s").val();
			if (appname.length == 0 ){
			    window.alert('公司名称不能为空');
			    return false;
			}else if (appusername.length == 0 ){
			    window.alert('姓名不能为空');
			    return false;
			}
			var dq=$("#province").val();
			  $.post("brower/toaddborr.do", {
				  	 btitle:appname,
				   	 brelname:appusername,
				   	 bpass:appuserphone,
				   	 bmoney:appusermoney,
				   	 brecommend:dq,
				   	 bleixing:i,
					 beizhu1:beizhu1,
					 beizhu2:beizhu2
			  }, function(data) {}, "json");
			  alert("申请成功!保存手机通畅,请等待工作人员答复");
		}
}
</script>
<script type="text/javascript">

$(function(){
  $('#appstyle a').click(function(){
    var oIndex=$(this).index();
	$(this).addClass("appon").siblings().removeClass("appon");
	$('.apform').eq(oIndex).show().siblings().hide();
  })
  
  $('.applystyle').change(function(){
    var appNum=parseInt($(".applystyle").val());
	if(appNum==1){
	  $('.appconpanyname').show();
	}else{
	  $('.appconpanyname').hide();
	};
  })
  
  
})
</script>
	 <!-- 导航栏 -->
	 <jsp:include page="bottom.jsp"></jsp:include>	
</body>
</html>
