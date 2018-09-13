<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>DASHGUM - FREE Bootstrap Admin Template</title>

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="<%=basePath%>assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="<%=basePath%>assets/css/style.css" rel="stylesheet">
<link href="<%=basePath%>assets/css/style-responsive.css"
	rel="stylesheet">

<script src="<%=basePath%>assets/js/jquery.js"></script>
<script src="<%=basePath%>assets/js/chart-master/Chart.js"></script>
<script src="<%=basePath%>assets/My97DatePickers/WdatePicker.js"></script>


<!--   时间插件  -->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/css/jquery.datetimepicker.css"/>
<script src="<%=basePath%>assets/js/jquery.js"></script>
<script src="<%=basePath%>assets/js/jquery.datetimepicker.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-daterangepicker/date.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.datetimepicker.min.js"></script>


<script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
	src="<%=basePath%>assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="<%=basePath%>assets/js/jquery.scrollTo.min.js"></script>
<script src="<%=basePath%>assets/js/jquery.nicescroll.js"
	type="text/javascript"></script>
<script src="<%=basePath%>assets/js/common-scripts.js"></script>
<script src="<%=basePath%>assets/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="<%=basePath%>assets/js/bootstrap-switch.js"></script>
<script src="<%=basePath%>assets/js/jquery.tagsinput.js"></script>

<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>

<script src="<%=basePath%>assets/js/form-component.js"></script>

</head>

<body onload="checks();">
	<!-- 导航栏 --><jsp:include page="common.jsp"></jsp:include>
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<!-- 内容开始 -->
			<div class="showback">
				<h4>
					<i class="fa fa-angle-right"></i>  还款详情
				</h4>
				<hr/>
				<!-- 页面内容 -->
				<form:form id="inputForm" modelAttribute="domain"
					class="form-horizontal tasi-form"
					action="/biao/save.do"
					method="post">
					
					<div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">还款方式</label>
                        <div class="col-sm-10">
                            <c:if test="${borr.bserial=='1'}">一次性还清</c:if>
                            <c:if test="${borr.bserial=='2'}">先本后息</c:if>
                            <c:if test="${borr.bserial=='3'}">等额本息</c:if>
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">真实姓名</label>
                        <div class="col-sm-10">
                            ${borr.brelname}
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">手机号码</label>
                        <div class="col-sm-10">
                            ${borr.bpass }
                            
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">发布标</label>
                        <div class="col-sm-10">
                            ${btype }
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">公司名称</label>
                        <div class="col-sm-10">
                           ${borr.btitle} 
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">借款金额</label>
                        <div class="col-sm-10">
                            ${borr.bmoney}
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">年利率</label>
                        <div class="col-sm-10">
                            ${borr.brate}%
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">期限</label>
                        <div class="col-sm-10">
                            ${borr.blimit}
                        </div>
                    </div>
					
					<div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">所在区域</label>
                        <div class="col-sm-10">
                            ${borr.brecommend}
                        </div>
                    </div>
                    
					<div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">
							<c:if test="${borr.bleixing=='0'}">车辆贷款</c:if>
                            <c:if test="${borr.bleixing=='1'}">房屋贷款</c:if>
						</label>
                        <div class="col-sm-10">
                            <c:if test="${borr.bleixing=='0'}">车辆品牌:${borr.beizhu1} <br/>  车辆品牌: ${borr.beizhu2 }</c:if>
                            <c:if test="${borr.bleixing=='1'}">房屋面积:${borr.beizhu1}<br/>  房龄: ${borr.beizhu2 }</c:if>
                            
                        </div>
                    </div>
					

				</form:form>
				<!-- 页面内容 -->
			</div>
			<!-- 内容结束 -->
			
			<!--每期应还款  -->
			 <div class="row mt">
              <div class="col-lg-12">
                      <div class="content-panel">
						  <h4><i class="fa fa-angle-right"></i><font><font>
						  	<c:if test="${borr.bserial=='1'}">一次性还清</c:if>
                            <c:if test="${borr.bserial=='2'}">先本后息</c:if>
                            <c:if test="${borr.bserial=='3'}">等额本息</c:if>---还款详情
						  </font></font></h4>
                          <section id="no-more-tables">
                              <table class="table table-bordered table-striped table-condensed cf">
                                  <thead class="cf">
                                  <tr>
                                      <th><font><font>期数</font></font></th>
                                      <th><font><font>月还本息</font></font></th>
                                      <th class="numeric"><font><font>月还本金</font></font></th>
                                      <th class="numeric"><font><font>月还利息</font></font></th>
                                      <th class="numeric"><font><font>本息余额</font></font></th>
                                      <th class="numeric"><font><font>还款截止时间</font></font></th>
                                      <th class="numeric"><font><font>还款状态</font></font></th>
                                      <th class="numeric"><font><font>还款操作</font></font></th>
                                  </tr>
                                  </thead>
                                  <tbody id="mytbdy">
                                  <!-- <tr>
                                      <td data-title="Code"><font><font>AAC</font></font></td>
                                      <td data-title="Company"><font><font>澳大利亚农业有限公司。</font></font></td>
                                      <td class="numeric" data-title="Price"><font><font>$ 1.38</font></font></td>
                                      <td class="numeric" data-title="Change"><font><font>-0.01</font></font></td>
                                  </tr> -->
                                  
                                  </tbody>
                              </table>
                          </section>
                      </div><!-- /content-panel -->
                  </div><!-- /col-lg-12 -->
              </div>
			
		</section>
	</section>
	<!-- /MAIN CONTENT -->
</body>

<script type="text/javascript">
		function checks(){
			
			$.post('<%=basePath%>brower/tohuankuanupdison.do?id=${borr.id}',{},function(data){
				var list= data;
				var repayWay='3';//还款方式
				var money=10000;//借款金额
				var month=12;//期限
				var annualRate=10;//年化收益率
				if(repayWay=='3'){
					// 贷款本金×月利率×（1+月利率）还款月数/[（1+月利率）还款月数-1]
					var annualRates=annualRate/100;
					var monthrate= annualRates/12;
					var num = monthrate; //月利率
					var a=1+num;
					var j=Math.pow(a,month);
					var yueHuanBenXi=money*num*j/(j-1);
					var ZongEr=yueHuanBenXi*month;
					var Zong=yueHuanBenXi*month;
					var tables="";
					
					//for(var i=1;i<=month;i++){
				  		$.each(list,function(i, dept) {

						var benxiyuer=(i==1?ZongEr:ZongEr-yueHuanBenXi);	
						var monthlixi=benxiyuer*(num);//第一个月利息=本金*月利率  第二个月利息=（本息总额-月还本息）*月利率 以后类推
						var monthBenjin=yueHuanBenXi-monthlixi;//月还本金=月还本息-月还利息
						var x=benxiyuer;
						var y=yueHuanBenXi;
						var nums=x-y;
						ZongEr=benxiyuer;
						var borr=list[i];
						tables=tables+"<tr><td data-title='Code'><font><font>"+(i+1)
						+"</font></font></td><td data-title='Company'><font><font>"+yueHuanBenXi.toFixed(2)
						+"</font></font></td><td data-title='Company'><font><font>"+monthBenjin.toFixed(2)
						+"</font></font></td><td data-title='Company'><font><font>"+monthlixi.toFixed(2)
						+"</font></font></td><td data-title='Company'><font><font>"+nums.toFixed(2)
						
						+"</font></font></td><td data-title='Company'><font><font>"+new Date(dept.bdate).toLocaleString()
						+"</font></font></td><td data-title='Company'><font><font>";
						if(dept.bstatue==1){
							tables+="已还款";
						}else if (dept.bstatue==0) {
							tables+="未还款";
						}
						tables+="</font></font></td><td data-title='Company'><font><font>";
						if(dept.bstatue==1){
							
						}else if (dept.bstatue==0) {
							tables+="<a href='<%=basePath%>brower/tohuankuanupds.do?ids="+dept.boid+"&id=${borr.id}'>还款</a>";
						}
						
						tables+="</font></font></td></tr>";
					//}
				  	});
					$("#mytbdy").html(tables);	
				}
				
				//一次还本付息=本金+每月利息*期数   这里的每月利息固定
				if(repayWay=='1'){
					var annualRates=annualRate/100;
					var monthrate=annualRates/12;
					var num = (monthrate.toFixed(5)); //月利率
					var g=(num*money)*month;
					var zong=parseFloat(money)+parseFloat(g);
					var tables="";
					tables+="<td data-title='Code'><font><font>"+month.toFixed(2)
					+"</font></font></td><td data-title='Company'><font><font>"+zong.toFixed(2)
					+"</font></font></td><td data-title='Company'><font><font>"+money.toFixed(2)
					+"</font></font></td><td data-title='Company'><font><font>"+g.toFixed(2)
					+"</font></font></td><td data-title='Company'><font><font>"+0.00
					
					+"</font></font></td><td data-title='Company'><font><font>"+new Date(dept.bdate).toLocaleString()
					+"</font></font></td><td data-title='Company'><font><font>"+dept.bstatue
					+"</font></font></td><td data-title='Company'><font><font><a>还款</a>"+""
					
					+"</font></font></td>";
					$("#mytbdy").html(tables);
				}
				//先息后本 月还利息不变
				if(repayWay=='2'){
					var annualRates=annualRate/100;
					var monthrate=annualRates/12;
					var num =(monthrate.toFixed(5)); //月利率
					var g=(num*money)*month;//总共要还的利息
					var gs=num*money;
					var zong=parseFloat(money)+parseFloat(g);
					var zon=parseFloat(money)+parseFloat(g);
					
					var tables="<tr>"
					//for(var i=1;i<=month;i++){
					$.each(list,function(i, dept) {
						var borr=list[i];
						var benxiyuer=(i==month?0.00:zong-gs);	
						zong=benxiyuer;
						var yuehuanbenxi=(i==month?(parseFloat(money)+parseFloat(gs)):gs);
						var yuehuanbenjin=i==month?money:0;
						tables+="<td data-title='Code'><font><font>"+(i+1)+"</font></font></td><td data-title='Company'><font><font>"+
						yuehuanbenxi.toFixed(2)+"</font></font></td><td class='numeric' data-title='Price'><font><font>"+
						yuehuanbenjin.toFixed(2)+"</font></font></td><td class='numeric' data-title='Change'><font><font>"+
						gs.toFixed(2)+" </font></font></td><td class='numeric' data-title='Change'><font><font>"+
						benxiyuer.toFixed(2)
						
						+"</font></font></td><td data-title='Company'><font><font>"+new Date(dept.bdate).toLocaleString()
						+"</font></font></td><td data-title='Company'><font><font>";
						if(dept.bstatue==1){
							tables+="已还款";
						}else if (dept.bstatue==0) {
							tables+="未还款";
						}
						tables+="</font></font></td><td data-title='Company'><font><font>";
						if(dept.bstatue==1){
							
						}else if (dept.bstatue==0) {
							tables+="<a href='<%=basePath%>brower/tohuankuanupds.do?ids="+dept.boid+"&id=${borr.id}'>还款</a>";
						}
						
						tables+="</font></font></td>";
						tables=tables+"</tr>";
					//}
					});
					$("#mytbdy").html(tables);
	            
				}
				
				
			},"json");
			
			
		}
	</script>


<script>
	$(function() {
		$('select.styled').customSelect();
	});
</script>
</html>
